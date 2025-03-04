# We have an array of integers as input and a target sum. For example, the target sum is 9, and we have the following array:
# [2, 6, 3, 4, 8, 1]
# In this case, we should return the following pairs (in any order): 6, 3 and 8, 1, since their sums equal 9.
# The goal is to implement a method that efficiently finds all such pairs.

# handles negative numbers?
# handles duplicate pairs?

def find_pairs(numbers, target)
  complements = Set.new
  pairs = []

  numbers.each_with_index do |number, i|
    complement = target - number
    
    if complements.include?(complement)
      pairs << [number, complement] 
    else
      complements << number
    end
  end

  pairs
end

print find_pairs([2, 6, 3, 4, 8, 1], 9)
print "\n======\n"
print find_pairs([9], 9)
print "\n======\n"
print find_pairs([1, 2, 3, 4], 10)
print "\n======\n"
print find_pairs([-2, -6, -3, -4, -8, -1], -9)
print "\n======\n"
print find_pairs([2, 3, 2, 3, 2], 5)
print "\n======\n"
