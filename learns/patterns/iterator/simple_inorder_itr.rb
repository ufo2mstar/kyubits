class Iterator
  attr_accessor :tree

  def initialize bintree
    @tree = bintree
    @stk = []
    @stk << bintree.root if bintree.root
    @ino_stk = []
    left_seek bintree.root if bintree.root
  end

  def has_next?
    !@stk.empty?
  end

  def has_next_ino?
    !@ino_stk.empty?
  end

  def next type
    case type
      when /pre/
        preorder_next
      when /in/
        inorder_next
      when /post/
        postorder_next
      else
        raise "unknown itr type passed: #{type}"
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

  def postorder_next
    if has_next?
      node = @stk.pop
      @stk << node.left if node.left
      @stk << node.right if node.right
      node.data
    end
  end

  def inorder_next
    if has_next?
      node = @ino_stk.pop
      left_seek node.right if node.right
      node.data
    end
  end

  private
  def left_seek node
    @ino_stk << node if node
    while node.left do
      node = node.left
      @ino_stk << node
    end
  end

end
