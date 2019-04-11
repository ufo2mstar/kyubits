#!/bin/ruby

require 'json'
require 'stringio'


# Complete the maxCircle function below.
def maxCircle(queries)
  @size = {}
  @parent = {}
  @node_id = {}
  @id_node = {}
  id = 1
  res = []
  queries.each do |edge|
    a, b = edge

    id = new_node a, id, parent, node_id, size unless node_id[a]
    id = new_node b, id, parent, node_id, size unless node_id[b]
    # node_id[a] = id += 1 unless node_id[a]
    # node_id[b] = id += 1 unless node_id[b]
    # size[a] ||= 1
    # size[b] ||= 1
    # parent[a] = node_id[a] unless parent[a]
    # parent[b] = node_id[b] unless parent[b]

    union_find a, b, parent, node_id, size
    res << max_val(size)
    # p res
  end
  res
end

def new_node node, id, parent, node_id, size
  node_id[node] = id
  node_id[node] = id
  size[node] = 1
  parent[node] = node_id[node]
  p "node_id: #{node_id} , size #{size}, parent #{parent}"
  id + 1
end

def max_val(hsh)
  hsh.values.max
end

def union_find a, b, parent, node_id, size
  if find(a, parent, node_id, size) != find(b, parent, node_id, size)
    union a, b, parent, node_id, size
  end
end

def union node1, node2, parent, node_id, size
  root1 = find node1, parent, node_id, size
  root2 = find node2, parent, node_id, size

  min_root, max_root = size[root1] < size[root2] ? [root1, root2] : [root2, root1]

  parent[min_root] = node_id[parent[max_root]]
  size[max_root] += size[min_root]
end

def find node, parent, node_id, size
  # root = node_id[node]
  root = node
  while node_id[root] != parent[root]
    root = parent[root]
  end

  # path compression later
  #

  root
end


# -------------------------
#

# fptr = File.open(ENV['OUTPUT_PATH'], 'w')

q = gets.to_i

queries = Array.new(q)

q.times do |i|
  queries[i] = gets.rstrip.split(' ').map(&:to_i)
end

ans = maxCircle queries

# fptr.write ans.join "\n"
# fptr.write "\n"
#
# fptr.close()


puts ans
