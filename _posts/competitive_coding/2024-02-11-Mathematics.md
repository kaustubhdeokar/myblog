---
layout: post
title: Mathematics
categories: competitivecoding
---

### Mathematics.

Modular exponentiation

- Problem statement. Calculate x^n % m 
- For large n , like 10^18, could be time consuming even for O(n).<br>
- Using following method.

> How it works.

```
    To calculate 2^10 % x
    on even powers, like 10 -> (2^2)^5 => 4^5 //straightaway halving the power. 
    for odd powers, 4 * (4^4) , power-=1, store the result of first part of operation and continue process.

        // 2^10      oddPowMultiplier=1    evenPowMultiplier=2   p=10
        // (4)^5     oddPowMultiplier=1    evenPowMultiplier=4   p=5
        // 4*(4^4)   oddPowMultiplier=4    evenPowMultiplier=4   p=4
        // 4*(16^2)  oddPowMultiplier=4    evenPowMultiplier=16  p=2
        // 4*(256^1) oddPowMultiplier=4    evenPowMultiplier=256 p=1
        // 4*256     oddPowMultiplier=1024 evenPowMultiplier=256 p=0

```
> Code
 
```
public static int exponential(int number, int power, int mod) {

        

        int evenPowMultiplier = number;
        int oddPowMultiplier = 1;

        while (power > 0) {
            if (power % 2 == 0) {
                evenPowMultiplier *= evenPowMultiplier;
                power /= 2;
            } else {
                oddPowMultiplier *= evenPowMultiplier;
                power -= 1;
            }
            //modulo should be done here to for evenPowMul & oddPowMul
            System.out.print("oddPowMultiplier:" + oddPowMultiplier);
            System.out.println(" evenPowMultiplier:" + evenPowMultiplier);
        }
        return oddPowMultiplier % mod;
    }
```