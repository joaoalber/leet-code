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
def inorder_traversal(root)
  return [] unless root

  @values = [] # space complexity O(n)
  dfs(root)

  @values
end

# O(n)
def dfs(node)
  return unless node

  dfs(node.left)
  @values << node.val
  dfs(node.right)
end

# time complexity O(n)
# space complexity O(n)
