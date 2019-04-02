# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}
def merge_two_lists(l1, l2)
  return nil if l1.nil? and l2.nil?
  heads = []
  heads << l1 if l1
  heads << l2 if l2
  res = nil
  until heads.empty?
    min_val = get_min(heads)
    if res == nil
      res = ListNode.new(min_val)
      head = res
    else
      res.next = ListNode.new(min_val)
      res = res.next
    end
  end
  head
end

def get_min heads
  min_val = 1.0/0

  heads.each do |node_i|
    min_val = [min_val, node_i.val].min
  end

  # min_val 1
  # heads = {<1->1->1>, <1->1->1>}
  heads.each_with_index do |node_i, i|
    if node_i.val == min_val
      heads[i] = node_i.next
      heads.compact! # O(K)
      break
    end
  end

  min_val
end
