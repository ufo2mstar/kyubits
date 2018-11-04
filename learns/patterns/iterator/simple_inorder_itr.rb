class Iterator
  attr_accessor :tree

  def initialize bst
    @tree = bst
    @stk = []
    @stk << bst.root if bst.root
  end

  def has_next?
    !@stk.empty?
  end

  def next type
    case type
      when /pre/
        preorder_next
      when /in/
        inorder_next
      when /post/
        postorder_next
    end
  end

  def preorder_next
    if has_next?
      node = @stk.pop
      @stk << node.right if node.right
      @stk << node.left if node.left
      node.data
    end
  end

  def inorder_next
    if has_next?
      node = @stk[-1]
      if node.left
        while node.left do
          node = node.left
          @stk << node
        end
      else
        @stk << node.right if node.right
      end
      node.data
    end
  end

end
