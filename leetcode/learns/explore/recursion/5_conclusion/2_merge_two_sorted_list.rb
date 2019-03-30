# Definition for a binary tree node.
class TreeNode
  attr_accessor :val, :left, :right

  def initialize(val)
    @val = val
    @left, @right = nil, nil
  end
end

def build_bst_ary i,ary = []

end

# @param {Integer} n
# @return {TreeNode[]}
def generate_trees(n)
  gen_bst n, []
end

def left i
  2 * i
end

def right i
  2 * i + 1
end

def gen_bst n, res
  ary = (1..n).to_a
  n.times {}
  build_bst ary, res
end

def build_bst ary, res
  build_bst ary, res if !ary.empty? and !ary
end
