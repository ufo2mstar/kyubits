
class Tree < Hash
  def initialize
    super
  end

  def move node
    #p node
    return 0 if node.nil? or node.empty?
    sum = 0
    #sum += node.values.reduce(&:+)
    node.keys.each{|k|
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
    self.each{|nod,links| links.delete(n)}
  end

  def walk node
    queue = node.values
    dists = []
    until queue.empty? do
      dists << []
    end
    dists
  end

  def run perm
    sum = 0
    p perm
    perm.each{|n|
      p 'walking '+n.to_s
      @queue = [n.to_s]
      dists = walk self[n.to_s]
      #sum += move self[n.to_s]
      sum += dists.reduce(&:+)
      p "sum for #{n} = #{sum}"
      remove n
    }
    sum
  end

  def add parent,child,dist
    #self[parent.to_s] ||= {}
    #self[child.to_s] ||= {}
    # add parent
    build parent,child,dist
    build child,parent,dist
  end

  private
  def build source ,dest ,dist
    self[source.to_s] ||= {}
    self[source.to_s][dest.to_s] = dist
  end
end

tree = Tree.new
ans =-> res {res % (10**9+7)}

n = gets.strip.to_i
for a0 in (0..n-1-1)
  u,v,w = gets.strip.split(' ')
  u = u.to_i
  v = v.to_i
  w = w.to_i
  tree.add u,v,w
end

puts tree.inspect
perms = (1..n).to_a.permutation
sum = 0
perms.each{|perm|
  sum+= tree.run(perm)
}

puts ans[sum]
