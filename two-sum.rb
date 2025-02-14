# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
def two_sum(nums, target)
  numbers = {}
  
  # O(n)
  nums.each_with_index do |num, i|
    if numbers[target - num]
      return [numbers[target - num], i]
    else
      numbers[num] = i 
    end 
  end
end
