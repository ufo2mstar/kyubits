#!/bin/ruby

class Tree < Hash
  def initialize
    super
  end

  def move node
    p node.values
    node.values.reduce(&:+)
  end

  def remove node
    n = node.to_s
    self.delete(n)
    self.each{|nod,links| links.delete(n)}
  end

  def run perm
    sum = 0
    perm.each{|n|
      sum += move self[n.to_s]
      remove n
    }
    sum
  end

  def add parent,child,dist
    build parent,child,dist
    build child,parent,dist
  end

  private
  def build n ,c ,d
    self[n.to_s] ||= {}
    self[n.to_s][c.to_s] = d
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
  p perm
  sum+= tree.run(perm)
}

puts ans[sum]




#!/bin/ruby

class Tree < Hash
  def initialize
    super
  end

  def move node
    p node.values
    node.values.reduce(&:+)
  end

  def remove node
    n = node.to_s
    self.delete(n)
    self.each{|nod,links| links.delete(n)}
  end

  def run perm
    sum = 0
    perm.each{|n|
      sum += move self[n.to_s]
      remove n
    }
    sum
  end

  def add parent,child,dist
    self[parent.to_s] ||= {}
    self[child.to_s] ||= {}
    # add parent
    build parent,child,dist
    build child,parent,dist
  end

  private
  def build source ,dest ,dist
    self[source.to_s][dest.to_s] = dist
    self[child.to_s].keys.each{|sub| build sub,parent,self[child.to_s][sub.to_s]+dist }
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
  p perm
  sum+= tree.run(perm)
}

puts ans[sum]
