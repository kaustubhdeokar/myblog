---
layout: post
title: 523 Continuous Subarray Sum
categories: 
    - competitivecoding
---


Question:

```

Given an integer array nums and an integer k, return true if nums has a good subarray or false otherwise.

A good subarray is a subarray where:

its length is at least two, and
the sum of the elements of the subarray is a multiple of k.
Note that:

A subarray is a contiguous part of the array.
An integer x is a multiple of k if there exists an integer n such that x = n * k. 0 is always a multiple of k.

``````

> Input: nums = [23,2,4,6,7], k = 6 <br>
> Output: true <br>
> Explanation: [2, 4] is a continuous subarray of size 2 whose elements sum up to 6.

Approach:

The aim is to find any subarray of atleast length 2, which has the sum divisible by k.

> Straight forwards approach is to:
By using prefix sum, we could find all possible subarray sums in O(n2)

> Another approach is that, for every index we can note down the remainder of the prefix sum.<br>
ex: [23,2 ,4, 6 ,7]<br>
    prefix sum: [23,25,29,35, 42] 
    remainders: [5,1,5]

>    (remainder 5 repeats at index 2. hence we can verify at this point if the length of the subarray is at least 2. and return if true.)

```
Solution:

        int len = nums.length;
        int[] prefixSum = new int[nums.length];
        int sum = 0;
        HashMap<Integer, Integer> mapRemainderToIndex = new HashMap<>();

        mapRemainderToIndex.put(0,0); // 

        for(int i=0;i<len;i++){
            sum += nums[i];
            prefixSum[i] = sum;

            int remainder = prefixSum[i]%k;
            
            if(!mapRemainderToIndex.containsKey(remainder)){
                mapRemainderToIndex.put(remainder, i+1); //storing remainder->index.
            } 
            else if(mapRemainderToIndex.get(remainder)<i){  //previous index if smaller then we have atleast length 2. Hence return true.
                return true;
            }
        }

        return false;
```

