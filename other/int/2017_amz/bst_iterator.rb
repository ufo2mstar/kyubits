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
    def initialize root
      @stack = []
      look_left root
    end

    def has_next?
      not @stack.empty?
    end

    def next
      next_node = @stack.pop
      if next_node.right
        puts "stacking right #{next_node.val}"
        look_left next_node.right
      end
      next_node.val
    end

    private

    def look_left node
      if node
        puts "stacking left #{node.val}"
        @stack.push(node)
        look_left node.left
      end
    end
  end

  attr_accessor :root, :itr

  def initialize ary
    return if ary.empty?
    ary.each {|itm| @root ? @root.insert(itm) : @root = Node.new(itm)}
  end

  def iterator
    @itr = Iterator.new @root
  end

end

LIM=100
srand 123
ary = (1..LIM).to_a.shuffle
# ary = [4, 2, 6, 1, 3, 5, 7]
bst = BST.new ary
itr = bst.iterator

while itr.has_next? do
  puts itr.next
end
