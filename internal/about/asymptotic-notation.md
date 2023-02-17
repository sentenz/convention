# Asymptotic Notation

Asymptotic notation is a mathematical concept used to describe the behavior of a function as the input size approaches infinity. It is commonly used in computer science and programming to analyze and compare the efficiency of different algorithms.

- [1. Types of Notation](#1-types-of-notation)
  - [1.1. Big O Notation (O)](#11-big-o-notation-o)
  - [1.2. Big Omega Notation (Ω)](#12-big-omega-notation-ω)
  - [1.3. Big Theta Notation (θ)](#13-big-theta-notation-θ)
  - [1.4. Little o Notation (o)](#14-little-o-notation-o)
  - [1.5. Little omega Notation (ω)](#15-little-omega-notation-ω)
- [2. Types of Complexity](#2-types-of-complexity)
  - [2.1. Time Complexity](#21-time-complexity)
  - [2.2. Space Complexity](#22-space-complexity)
  - [2.3. Communication Complexity](#23-communication-complexity)
  - [2.4. Circuit Complexity](#24-circuit-complexity)
  - [2.5. Kolmogorov Complexity](#25-kolmogorov-complexity)
- [3. Types of Classes](#3-types-of-classes)
  - [3.1. Time Complexity](#31-time-complexity)
    - [3.1.1. Constant Time](#311-constant-time)
    - [3.1.2. Logarithmic Time](#312-logarithmic-time)
    - [3.1.3. Linear Time](#313-linear-time)
    - [3.1.4. Linearithmic Time](#314-linearithmic-time)
    - [3.1.5. Quadratic Time](#315-quadratic-time)
    - [3.1.6. Cubic Time](#316-cubic-time)
    - [3.1.7. Exponential Time](#317-exponential-time)
    - [3.1.8. Factorial Time](#318-factorial-time)
    - [3.1.9. Polynomial Time](#319-polynomial-time)
    - [3.1.10. Sublinear Time](#3110-sublinear-time)
    - [3.1.11. Pseudo-polynomial Time](#3111-pseudo-polynomial-time)
    - [3.1.12. Exponential Time](#3112-exponential-time)
  - [3.2. Space Complexity](#32-space-complexity)
    - [3.2.1. Constant Space](#321-constant-space)
    - [3.2.2. Linear Space](#322-linear-space)
    - [3.2.3. Quadratic Space](#323-quadratic-space)
    - [3.2.4. Exponential Space](#324-exponential-space)
- [5. Complexity Classification](#5-complexity-classification)
- [4. Terminology](#4-terminology)
- [6. References](#6-references)

## 1. Types of Notation

Asymptotic notation are used in computer science to analyze the time and space complexity of algorithms.

### 1.1. Big O Notation (O)

Big O notation (O) represents the upper bound of an algorithm's running time. It gives an idea of how quickly the algorithm will grow in relation to the size of the input. For example, an algorithm with O(n) time complexity will have a linear growth in relation to the input size.

### 1.2. Big Omega Notation (Ω)

Big Omega notation (Ω) represents the lower bound of an algorithm's running time. It gives an idea of how quickly the algorithm will perform at its best in relation to the size of the input. For example, an algorithm with Ω(n) time complexity will have a linear growth at its best.

### 1.3. Big Theta Notation (θ)

Big Theta notation (θ) represents the tight bound of an algorithm's running time. It gives an idea of how quickly the algorithm will grow in relation to the size of the input, with both the upper and lower bounds taken into account. For example, an algorithm with θ(n) time complexity will have a linear growth at its best and worst.

### 1.4. Little o Notation (o)

Little o notation (o) represents the upper bound of an algorithm's growth rate, but it is a stricter condition than big O notation. It is used to describe algorithms that grow slower than another algorithm. For example, an algorithm with o(n^2) growth rate will grow slower than an algorithm with O(n^2) growth rate.

### 1.5. Little omega Notation (ω)

Little omega notation (ω) represents the lower bound of an algorithm's growth rate, but it is a stricter condition than omega notation. It is used to describe algorithms that grow faster than another algorithm. For example, an algorithm with ω(n^2) growth rate will grow faster than an algorithm with Ω(n^2) growth rate.

## 2. Types of Complexity

In computer science, there are several types of complexity that are used to analyze the performance and efficiency of algorithms. The different types of complexity are important for understanding the performance and behavior of different types of algorithms and computational systems, and they are often used in conjunction with one another to provide a more complete picture of the efficiency and complexity of a particular computational task.

### 2.1. Time Complexity

Time complexity refers to the amount of time an algorithm takes to complete as a function of the size of its input. Time complexity is usually expressed using big-O notation, which provides an upper bound on the growth rate of the algorithm's runtime as the input size grows.

### 2.2. Space Complexity

Space complexity refers to the amount of memory an algorithm requires to run as a function of the size of its input. Space complexity is also expressed using big-O notation, which provides an upper bound on the growth rate of the algorithm's memory usage as the input size grows.

### 2.3. Communication Complexity

Communication complexity: This refers to the amount of information that must be transmitted between different computational agents in a distributed computing system. Communication complexity is often used to analyze the performance of parallel algorithms that must coordinate their efforts across different processors or nodes.

### 2.4. Circuit Complexity

Circuit complexity refers to the amount of resources, such as gates or wires, required to implement a particular computational function using a digital circuit. Circuit complexity is often used in the design and analysis of hardware systems, such as computer processors or memory chips.

### 2.5. Kolmogorov Complexity

Kolmogorov complexity refers to the length of the shortest possible program that can generate a particular string of data. Kolmogorov complexity is a measure of the amount of information contained in a string, and it is often used in the study of information theory and computational complexity.

## 3. Types of Classes

> NOTE The specific values of k, M, and n can have a significant impact on the actual running time of an algorithm, even within the same complexity class. Additionally, other factors such as memory usage, cache efficiency, and parallelization can all influence the performance of an algorithm in practice. Asymptotic notation is a useful tool for analyzing and comparing algorithms, but it should always be used in conjunction with empirical testing and analysis to fully understand an algorithm's performance.

### 3.1. Time Complexity

#### 3.1.1. Constant Time

O(1), Ω(1), θ(1)

Algorithms with constant time complexity have a fixed running time that does not depend on the size of the input. They are the most efficient algorithms in terms of time complexity and are typically used for simple operations, such as assigning a value to a variable, accessing an array element, or performing basic arithmetic operations.

Examples: Assigning a value to a variable, accessing an array element, performing basic arithmetic operations.

#### 3.1.2. Logarithmic Time

O(log n), Ω(log n), θ(log n)

Algorithms with logarithmic time complexity divide the input into smaller and smaller pieces until the target is found. They are typically used for search or divide-and-conquer operations, where the input is sorted or can be easily split into smaller pieces.

Examples: Binary search, quicksort, mergesort.

#### 3.1.3. Linear Time

O(n), Ω(n), θ(n)

Algorithms with linear time complexity have a running time that is directly proportional to the size of the input. They are typically used for operations that involve iterating through the entire input, such as searching, filtering, or counting.

Examples: Linear search, selection sort, counting sort.

#### 3.1.4. Linearithmic Time

O(n log n), Ω(n log n), θ(n log n)

Algorithms with linearithmic time (or log-linear time) complexity have a running time that is a product of a linear and logarithmic function of the input size. They are typically used for sorting operations that involve dividing the input into smaller and smaller pieces and then merging them back together.

Examples: Heapsort, quicksort, mergesort.

#### 3.1.5. Quadratic Time

O(n^2), Ω(n^2), θ(n^2)

Algorithms with quadratic time complexity have a running time that is directly proportional to the square of the input size. They are typically used for operations that involve comparing or processing every pair of elements in the input, such as nested loops.

Examples: Bubble sort, selection sort, insertion sort.

#### 3.1.6. Cubic Time

O(n^3), Ω(n^3), θ(n^3)

Algorithms with cubic time complexity have a running time that is directly proportional to the cube of the input size. They are typically used for operations that involve comparing or processing every triplet of elements in the input, such as nested loops.

Examples: Matrix multiplication using the naive algorithm.

#### 3.1.7. Exponential Time

O(2^n), Ω(2^n), θ(2^n)

Algorithms with exponential time complexity have a running time that grows exponentially with the input size. They are typically used for operations that involve generating or enumerating all possible combinations or permutations of the input.

Examples: Brute-force search, exhaustive search, traveling salesman problem using dynamic programming.

#### 3.1.8. Factorial Time

O(n!), Ω(n!), θ(n!)

Factorial time complexity is a class that is used to describe algorithms that have a running time that is proportional to the factorial of the input size. Algorithms with factorial time complexity are typically used for problems that involve generating or counting all possible permutations or combinations of the input. An algorithm with a factorial time complexity is considered extremely inefficient and generally impractical for large inputs.

Examples: Brute-force search, traveling salesman problem, permutation generation.

#### 3.1.9. Polynomial Time

O(n^k), Ω(n^k), θ(n^k), where k is a constant. This includes linear time (k=1), quadratic time (k=2), and cubic time (k=3), among others.

Algorithms with polynomial time complexity have a running time that grows as a polynomial function of the input size. They are generally considered to be efficient and practical for solving a wide range of problems, as their running time increases at a manageable rate with increasing input size. Many commonly used algorithms fall under this category, including sorting, searching, and graph algorithms.

Examples: Bubble sort, Dijkstra's algorithm, polynomial regression.

#### 3.1.10. Sublinear Time

O(log log n), Ω(log log n), θ(log log n)

Algorithms with factorial time complexity have a running time that grows factorially with the input size. They are typically used for operations that involve generating or enumerating all possible permutations of the input.

Examples: Brute-force search, exhaustive search, traveling salesman problem using dynamic programming with memoization.

#### 3.1.11. Pseudo-polynomial Time

O(nM), where M is a number that is not necessarily polynomial in the size of the input n. This is used to describe algorithms that are efficient when the input data is restricted in some way, such as when M is much smaller than n.

Algorithms with pseudo-polynomial time complexity have a runtime that is a function of both the input size and the numerical value of the input. These algorithms are typically used for problems that involve integer values or counting, and their runtime can depend on the maximum value of the input, rather than just its size.

Examples: Knapsack problem, subset sum problem, coin change problem.

#### 3.1.12. Exponential Time

O(k^n), where k is a constant greater than 1.

Algorithms with exponential time complexity have a runtime that grows exponentially with the input size. These algorithms are typically considered `inefficient` for large inputs and are generally only used for small instances of a problem.

Examples: Brute-force search, traveling salesman problem, subset generation.

### 3.2. Space Complexity

Space complexity refers to the amount of memory required by an algorithm to solve a problem, and can depend on factors such as the size of the input, the data structures used, and the number of variables or objects created during the algorithm's execution.

#### 3.2.1. Constant Space

O(1), Ω(1), θ(1)

Algorithms with constant space complexity use a fixed amount of memory that does not depend on the size of the input. They are typically used for simple operations that do not require additional storage beyond the input and a small number of variables.

Examples: Assigning a value to a variable, accessing an array element, performing basic arithmetic operations.

#### 3.2.2. Linear Space

O(n), Ω(n), θ(n)

Algorithms with linear space complexity use a memory allocation that is directly proportional to the size of the input. They are typically used for operations that require additional data structures to be created in order to solve the problem.

Examples: Building a hash table, constructing a binary tree, merging sorted arrays.

#### 3.2.3. Quadratic Space

O(n^2), Ω(n^2), θ(n^2)

Algorithms with quadratic space complexity use a memory allocation that is directly proportional to the square of the input size. They are typically used for operations that require additional data structures that depend on pairs of elements in the input.

Examples: Matrix multiplication, bubble sort, selection sort (when implemented with a two-dimensional array).

#### 3.2.4. Exponential Space

O(2^n), Ω(2^n), θ(2^n)

Algorithms with exponential space complexity use a memory allocation that grows exponentially with the input size. They are typically used for operations that require storing or generating all possible combinations or permutations of the input. This space complexity class is commonly associated with problems that are known to be `intractable` in the sense that no algorithm can solve them in polynomial time, such as the subset sum problem or the knapsack problem.

Examples: Generating all subsets of a set, computing the Fibonacci sequence using recursive memoization.

## 5. Complexity Classification

Complexity classes are commonly used to describe the performance of algorithms or problems. These classes include:

- P
  > The P (Polynomial Time) class of problems that can be solved in polynomial time using a deterministic algorithm.

- NP
  > The NP (Nondeterministic Polynomial Time) class of problems for which a solution can be verified in polynomial time, but not necessarily found in polynomial time.

- NP-hard
  > The NP-hard (Nondeterministic Polynomial Time Hard) class of problems that are at least as hard as the hardest problems in NP. These problems do not necessarily have polynomial-time solutions.

- NP-complete
  > The NP-complete (Nondeterministic Polynomial Time Complete) class of problems that are both in NP and NP-hard. These problems are some of the most difficult computational problems known.

- EXPTIME
  > The EXPTIME (Exponential Time) class of problems that can be solved in exponential time.

- PSPACE
  > The PSPACE (Polynomial Space) class of problems that can be solved using polynomial space.

- EXPSPACE
  > The EXPSPACE (Exponential Space) class of problems that can be solved using exponential space.

> NOTE PSPACE and EXPSPACE are space complexity classes, while the others are time complexity classes. Additionally, NP, NP-hard, and NP-complete are related to the concept of nondeterminism, while P, EXPTIME, PSPACE, and EXPSPACE are related to deterministic algorithms.

### Performance

The [performance](https://www.bigocheatsheet.com/) (runtime) of an algorithm depends on the size of the input n or the number of operations is required for each input item.

The algorithms can be classified as best-to-worst performance (Time Complexity).

- Best
  >
  > - Constant Time: O(1)

- Good
  >
  > - Logarithmic Time: O(log n)

- Fair:
  >
  > - Linear Time: O(n)

- Bad
  >
  > - Linearithmic Time: O(n log n)

- Worst
  >
  > - Quadratic Time: O(n^2)
  > - Exponential Time: O(2^n)
  > - Factorial Time: O(n!)

## 4. Terminology

- Big O notation (O)
  > A function f(n) is said to be O(g(n)) if there exist constants c and n0 such that |f(n)| <= c|g(n)| for all n >= n0.

- Omega notation (Ω)
  > A function f(n) is said to be Ω(g(n)) if there exist constants c and n0 such that |f(n)| >= c|g(n)| for all n >= n0.

- Theta notation (Θ)
  > A function f(n) is said to be Θ(g(n)) if it is both O(g(n)) and Ω(g(n)).

- Little o notation (o)
  > A function f(n) is said to be o(g(n)) if for any constant ε > 0, there exists a constant n0 such that |f(n)| < ε|g(n)| for all n >= n0.

- Little omega notation (ω)
  > A function f(n) is said to be ω(g(n)) if for any constant ε > 0, there exists a constant n0 such that |f(n)| > ε|g(n)| for all n >= n0.

## 6. References

- GeeksForGeeks [asymptotic notations](https://www.geeksforgeeks.org/analysis-of-algorithms-set-3asymptotic-notations/amp/) article.
- GeeksForGeeks [analysis of algorithms](https://www.geeksforgeeks.org/analysis-algorithms-big-o-analysis/) article.
- GitHub [o-notation](https://github.com/SvenWoltmann/o-notation-and-time-complexity) repository.
