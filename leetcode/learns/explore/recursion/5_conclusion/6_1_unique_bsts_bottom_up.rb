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
  # res = generate(1, n)
  res = generate_cached(1, n, {})
  res
end

def generate_cached(start, last, cache)
  res = []
  # res = [nil]
  if cache[[start, last]]
    cache[[start, last]]
  else
    (start..last).each do |root|

      leftTrees = generate_cached(start, root - 1, cache)
      rightTrees = generate_cached(root + 1, last, cache)

      leftTrees.each do |left|
        rightTrees.each do |right|
          node = TreeNode.new(root)
          node.left = left
          node.right = right

          res << node
        end
      end
    end
    cache[[start, last]] = res.empty? ? [nil] : res
  end
end

def generate(start, last)
  res = []
  # res = [nil]
  (start..last).each do |root|

    leftTrees = generate(start, root - 1)
    rightTrees = generate(root + 1, last)

    leftTrees.each do |left|
      rightTrees.each do |right|
        node = TreeNode.new(root)
        node.left = left
        node.right = right

        res << node
      end
    end
  end
  res.empty? ? [nil] : res
  # res
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
# p generate_trees 1
# p generate_trees 2
# p generate_trees 3
# p generate_trees 4
# p generate_trees 5
p generate_trees 10
