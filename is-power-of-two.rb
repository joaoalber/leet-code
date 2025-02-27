# @param {Integer} n
# @return {Boolean}
def is_power_of_two(n)
  return true if n == 1
  return false if n == 0

  return false if n % 2 != 0
  return false unless is_power_of_two(n / 2)

  true
end
