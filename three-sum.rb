# @param {Integer[]} nums
# @return {Integer[][]}
def three_sum(nums)
  target = 0
  left_pointer = target + 1
  right_pointer = nums.size - 1
  triplets = []

  nums.sort!

  loop do
    return triplets.uniq if target == nums.size - 1

    if left_pointer == right_pointer
      target += 1
      left_pointer = target + 1
      right_pointer = nums.size - 1
      next
    end
    
    sum = nums[target] + nums[left_pointer] + nums[right_pointer]

    right_pointer -= 1 if sum > 0
    left_pointer += 1 if sum < 0
      
    if sum == 0
      triplets << [nums[target], nums[left_pointer], nums[right_pointer]]
      left_pointer += 1

      while nums[left_pointer] == nums[left_pointer - 1] && left_pointer < right_pointer
        left_pointer += 1
      end
    end
  end
end

# time complexity O(n^2)
# space complexity O(n)
