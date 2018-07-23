class BST
  class Node
    attr_accessor :data, :left, :right

    def initialize int
      @data = int
    end

    def to_s
      "Node: #{object_id}: data: #{data}"
    end
  end

  attr_accessor :root

  def initialize
    # @root = Node.new
    @root = nil
  end

  def size
    count = 0
    unless @root.nil?
      in_order(@root) {|data| count+=1; puts " node #{data} -> #{count}"}
    end
    count
  end

  def in_order_explicit_block node, &block
    return if node.nil?
    in_order(node.left,&block)
    block.call(node.data)
    in_order(node.right,&block)
    # yield node.data
  end
  alias_method :in_order, :in_order_explicit_block

  #warn: not good for recursion
  def in_order_implicit_block node
    return if node.nil?
    in_order(node.left) {yield}
    yield
    in_order(node.right) {yield}
  end

  def insert val
    if @root.nil?
      @root = Node.new val
    else
      insert_util @root, val
    end
  end


  def search val
    if @root.nil?
      "BST is blank!"
    else
      search_util @root, val
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

  def search_util node, val

  end

end




