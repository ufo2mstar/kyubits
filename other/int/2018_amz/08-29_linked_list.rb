# 1->2->3
# 2->3->5

# 1->2->2->3->3->5

class Node
  attr_accessor :val, :next_node

  def initialize(int)
    @val = int
  end

  def add_next_node(node)
    @next_node = node
  end
end


ll1 = Node.new(1)
ll1.add_next_node(Node.new(2))
ll1.add_next_node(Node.new(3))

# ll2

# // node1: 1->2->3 n
# // node2: 1 m
#
# O(n+m)
#

def two_list_merge node1, node2
  res = nil

  while node1 != nil or node2 != nil

    if node1 != nil and node2 != nil
      if node1.val < node2.val
        res == nil ? res = Node.new(node1.val) : res.add_next_node(Node.new(node1.val))
        node1 = node1.next_node
      else
        res == nil ? res = Node.new(node2.val) : res.add_next_node(Node.new(node2.val))
        node2 = node2.next_node
      end
    elsif node1 == nil
      res == nil ? res = Node.new(node2.val) : res.add_next_node(Node.new(node2.val))
      node2 = node2.next_node
    else
      res == nil ? res = Node.new(node1.val) : res.add_next_node(Node.new(node1.val))
      node1 = node1.next_node
    end
  end
end

# heads = [node_1 .. node_n]
# #
# heads = [<1> , <1>]
# heads = [<1> , <1>]
# heads = [<1> , <1>]
# heads = [<1> ]
# heads = [<2> ]
# heads = [<3> ]
# heads = []

# [].empty? = true k
# 1 -> 1 -> 1 n1
# 1 -> 2 -> 3 n2

def merge_lists heads
  head = nil
  res = nil
  until heads.empty?
    min_val = get_min(heads)
    if res == nil
      res = Node.new(min_val)
      head = res
    else
      res.add_next_node(Node.new(min_val))
      res = res.next_node
    end
  end
  head
end

# O(k)
# min heap
# O(log k)

def get_min heads
  min_val = 1.0/0

  heads.each do |node_i|
    min_val = [min_val, node_i.val].min
  end

  # min_val 1
  # heads = {<1->1->1>, <1->1->1>}
  heads.each_with_index do |node_i, i|
    if node_i.val == min_val
      heads[i] = node_i.next_node
      heads.compact! # O(K)
      break
    end
  end

  min_val
end

# O(n1+n2+..nn+k)
#max number of emlements in list is n
# number of lists is k
# O(nk)

# [1,2,nil,4,nil].compact = [1,2,4]


# 1 -> 2 -> 3
# 1 -> 2 -> 3
# 1 -> 2 -> 3
# ....
# List<Node>

def make_ll(ary)
  head = nil
  node = nil
  ary.each do |val|
    if node == nil
      (node = Node.new(val))
      head = node
    else
      node.add_next_node(Node.new(val))
      node = node.next_node
    end
  end

  head
end

n1 = make_ll([1, 2, 2, 4, 5, 6, 9])
n2 = make_ll([3, 3, 8, 8, 9])
n3 = make_ll([3, 3, 6, 10])
n4 = make_ll([7])

heads = [n1, n2, n3, n4]

res = merge_lists heads

while res.next_node
  print "#{res.val} -> "
  res = res.next_node
end
