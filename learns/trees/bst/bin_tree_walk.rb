require_relative 'bin_tree_init'

class BinTree
  def bfs_walk &block
    bfs(@root, &block)
  end
end
