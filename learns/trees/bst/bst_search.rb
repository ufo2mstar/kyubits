require_relative 'bin_tree_init'

class BinTree
  def search val
    if @root.nil?
      "BST is blank!"
    else
      search_util @root, val, ""
    end
  end

  private

  def search_util node, target, res_str
    return "#{target} Not Found in tree!!" if node.nil?
    if node.data < target
      search_util node.right, target, res_str+"N(#{node.data}) R => "
    elsif node.data > target
      search_util node.left, target, res_str+"N(#{node.data}) L => "
    else
      res_str + "N(#{node.data}) <-- there you go!"
    end
  end

end
