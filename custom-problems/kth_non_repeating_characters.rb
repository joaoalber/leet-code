# return the k-th non-repeating character in the string. 
# If there are fewer than k non-repeating characters, return nil.

def kth_unique_char(str, k)
  char_counter = {}
  matching_characters = []

  str.each_char do |char|
    if char_counter[char]
      char_counter[char] += 1
    else
      char_counter[char] = 1
    end
  end

  char_counter.each do |key, v|
    matching_characters << key if v == 1

    if matching_characters.size == k
      return matching_characters[k - 1]
    end
  end

  nil
end

puts kth_unique_char("engineers", 1) # => "g" 
puts kth_unique_char("engineers", 2) # => "i"
puts kth_unique_char("engineers", 3) # => "r"
puts kth_unique_char("engineers", 4) # => "s" 
puts kth_unique_char("engineers", 5) # => nil
