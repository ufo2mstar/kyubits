# 817. Linked List Components
# Medium
#
# 202
#
# 480
#
# Favorite
#
# Share
# We are given head, the head node of a linked list containing unique integer values.
#
#     We are also given the list G, a subset of the values in the linked list.
#
#     Return the number of connected components in G, where two values are connected if they appear consecutively in the linked list.
#
#     Example 1:
#
#     Input:
#     head: 0->1->2->3
# G = [0, 1, 3]
# Output: 2
# Explanation:
#     0 and 1 are connected, so [0, 1] and [3] are the two connected components.
#     Example 2:
#
#     Input:
#     head: 0->1->2->3->4
# G = [0, 3, 1, 4]
# Output: 2
# Explanation:
#     0 and 1 are connected, 3 and 4 are connected, so [0, 1] and [3, 4] are the two connected components.
#     Note:
#
#     If N is the length of the linked list given by head, 1 <= N <= 10000.
#         The value of each node in the linked list will be in the range [0, N - 1].
#     1 <= G.length <= 10000.
#         G is a subset of all values in the linked list.
#     Accepted
# 22,557
# Submissions
# 41,596
#


# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# @param {ListNode} head
# @param {Integer[]} g
# @return {Integer}

# require
def num_components(head, g)
  uf_num_components(head, g)
end

def uf_num_components(head, g)
  @parent = {}
  set = {}
  g.each{|p| set[p] = true }
  while head.next
    l = head.val
    r = head.next.val
    @parent[l] = l unless @parent[l]
    @parent[r] = r unless @parent[r]

    union_find l,r if set[l] and set[r]
    head = head.next
  end
  set={}
  # p @parent
  g.each{|ge|
    p = @parent[ge]
    set[p] = true
  }

  set.size
end

def union_find a,b
  ra = find a
  rb = find b
  union ra,rb if ra != rb
end

def find a
  root = @parent[a]
  while @parent[root] != root
    root = @parent[root]
  end

  while @parent[a] != root
    temp = @parent[a]
    @parent[a] = root
    a = temp
  end

  root
end

def union a,b
  @parent[b] = a
end





require 'rspec'

describe "" do
  context "" do
    it '' do
      a = [0,1,2,3]
      b = [0,1,3]
      exp = 2

      res = num_components a,b

      expect(res).to eq exp
    end
  end
end
