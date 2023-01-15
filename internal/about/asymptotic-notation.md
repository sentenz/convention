# Asymptotic Notation

Asymptotic notations describes the time complexity of algorithms for asymptotic analysis with a given input of N.

- [1. Types of Notation](#1-types-of-notation)
  - [1.1. Big-O Notation](#11-big-o-notation)
  - [1.2. Omega Notation](#12-omega-notation)
  - [1.3. Theta Notation](#13-theta-notation)
- [2. Types of Complexity](#2-types-of-complexity)
  - [2.1. Computational Time Complexity](#21-computational-time-complexity)
  - [2.2. Space Complexity](#22-space-complexity)
- [3. Complexity Classes](#3-complexity-classes)
  - [3.1. $O(1)$ - Constant Time](#31-o1---constant-time)
  - [3.2. $O(\log{}n)$ - Logarithmic Time](#32-ologn---logarithmic-time)
  - [3.3. $O(n)$ - Linear Time](#33-on---linear-time)
  - [3.4. $O(n\log{}n)$ - Quasilinear Time](#34-onlogn---quasilinear-time)
  - [3.5. $O(n^2)$ - Quadratic Time](#35-on2---quadratic-time)
  - [3.6. $O(2^n)$ - Exponential Time](#36-o2n---exponential-time)
  - [3.7. $O(n!)$ - Factorial Time](#37-on---factorial-time)
  - [3.8. $O(n^m)$ - Polynomial Time](#38-onm---polynomial-time)
- [4. Complexity Classification](#4-complexity-classification)
- [5. References](#5-references)

## 1. Types of Notation

The big $O$, big theta $\Theta$, and big omega $\Omega$ notations are of Bachmann-Landau or [asymptotic notations](https://www.w3schools.blog/data-structure-asymptotic-analysis). These notations describe the limiting behavior of a function in mathematics or classify algorithms in computer science according to their complexity / processing time.

### 1.1. Big-O Notation

The big [$O$ notation](https://www.happycoders.eu/algorithms/big-o-notation-time-complexity/) describes the worst-case running time of a program. $O$ notation represents the upper bound of the running time of an algorithm. Compute the $O$ of an algorithm by counting the iterations an algorithm in the worst-case scenario with an input of N. Typically consult the $O$ to consider the worst case.

### 1.2. Omega Notation

The big $\Omega$ notation (Omega) describes the best running time of a program. Omega notation represents the lower bound of the running time of an algorithm. Compute the $\Omega$ by counting the iterations an algorithm in the best-case scenario based on an input of N.

For example, a Bubble Sort algorithm has a running time of $\Omega$(N)$ because in the best case scenario the list is already sorted, and the bubble sort will terminate after the first iteration.

### 1.3. Theta Notation

The big $\Theta$ notation (Theta) encloses the function from above and below. Since it represents the upper and the lower bound of the running time of an algorithm, it is used for analyzing the average-case complexity of an algorithm.  

## 2. Types of Complexity

### 2.1. Computational Time Complexity

Computational time complexity describes the change in the runtime of an algorithm, depending on the change in the input data's size.

Examples:

An algorithm degrades as the amount of input data within an unsorted array increases.

- To find an element within a sorted array takes one more step, when the size of the array doubles.

- If the size of an unsorted array doubles, it takes twice as long to find an element in it.

### 2.2. Space Complexity

Space complexity describes how much additional memory an algorithm needs depending on the size of the input data.

This does not refer to the memory required for the input data itself (i.e. that twice as much space is naturally needed for an input array twice as large), but the additional memory needed by the algorithm for loop and helper variables, temporary data structures, and the call stack (e.g, due to recursion).

## 3. Complexity Classes

Algorithms are divided into complexity classes. The Landau symbol $O$ (big $O$) is used to describe the complexity class. The complexity classes are sorted in ascending order of complexity and can vary depending on the notation type.

> NOTE The complexity class makes no statement about the absolute time required, but only about the change in the time required depending on the change in the input size. The absolute time is irrelevant for the complexity class.

### 3.1. $O(1)$ - Constant Time

Pronounced: `Order 1`, `O of 1`, `big O of 1`.

The runtime of $O(1)$ is constant, i.e. independent of the number of input elements n.

Examples:

- Accessing a specific element of an array of size n: No matter how large the array is, accessing it via array[index] always takes the same time.

- Inserting an element at the beginning of a linked list: This always requires setting one or two (for a doubly linked list) pointers (or references), regardless of the list's size. (In an array, on the other hand, this would require moving all values one field to the right, which takes longer with a larger array than with a smaller one).

### 3.2. $O(\log{}n)$ - Logarithmic Time

Pronounced: `Order log n`, `O of log n`, `big O of log n`.

The effort increases approximately by a constant amount when the number of input elements doubles.

Example:

Search algorithms like `binary search` for a specific element in a sorted array of size n.

### 3.3. $O(n)$ - Linear Time

Pronounced: `Order n`, `O of n`, `big O of n`.

The time grows linearly with the number of input elements n, e.g. if n doubles, then the time approximately doubles.

> NOTE `Approximately` because the effort may include components with lower complexity classes. These become insignificant if `n` is sufficiently large so they are omitted in the notation.

Examples:

- Finding a specific element in an array: All elements of the array have to be examined. If there are twice as many elements, it takes twice as long.

- Summing up all elements of an array: All elements must be looked at once. If the array is twice as large, it takes twice as long.

### 3.4. $O(n\log{}n)$ - Quasilinear Time

Pronounced: `Order n log n`, `O of n log n`, `big O of n log n`.

The effort grows slightly faster than linear because the linear component is multiplied by a logarithmic one.

Example:

Efficient sorting algorithms like `Quicksort`, `Merge Sort`, and `Heapsort`.

> NOTE Quicksort sorts a billion items in 90 seconds on "Processor Data". Insertion Sort, on the other hand, needs 85 million seconds for a billion items, that are  two years and eight months.

### 3.5. $O(n^2)$ - Quadratic Time

Pronounced: `Order n squared`, `O of n squared`, `big O of n squared`.

The time increases linearly with the square of the number of input elements. If the number of input elements n doubles, then the time roughly quadruples.

> NOTE The effort can contain components of lower complexity classes and constant factors. Both are irrelevant for the $O$ notation since they are no longer of importance if n is sufficiently large. It is therefore possible that $O(n^2)$ is faster than $O(n)$, at least up to a certain size of n.

Examples:

Sorting algorithms like `Insertion Sort`, `Selection Sort`, and `Bubble Sort`.

### 3.6. $O(2^n)$ - Exponential Time

Example:

Tower of Hanoi

### 3.7. $O(n!)$ - Factorial Time

Example:

Determinant Expansion by Minors, Brute force Search algorithm for Traveling Salesman Problem.

### 3.8. $O(n^m)$ - Polynomial Time

Example:

Strassen’s Matrix Multiplication, Bubble Sort, Selection Sort, Insertion Sort, Bucket Sort.

## 4. Complexity Classification

The [performance](https://www.bigocheatsheet.com/) (runtime) of an algorithm depends on the size of the input n or the number of operations is required for each input item.

The algorithms can be classified as best-to-worst performance (Time Complexity).

Best:

- $O(1)$

Good:

- $O(\log{}n)$

Fair:

- $O(n)$

Bad:

- $O(n\log{}n)$

Worst:

- $O(n^2)$
- $O(2^n)$
- $O(n!)$

## 5. References

- GeeksForGeeks [asymptotic notations](https://www.geeksforgeeks.org/analysis-of-algorithms-set-3asymptotic-notations/amp/) article.
- GeeksForGeeks [analysis of algorithms](https://www.geeksforgeeks.org/analysis-algorithms-big-o-analysis/) article.
- GitHub [o-notation](https://github.com/SvenWoltmann/o-notation-and-time-complexity) repository.
