# Sanitizer

Sanitizers are dynamic analysis tools that detect bugs such as buffer overflows or accesses, dangling pointers or different types of undefined behavior at runtime and prevent security vulnerabilities in C/C++ code.

- [1. Category](#1-category)
  - [1.1. Valgrind](#11-valgrind)
    - [1.1.1. Memcheck](#111-memcheck)
    - [1.1.2. Helgrind](#112-helgrind)
    - [1.1.3. DRD](#113-drd)
    - [1.1.4. Massif](#114-massif)
    - [1.1.5. Cachegrind](#115-cachegrind)
  - [1.2. Google Sanitizer](#12-google-sanitizer)
    - [1.2.1. AddressSanitizer (ASan)](#121-addresssanitizer-asan)
    - [1.2.2. LeakSanitizer (LSan)](#122-leaksanitizer-lsan)
    - [1.2.3. MemorySanitizer (MSan)](#123-memorysanitizer-msan)
    - [1.2.4. UndefinedBehaviorSanitizer (UBSan)](#124-undefinedbehaviorsanitizer-ubsan)
    - [1.2.5. ThreadSanitizer (TSan)](#125-threadsanitizer-tsan)
- [2. References](#2-references)

## 1. Category

### 1.1. Valgrind

[Valgrind](https://valgrind.org/) is a dynamic analysis tool that can be used to detect memory leaks, or buffer overflows errors in C/C++ code.

> [!NOTE]
> Valgrind tools are not designed to be used simultaneously. Each tool serves a specific purpose and provides different types of analysis or debugging capabilities. Run one tool at a time to get the desired information about a program's behavior or performance.

1. Support and Services

    - Linux
      > Support for `x86`, `AMD64`, `ARM32`, `ARM64`, `PPC32`, `PPC64BE`, `PPC64LE`, `S390X`, `MIPS32`, `MIPS64`.

    - Android
      > Support for `ARM`, `ARM64`, `MIPS32`, `X86`.

    - Solaris
      > Support for `X86`, `AMD64`.

    - FreeBSD
      > Support for `X86`, `AMD64`.

    - MacOSX
      > Support for `AMD64`.

#### 1.1.1. Memcheck

[Memcheck](https://valgrind.org/docs/manual/mc-manual.html) detects memory-management problems, primarily aimed at C and C++ programs.

1. Files and Folders

    - `program.c`
      > Create a memory leak by allocating memory and not freeing it.

      ```c
      #include <stdlib.h>

      int* function(void) {
        int *memory_leak = malloc(sizeof(int)); // Triggering memory leak error
        return memory_leak;
      }

      int main(void) {
        int *data = function();
        return 0;
      }
      ```

2. Commands and Operations

    - Compile and Check
      > Compiling a program with gcc and checking for memory leaks with Memcheck.

      ```bash
      gcc -g program.c -o executable
      valgrind --tool=memcheck --leak-check=yes ./executable
      ```

3. Output and Result

    - `output.log`

      ```plaintext
      ==1665143== Memcheck, a memory error detector
      ==1665143== Copyright (C) 2002-2017, and GNU GPL'd, by Julian Seward et al.
      ==1665143== Using Valgrind-3.18.1 and LibVEX; rerun with -h for copyright info
      ==1665143== Command: ./executable
      ==1665143== 
      ==1665143== 
      ==1665143== HEAP SUMMARY:
      ==1665143==     in use at exit: 4 bytes in 1 blocks
      ==1665143==   total heap usage: 1 allocs, 0 frees, 4 bytes allocated
      ==1665143== 
      ==1665143== 4 bytes in 1 blocks are definitely lost in loss record 1 of 1
      ==1665143==    at 0x4848899: malloc (in /usr/libexec/valgrind/vgpreload_memcheck-amd64-linux.so)
      ==1665143==    by 0x10915E: function (program.c:4)
      ==1665143==    by 0x109179: main (program.c:9)
      ==1665143== 
      ==1665143== LEAK SUMMARY:
      ==1665143==    definitely lost: 4 bytes in 1 blocks
      ==1665143==    indirectly lost: 0 bytes in 0 blocks
      ==1665143==      possibly lost: 0 bytes in 0 blocks
      ==1665143==    still reachable: 0 bytes in 0 blocks
      ==1665143==         suppressed: 0 bytes in 0 blocks
      ==1665143== 
      ==1665143== For lists of detected and suppressed errors, rerun with: -s
      ==1665143== ERROR SUMMARY: 1 errors from 1 contexts (suppressed: 0 from 0)
      ```

#### 1.1.2. Helgrind

[Helgrind](https://valgrind.org/docs/manual/hg-manual.html) is a thread debugger for finding data races in multithreaded programs.

1. Files and Folders

    - `program.c`
      > Creates data races by having two threads increment a shared variable.

      ```c
      #include <pthread.h>
      #include <stdio.h>

      int shared_variable = 0;

      void* thread_function(void* arg) {
        shared_variable++;
        return NULL;
      }

      int main(void) {
        pthread_t thread1, thread2;
        pthread_create(&thread1, NULL, thread_function, NULL);
        pthread_create(&thread2, NULL, thread_function, NULL);
        pthread_join(thread1, NULL);
        pthread_join(thread2, NULL);
        printf("Shared variable: %d\n", shared_variable);
        return 0;
      }
      ```

2. Commands and Operations

    - Compile and Detect
      > Detecting data races in a multithreaded program with Helgrind.

      ```bash
      gcc -g -pthread program.c -o executable
      valgrind --tool=helgrind ./executable
      ```

3. Output and Result

    - `output.log`

      ```plaintext
      ==1587133== Helgrind, a thread error detector
      ==1587133== Copyright (C) 2007-2017, and GNU GPL'd, by OpenWorks LLP et al.
      ==1587133== Using Valgrind-3.18.1 and LibVEX; rerun with -h for copyright info
      ==1587133== Command: ./executable
      ==1587133== 
      ==1587133== Possible data race during write of size 4 at 0x10C014 by thread #3
      ==1587133== Locks held: none
      ==1587133==    at 0x1091BE: thread_function (program.c:7)
      ==1587133==    by 0x485396A: ??? (in /usr/libexec/valgrind/vgpreload_helgrind-amd64-linux.so)
      ==1587133==    by 0x48FBAC2: start_thread (pthread_create.c:442)
      ==1587133==    by 0x498CA03: clone (clone.S:100)
      ==1587133== 
      ==1587133== This conflicts with a previous write of size 4 by thread #2
      ==1587133== Locks held: none
      ==1587133==    at 0x1091BE: thread_function (program.c:7)
      ==1587133==    by 0x485396A: ??? (in /usr/libexec/valgrind/vgpreload_helgrind-amd64-linux.so)
      ==1587133==    by 0x48FBAC2: start_thread (pthread_create.c:442)
      ==1587133==    by 0x498CA03: clone (clone.S:100)
      ==1587133==  Address 0x10c014 is 0 bytes inside data symbol "shared_variable"
      ==1587133== 
      Shared variable: 2
      ==1587133== 
      ==1587133== Use --history-level=approx or =none to gain increased speed, at
      ==1587133== the cost of reduced accuracy of conflicting-access information
      ==1587133== For lists of detected and suppressed errors, rerun with: -s
      ==1587133== ERROR SUMMARY: 2 errors from 2 contexts (suppressed: 0 from 0)
      ```

#### 1.1.3. DRD

[DRD](https://valgrind.org/docs/manual/drd-manual.html) is a thread error detector that helps in identifying issues in multithreaded programs.

1. Files and Folders

    - `program.c`
      > Creates data races by having two threads increment a shared variable.

      ```c
      #include <pthread.h>
      #include <stdio.h>

      int shared_variable = 0;

      void* thread_function(void* arg) {
        shared_variable++;
        return NULL;
      }

      int main(void) {
        pthread_t thread1, thread2;
        pthread_create(&thread1, NULL, thread_function, NULL);
        pthread_create(&thread2, NULL, thread_function, NULL);
        pthread_join(thread1, NULL);
        pthread_join(thread2, NULL);
        printf("Shared variable: %d\n", shared_variable);
        return 0;
      }
      ```

2. Commands and Operations

    - Compile and Detect
      > Detecting a thread error detector DRD

      ```bash
      gcc -g -pthread program.c -o executable
      valgrind --tool=drd ./executable
      ```

3. Output and Result

    - `output.log`

      ```plaintext
      ==1591008== drd, a thread error detector
      ==1591008== Copyright (C) 2006-2020, and GNU GPL'd, by Bart Van Assche.
      ==1591008== Using Valgrind-3.18.1 and LibVEX; rerun with -h for copyright info
      ==1591008== Command: ./executable
      ==1591008== 
      ==1591008== Thread 3:
      ==1591008== Conflicting store by thread 3 at 0x0010c014 size 4
      ==1591008==    at 0x1091BE: thread_function (program.c:7)
      ==1591008==    by 0x485437A: ??? (in /usr/libexec/valgrind/vgpreload_drd-amd64-linux.so)
      ==1591008==    by 0x4918AC2: start_thread (pthread_create.c:442)
      ==1591008==    by 0x49A9A03: clone (clone.S:100)
      ==1591008== Allocation context: BSS section of /home/executable
      ==1591008== Other segment start (thread 2)
      ==1591008==    at 0x49A99F6: clone (clone.S:83)
      ==1591008==    by 0x49187CF: ??? (pthread_create.c:321)
      ==1591008==    by 0x52B063F: ???
      ==1591008== Other segment end (thread 2)
      ==1591008==    at 0x49A2B7B: madvise (syscall-template.S:117)
      ==1591008==    by 0x4918BE0: advise_stack_range (allocatestack.c:195)
      ==1591008==    by 0x4918BE0: start_thread (pthread_create.c:551)
      ==1591008==    by 0x49A9A03: clone (clone.S:100)
      ==1591008== 
      Shared variable: 2
      ==1591008== 
      ==1591008== For lists of detected and suppressed errors, rerun with: -s
      ==1591008== ERROR SUMMARY: 2 errors from 2 contexts (suppressed: 8 from 4)
      ```

#### 1.1.4. Massif

[Massif](https://valgrind.org/docs/manual/ms-manual.html) is a heap profiler that measures how much heap memory a program uses.

1. Files and Folders

    - `program.c`
      > Allocates and frees memory to analyze heap usage with Massif.

      ```c
      #include <stdlib.h>

      void function(void) {
        void *block = malloc(1);
        free(block);
      }

      void massif(void) {
        void *block = malloc(1024 * 1024); // Allocate 1MB of memory
        free(block);
      }

      int main() {
        function();
        massif();
        return 0;
      }
      ```

2. Commands and Operations

    - Compile and Analyze
      > Analyzing heap usage with Massif.

      ```bash
      gcc -g program.c -o executable
      valgrind --tool=massif ./executable
      ```

3. Output and Result

    - `massif.out.xxx`

      ```plaintext
      desc: (none)
      cmd: ./executable
      time_unit: i
      #-----------
      snapshot=2
      #-----------
      time=148046
      mem_heap_B=1
      mem_heap_extra_B=23
      mem_stacks_B=0
      heap_tree=detailed
      n1: 1 (heap allocation functions) malloc/new/new[], --alloc-fns, etc.
      n1: 1 0x10917E: function (program.c:4)
        n0: 1 0x1091C7: main (program.c:14)
      #-----------
      snapshot=5
      #-----------
      time=148123
      mem_heap_B=1048576
      mem_heap_extra_B=8
      mem_stacks_B=0
      heap_tree=peak
      n2: 1048576 (heap allocation functions) malloc/new/new[], --alloc-fns, etc.
      n1: 1048576 0x1091A7: massif (program.c:9)
        n0: 1048576 0x1091CC: main (program.c:15)
      n0: 0 in 1 place, below massif's threshold (1.00%)
      ```

#### 1.1.5. Cachegrind

[Cachegrind](https://valgrind.org/docs/manual/cg-manual.html) is a cache profiler that analyzes cache use and identifies bottlenecks.

1. Files and Folders

    - `program.c`
      > Creates cache performance issues by accessing an array of integers.

      ```c
      #include <stdlib.h>

      int function(void) {
        int i, sum = 0;
        int *array = malloc(1000 * sizeof(int));
        for (i = 0; i < 1000; i++) {
          sum += array[i];
        }
        return sum;
      }

      int main(void) {
        int data = function();
        return data;
      }
      ```

2. Commands and Operations

    - Compile, Profile and Analyze
      > Profiling cache usage with Cachegrind.

      ```bash
      gcc -g program.c -o executable
      valgrind --tool=cachegrind ./executable
      cg_annotate cachegrind.out.xxx
      ```

3. Output and Result

    - `output.log`

      ```plaintext
      --------------------------------------------------------------------------------
      -- Auto-annotated source: /home/program.c
      --------------------------------------------------------------------------------
      Ir             I1mr       ILmr       Dr             D1mr        DLmr        Dw         D1mw       DLmw

          .          .          .              .           .           .          .          .          .             #include <stdlib.h>
          .          .          .              .           .           .          .          .          .
          4 ( 0.00%) 0          0              0           0           0          1 ( 0.01%) 0          0             int function(void) {
          1 ( 0.00%) 0          0              0           0           0          1 ( 0.01%) 0          0               int i, sum = 0;
          3 ( 0.00%) 0          0              0           0           0          2 ( 0.02%) 0          0               int *array = malloc(1000 * sizeof(int));
      3,004 ( 2.03%) 0          0          2,001 ( 5.19%)  0           0          1 ( 0.01%) 0          0               for (i = 0; i < 1000; i++) {
      7,000 ( 4.72%) 0          0          4,000 (10.37%) 62 ( 3.83%) 62 ( 4.57%) 0          0          0                 sum += array[i];
          .          .          .              .           .           .          .          .          .               }
          1 ( 0.00%) 0          0              1 ( 0.00%)  0           0          0          0          0               return sum;
          2 ( 0.00%) 0          0              2 ( 0.01%)  0           0          0          0          0             }
          .          .          .              .           .           .          .          .          .
          4 ( 0.00%) 1 ( 0.08%) 1 ( 0.08%)     0           0           0          1 ( 0.01%) 0          0             int main(void) {
          2 ( 0.00%) 0          0              0           0           0          2 ( 0.02%) 0          0               int data = function();
          1 ( 0.00%) 0          0              1 ( 0.00%)  0           0          0          0          0               return data;
          2 ( 0.00%) 0          0              2 ( 0.01%)  0           0          0          0          0             }

      --------------------------------------------------------------------------------
      Ir              I1mr       ILmr       Dr             D1mr        DLmr        Dw         D1mw       DLmw
      --------------------------------------------------------------------------------
      10,024 ( 6.76%) 1 ( 0.08%) 1 ( 0.08%) 6,007 (15.57%) 62 ( 3.83%) 62 ( 4.57%) 8 ( 0.06%) 0          0           events annotated
      ```

### 1.2. Google Sanitizer

The [Google Sanitizers](https://github.com/google/sanitizers) are a collection of tools integrated into compilers, designed to detect various types of bugs.

> [!NOTE]
> `Google Sanitizers` are not designed to be used simultaneously. Each sanitizer serves a specific purpose and provides different types of analysis or debugging capabilities. Compile and run a program with one sanitizer at a time to get the desired information about a program’s behavior or performance. Using multiple sanitizers at once could lead to conflicts and potentially inaccurate results.

1. Support and Services

    - LLVM/Clang
      > Support for `AddressSanitizer (ASan)`, `LeakSanitizer (LSan)`, `UndefinedBehaviorSanitizer (UBSan)`, `ThreadSanitizer (TSan)`, `MemorySanitizer (MSan)`, `DataFlowSanitizer (DFSan)`.
  
    - GCC/G++
      > Support for `AddressSanitizer (ASan)`, `LeakSanitizer (LSan)`, `UndefinedBehaviorSanitizer (UBSan)`, `ThreadSanitizer (TSan)`.

    - MSVC
      > Support for `AddressSanitizer (ASan)`.

#### 1.2.1. AddressSanitizer (ASan)

[AddressSanitizer (ASan)](https://github.com/google/sanitizers/wiki/AddressSanitizer) is a dynamic analysis tool that detects memory access errors, such as out-of-bounds memory accesses and use-after-free bugs.

1. Files and Folders

    - `program.cpp`
      > Out-of-bounds access, triggering ASan error.

      ```cpp
      #include <iostream>

      void function(void) {
        int* array = new int[10];
        array[11] = 42; // Triggering ASan error
        delete[] array;
      }

      int main(void) {
        function();
        return 0;
      }
      ```

2. Commands and Operations

    - Compile
      > Compiling with the sanitizer flag `-fsanitize=address`.

      ```bash
      g++ -fsanitize=address -std=c++14 program.cpp -o executable
      ./executable
      ```

3. Output and Result

    - `output.log`

      ```plaintext
      =================================================================
      ==1617890==ERROR: AddressSanitizer: heap-buffer-overflow on address 0x60400000003c at pc 0x56502431e2e2 bp 0x7fff570c3790 sp 0x7fff570c3780
      WRITE of size 4 at 0x60400000003c thread T0
          #0 0x56502431e2e1 in function() (/home/executable+0x12e1)
          #1 0x56502431e30a in main (/home/executable+0x130a)
          #2 0x7f84f97c2d8f in __libc_start_call_main ../sysdeps/nptl/libc_start_call_main.h:58
          #3 0x7f84f97c2e3f in __libc_start_main_impl ../csu/libc-start.c:392
          #4 0x56502431e1c4 in _start (/home/executable+0x11c4)

      0x60400000003c is located 4 bytes to the right of 40-byte region [0x604000000010,0x604000000038)
      allocated by thread T0 here:
          #0 0x7f84f9dab357 in operator new[](unsigned long) ../../../../src/libsanitizer/asan/asan_new_delete.cpp:102
          #1 0x56502431e29e in function() (/home/executable+0x129e)
          #2 0x56502431e30a in main (/home/executable+0x130a)
          #3 0x7f84f97c2d8f in __libc_start_call_main ../sysdeps/nptl/libc_start_call_main.h:58

      SUMMARY: AddressSanitizer: heap-buffer-overflow (/home/executable+0x12e1) in function()
      Shadow bytes around the buggy address:
        0x0c087fff7fb0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
        0x0c087fff7fc0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
        0x0c087fff7fd0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
        0x0c087fff7fe0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
        0x0c087fff7ff0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
      =>0x0c087fff8000: fa fa 00 00 00 00 00[fa]fa fa fa fa fa fa fa fa
        0x0c087fff8010: fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
        0x0c087fff8020: fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
        0x0c087fff8030: fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
        0x0c087fff8040: fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
        0x0c087fff8050: fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
      Shadow byte legend (one shadow byte represents 8 application bytes):
        Addressable:           00
        Partially addressable: 01 02 03 04 05 06 07 
        Heap left redzone:       fa
        Freed heap region:       fd
        Stack left redzone:      f1
        Stack mid redzone:       f2
        Stack right redzone:     f3
        Stack after return:      f5
        Stack use after scope:   f8
        Global redzone:          f9
        Global init order:       f6
        Poisoned by user:        f7
        Container overflow:      fc
        Array cookie:            ac
        Intra object redzone:    bb
        ASan internal:           fe
        Left alloca redzone:     ca
        Right alloca redzone:    cb
        Shadow gap:              cc
      ==1617890==ABORTING
      ```

#### 1.2.2. LeakSanitizer (LSan)

[LeakSanitizer (LSan)](https://github.com/google/sanitizers/wiki/AddressSanitizerLeakSanitizer) is a dynamic analysis tool that detects memory leaks.

1. Files and Folders

    - `program.cpp`
      > Missing delete statement, triggering LSan error (leak).

      ```cpp
      #include <iostream>

      int* function(void) {
        int* leaked_data = new int;
        return leaked_data;
      }

      int main(void) {
        int* data = function();
        // Triggering LSan error
        return 0;
      }
      ```

2. Commands and Operations

    - Compile
      > Compiling with the sanitizer flag `-fsanitize=leak`.

      ```bash
      g++ -fsanitize=leak -std=c++14 program.cpp -o executable
      ./executable
      ```

    1. Output and Result

    - `output.log`

      ```plaintext
      =================================================================
      ==1622756==ERROR: LeakSanitizer: detected memory leaks

      Direct leak of 4 byte(s) in 1 object(s) allocated from:
          #0 0x7f6fa6d201e7 in operator new(unsigned long) ../../../../src/libsanitizer/asan/asan_new_delete.cpp:99
          #1 0x5592399e325e in function() (/home/executable+0x125e)
          #2 0x5592399e3279 in main (/home/executable+0x1279)
          #3 0x7f6fa6737d8f in __libc_start_call_main ../sysdeps/nptl/libc_start_call_main.h:58

      SUMMARY: AddressSanitizer: 4 byte(s) leaked in 1 allocation(s).
      ```

#### 1.2.3. MemorySanitizer (MSan)

[MemorySanitizer (MSan)](https://github.com/google/sanitizers/wiki/MemorySanitizer) is a dynamic analysis tool that detects uninitialized memory reads.

1. Files and Folders

    - `program.cpp`
      > Use of uninitialized memory, triggering MSan error.

      ```cpp
      #include <iostream>

      int main(void) {
        int* uninitialized_data = new int;
        std::cout << *uninitialized_data << std::endl; // Triggering MSan error
        delete uninitialized_data;
        return 0;
      }
      ```

2. Commands and Operations

    - Compile
      > Compiling with the sanitizer flag `-fsanitize=memory`.

      ```bash
      clang -fsanitize=memory -std=c++14 program.cpp -o executable
      ./executable
      ```

3. Output and Result

    - `output.log`

      ```plaintext
      ==12345==WARNING: MemorySanitizer: use-of-uninitialized-value
          #0 0x4a5b2c in main /path/to/program.c:5:12
          #1 0x7f6e38c5783f in __libc_start_main /build/glibc-e6zv40/glibc-2.23/csu/../csu/libc-start.c:291
          #2 0x419a68 in _start (/path/to/program+0x419a68)

        Uninitialized value was created by a stack allocation
          #0 0x4a5a40 in main /path/to/program.c:3:5

      SUMMARY: MemorySanitizer: use-of-uninitialized-value /path/to/program.c:5:12 in main
      Exiting
      ```

#### 1.2.4. UndefinedBehaviorSanitizer (UBSan)

[UndefinedBehaviorSanitizer (UBSan)](https://clang.llvm.org/docs/UndefinedBehaviorSanitizer.html) is a dynamic analysis tool that detects undefined behavior, such as signed integer overflow and division by zero.

1. Files and Folders

    - `program.cpp`
      > Division by zero and signed integer overflow, triggering UBSan error.

      ```cpp
      #include <iostream>
      #include <limits>

      void divisionByZero(void) {
        int x = 10;
        int y = 0;
        int result = x / y; // Division by zero
        std::cout << result << std::endl;
      }

      void signedIntegerOverflow(void) {
        int maxInt = std::numeric_limits<int>::max();
        int result = maxInt + 1; // Signed integer overflow
        std::cout << result << std::endl;
      }

      int main(void) {
        divisionByZero();
        signedIntegerOverflow();
        return 0;
      }
      ```

2. Commands and Operations

    - Compile
      > Compiling with the sanitizer flag `-fsanitize=undefined`.

      ```bash
      g++ -fsanitize=undefined -std=c++14 program.cpp -o executable
      ./executable
      ```

3. Output and Result

    - `output.log`

      ```plaintext
      program.cpp:6:20: runtime error: division by zero
      program.cpp:13:7: runtime error: signed integer overflow: 2147483647 + 1 cannot be represented in type 'int'
      ```

#### 1.2.5. ThreadSanitizer (TSan)

[ThreadSanitizer (TSan)](https://github.com/google/sanitizers/wiki/ThreadSanitizerCppManual) is a tool that detects data races and synchronization bugs in multithreaded code.

1. Files and Folders

    - `program.cpp`
      > Data race, triggering TSan error.

      ```cpp
      #include <iostream>
      #include <thread>

      int shared_data = 0;

      void ThreadFunction() {
        shared_data++; // Triggering TSan error
      }

      int main(void) {
        std::thread t1(ThreadFunction);
        std::thread t2(ThreadFunction);
        t1.join();
        t2.join();
        return 0;
      }
      ```

2. Commands and Operations

    - Compile
      > Compiling with the sanitizer flag `-fsanitize=thread`.

      ```bash
      g++ -fsanitize=thread -std=c++14 -pthread program.cpp -o executable
      ./executable
      ```

3. Output and Result

    - `output.log`

      ```plaintext
      ==================
      WARNING: ThreadSanitizer: data race (pid=1661799)
        Read of size 4 at 0x55613579201c by thread T2:
          #0 ThreadFunction() <null> (executable+0x1390)
          #1 void std::__invoke_impl<void, void (*)()>(std::__invoke_other, void (*&&)()) <null> (executable+0x21c4)
          #2 std::__invoke_result<void (*)()>::type std::__invoke<void (*)()>(void (*&&)()) <null> (executable+0x2119)
          #3 void std::thread::_Invoker<std::tuple<void (*)()> >::_M_invoke<0ul>(std::_Index_tuple<0ul>) <null> (executable+0x206e)
          #4 std::thread::_Invoker<std::tuple<void (*)()> >::operator()() <null> (executable+0x2010)
          #5 std::thread::_State_impl<std::thread::_Invoker<std::tuple<void (*)()> > >::_M_run() <null> (executable+0x1fc2)
          #6 <null> <null> (libstdc++.so.6+0xdc252)

        Previous write of size 4 at 0x55613579201c by thread T1:
          #0 ThreadFunction() <null> (executable+0x13a8)
          #1 void std::__invoke_impl<void, void (*)()>(std::__invoke_other, void (*&&)()) <null> (executable+0x21c4)
          #2 std::__invoke_result<void (*)()>::type std::__invoke<void (*)()>(void (*&&)()) <null> (executable+0x2119)
          #3 void std::thread::_Invoker<std::tuple<void (*)()> >::_M_invoke<0ul>(std::_Index_tuple<0ul>) <null> (executable+0x206e)
          #4 std::thread::_Invoker<std::tuple<void (*)()> >::operator()() <null> (executable+0x2010)
          #5 std::thread::_State_impl<std::thread::_Invoker<std::tuple<void (*)()> > >::_M_run() <null> (executable+0x1fc2)
          #6 <null> <null> (libstdc++.so.6+0xdc252)

        Location is global 'shared_data' of size 4 at 0x55613579201c (executable+0x00000000501c)

        Thread T2 (tid=1661803, running) created by main thread at:
          #0 pthread_create ../../../../src/libsanitizer/tsan/tsan_interceptors_posix.cpp:969 (libtsan.so.0+0x605b8)
          #1 std::thread::_M_start_thread(std::unique_ptr<std::thread::_State, std::default_delete<std::thread::_State> >, void (*)()) <null> (libstdc++.so.6+0xdc328)
          #2 main <null> (executable+0x140e)

        Thread T1 (tid=1661802, finished) created by main thread at:
          #0 pthread_create ../../../../src/libsanitizer/tsan/tsan_interceptors_posix.cpp:969 (libtsan.so.0+0x605b8)
          #1 std::thread::_M_start_thread(std::unique_ptr<std::thread::_State, std::default_delete<std::thread::_State> >, void (*)()) <null> (libstdc++.so.6+0xdc328)
          #2 main <null> (executable+0x13f8)

      SUMMARY: ThreadSanitizer: data race (/home/executable+0x1390) in ThreadFunction()
      ==================
      ThreadSanitizer: reported 1 warnings
      ```

## 2. References

- Sentenz [Software Analysis](../articles/software-analysis.md) article.
