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

  def initialize name, first_node
    @name = name
    @nodes = {}
    make_node(first_node)
  end

  def make_node node
    @nodes[node] = Node.new node
  end

  def link_nodes node_1, node_2
    node_1, node_2 = make_node(node_1), make_node(node_2)
    node_1.add_link node_2
    node_2.add_link node_1
  end

  def count
    @nodes.keys.length # returns count of all the nodes
  end

  def merge tree
    @nodes.merge! tree.nodes
    # @nodes
  end
end

class Forest
  attr_accessor :name, :trees, :nodes

  def initialize name, node_count
    @name = name
    @nodes = {}
    @trees = {}
    @tree_count = 0
    @node_count = node_count
  end

  def sow node_1, node_2
    # match, extra = [node_1,node_2] & @nodes
    # puts "Extra #{extra}" if extra
    # n_old, n_new = nil, nil
    t_n1, t_n2 = @nodes[node_1], @nodes[node_2]
    if t_n1 and t_n2 and t_n1!= t_n2
      big_tree, small_tree = t_n1.count > t_n2.count ? [t_n1, t_n2] : [t_n2, t_n1]
      transfer small_tree, big_tree
      big_tree.merge small_tree
      @trees.delete(small_tree.name)
    elsif t_n1.nil? and t_n2.nil?
      add_tree node_1, node_2
    elsif t_n1.nil?
      tree = t_n2
      @nodes[node_1] = tree
      tree.link_nodes node_2, node_1
    else
      tree = t_n1
      @nodes[node_2] = tree
      tree.link_nodes node_1, node_2
    end
  end

  def transfer from_tree, to_tree
    from_tree.nodes.keys.each do |node|
      @nodes[node] = to_tree
    end
  end

  def add_tree node_1, node_2 = nil
    @trees[@tree_count] = MyTree.new @tree_count, node_1
    tree = @trees[@tree_count]
    @nodes[node_1] = tree
    if node_2
      @nodes[node_2] = tree
      tree.link_nodes node_1, node_2
    end
    @tree_count+=1
  end

  def count
    @trees.keys.length # returns count of all the trees
  end

  def make_remainders
    @node_count.times do |n|
      unless @nodes[n]
        add_tree n
      end
    end
  end

  def show_trees
    @trees.each do |t_name, t|
      puts "#{t_name} => #{t.nodes.keys} = #{t.count}"
    end
    @nodes.each do |n,t|
      puts "#{n} => #{t.name}"
    end
  end

  def compute
    make_remainders
    # show_trees
    sum = 0
    count_queue = []
    @trees.values.each do |t|
      count_queue << t.count
    end
    while count_queue.length > 1
      n = count_queue.pop
      count_queue.each { |c| sum+=n*c }
    end
    sum
  end
end


class Comb

  def self.ncr(n, r)
    a, b = r, n-r
    a, b = b, a if a < b # a is the larger
    numer = (a+1..n).inject(1) { |t, v| t*v } # n!/r!
    denom = (2..b).inject(1) { |t, v| t*v } # (n-r)!
    numer/denom
  end

  def self.npr(n, r)
    a, b = r, n-r
    # a, b  = b, a if a < b # a is the larger
    numer = (1..n).inject(1) { |t, v| t*v } # n!
    denom = (2..b).inject(1) { |t, v| t*v } # (n-r)!
    numer/denom
  end

  def self.facto n
    (1..n).inject(1) { |f, v| f*v } # n!
  end

end


# Enter your code here. Read input from STDIN. Print output to STDOUT
N, i = gets.split.map { |x| x.to_i }

f = Forest.new 'gir', N
i.times do
  a, b = gets.split.map { |x| x.to_i }
  f.sow a, b
end

result = f.compute
puts result


# 1 => 4
# 2 => 23
# 3 => 3984 but 1584