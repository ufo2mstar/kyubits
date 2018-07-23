require_relative 'bin_tree_init'

class BinTree
  class Iterator
    include Traversals

    def initialize root
      @stack = []
      look_left root
    end

    # returns boolean if next exists
    def has_next?
      !@stack.empty?
    end

    # return the data of the next node and increase counter
    def next
      if has_next?
        node = @stack.pop
        # keep next ready
        look_left node.right if node.right
        node.data
      end
    end

    private
    def look_left node
      @stack.push node
      look_left node.left if node.left
    end
  end

  def get_iterator
    if @root.nil?
      puts "BST is blank!"
      nil
    else
      @itr ||= Iterator.new @root
    end
  end

  private

  def search_util node, target, res_str
    return "#{target} Not Found in tree!!" if node.nil?
    if node.data < target
      search_util node.right, target, res_str+"N(#{node.data}) R => "
    elsif node.data > target
      search_util node.left, target, res_str+"N(#{node.data}) L => "
    else
      res_str + "N(#{node.data}) <-- there you go!"
    end
  end

end
