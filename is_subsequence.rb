# @param {String} s
# @param {String} t
# @return {Boolean}
def is_subsequence(s, t)
  source_index = 0

  # O(n)
  t.each_char do |chr|
    source_index = source_index + 1 if s[source_index] == chr
  end

  source_index == s.size

  # time complexity O(n)
  # space complexity O(1)
end