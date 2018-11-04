module Traversals

  def pre_order node, &block
    return if node.nil?
    block.call(node) if block_given?
    pre_order(node.left,&block)
    pre_order(node.right,&block)
  end

  def post_order node, &block
    return if node.nil?
    post_order(node.left,&block)
    post_order(node.right,&block)
    block.call(node) if block_given?
  end

  def in_order_explicit_block node, &block
    return if node.nil?
    in_order(node.left,&block)
    block.call(node) if block_given?
    in_order(node.right,&block)
    # yield node
  end
  alias_method :in_order, :in_order_explicit_block

  #warn: not good for recursion, esp if block takes an argument!
  def in_order_implicit_block node
    return if node.nil?
    in_order(node.left) {yield}
    yield
    in_order(node.right) {yield}
  end

  def bfs node, &block
    queue = []
    queue << node
    until queue.empty? do
      current_node = queue.shift
      queue << current_node.left if current_node.left
      queue << current_node.right if current_node.right
      block.call(current_node) if block_given?
    end
  end

end
