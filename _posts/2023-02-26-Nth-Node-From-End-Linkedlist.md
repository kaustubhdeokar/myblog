---
layout: post
title: Delete Nth Node From End Linkedlist
categories: linkedlist
---
# Intuition
Maintain a pointer to the previous node of the node we want to  replace. 


# Approach

1. If we have the pointer to the prev node of the target node we want to replace: than simple prev.next = target.next;
```
example: n = 2
1   ->  2 ->    3 ->    4   ->  5
              prev    target    
```
2. When n = size of the list, the previous pointer will be null, hence in that case answer will be <b>target.next</b>
```
example: n = 5
1     ->   2  ->    3 ->    4   ->  5
target         
prev=null;     
```


# Complexity
- Time complexity:
    O(n) one pass solution.

- Space complexity:
O(1) constant extra space for some pointers.

# Code
```
/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     int val;
 *     ListNode next;
 *     ListNode() {}
 *     ListNode(int val) { this.val = val; }
 *     ListNode(int val, ListNode next) { this.val = val; this.next = next; }
 * }
 */
class Solution {
    public ListNode removeNthFromEnd(ListNode head, int n) {
        
        ListNode resultPtr = head;
        ListNode prev = head;
        ListNode nthNode = head;
        ListNode nthNodePrev = null;
        int i=0;

        while(prev!=null){
            prev = prev.next;
            if(i>=n){
                nthNodePrev = nthNode;
                nthNode = nthNode.next;
            } 
            i+=1;
        }
        if(nthNodePrev != null) {
            nthNodePrev.next = nthNode.next;
            //System.out.println("nthnodeprev:"+nthNodePrev.val);
        }
        
        else if(nthNodePrev == null && nthNode!=null) {
            //System.out.println("nthNode:"+nthNode.val);
            return nthNode.next;
        }

        //System.out.println(nthNode.val);

        return resultPtr;
    }
}
```