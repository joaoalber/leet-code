# given an array of visits
# merge the N structures that have an overlap between the times in the same day, example: 1-3 overlaps with 3-4
# and then create a new struct containing this visit with the new times which will be 1-4 (the two opposites) 

visits = [
  {
    date: "2025-04-02",
    time: { start_time: 1, end_time: 3 }
  },
  {
    date: "2025-04-02",
    time: { start_time: 4, end_time: 8 }
  },
  {
    date: "2025-04-02",
    time: { start_time: 3, end_time: 5 }
  },
  {
    date: "2025-04-02",
    time: { start_time: 9, end_time: 10 }
  },
  {
    date: "2024-06-05",
    time: { start_time: 4, end_time: 5 }
  },
  {
    date: "2024-02-03",
    time: { start_time: 1, end_time: 4 }
  },
]

def group_by_date(visits)
  visits_by_date = Hash.new { |h, k| h[k] = [] }

  visits.each do |visit|
    visits_by_date[visit[:date]] << visit.except(:date) if visits_by_date[visit[:date]]
  end

  visits_by_date
end

def sort_by_time(visits_by_date)
  visits_by_date.each do |_, visits|
    visits.sort_by! { |e| e[:time][:start_time] }
  end
end

def normalize_visits(visits_by_date, merged_conflicts = {})
  visits_by_date.each { |date, visits| merge_conflicts(date, visits, merged_conflicts) }
  visits_by_date.merge(merged_conflicts)
end

def merge_conflicts(date, visits, merged_conflicts)
  visits.each_with_index do |visit, i|
    return if visits[i + 1].nil?

    overlap_range = (visit[:time][:start_time]..visit[:time][:end_time])
    overlaps = overlap_range.include?(visits[i + 1][:time][:start_time])

    insert_conflict(date, visit, visits[i + 1], merged_conflicts) if overlaps
  end
end

def insert_conflict(date, visit, overlap_visit, merged_conflicts)
  if merged_conflicts[date]
    merged_conflicts[date][:end_time] = overlap_visit[:time][:end_time]
  else
    merged_conflicts[date] = { start_time: visit[:time][:start_time], end_time: overlap_visit[:time][:end_time] }
  end
end


visits_by_date = group_by_date(visits)
sorted_visits = sort_by_time(visits_by_date)
puts normalize_visits(sorted_visits)

