# Definition for a binary tree node.
class TreeNode
  attr_accessor :val, :left, :right

  def initialize(val)
    @val = val
    @left, @right = nil, nil
  end
end


def generate_trees n
  return [] if n == 0
  res = generate_from_ary((1..n).to_a)
end

def generate_from_ary(ary)
  res = []
  if ary.size == 0
    [nil]
  elsif ary.size == 1
    node = TreeNode.new ary[0]
    res << node
  else
    ary.each_index do |i|
      left_trees, right_trees = [nil], [nil]

      right_trees = generate_from_ary(ary[i + 1..-1]) if i != ary.size
      left_trees = generate_from_ary(ary[0..i - 1]) if i != 0

      left_trees.each do |left|
        right_trees.each do |right|
          node = TreeNode.new ary[i]
          node.left = left
          node.right = right
          res << node
        end
      end
    end
  end
  res.empty? ? [nil] : res
end

def generate_cached(ary, i, res)
  res = []
  # res = [nil]
end

def flatten_trees res
  ary = []
  res.each {|root| ary << flatten_tree(root)}
  ary
end

def flatten_tree root
  tree_ary = []
  i = 0
  flatten_tree_util root, i, tree_ary
  tree_ary
end

def flatten_tree_util node, i, tree_ary
  return if node.nil?
  left_i = (2 * i) + 1
  right_i = (2 * i) + 2
  tree_ary[i] = node.val
  # tree_ary[left_i] = nil if node.left
  # tree_ary[right_i] = nil if node.right
  flatten_tree_util node.left, left_i, tree_ary
  flatten_tree_util node.right, right_i, tree_ary
end

require 'awesome_print'
require 'pp'
# require 'combos'

trees =
# generate_trees 1
# generate_trees 2
#     generate_trees 3
# generate_trees 4
generate_trees 5
# generate_trees 10

# ap trees
pp trees
# ap flatten_trees trees
# pp flatten_trees trees

p trees.size
