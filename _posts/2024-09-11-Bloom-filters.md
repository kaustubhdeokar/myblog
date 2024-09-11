---
layout: post
title: Range Sum Query - Mutable
image: /assets/img/false-pos-false-neg.png
image2: /assets/img/bloom-filter-true-negative.png
image3: /assets/img/bloom-filter-false-positive.png
categories: 
    - systemdesign
---

Bloom filters 

- ![false-pos-false-neg.png]({{page.image | relative_url}})

-> can report false positives, but can never report false negative. 


User likes ribeye and potato and doesn't like pork chop.
This case gives us correct result.
- ![Bloom filter true negative]({{page.image2 | relative_url}})


User doesn't like lemon but the bloom filter denotes it likes lemon.
- ![Bloom filter false positive]({{page.image3 | relative_url}})

But the case can never happen where user likes something and it doesn't return the result as negative.

Hence false negatives cannot happen.


That's why for searching in a large data we can use bloom filters.