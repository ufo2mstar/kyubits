# Find Duplicate Subtrees
# Go to Discuss
# Given a binary tree, return all duplicate subtrees. For each kind of duplicate subtrees, you only need to return the root node of any one of them.
#
#     Two trees are duplicate if they have the same structure with same node values.
#
#     Example 1:
#
#     1
# / \
#       2   3
#      /   / \
#     4   2   4
# /
#       4
# The following are two duplicate subtrees:
#
#       2
#      /
# 4
# and
#
#     4
# Therefore, you need to return above trees' root in the form of a list.


# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end


# @param {TreeNode} root
# @return {TreeNode[]}
def find_duplicate_subtrees_no_pretty(root)
  hsh = Hash.new(0)
  post_order_no_pretty root,hsh

  res = []
  hsh.each{|k,v| res << k[/^\d+/].to_i if v > 1}
  res
end

def post_order_no_pretty node, hsh
  return if node == nil
  left = post_order_no_pretty node.left, hsh
  right = post_order_no_pretty node.right, hsh

  key = "#{node.val}(#{left},#{right})"

  hsh[key]+=1
  return key
end

# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @return {TreeNode[]}
def find_duplicate_subtrees_null_handle(root)
  hsh = Hash.new(0)
  post_order_null_handle root,hsh

  res = []
  hsh.each{|k,v| res << k.flatten.compact if v > 1}
  res
end

def post_order_null_handle node, hsh
  return if node == nil
  left = post_order_null_handle node.left, hsh
  right = post_order_null_handle node.right, hsh

  # key = "#{node.val},#{left},#{right}"
  key = [node.val,left,right]

  hsh[key]+=1
  return key
end
