# Definition for a binary tree node.
class TreeNode
  attr_accessor :val, :left, :right

  def initialize(val)
    @val = val
    @left, @right = nil, nil
  end
end


# def permute_helper_swap str, l, r
#   if l == r
#     puts str
#   else
#     (l...r).each do |i|
#       # swap i and l
#       swap str, i, l
#       # explore l+1 to end
#       permute_helper_swap str, l + 1, r
#       # swap l and i back
#       swap str, l, i
#     end
#   end
# end
#
# def swap str, i, j
#   str[i], str[j] = str[j], str[i]
# end

def left i
  (2 * i) + 1
end

def right i
  (2 * i) + 2
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


def permute_helper_swap ary, l, r
  if l == r
    @perms << ary.dup
  else
    (l...r).each do |i|
      # swap i and l
      swap ary, i, l
      # explore l+1 to end
      permute_helper_swap ary, l + 1, r
      # swap l and i back
      swap ary, l, i
    end
  end
end

def swap ary, i, j
  ary[i], ary[j] = ary[j], ary[i]
end

def permute ary
  @perms = []
  # # swap test
  permute_helper_swap ary, 0, ary.length
  @perms
end

# @param {Integer} n
# @return {TreeNode[]}
def generate_trees(n)
  gen_bst n
end

def gen_bst n
  ary = (1..n).to_a
  perms = permute ary
  res = Set.new
  perms.each do |perm|
    root = build_bst(perm)
    # ary = flatten_tree(root)
    # res << ary
    res << root
  end
  res.to_a
end

def build_bst ary
  root = nil
  ary.each do |x|
    if root.nil?
      root ||= add_to_tree root, x
    else
      add_to_tree root, x
    end
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

# def is_bst root
#   # is_bst_util @root, -Float::INFINITY, Float::INFINITY
#   is_bst_util root, -1.0 / 0, 1.0 / 0
# end
#
# private
#
# def is_bst_util node, min, max
#   return true if node.nil?
#   (node.val > min and
#       node.val < max and
#       is_bst_util(node.left, min, node.val) and
#       is_bst_util(node.right, node.val, max))
# end
#
# ary = [2, 3, 1, 6, 4, 5]
# ary = [2, 3, 1, 6, 5, 4]
# ary = [2, 3, 1, 5, 4, 6]
# ary = [2, 3, 1, 5, 4]
# root = build_bst ary
#
# p is_bst root
# # build_bst ary, res if !ary.empty? and !ary

n = 3
p generate_trees(n)
