# @param {Integer[][]} matrix
# @param {Integer} target
# @return {Boolean}

# O(m log(n))
def search_matrix(matrix, target)
  # O(m)
  matrix.each do |arr|
    return true if binary_search(arr, target)
  end

  false
end

# O(log(n))
def binary_search(arr, target)
  middle = arr.size / 2

  while arr.size != 1
    if target < arr[middle]
      arr = arr[0..middle - 1]
    elsif target > arr[middle]
      arr = arr[middle..arr.size - 1]
    else
      return true
    end

    middle = arr.size / 2
  end

  return true if arr[0] == target

  false
end

# time complexity O(m log(n))
# space complexity O(1)
  