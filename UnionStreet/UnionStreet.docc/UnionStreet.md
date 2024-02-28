# UnionStreet

**UnionStreet** is Drop-in **Union Find** data struct for Leetcode problems written (and tested) in Swift.

## Overview

Union Find algorithm is handy when dealing with finding connected components in a graph. 

## Topics

### Implementation


The implementation of Union Find algorithm in `UnionFind`. The core idea of this implementation revolves around two optimizations:

* **Union by Rank**: This optimization ensures that the smaller tree (or the one with lesser rank) is merged under the root of the taller tree. This helps in keeping the tree as flat as possible (see `func union(_:_:)`).

* **Path Compression**: Directly connect each node to the root during the find operation to flatten the tree structure even more (see `func find(_:)`).

Note, both `func union(_:_:)` and `func find(_:)` have side-effects, and hence marked as `mutating`.

### Time Complexity

Given these optimizations, the time complexity for both _union_ and _find_ operations can be considered very efficient over a series of operations. With **union by rank** and **path compression**, the amortized time complexity for each operation (_find_ and _union_) becomes nearly constant time, `O(α(n)` , where `α` is the inverse Ackermann function. For all practical data structure sizes,  `α(n)` is effectively a very small constant (less than 5).

### Space Complexity

TBA

### <!--@START_MENU_TOKEN@-->Group<!--@END_MENU_TOKEN@-->

- <!--@START_MENU_TOKEN@-->``Symbol``<!--@END_MENU_TOKEN@-->
