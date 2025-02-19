HEX_TABLE = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "A", "B", "C", "D", "E", "F"]

def convert_rgb_to_hex(r, g, b)
  result = []

  return "invalid arguments" if r + g + b > 765
 
  result << HEX_TABLE[r / 16]
  result << HEX_TABLE[r % 16]
  result << HEX_TABLE[g / 16]
  result << HEX_TABLE[g % 16]
  result << HEX_TABLE[b / 16]
  result << HEX_TABLE[b % 16]

  result.join
end

puts convert_rgb_to_hex(255, 255, 240)
