# given an array of integers, move all 0's to the end of the array
# example
# input: [1, 0, 2]
# output: [1, 2, 0]

def move_zeroes(nums)
  left = 0
  right = 1

  nums_size = nums.size
  
  while right < nums_size
    if nums[left] == 0 && nums[right] == 0
      right = right + 1
      next
    elsif nums[left] == 0
      nums[left] = nums[right]
      nums[right] = 0
    end

    left = left + 1
    right = right + 1
  end

  nums
end

print move_zeroes([0, 0, 1])
