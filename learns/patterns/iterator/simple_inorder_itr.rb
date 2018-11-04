
class Iterator
  attr_accessor :tree
  def initialize bst
    @tree = bst
    @stk = [bst.root]
  end

  def has_next?
    !@stk.empty?
  end


end
