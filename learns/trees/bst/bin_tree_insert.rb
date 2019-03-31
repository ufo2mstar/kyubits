require_relative 'bin_tree_init'

class BinTree


  def insert_input_order ary
    root = nil
    ary.each do |x|
      if root.nil?
        root ||= add_to_tree root, x
      else
        add_to_tree root, x
      end
    end
    @root = root
  end

  def add_to_tree(root, x)
    if root.nil?
      node = Node.new x
      node.data = x
      node
    else
      if x > root.data
        if root.right.nil?
          root.right = add_to_tree(nil, x)
        else
          add_to_tree(root.right, x)
        end
      elsif x < root.data
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
end


