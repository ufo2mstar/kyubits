require_relative 'bin_tree_init'

class BinTree
  def is_bst
    # is_bst_util @root, -Float::INFINITY, Float::INFINITY
    is_bst_util @root, -1.0/0, 1.0/0
  end

  private
  def is_bst_util node, min, max
    return true if node.nil?
    (node.data > min and
        node.data < max and
        is_bst_util(node.left, min, node.data) and
        is_bst_util(node.right, node.data, max))
  end
end
