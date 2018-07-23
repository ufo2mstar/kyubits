require_relative 'bin_tree_init'

class BinTree
  def search val
    if @root.nil?
      "BST is blank!"
    else
      search_util @root, val
    end
  end

  private

  def search_util node, val

  end

end
