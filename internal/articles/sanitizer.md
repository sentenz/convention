# Sanitizer

Sanitizers are dynamic analysis tools that detect bugs such as buffer overflows or accesses, dangling pointers or different types of undefined behavior at runtime and prevent security vulnerabilities in C/C++ code.

- [1. Category](#1-category)
  - [1.1. Valgrind](#11-valgrind)
    - [1.1.1. Memcheck](#111-memcheck)
    - [1.1.5. Helgrind](#115-helgrind)
    - [1.1.6. DRD](#116-drd)
    - [1.1.2. Cachegrind](#112-cachegrind)
    - [1.1.3. Callgrind](#113-callgrind)
    - [1.1.4. Massif](#114-massif)
  - [1.2. Google Sanitizer](#12-google-sanitizer)
    - [1.2.1. AddressSanitizer (ASan)](#121-addresssanitizer-asan)
    - [1.2.2. LeakSanitizer (LSan)](#122-leaksanitizer-lsan)
    - [1.2.5. MemorySanitizer (MSan)](#125-memorysanitizer-msan)
    - [1.2.3. UndefinedBehaviorSanitizer (UBSan)](#123-undefinedbehaviorsanitizer-ubsan)
    - [1.2.4. ThreadSanitizer (TSan)](#124-threadsanitizer-tsan)

## 1. Category

### 1.1. Valgrind

[Valgrind](https://valgrind.org/) is a dynamic analysis tool that can be used to detect memory leaks, or buffer overflows errors in C/C++ code.

> NOTE Valgrind tools are not designed to be used simultaneously. Each tool serves a specific purpose and provides different types of analysis or debugging capabilities. Run one tool at a time to get the desired information about a program's behavior or performance.

Benefits and Features:

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

Files and Folders:

- `.valdrindrc`
  > Place `.valdrindrc` file in the root directory, Valgrind will automatically apply these settings when it runs. Remember to adjust the settings according to the specific needs of each project.

  ```plaintext
  --tool=memcheck --leak-check=yes
  --tool=cachegrind
  --tool=callgrind
  --tool=massif
  --tool=helgrind
  --tool=drd
  ```

#### 1.1.1. Memcheck

[Memcheck](https://valgrind.org/docs/manual/mc-manual.html) detects memory-management problems, primarily aimed at C and C++ programs.

Files and Folders:

- `my_program.c`
  > Create a memory leak by allocating memory and not freeing it.

  ```c
  #include <stdlib.h>

  int main() {
      int *memory_leak = malloc(sizeof(int));
      return 0; // Triggering memory leak error
  }
  ```

Commands and Operations:

- Compile and Check
  > Compiling a program with gcc and checking for memory leaks with Memcheck.

  ```bash
  gcc -g -o my_program my_program.c
  valgrind --tool=memcheck --leak-check=yes ./my_program
  ```

Output and Result:

- `output.log`

  ```plaintext
  ==12345== Memcheck, a memory error detector
  ==12345== Command: ./my_program
  ==12345==
  ==12345== HEAP SUMMARY:
  ==12345==     in use at exit: 4 bytes in 1 blocks
  ==12345==   total heap usage: 1 allocs, 0 frees, 4 bytes allocated
  ==12345==
  ==12345== 4 bytes in 1 blocks are definitely lost in loss record 1 of 1
  ==12345==    at 0x4C2AB80: malloc (in /usr/lib/valgrind/vgpreload_memcheck-amd64-linux.so)
  ==12345==    by 0x400576: main (in /home/user/my_program)
  ==12345==
  ==12345== LEAK SUMMARY:
  ==12345==    definitely lost: 4 bytes in 1 blocks
  ==12345==    indirectly lost: 0 bytes in 0 blocks
  ==12345==      possibly lost: 0 bytes in 0 blocks
  ==12345==    still reachable: 0 bytes in 0 blocks
  ==12345==         suppressed: 0 bytes in 0 blocks
  ==12345==
  ==12345== For counts of detected and suppressed errors, rerun with: -v
  ==12345== ERROR SUMMARY: 1 errors from 1 contexts (suppressed: 0 from 0)
  ```

#### 1.1.5. Helgrind

[Helgrind](https://valgrind.org/docs/manual/hg-manual.html) is a thread debugger for finding data races in multithreaded programs.

Files and Folders:

- `my_program.c`
  > Creates data races by having two threads increment a shared variable.

  ```c
  #include <pthread.h>
  #include <stdio.h>

  int shared_variable = 0;

  void* thread_function(void* arg) {
      shared_variable++;
      return NULL;
  }

  int main() {
      pthread_t thread1, thread2;
      pthread_create(&thread1, NULL, thread_function, NULL);
      pthread_create(&thread2, NULL, thread_function, NULL);
      pthread_join(thread1, NULL);
      pthread_join(thread2, NULL);
      printf("Shared variable: %d\n", shared_variable);
      return 0;
  }
  ```

Commands and Operations:

- Compile and Detect
  > Detecting data races in a multithreaded program with Helgrind.

  ```bash
  gcc -g -pthread -o my_program my_program.c
  valgrind --tool=helgrind ./my_program
  ```

Output and Result:

- `output.log`

  ```plaintext
  ==12345== Helgrind, a thread error detector
  ==12345== Command: ./my_program
  ==12345==
  ==12345== Possible data race during read of size 4 at 0xXXXXXX by thread #2
  ==12345==    at 0x4005XX: thread_function (my_program.c:XX)
  ==12345==    by 0x4C2XXXX: start_thread (pthread_create.c:XXX)
  ==12345==    by 0x5XXXXXX: clone (clone.S:XX)
  ==12345==
  ==12345== This conflicts with a previous write of size 4 by thread #1
  ==12345==    at 0x4005XX: thread_function (my_program.c:XX)
  ==12345==    by 0x4C2XXXX: start_thread (pthread_create.c:XXX)
  ==12345==    by 0x5XXXXXX: clone (clone.S:XX)
  ==12345==
  ```

#### 1.1.6. DRD

[DRD](https://valgrind.org/docs/manual/drd-manual.html) is a thread error detector that helps in identifying issues in multithreaded programs.

Files and Folders:

- `my_program.c`
  > Creates data races by having two threads increment a shared variable.

  ```c
  #include <pthread.h>
  #include <stdio.h>

  int shared_variable = 0;

  void* thread_function(void* arg) {
      shared_variable++;
      return NULL;
  }

  int main() {
      pthread_t thread1, thread2;
      pthread_create(&thread1, NULL, thread_function, NULL);
      pthread_create(&thread2, NULL, thread_function, NULL);
      pthread_join(thread1, NULL);
      pthread_join(thread2, NULL);
      printf("Shared variable: %d\n", shared_variable);
      return 0;
  }
  ```

Commands and Operations:

- Compile and Detect
  > Detecting a thread error detector DRD

  ```bash
  gcc -g -pthread -o my_program my_program.c
  valgrind --tool=drd ./my_program
  ```

Output and Result:

- `output.log`

  ```plaintext
  ==12345== DRD, a thread error detector
  ==12345== Command: ./my_program
  ==12345==
  ==12345== Possible data race during read of size 4 at 0xXXXXXX by thread #2
  ==12345==    at 0x4005XX: thread_function (my_program.c:XX)
  ==12345==    by 0x4C2XXXX: start_thread (pthread_create.c:XXX)
  ==12345==    by 0x5XXXXXX: clone (clone.S:XX)
  ==12345==
  ==12345== This conflicts with a previous write of size 4 by thread #1
  ==12345==    at 0x4005XX: thread_function (my_program.c:XX)
  ==12345==    by 0x4C2XXXX: start_thread (pthread_create.c:XXX)
  ==12345==    by 0x5XXXXXX: clone (clone.S:XX)
  ==12345==
  ```

#### 1.1.2. Cachegrind

[Cachegrind](https://valgrind.org/docs/manual/cg-manual.html) is a cache profiler that analyzes cache use and identifies bottlenecks.

Files and Folders:

- `my_program.c`
  > Creates cache performance issues by accessing an array of integers.

  ```c
  #include <stdlib.h>

  int main() {
      int i, sum = 0;
      int *array = malloc(1000 * sizeof(int));
      for (i = 0; i < 1000; i++) {
          sum += array[i];
      }
      free(array);
      return sum;
  }
  ```

Commands and Operations:

- Compile and Profile
  > Profiling cache usage with Cachegrind.

  ```bash
  gcc -g -o my_program my_program.c
  valgrind --tool=cachegrind ./my_program
  ```

Output and Result:

- `output.log`

  ```plaintext
  ==12345== Cachegrind, a cache and branch-prediction profiler
  ==12345== Command: ./my_program
  ==12345==
  --12345-- Cachegrind, a cache and branch-prediction profiler
  --12345-- For interactive control, run 'cg_annotate'
  --12345-- For a textual report, run 'cg_annotate --auto=yes'
  ```

#### 1.1.3. Callgrind

[Callgrind](https://valgrind.org/docs/manual/cl-manual.html) is an extension to Cachegrind, it provides call-graph generating and profiling.

Files and Folders:

- `my_program.c`
  > Creates a call-stack by calling a function.

  ```c
  #include <stdio.h>

  void function() {
      printf("Function called\n");
  }

  int main() {
      function();
      return 0;
  }
  ```

Commands and Operations:

- Compile and Generate
  > Generating a call-graph with Callgrind.

  ```bash
  gcc -g -o my_program my_program.c
  valgrind --tool=callgrind ./my_program
  ```

Output and Result:

- `output.log`

  ```plaintext
  ==12345== Callgrind, a call-graph generating cache profiler
  ==12345== Command: ./my_program
  ==12345==
  --12345-- Callgrind, a call-graph generating cache profiler
  --12345-- For interactive control, run 'callgrind_control'
  --12345-- For a textual report, run 'callgrind_annotate'
  ```

#### 1.1.4. Massif

[Massif](https://valgrind.org/docs/manual/ms-manual.html) is a heap profiler that measures how much heap memory a program uses.

Files and Folders:

- `my_program.c`
  > Allocates and frees memory to analyze heap usage with Massif.

  ```c
  #include <stdlib.h>

  int main() {
      void *block = malloc(1024 * 1024); // Allocate 1MB of memory
      free(block);
      return 0;
  }
  ```

Commands and Operations:

- Compile and Analyze
  > Analyzing heap usage with Massif.

  ```bash
  gcc -g -o my_program my_program.c
  valgrind --tool=massif ./my_program
  ```

Output and Result:

- `output.log`

  ```plaintext
  ==12345== Massif, a heap profiler
  ==12345== Command: ./my_program
  ==12345==
  --12345-- Massif, a heap profiler
  --12345-- For a detailed snapshot, run 'ms_print'
  ```

### 1.2. Google Sanitizer

The [Google Sanitizers](https://github.com/google/sanitizers) are a collection of tools integrated into compilers, designed to detect various types of bugs.

> NOTE `Google Sanitizers` are not designed to be used simultaneously. Each sanitizer serves a specific purpose and provides different types of analysis or debugging capabilities. Compile and run a program with one sanitizer at a time to get the desired information about a program’s behavior or performance. Using multiple sanitizers at once could lead to conflicts and potentially inaccurate results.

Benefits and Features:

- LLVM/Clang
  > Support for `AddressSanitizer (ASan)`, `LeakSanitizer (LSan)`, `UndefinedBehaviorSanitizer (UBSan)`, `ThreadSanitizer (TSan)`, `MemorySanitizer (MSan)`, `DataFlowSanitizer (DFSan)`.
  
- GCC/G++
  > Support for `AddressSanitizer (ASan)`, `LeakSanitizer (LSan)`, `UndefinedBehaviorSanitizer (UBSan)`, `ThreadSanitizer (TSan)`, `MemorySanitizer (MSan)`.

- MSVC
  > Support for `AddressSanitizer (ASan)`.

#### 1.2.1. AddressSanitizer (ASan)

[AddressSanitizer (ASan)](https://github.com/google/sanitizers/wiki/AddressSanitizer) is a dynamic analysis tool that detects memory access errors, such as out-of-bounds memory accesses and use-after-free bugs.

Files and Folders:

- `my_file.cpp`
  > Out-of-bounds access, triggering ASan error.

  ```cpp
  #include <iostream>

  int main() {
      int* array = new int[10];
      array[11] = 42; // Triggering ASan error
      delete[] array;
      return 0;
  }
  ```

Commands and Operations:

- Compile
  > Compiling with the sanitizer flag `-fsanitize=address`.

  ```bash
  g++ -fsanitize=address -std=c++11 my_file.cpp -o my_executable
  ```

Output and Result:

- `output.log`

  ```plaintext
  =================================================================
  ==12345==ERROR: AddressSanitizer: heap-buffer-overflow on address 0x60200000001a at pc 0x000000400781 bp 0x7ffd1c8b4d30 sp 0x7ffd1c8b4d28
  WRITE of size 1 at 0x60200000001a thread T0
      #0 0x400780 in main /path/to/my_program.c:5
      #1 0x7f2e1d3a082f in __libc_start_main (/lib/x86_64-linux-gnu/libc.so.6+0x2082f)
      #2 0x400608 in _start (/path/to/my_program+0x400608)

  0x60200000001a is located 0 bytes to the right of 10-byte region [0x602000000010,0x60200000001a)
  allocated by thread T0 here:
      #0 0x7f2e1d7a7602 in malloc (/usr/lib/x86_64-linux-gnu/libasan.so.2+0x98602)
      #1 0x40076d in main /path/to/my_program.c:4
      #2 0x7f2e1d3a082f in __libc_start_main (/lib/x86_64-linux-gnu/libc.so.6+0x2082f)

  SUMMARY: AddressSanitizer: heap-buffer-overflow /path/to/my_program.c:5 main
  Shadow bytes around the buggy address:
    0x0c047fff7fd0: fa fa 00 00 00 00 00 00 00 00 00 00 00 00 00 fa
    0x0c047fff7fe0: fa fa 00 00 00 00 00 00 00 00 00 00 00 00 00 fa
    0x0c047fff7ff0: fa fa 00 00 00 00 00 00 00 00 00 00 00 00 00 fa
    0x0c047fff8000: fa fa 00 00 00 00 00 00 00 00 00 00 00 00 00 fa
    0x0c047fff8010: fa fa 00 00 00 00 00 00 00 00 00 00 00 00 00 fa
  =>0x0c047fff8020: fa fa 00 00 00 00 00 00 00 00 00 00 00[02]fa fa
    0x0c047fff8030: fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
    0x0c047fff8040: fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
    0x0c047fff8050: fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
    0x0c047fff8060: fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
    0x0c047fff8070: fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
  Shadow byte legend (one shadow byte represents 8 application bytes):
    Addressable:           00
    Partially addressable: 01 02 03 04 05 06 07
    Heap left redzone:       fa
    Freed heap region:       fd
    Stack left redzone:      f1
    Stack mid redzone:       f2
    Stack right redzone:     f3
    Stack partial redzone:   f4
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
  ==12345==ABORTING
  ```

#### 1.2.2. LeakSanitizer (LSan)

[LeakSanitizer (LSan)](https://github.com/google/sanitizers/wiki/AddressSanitizerLeakSanitizer) is a dynamic analysis tool that detects memory leaks.

Files and Folders:

- `my_file.cpp`
  > Missing delete statement, triggering LSan error (leak).

  ```cpp
  #include <iostream>

  int main() {
      int* leaked_data = new int;
      // Triggering LSan error
      return 0;
  }
  ```

Commands and Operations:

- Compile
  > Compiling with the sanitizer flag `-fsanitize=leak`.

  ```bash
  g++ -fsanitize=leak -std=c++11 my_file.cpp -o my_executable
  ```

Output and Result:

- `output.log`

  ```plaintext
  =================================================================
  ==12345==ERROR: LeakSanitizer: detected memory leaks

  Direct leak of 10 byte(s) in 1 object(s) allocated from:
      #0 0x4c2b0d in malloc (/path/to/my_program+0x4c2b0d)
      #1 0x4a5b4c in main /path/to/my_program.c:4:23
      #2 0x7f6e38c5783f in __libc_start_main /build/glibc-e6zv40/glibc-2.23/csu/../csu/libc-start.c:291

  SUMMARY: LeakSanitizer: 10 byte(s) leaked in 1 allocation(s).
  ```

#### 1.2.5. MemorySanitizer (MSan)

[MemorySanitizer (MSan)](https://github.com/google/sanitizers/wiki/MemorySanitizer) is a dynamic analysis tool that detects uninitialized memory reads.

Files and Folders:

- `my_file.cpp`
  > Use of uninitialized memory, triggering MSan error.

  ```cpp
  #include <iostream>

  int main() {
      int* uninitialized_data = new int;
      std::cout << *uninitialized_data << std::endl; // Triggering MSan error
      delete uninitialized_data;
      return 0;
  }
  ```

Commands and Operations:

- Compile
  > Compiling with the sanitizer flag `-fsanitize=memory`.

  ```bash
  g++ -fsanitize=memory -std=c++11 my_file.cpp -o my_executable
  ```

Output and Result:

- `output.log`

  ```plaintext
  ==12345==WARNING: MemorySanitizer: use-of-uninitialized-value
      #0 0x4a5b2c in main /path/to/my_program.c:5:12
      #1 0x7f6e38c5783f in __libc_start_main /build/glibc-e6zv40/glibc-2.23/csu/../csu/libc-start.c:291
      #2 0x419a68 in _start (/path/to/my_program+0x419a68)

    Uninitialized value was created by a stack allocation
      #0 0x4a5a40 in main /path/to/my_program.c:3:5

  SUMMARY: MemorySanitizer: use-of-uninitialized-value /path/to/my_program.c:5:12 in main
  Exiting
  ```

#### 1.2.3. UndefinedBehaviorSanitizer (UBSan)

[UndefinedBehaviorSanitizer (UBSan)](https://clang.llvm.org/docs/UndefinedBehaviorSanitizer.html) is a dynamic analysis tool that detects undefined behavior, such as signed integer overflow and division by zero.

Files and Folders:

- `my_file.cpp`
  > Division by zero, triggering UBSan error.

  ```cpp
  #include <iostream>

  int main() {
      int x = 10;
      int y = 0;
      int result = x / y; // Triggering UBSan error
      std::cout << result << std::endl;
      return 0;
  }
  ```

Commands and Operations:

- Compile
  > Compiling with the sanitizer flag `-fsanitize=undefined`.

  ```bash
  g++ -fsanitize=undefined -std=c++11 my_file.cpp -o my_executable
  ```

Output and Result:

- `output.log`

  ```plaintext
  /path/to/my_program.c:6:12: runtime error: division by zero
      #0 0x4a5b2c in main /path/to/my_program.c:6:12
      #1 0x7f6e38c5783f in __libc_start_main /build/glibc-e6zv40/glibc-2.23/csu/../csu/libc-start.c:291
      #2 0x419a68 in _start (/path/to/my_program+0x419a68)

  SUMMARY: UndefinedBehaviorSanitizer: division by zero /path/to/my_program.c:6:12 in main
  ```

#### 1.2.4. ThreadSanitizer (TSan)

[ThreadSanitizer (TSan)](https://github.com/google/sanitizers/wiki/ThreadSanitizerCppManual) is a tool that detects data races and synchronization bugs in multithreaded code.

Files and Folders:

- `my_file.cpp`
  > Data race, triggering TSan error.

  ```cpp
  #include <iostream>
  #include <thread>

  int shared_data = 0;

  void ThreadFunction() {
      shared_data++; // Triggering TSan error
  }

  int main() {
      std::thread t1(ThreadFunction);
      std::thread t2(ThreadFunction);
      t1.join();
      t2.join();
      return 0;
  }
  ```

Commands and Operations:

- Compile
  > Compiling with the sanitizer flag `-fsanitize=thread`.

  ```bash
  g++ -fsanitize=thread -std=c++11 -pthread my_file.cpp -o my_executable
  ```

Output and Result:

- `output.log`

  ```plaintext
  WARNING: ThreadSanitizer: data race (pid=12345)
    Write of size 4 at 0x0000014c3b20 by thread T1:
      #0 increment /path/to/my_program.c:6 (my_program+0x000000400f2d)

    Previous write of size 4 at 0x0000014c3b20 by thread T2:
      #1 increment /path/to/my_program.c:6 (my_program+0x000000400f2d)

    Location is global 'shared_variable' of size 4 at 0x0000014c3b20 (my_program+0x0000014c3b20)

  Thread T1 (tid=12346, running) created by main thread at:
      #2 main /path/to/my_program.c:14 (my_program+0x0000004010f1)

  Thread T2 (tid=12347, running) created by main thread at:
      #3 main /path/to/my_program.c:15 (my_program+0x0000004010f1)

  SUMMARY: ThreadSanitizer: data race /path/to/my_program.c:6 in increment
  ```
