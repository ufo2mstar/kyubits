module Traversals

  def pre_order node, &block
    return if node.nil?
    block.call(node.data) if block_given?
    in_order(node.left,&block)
    in_order(node.right,&block)
  end

  def post_order node, &block
    return if node.nil?
    in_order(node.left,&block)
    in_order(node.right,&block)
    block.call(node.data) if block_given?
  end

  def in_order_explicit_block node, &block
    return if node.nil?
    in_order(node.left,&block)
    block.call(node.data) if block_given?
    in_order(node.right,&block)
    # yield node.data
  end
  alias_method :in_order, :in_order_explicit_block

  #warn: not good for recursion, esp if block takes an argument!
  def in_order_implicit_block node
    return if node.nil?
    in_order(node.left) {yield}
    yield
    in_order(node.right) {yield}
  end

end
