class BT
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

      if left.nil?
        @left = Node.new
        left.insert int
      elsif right.nil?
        @right = Node.new
        right.insert int
      else
        left.insert int # just insert to the left, to the left
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

bt = BT.new

ary.each {|val|
  bt.insert val
}

puts bt.to_s
