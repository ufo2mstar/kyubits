#!/bin/ruby

require 'json'
require 'stringio'


# Complete the maxCircle function below.
def maxCircle(queries)
  @parent = {}
  @size = {}
  @node_id = {}
  @id_node = {}
  id = 1
  res = []
  queries.each do |edge|
    a, b = edge

    id = new_node a, id unless @parent[a]
    id = new_node b, id unless @parent[b]

    union_find a, b
    res << max_val(@size)
    # p res.size
    p sizes(res)
  end
  res
end

def sizes res
  "parents: #{@parent.size} .. #{res[-1]}"
end

def new_node node, id
  parent, size, node_id, id_node = @parent, @size, @node_id, @id_node

  # node_id[node] = id
  # id_node[id] = node

  size[node] = 1
  parent[node] = node

  # puts "size #{size}, parent #{parent}, node_id: #{node_id} , id_node: #{id_node} "
  id + 1
end

def max_val(hsh)
  hsh.values.max
end

def union_find a, b
  # parent, size, node_id, id_node = @parent, @size, @node_id, @id_node
  if (root1 = find(a)) != (root2 = find(b))
    union root1,root2
  end
end

def union_find_old a, b
  # parent, size, node_id, id_node = @parent, @size, @node_id, @id_node
  if find(a) != find(b)
    union a, b
  end
end

def union node1, node2
  parent, size, node_id, id_node = @parent, @size, @node_id, @id_node

  root1 = find node1
  root2 = find node2

  min_root, max_root = size[root1] < size[root2] ? [root1, root2] : [root2, root1]

  parent[min_root] = parent[max_root]
  size[max_root] += size[min_root]
end

def find node
  parent, size, node_id, id_node = @parent, @size, @node_id, @id_node
  if parent[node] == node
    node
  else
    parent[node] = find parent[node]
  end
end

def find_itr node
  parent, size, node_id, id_node = @parent, @size, @node_id, @id_node

  root = node
  while root != parent[root]
    root = parent[root]
  end

  # path compression
  while node != root
    temp = parent[node]
    parent[node] = root
    node = temp
  end

  root
end


# -------------------------
#

# fptr = File.open(ENV['OUTPUT_PATH'], 'w')

q = gets.to_i

queries = Array.new(q)

q.times do |i|
  # queries[i] = gets.rstrip.split(' ').map(&:to_i)
  queries[i] = gets.rstrip.split(' ')
end

ans = maxCircle queries

# fptr.write ans.join "\n"
# fptr.write "\n"
#
# fptr.close()


puts ans
