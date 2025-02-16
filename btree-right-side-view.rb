# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end
# @param {TreeNode} root
# @return {Integer[]}
def right_side_view(root)
  queue = Queue.new
  levels = Hash.new { |h, k| h[k] = [] } # space complexity O(n)
  
  return [] unless root
  queue << [root, 0]

  # O(n)
  while !queue.empty?
    node, level = queue.pop
    levels[level] << node.val

    queue << [node.left, level + 1] if node.left
    queue << [node.right, level + 1] if node.right
  end

  levels.map { |_level, values| values.last } 
end

# time complexity O(n)
# space complexity O(n)
  