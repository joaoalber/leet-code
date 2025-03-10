# @param {Integer[][]} intervals
# @param {Integer[]} new_interval
# @return {Integer[][]}
def insert(intervals, new_interval)
  return [new_interval] if intervals.empty?
  return [new_interval] if (intervals.first[0] > new_interval[0]) && (intervals.last[1] < new_interval[1])

  i = 0
  @intervals = intervals

  @initial_overlap = nil
  @end_overlap = nil

  new_intervals = []
  new_interval_collection = (new_interval[0]..new_interval[1]).to_a

  while intervals[i] != nil
    while has_intersection?(interval_collection(i), new_interval_collection)
      @initial_overlap ||= [@intervals[i][0], new_interval[0]].min
      i += 1
    end

    if @initial_overlap
      @end_overlap = [new_interval[1], @intervals[i - 1][1]].max
      new_intervals << [@initial_overlap, @end_overlap]
      @initial_overlap = nil
    end

    new_intervals << intervals[i]

    i += 1
  end

  new_intervals << new_interval unless overlap_found?
  new_intervals.compact.sort
end

def has_intersection?(arr1, arr2)
  (arr1 & arr2).any?
end

def interval_collection(i)
  return [] unless @intervals[i]

  (@intervals[i][0]..@intervals[i][1]).to_a
end

def overlap_found?
  @initial_overlap || @end_overlap
end
