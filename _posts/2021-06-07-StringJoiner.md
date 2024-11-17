---
layout: post
title: Java String Joiner
categories: 
    - programming
---

> Using a delimiter of ", ", appending strings will produce the result
  one, two, three.

```
    @Test
    public void testStringJoiner() {
        StringJoiner stringJoiner = new StringJoiner(", ");

        stringJoiner.add("one");
        stringJoiner.add("two");
        stringJoiner.add("three");

        Assert.assertEquals(stringJoiner.toString(), "one, two, three");
    }
```
> Can be done similar to a strinbuilder , as add returns the string joiner object.

```
    @Test
    public void testStringJoinerReturnsStringJoiner() {
        StringJoiner stringJoiner = new StringJoiner(", ");

        stringJoiner.add("one").add("two").add("three");

        Assert.assertEquals(stringJoiner.toString(), "one, two, three");
    }
```
> Using starting and ending values. 

```
    @Test
    public void testStringJoinerWithStartingAndEndingValues() {
        StringJoiner stringJoiner = new StringJoiner(", ","Start{","}End");
        stringJoiner.add("one");
        stringJoiner.add("two");
        stringJoiner.add("three");

        Assert.assertEquals(stringJoiner.toString(), "Start{one, two, three}End");
    }
```
> To create a pattern as [one], [two], [three]

```

    @Test
    public void testStringJoinerCreatingSquareBracketPattern() {
        StringJoiner stringJoiner = new StringJoiner("], [","[","]");
        stringJoiner.add("one");
        stringJoiner.add("two");
        stringJoiner.add("three");

        Assert.assertEquals(stringJoiner.toString(), "[one], [two], [three]");
    }
}