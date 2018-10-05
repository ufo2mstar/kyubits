  Remove Nth Node From End of List
  Go to Discuss
Given a linked list, remove the n-th node from the end of list and return its head.

Example:

Given linked list: 1->2->3->4->5, and n = 2.

After removing the second node from the end, the linked list becomes 1->2->3->5.
Note:

Given n will always be valid.

Follow up:

Could you do this in one pass?


/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     int val;
 *     ListNode next;
 *     ListNode(int x) { val = x; }
 * }
 */
class Solution {
    public ListNode removeNthFromEnd(ListNode head, int n) {
        ListNode trailHead = head;
        ListNode leadHead = head;

        if(length(head)==1){
            head = null;
            return head;
        }
        else if (length(head)==n) {
            head = head.next;
            return head;
        }
        // n++;
        while(0 != n){
            n--;
            leadHead = leadHead.next;
        }

        // leadHead = leadHead.next;
        while(null != leadHead && null != leadHead.next){
            leadHead = leadHead.next;
            trailHead = trailHead.next;
        }

        if(null == trailHead || null == trailHead.next)
            return null;

        trailHead.next = trailHead.next.next;
        return head;
    }


    private int length(ListNode node){
        int i = 0;
        while(null != node){
            node = node.next;
            i++;
        }
        return i;
    }
}

×Close
  Remove Nth Node From End of List
Can you do it in one pass? Hint: keep a certain distance between the two pointers.

× Close
sample 8 ms submission
/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     int val;
 *     ListNode next;
 *     ListNode(int x) { val = x; }
 * }
 */
class Solution {
    	public ListNode removeNthFromEnd(ListNode head, int n) {
		if (head == null) {
			return null;
		}
        ListNode dummy = new ListNode(0);
        dummy.next  = head;
        ListNode slow = dummy;
        ListNode fast = dummy;

        for (int i = 0; i < n; i++) {
        	fast = fast.next;
        }
        while (fast.next != null) {
        	slow = slow.next;
        	fast = fast.next;
        }
        ListNode tmp = slow.next.next;
        slow.next = tmp;
        return dummy.next;
    }
}
