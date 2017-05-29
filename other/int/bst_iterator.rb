class BST
  class Node
    attr_accessor :left, :right, :val

    def initialize new_val
      @val = new_val
      @left = nil
      @right = nil
    end

    def insert itm
      return unless itm
      add =-> node, val {node ? node.insert(val) : node = Node.new(val); return node}
      if itm > @val
        @right = add[@right, itm]
      else
        @left = add[@left, itm]
      end
    end

    def is_leaf?
      not (@left or @right)
    end
  end

  class Iterator
    def initialize # root
      # @root = root
      @stack = []
      @set = {}
      @last = nil
      look_left @root
    end

    def has_next?
      not @stack.empty?
    end

    def next
      next_node = @stack.pop
      right = next_node.right
      if right
        @stack.push(right)
        look_left right
      end
      next_node.val
    end

    private

    def look_left node
      # while node.left do
      if node
        @stack.push(node)
        look_left node
      end
    end
  end

  attr_accessor :root, :itr

  def initialize ary
    return if ary.empty?
    ary.each {|itm| @root ? @root.insert(itm) : @root = Node.new(itm)}
  end

  def iterator
    @itr = Iterator.new # @root
  end

end

LIM=10
srand 123
ary = (1..LIM).to_a.shuffle
ary = [4,2,6,1,3,5,7]
bst = BST.new ary
itr = bst.iterator

while itr.has_next? do
  puts itr.next
end
