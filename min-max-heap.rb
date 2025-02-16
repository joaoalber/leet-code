# @param {Integer[]} nums
# transform the array into a min or max heap

def heap(nums)
  # minheap
  heap = []
  nums.each { |num| insert(heap, num, :min) }
  print heap

  # maxheap
  heap = []
  nums.each { |num| insert(heap, num, :max) }
  print heap
end

def insert(heap, num, operator)
  heap << num
  current_index = heap.size - 1

  while current_index > 0
    parent = (current_index - 1) / 2

    if operator == :min
      break if heap[parent] <= heap[current_index]
    elsif operator == :max
      break if heap[parent] >= heap[current_index]        
    end

    # SWAP
    heap[current_index], heap[parent] = heap[parent], heap[current_index]
    current_index = parent
  end
end
