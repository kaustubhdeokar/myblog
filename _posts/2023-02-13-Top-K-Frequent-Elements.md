---
layout: post
title: Top K Frequent Elements
categories: competitivecoding
---

Link to problem : https://leetcode.com/problems/top-k-frequent-elements/description/

Approach 1:

> Hashmap to store count <br>
> Priority Queue to maintain top k elements. 

```
public int[] topKFrequent(int[] arr, int k) {
        HashMap<Integer, Integer> map = new HashMap<>();

        for (int i : arr) {
            if (map.containsKey(i)) {
                map.put(i, map.get(i) + 1);
            } else {
                map.put(i, 1);
            }
        }
        
        Comparator<Integer> comparator = (i1, i2) -> Integer.compare(map.get(i1), map.get(i2));
        //A bit slow to add n element , with each insertion taking log n time.
        PriorityQueue<Integer> queue = new PriorityQueue<>(comparator);
        for (int i : map.keySet()) {
            queue.add(i);
            if(queue.size()>k)
                queue.poll();
        }
        
        int[] frequentKElems = new int[k];
        int idx = 0;
        while(!queue.isEmpty()){
            frequentKElems[idx++] = queue.poll();
        }
        return frequentKElems;
        
    }

```

Approach 2
> Step 1 remains the same.<br>
> Creating a 2-d arraylist with length = (max count found in step 1).<br>
> Inserting elements into 2-d arraylist according to their occurences. <br>
> Using a reverse iterator to find the top k elements.<br>


```

    public int[] topKFrequent(int[] nums, int k) {

        HashMap<Integer, Integer> map = new HashMap<>();
        int max = 1;
        for(int i:nums){
            if(map.get(i)==null){
                map.put(i, 1);
            }
            else{
                int val = map.get(i)+1;
                map.put(i, val);
                max = Integer.max(max, val);
            }
        }
    
        //(1, 3) (2, 2) (3, 1)

        ArrayList<ArrayList<Integer>> list = new ArrayList<>();
        for(int i=0;i<=max;i++){
            list.add(new ArrayList<>());
        }
        
        //() , (3), (2), (1)

        for(Map.Entry<Integer, Integer> entry: map.entrySet()){
            int count = entry.getValue();
            list.get(count).add(entry.getKey());
        }

        int[] result = new int[k];
        while(k>0){
            for(int i=list.size()-1;i>=0;i--){
                ArrayList<Integer> innerList = list.get(i);
                for(int j=0;j<innerList.size();j++){
                    if(k>0) result[--k] = innerList.get(j);
                    else break;
                }
                if(k==0) break;
            }
        }

        return result;

    }
```