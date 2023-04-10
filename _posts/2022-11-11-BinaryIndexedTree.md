---
layout: post
title: Range Sum Query - Mutable
categories: 
    - tree
---

```
To do range sum queries in a better time complexity than O(n^2), we use binary indexed tree. 
Comparing to the segment trees, this is faster, easier to implement. 
It can be used almost for all such range query problem except for some which we will see in the segment tree doc
```

### Leetcode Problem:307. Range Sum Query - Mutable

```
Queries are divided into three types - (instantiation, sum & update)

["NumArray", "sumRange", "update", "sumRange"]
[[[1, 3, 5]], [0, 2], [1, 2], [0, 2]]

Output
[null, 9, null, 8]
```

> Solution using binary indexed tree. 

The idea of binary indexed tree is that any number can be written as a sum of numbers in 2's power.

Supposed there are 8 elements in an array.
We construct the binary indexed tree as [0,n+1] array not using the 0th element. 

Every index will add to the next i&(-i) index, in range of array length.

> i & (-i) is the lowest set bit for the i. For powers of 2 it's the max bit. 

```
[1,2,3,4,5,6,7,8]

index 1: 1 -> 2 -> 4 -> 8
index 2: 2 -> 4 -> 8
index 3: 3 -> 4 -> 8
index 4: 4 -> 8
index 5: 5 -> 6 -> 8
index 6: 6 -> 8
index 7: 7 -> 8
index 8: 8
```

The code for construction goes as follows:

```

def update_tree(index, limit, val, tree):
    index += 1
    
    while(index<=limit):
        tree[index] += val
        index += index & (-index)
    

def construct_binary_index_tree(arr):
    tree = [0]*(len(arr)+1)
    for i in range(0, len(arr)):
        update_tree(i, len(arr), arr[i], tree)
    self.tree = tree
    return tree
```

To get the sum uptil i, using the same concept of getting the last set bit, (index & (-index))

we can find the numbers who have contributed to the ith position, then going down (index & (-index)) until we reach 0.

```

  public static int getSum(int[] bTree, int i){
        
        int index = i+1;
        int sum = 0;
        while(index>0){
            sum+=bTree[index];
            index-= (index & (-index));
        }
        return sum;
    }

```





