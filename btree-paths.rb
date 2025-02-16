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
# @return {String[]}
def binary_tree_paths(root)
  return [] unless root
  @result = []

  dfs(root, "")

  @result
end

def dfs(node, path)
  return unless node

  path += node.val.to_s

  if node.left.nil? && node.right.nil?
    @result << path
  else
    path += "->"
    dfs(node.left, path)
    dfs(node.right, path)
  end
end
