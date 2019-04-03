# Definition for singly-linked list.
# class ListNode
class Node
    attr_accessor :val, :next
    def initialize(val)
        @val = val
        @next = nil
    end
end

# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}
def merge_two_lists(l1, l2)
  if l1 and l2
    l1,l2 = [l2,l1] if l1.val > l2.val
    l1.next = merge_two_lists l1.next,l2
  end
  l1 or l2
end

def n_list_technique(heads)
  lowest, others = [],[]
  heads.each do |list|
    lowest = list
  end
end

def merge_lists heads
  return if heads.empty?
  return heads[0] if heads.size == 1
  result = nil
  two_list_technique heads, result
  result
end

def two_list_technique(heads,result)
  heads.each do |list|
    result = merge_two_lists result, list
  end
end

def make_ll(ary)
  head = nil
  node = nil
  ary.each do |val|
    if node == nil
      (node = Node.new(val))
      head = node
    else
      node.next = Node.new(val)
      node = node.next
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

while res
  print "#{res.val} -> "
  res = res.next
end
