# given a 2D matrix, check if the given substring is present in this matrix
# consider only adjacents sequences (horizontally and vertically no need to check diagonal)
# example:
# [
#  ["A", "B", "C", "F"],
#  ["B", "Z", "H", "G"],
#  ["C", "K", "L", "A"],
#  ["B", "Z", "D", "W"],
# ]
# substring = "BZKL" -> should return true 
# substring = "BZKD" -> should return false because D is diagonal adjacent to K (should not be considered)

matrix = [
  ["A", "B", "C", "F"],
  ["B", "Z", "H", "G"],
  ["C", "K", "L", "A"],
  ["B", "Z", "D", "W"],
]

def find_substr(matrix, substr)
  word = substr[0]

  # O((n*m) * s) -> O(nms)
  matrix.each_with_index do |line, i|
    line.each_with_index do |char, j|
      # O(s)
      return find_sequence(matrix, i, j, substr, 1) if char == word
    end
  end

  false
end

def find_sequence(matrix, i, j, substr, index)
  word = substr[index]
  return true if substr[index].nil?

  adjacents = [[i + 1, j], [i - 1, j], [i, j + 1], [i, j - 1]]
  # O(1)
  adjacents.select! { |values| !values.include?(-1) }

  # O(4*s) -> O(s) (tamanho da palavra)
  adjacents.each do |adjacent|
    i, j = adjacent
    next unless matrix[i][j]

    result = find_sequence(matrix, i, j, substr, index + 1) if word == matrix[i][j]
    return true if result
  end

  false
end

puts find_substr(matrix, "BZKL")
puts find_substr(matrix, "BZKD")
