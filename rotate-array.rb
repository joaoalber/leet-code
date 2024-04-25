# https://leetcode.com/problems/rotate-array
# @param {Integer[]} nums
# @param {Integer} k
# @return {Void} Do not return anything, modify nums in-place instead.
def rotate(nums, k)
  # O(n)
  nums_clone = Array.new(nums.size) { |i| nums[i] }

  # O(n)
  nums_clone.each_with_index do |n, i|
    if nums_clone[i + k] == nil
      nums[(i + k) % nums.size] = nums_clone[i] 
    else
      nums[i + k] = nums_clone[i]
    end
  end
end

# O(2n) == O(n)
