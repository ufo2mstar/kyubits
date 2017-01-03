class Tree < Hash
  def initialize
    super
  end

  def move node
    #p node
    return 0 if node.nil? or node.empty?
    sum = 0
    #sum += node.values.reduce(&:+)
    node.keys.each { |k|
      #p @visited
      unless @visited.include? k
        @visited << k
        sum += node[k]+ move(self[k])
      end
    }
    sum
  end

  def remove node
    n = node.to_s
    p "removing #{n}"
    self.delete(n)
    self.each { |nod, links| links.delete(n) }
  end

  def walk node, dist = 0
    queue = node.keys
    dists ||= [0]
    until queue.empty? do
      child = queue.shift
      next if @visited.include? child
      @visited << child
      child_dist = node[child]
      next unless child_dist
      dists << dist + child_dist
      dists << walk(self[child], child_dist)
    end
    dists.flatten
  end

  def run perm
    sum = 0
    p perm
    perm.each { |n|
      p 'walking '+n.to_s
      @visited = [n.to_s]
      dists = walk self[n.to_s]
      #sum += move self[n.to_s]
      sum += dists.reduce(&:+)
      # p "sum for #{n} = #{sum}"
      remove n
    }
    sum
  end

  def add parent, child, dist
    build parent, child, dist
    build child, parent, dist
  end

  def dup
    super
  end
  private
  def build source, dest, dist
    self[source.to_s] ||= {}
    self[source.to_s][dest.to_s] = dist
  end
end

tree = Tree.new
ans =-> res { res % (10**9+7) }

n = 3
aa = [
    [2, 1, 2],
    [3, 2, 3]]
for a0 in aa
  u, v, w = a0
  u = u.to_i
  v = v.to_i
  w = w.to_i
  tree.add u, v, w
end

perms = (1..n).to_a.permutation
sum = 0
@tree = tree.dup
perms.each { |perm|
  puts tree.inspect
  @loc = @tree.dup
  loc_tree = Tree.new
  loc_tree = @tree.dup
  sum += loc_tree.run(perm)
  p "sum for #{perm} = #{sum}"
  tree = @loc.dup
  puts tree.inspect
}

puts ans[sum]
