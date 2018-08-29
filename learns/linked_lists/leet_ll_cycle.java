/* -----------------------------------
 *  WARNING:
 * -----------------------------------
 *  Your code may fail to compile
 *  because it contains public class
 *  declarations.
 *  To fix this, please remove the
 *  "public" keyword from your class
 *  declarations.
 */

/**
 * Definition for singly-linked list.
 * class ListNode {
 *     int val;
 *     ListNode next;
 *     ListNode(int x) {
 *         val = x;
 *         next = null;
 *     }
 * }
 */
/**
 * Definition for singly-linked list.
 * class ListNode {
 *     int val;
 *     ListNode next;
 *     ListNode(int x) {
 *         val = x;
 *         next = null;
 *     }
 * }
 */
public class Solution {
    public ListNode detectCycle(ListNode head) {
        if(hasCycle(head)){
            ListNode fast = head;
            ListNode slow = head;

            fast = fast.next.next;
            slow = slow.next;
            while(fast != slow){
              fast = fast.next.next;
              slow = slow.next;
            }

            ListNode node_meet = slow;
            ListNode node_start = head;
            while(node_start != node_meet){
              node_start = node_start.next;
              node_meet = node_meet.next;
            }
            return node_meet;

        } else
            return null;
    }

    private boolean hasCycle(ListNode head) {
      if(null == head || null == head.next || null == head.next.next)
        return false;

        ListNode fast = head;
        ListNode slow = head;
        fast = fast.next.next;
        slow = slow.next;
        while(fast != slow){
          if(null == fast || null == fast.next || null == fast.next.next)
            return false;
          fast = fast.next.next;
          slow = slow.next;
        }
      return true;
    }
}
