=begin
# Sample code to perform I/O:

name = gets.chomp                # Reading input from STDIN
print "Hi, #{name}.\n"           # Writing output to STDOUT

# Warning: Printing unwanted or ill-formatted data to output will cause the test cases to fail
=end

# Write your code here

def count_unvisited(visited)
  visited.count(false) - 1
end


def dfs(node, adj, visited)
  unless visited[node]
    visited[node] = true
    adj[node].each do |child|
      dfs(child, adj, visited)
    end
  end
end


def dfs_alt(node, adj, visited)
  visited[node] = true
  adj[node].each do |child|
    dfs(child, adj, visited) unless visited[child]
  end
end


nodes, edges = gets.chomp.split.map(&:to_i)

edge_list = []

adj = Array.new(nodes + 1) {[]}

edges.times {|i|
  edge_list << gets.chomp.split.map(&:to_i)
  x, y = edge_list[-1]
  adj[x] << y
  adj[y] << x
}

# p adj

visited = Array.new(nodes + 1) {false}

head = gets.chomp.to_i

# dfs(head, adj, visited)
dfs_alt(head, adj, visited)

p count_unvisited(visited)


