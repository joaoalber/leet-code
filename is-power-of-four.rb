# @param {Integer} n
# @return {Boolean}
def is_power_of_four(n)
  return true if n == 1
  return false if n == 0

  return false if n % 4 != 0
  return false unless is_power_of_four(n / 4)

  true
end
