require_relative 'traversals'

class BinTree
  class Node
    attr_accessor :data, :left, :right

    def initialize int
      @data = int
    end

    def to_s
      "Node: #{object_id}: data: #{data}"
      "Node: #{data}"
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
      # pre_order(@root) {|data| count+=1; puts "pre node #{data} -> #{count}"}
      # pre_order(@root) {|data| count+=1; puts "pre node #{data} -> #{count}"}
      # in_order(@root) {|data| count+=1; puts "in node #{data} -> #{count}"}
      # post_order(@root) {|data| count+=1; puts "post node #{data} -> #{count}"}
      #
      in_order(@root) {count += 1}
    end
    count
  end

  def insert_level_order ary
    i = 0
    n = ary.size
    @root = level_order_insert_util ary, i, n
  end

  def flatten_tree
    tree_ary = []
    i = 0
    flatten_tree_util @root, i, tree_ary
    tree_ary
  end

  private

  def level_order_insert_util ary, i, n
    if i < n
      node = Node.new ary[i]
      node.left = level_order_insert_util ary, (2 * i) + 1, n
      node.right = level_order_insert_util ary, (2 * i) + 2, n
      node
    else
      # recursion base case: dont run for out of bound nodes
      # puts "#{i}, #{n}"
    end
  end

  def flatten_tree_util node, i, tree_ary
    return if node.nil?
    left_i = (2 * i) + 1
    right_i = (2 * i) + 2
    tree_ary[i] = node.data
    # tree_ary[left_i] = nil if node.left
    # tree_ary[right_i] = nil if node.right
    flatten_tree_util node.left, left_i, tree_ary
    flatten_tree_util node.right, right_i, tree_ary
  end
end


