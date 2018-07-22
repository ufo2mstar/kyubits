class BST
  class Node
    attr_accessor :data, :left, :right
    # def initialize int
    #   @data = int
    # end

    def insert int
      if data.nil?
        @data = int
        return
      end

      if int < data
        @left = Node.new if left.nil?
        left.insert int
      elsif int > data
        @right = Node.new if right.nil?
        right.insert int
      else
        raise "\nStrict BST here.. We don't allow same data! \n'#{int}' already exists in this BST"
      end

    end
  end

  attr_accessor :root

  def initialize
    @root = Node.new
  end

  def insert val
    @root.insert val
  end

end


ary = [ 5, 3, 2, 6, 7, 4, 1]

bst = BST.new

ary.each {|val|
  bst.insert val
}

puts bst.to_s
