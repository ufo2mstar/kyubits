# https://www.hackerrank.com/challenges/even-tree

require 'awesome_print'

class Node
  attr_accessor :name, :links

  def initialize name
    @name = name
    @links = []
  end
end

class Tree
  attr_accessor :nodes

  def initialize
    @nodes = {}
  end

  def add source, dest
    @nodes[source] ||= Node.new source
    @nodes[dest] ||= Node.new dest
    @nodes[source].links << dest
    @nodes[dest].links << source
  end

  def show
    ap @nodes
  end
end

inp = <<EOF
10 9
2 1
3 1
4 3
5 2
6 1
7 2
8 6
9 8
10 8
EOF

inp = inp.split "\n"
nodes, links = inp[0].split
edges = inp[1..-1]
p nodes, links, edges

tree = Tree.new

edges.each do |edge|
  s, d = edge.split
  tree.add s, d
end
tree.show

