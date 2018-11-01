# Maximum Depth of Binary Tree
# Go to Discuss
# Given a binary tree, find its maximum depth.
#
#     The maximum depth is the number of nodes along the longest path from the root node down to the farthest leaf node.
#
#         Note: A leaf is a node with no children.
#
#     Example:
#
#     Given binary tree [3,9,20,null,null,15,7],
#
#     3
#    / \
#   9  20
#     /  \
#    15   7
# return its depth = 3

# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @return {Integer}

# def max_depth(root)
#     if root
#         l_depth = max_depth(root.left)
#         r_depth = max_depth(root.right)

#         l_depth > r_depth ? l_depth+1 : r_depth+1
#     else
#         return 0
#     end
# end

def max_depth(root)
  return 0 unless root
  1 + [max_depth(root.left), max_depth(root.right)].max
end
