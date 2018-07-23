require_relative 'bin_tree_init'

class BinTree

  def insert_bst val
    if @root.nil?
      @root = Node.new val
    else
      insert_util @root, val
    end
  end

  private
  def insert_util node, val
    data = node.data
    if val < data
      if node.left
        insert_util node.left, val
      else
        node.left = Node.new val
      end
    elsif val > data
      if node.right
        insert_util node.right, val
      else
        node.right = Node.new val
      end
    else
      raise "\nStrict BST here.. We don't allow same data! \n'#{val}' already exists in this BST"
    end
  end

end




