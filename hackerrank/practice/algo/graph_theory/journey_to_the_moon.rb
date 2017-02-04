class Node
  attr_accessor :name, :nodes

  def initialize name
    @name = name
    @link = {}
  end

  def add_link node
    @link[node.name] = node
  end
end

class MyTree
  attr_accessor :name, :nodes

  def initialize name
    @name = name
    @nodes = {}
  end

  def add_nodes node_1, node_2
    node_1.add_link node_2
    node_2.add_link node_1
  end

  def count
    @nodes.keys.length # returns count of all the nodes
  end
end

class Forest
  attr_accessor :name, :trees , :nodes

  def initialize name
    @name = name
    @nodes = {}
    @trees = {}
    @tree_count = 0
  end

  def sow node_1, node_2
    # match, extra = [node_1,node_2] & @nodes
    # puts "Extra #{extra}" if extra
    match = @nodes[node_1] || @nodes[node_2]
    tree = if match
      @trees[match]
    else
      @trees[@tree_count] = MyTree.new @tree_count
      @tree_count+=1
    end
    tree.add_nodes node_1, node_2
  end

  def add_tree node
    @trees[node.name] = node
  end

  def count
    @trees.keys.length # returns count of all the trees
  end
end