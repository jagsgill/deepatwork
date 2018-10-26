---
title: "Array Manipulation"
date: 2018-08-10T09:55:52Z
draft: false
slug: "hackerrank-datastructures-arrays-arraymanipulation"
isCJKLanguage: false
---

# HackerRank: Array Manipulation
[Practice -> Data Structures -> Arrays -> Array Manipulation](https://www.hackerrank.com/challenges/crush/problem)

Given an array of zeroes, add a constant to given subarrays.
After all operations are completed, find the max value of the array.

Example input:

|a|b|k|
|:---:|:---:|:---:|
|1|5|3|
|4|8|7|
|6|9|1|

Array manipulations:

|operation \ index|0|1|2|3|4|5|6|7|8|9|
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
|0|0|0|0|0|0|0|0|0|0|0|
|1|3|3|3|3|3|0|0|0|0|0|
|2|3|3|3|10|10|7|7|7|0|0|
|3|3|3|3|10|10|8|8|8|1|0|

# Analysis
This is an instance of finding the best (weighted) overlapping interval.

## Example 1
All overlaps in the above example:
- (1,5)
    - overlaps with (4,8) on subinterval (4,5) __wins with total 19__
- (4,8)
    - overlaps with (1,5) on subinterval (4,5)
    - overlaps with (6,9) on subinterval (6,8)
- (6,9)
    - overlaps with (4,8) on subinterval (6,8)

| |(1,5)|(4,8) |(6,9) |
|:---:|:---:|:---:|:---:|
|(1,5)|3|(4,5)10|0|
|(4,8)|(4,5)10|7|(6,8)8|
|(6,9)|0|(6,8)8|1|

## Example 2

|a|b|k|
|:---:|:---:|:---:|
|1|5|3|
|4|8|7|
|6|9|1|
|4|5|2|

All overlaps in the above example:
- (1,5) +3
    - overlaps with (4,8) on subinterval (4,5) +7
        - overlaps with (4,5) on subinterval (4,5) +2 = 12
    - overlaps with (4,5) on subinterval (4,5) +2
        - overlaps with (4,8) on subinterval (4,5) +7 = 12
- (4,8) +7
    - overlaps with (1,5) on subinterval (4,5) +3
        - overlaps with (4,5) on subinterval (4,5) +2 = 12
    - overlaps with (6,9) on subinterval (6,8) +1 = 8
    - overlaps with (4,5) on subinterval (4,5) +2
        - overlaps with (1,5) on subinterval (4,5) +3 = 12
- (6,9) +1
    - overlaps with (4,8) on subinterval (6,8) +7 = 8



| |(1,5)|(4,8)|(6,9)|(4,5)}
|:---:|:---:|:---:|:---:|:---:|
|(1,5)|3|(4,5)10|0|(4,5)5|
|(4,8)|(4,5)10|7|(6,8)8|(4,5)9|
|(6,9)|0|(6,8)8|1|0|
|(4,5)|(4,5)5|(4,5)9|0|2|

The tabular approach does not work well as the problem scales to a larger
number of operations.

However, the listing appoach looks like a search with multiple trees.
The path from the root of each tree to its leaves is an overlapping
interval.


