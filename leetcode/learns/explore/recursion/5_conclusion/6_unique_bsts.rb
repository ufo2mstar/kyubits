# Definition for a binary tree node.
class TreeNode
  attr_accessor :val, :left, :right

  def initialize(val)
    @val = val
    @left, @right = nil, nil
  end
end

def build_bst_ary node, i, ary = []
  if node.nil?
    ary[i] = nil
  else
    ary[i] = node.val
    build_bst_ary node.left, left(i), ary
    build_bst_ary node.right, right(i), ary
  end
  ary[1..-1]
end

# @param {Integer} n
# @return {TreeNode[]}
def generate_trees(n)
  gen_bst n, []
end

def left i
  (2 * i) + 1
end

def right i
  (2 * i) + 2
end

def gen_bst n, res
  ary = (1..n).to_a
  n.times {}
  build_bst ary, res
end

def build_bst ary
  root = nil
  ary.each do |x|
    root = add_to_tree root, x
  end
  root
end

def add_to_tree(root, x)
  if root.nil?
    node = TreeNode.new x
    node.val = x
    node
  else
    if x > root.val
      if root.right.nil?
        root.right = add_to_tree(nil, x)
      else
        add_to_tree(root.right, x)
      end
    elsif x < root.val
      if root.left.nil?
        root.left = add_to_tree(nil, x)
      else
        add_to_tree(root.left, x)
      end
    else
      warn "KOD!.. root #{root} has child '#{x}'"
    end
  end
end

def is_bst root
  # is_bst_util @root, -Float::INFINITY, Float::INFINITY
  is_bst_util root, -1.0 / 0, 1.0 / 0
end

private

def is_bst_util node, min, max
  return true if node.nil?
  (node.val > min and
      node.val < max and
      is_bst_util(node.left, min, node.val) and
      is_bst_util(node.right, node.val, max))
end

ary = [2, 3, 1, 6, 4, 5]
ary = [2, 3, 1, 6, 5, 4]
ary = [2, 3, 1, 5, 4, 6]
ary = [2, 3, 1, 5, 4]
root = build_bst ary

p is_bst root
# build_bst ary, res if !ary.empty? and !ary
