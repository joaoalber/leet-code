# @param {Integer[]} numbers
# @param {Integer} target
# @return {Integer[]}
def two_sum(numbers, target)
  left_pointer = 0
  right_pointer = numbers.size - 1

  # O(n)
  loop do
    sum = numbers[left_pointer] + numbers[right_pointer]

    right_pointer -= 1 if sum > target
    left_pointer += 1 if sum < target

    return [left_pointer + 1, right_pointer + 1] if sum == target
    return [] if left_pointer == right_pointer
  end

  # time complexity O(n)
  # space complexity O(1)
end
  