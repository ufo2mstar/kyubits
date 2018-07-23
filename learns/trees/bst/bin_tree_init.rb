require_relative 'traversals'

class BinTree
  class Node
    attr_accessor :data, :left, :right

    def initialize int
      @data = int
    end

    def to_s
      "Node: #{object_id}: data: #{data}"
    end
  end

  include Traversals
  attr_accessor :root

  def initialize
    @root = nil
  end

  def size
    count = 0
    unless @root.nil?
      pre_order(@root) {|data| count+=1; puts "pre node #{data} -> #{count}"}
      # in_order(@root) {|data| count+=1; puts "in node #{data} -> #{count}"}
      # post_order(@root) {|data| count+=1; puts "post node #{data} -> #{count}"}
      #
      # in_order(@root)
    end
    count
  end
  
  def insert_level_order ary

  end
end


