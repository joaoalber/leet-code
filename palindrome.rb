# @param {String} s
# @return {Boolean}
def is_palindrome(s)
    # O(n)
    converted_str = s.downcase.gsub(/[^a-z0-9]/, '')
  
    left_pointer = 0
    right_pointer = converted_str.size - 1
  
    # O(n/2) -> O(n)
    loop do
      return false unless converted_str[left_pointer] == converted_str[right_pointer]
      return true if right_pointer <= left_pointer
  
      left_pointer = left_pointer + 1
      right_pointer = right_pointer - 1
    end
  
    # average time complexity: O(n + n/2) -> O(n)
    # worst time complexity: O(n + n) -> O(n)
  
    # space complexity: O(n)
  end