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
      @curr = nil
      @last = nil
    end

    def has_next?
      @curr = look_next
    end

    def next

    end

    private
    def look_next
      @curr ||= @root
      if @last == @stack.last.val
        @curr = @stack.pop
        while @curr.right do
          @stack.push(@curr.right) #if @curr.right
        end
      else

        while @curr.left do
          @stack.push(@curr.left) #if @curr.left
        end
        # @stack.push(@curr.left ? @curr.left : @curr.right)
      end

      @last = @stack.last.val
      # @last # returns the leftmost value
    end

    def look_next node
      return node.val unless node.left
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
ary = (1..LIM).to_a.shuffle
bst = BST.new ary
itr = bst.iterator

while itr.has_next? do
  puts itr.next
end
