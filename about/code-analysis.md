# Code Analysis

Code analysis allows users to carry out a number of useful actions for performance profiling, checking for security-related correctness,
code coverage reporting, and dead code elimination.

- [Static Analysis](#static-analysis)
  - [Linters](#linters)
- [Dynamic Analysis](#dynamic-analysis)
  - [Tools](#tools)
  - [Sanitizers](#sanitizers)
    - [Valgrind](#valgrind)
    - [Google Sanitizers](#google-sanitizers)
- [See also](#see-also)

## Static Analysis

Static analysis is a means of analyzing and  understanding computer programs by inspecting their source code without executing or running them. Static analyzers parse the source code and build an internal representation of the program that’s suitable for automated analysis. This approach can discover potential bugs in source code, preferably before the code is checked in or deployed in production. Numerous tools are available for various languages, as well as tools for cross-language analyses. Linters enforce style and format checks in order to maintain a cohesive codebase across developer teams.

### Linters

Automated code inspection tools perform a syntactic analysis of source code with respect to language features and usage rules. These tools, commonly referred to as linters, generally don’t model complex program behaviors like interprocedural data flow. Linters perform relatively shallow analysis, the tools scale easily to arbitrary code sizes, they can often complete their source code analysis in about the same amount of time it takes to compile the code. Code inspection tools are also extensible, and can add new rules that cover many types of bugs, especially bugs related to language features.

## Dynamic Analysis

Dynamic program analysis analyzes software by running programs, potentially in virtualized or emulated environments, for purposes beyond just testing.

Dynamic analysis approaches that rely on compiler support to detect memory-related errors are often called instrumentation. Compilers and dynamic program analysis tools let you configure instrumentation to collect runtime statistics on the binaries that the compilers produce, such as performance profiling information, code coverage information, and profilebased optimizations. The compiler inserts additional instructions and callbacks to a backend runtime library that surfaces and collects the relevant information when the binary is executed.

### Tools

- Performance Profiler
  > Are used to find performance issues in programs.

- Code Coverage
  > Measure (in percent) of the degree to which the source code of a program is executed when a particular test suite is run.

### Sanitizers

Sanitizers are tools that can detect bugs such as buffer overflows or accesses, dangling pointer or different types of undefined behavior.

The two compilers that mainly support sanitizing options are gcc and [clang](https://clang.llvm.org/docs/UsersManual.html#controlling-code-generation). These options are passed to the compiler as flags and, depending on if you are using clang or [gcc](https://gcc.gnu.org/onlinedocs/gcc/Instrumentation-Options.html), different sanitizers are supported.

- Performance Tradeoffs in Dynamic Program Analysis

  Dynamic program analysis tools like sanitizers provide developers with useful feedback about correctness and other dimensions, such as performance and code coverage. This feedback comes at a performance cost: the compiler-instrumented binaries can be orders of magnitude slower than the native binaries. As a result, many projects are adding sanitizer-enhanced pipelines to their existing CI/CD systems, but running those pipelines less frequently—for example, nightly. This practice may catch otherwise hard-to-identify bugs caused by memory corruption issues. Other program analysis–based CI/CD-enabled pipelines collect additional developer signals, such as nightly code coverage metrics. Over time, you can use these signals to gauge various code health metrics.

#### Valgrind

The dynamic program analysis tool [Valgrind](https://valgrind.org/), provides a virtual machine and various tools to interpret a binary and check whether an execution exhibits various common bugs.

The Valgrind tool Helgrind can additionally detect common synchronization errors such as:

- Misuses of the POSIX pthreads API, e.g. unlocking a not-locked mutex, or a mutex held by another thread
- Potential deadlocks arising from lock ordering problems
- Data races caused by accessing memory without adequate locking or synchronization

#### Google Sanitizers

The [Google Sanitizers](https://github.com/google/sanitizers/wiki) suite provides compilation-based dynamic analysis tools for security-relevant memory misuse bugs of C/C++ programs. They were initially developed as part of the LLVM compiler infrastructure to capture common programming mistakes, and are now supported by GCC and other compilers, as well.

Following popular sanitizers:

- AddressSanitizer (ASan)
  > Detects memory errors , such as out-of-bounds memory accesses, buffer overflows, use after free, incorrect initialization order.

- UndefinedBehaviorSanitizer (UBSan)
  > Performs runtime flagging of undefined behavior (using misaligned  pointers; signed integer overflow; converting to, from, or between floating-point types that will overflow the destination).

- ThreadSanitizer (TSan)
  > Detects race conditions and deadlocks.

- MemorySanitizer (MSan)
  > Detects reading of uninitialized memory.

- LeakSanitizer (LSan)
  > Detects memory leaks and other types of leaks.

## See also

- Google [dynamic analysis](https://static.googleusercontent.com/media/sre.google/de//static/pdf/building_secure_and_reliable_systems.pdf#page=313&zoom=100,0,600) book.
- Google [static analysis](https://static.googleusercontent.com/media/sre.google/de//static/pdf/building_secure_and_reliable_systems.pdf#page=326&zoom=100,0,600) book.
- Google [sanitize](https://static.googleusercontent.com/media/sre.google/de//static/pdf/building_secure_and_reliable_systems.pdf#page=303&zoom=100,0,530) book.
