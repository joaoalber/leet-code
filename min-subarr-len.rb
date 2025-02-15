# @param {Integer} target
# @param {Integer[]} nums
# @return {Integer}
def min_sub_array_len(target, nums)
  minimal_length = nums.size
  match = false
  left = 0
  right = 1
  sum = nums[left]

  # O(n)
  nums.each do |num|
    return 1 if num >= target

    if left >= right || right > (nums.size - 1)
      return match ? minimal_length : 0  
    end

    sum += nums[right]

    # O(n) - but amortized using the sliding window algorithm
    while sum >= target
      match = true
      window_size = (right - left + 1)
      minimal_length = window_size if window_size < minimal_length
      
      sum -= nums[left]
      left += 1
    end
    
    right += 1
  end
end

# time complexity O(n)
# space complexity O(1)
