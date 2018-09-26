# Add Two Numbers
# DescriptionHintsSubmissionsDiscussSolution
# You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order and each of their nodes contain a single digit. Add the two numbers and return it as a linked list.
#
#     You may assume the two numbers do not contain any leading zero, except the number 0 itself.
#
#     Example:
#
#     Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
# Output: 7 -> 0 -> 8
# Explanation: 342 + 465 = 807.

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
def add_two_numbers(l1, l2)
  head = nil
  node = nil
  carry = 0
  begin
    sum = carry
    sum+=l1.val.to_i if l1
    sum+=l2.val.to_i if l2

    rem = sum % 10
    carry = sum / 10
    if head.nil?
      head = ListNode.new(rem)
      node = head
    else
      new_node = ListNode.new(rem)
      node.next = new_node
      node = node.next
    end
    l1 = l1.next if l1
    l2 = l2.next if l2
  end while !(l1.nil? and l2.nil?) or carry > 0
  head
end
