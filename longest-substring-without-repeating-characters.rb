# @param {String} s
# @return {Integer}
def length_of_longest_substring(s)
  current_substring = []
  longest_substring = []

  chars = s.chars
  return 0 if chars.empty?

  # O(n^2)
  chars.each do |chr|
    # O(n)
    if current_substring.include?(chr)
      # O(n)
      current_substring.slice!(0..current_substring.index(chr))
    end

    # O(1)
    current_substring << chr

    # O(1)
    longest_substring = Array.new(current_substring) if current_substring.size >= longest_substring.size
  end

  longest_substring.size
end

# O(n^2)
