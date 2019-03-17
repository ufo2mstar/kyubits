# Reverse Linked List
# Go to Discuss
# Reverse a singly linked list.
#
#     Example:
#
#     Input: 1->2->3->4->5->NULL
# Output: 5->4->3->2->1->NULL
# Follow up:
#
#            A linked list can be reversed either iteratively or recursively. Could you implement both?

# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# @param {ListNode} head
# @return {ListNode}
def reverse_list_itr(head)
  tail = head
  # head = node
  return head unless head

  while tail.next do
# tail pull
    curr_next = tail.next
    tail.next = curr_next.next

# head swap
    old_head = head
    head = curr_next
    head.next = old_head
  end

  head
end
