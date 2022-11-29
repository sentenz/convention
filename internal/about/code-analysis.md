# Code Analysis

Code analysis, generally SAST and DAST, refers to performance profiling measures, safety-related correctness testing, code coverage reporting, code quality testing, syntax style review tools, or dead code elimination.

- [1. SAST](#1-sast)
  - [1.1. Linter](#11-linter)
- [2. DAST](#2-dast)
  - [2.1. Sanitizer](#21-sanitizer)
  - [2.2. Other Tools](#22-other-tools)
- [3. References](#3-see-also)

## 1. SAST

Static Application Security Testing (SAST) or Static Code Analysis, is a testing methodology that analyzes source code to find security vulnerabilities that make applications susceptible to attack. SAST scans an application before the code is compiled. It’s also known as white box testing.

### 1.1. Linter

Automated code inspection tools perform a syntactic analysis of source code with respect to language features and usage rules. These tools, commonly referred to as linters, generally don’t model complex program behaviors like interprocedural data flow. Linters perform relatively shallow analysis, the tools scale easily to arbitrary code sizes, they can often complete their source code analysis in about the same amount of time it takes to compile the code. Code inspection tools are also extensible, and can add new rules that cover many types of bugs, especially bugs related to language features.

## 2. DAST

Dynamic Application Security Testing (DAST) or Dynamic Code Analysis is a method of testing that examines an application while it’s running, without knowledge of the application’s internal interactions or designs at the system level, and with no access or visibility into the source program. This “black box” testing looks at an application from the outside in, examines its running state, and observes its responses to simulated attacks made by the tool. An application’s responses to these simulations help determine whether the application is vulnerable and could be susceptible to a real malicious attack.

Dynamic analysis approaches that rely on compiler support to detect memory-related errors are often called instrumentation. Compilers and dynamic program analysis tools let you configure instrumentation to collect runtime statistics on the binaries that the compilers produce, such as performance profiling information, code coverage information, and profilebased optimizations. The compiler inserts additional instructions and callbacks to a backend runtime library that surfaces and collects the relevant information when the binary is executed.

### 2.1. Sanitizer

Sanitizer are tools that can detect bugs such as buffer overflows or accesses, dangling pointer or different types of undefined behavior.

The two compilers that mainly support sanitizing options are [gcc](https://gcc.gnu.org/onlinedocs/gcc/Instrumentation-Options.html) and [clang](https://clang.llvm.org/docs/UsersManual.html#controlling-code-generation). These options are passed to the compiler as flags and, depending on if you are using `gcc` or `clang`, different sanitizers are supported.

The code can be instrumented using the following option to address e.g. issues with pointers and arrays:

```bash
gcc  -g  -fsanitize=address  ...
```

#### 2.1.1. Valgrind

The dynamic program analysis tool [Valgrind](https://valgrind.org/), provides a virtual machine and various tools to interpret a binary and check whether an execution exhibits various common bugs.

The Valgrind tool Helgrind can additionally detect common synchronization errors such as:

- Misuses of the POSIX pthreads API, e.g. unlocking a not-locked mutex, or a mutex held by another thread
- Potential deadlocks arising from lock ordering problems
- Data races caused by accessing memory without adequate locking or synchronization

#### 2.1.2. Google Sanitizers

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

### 2.2. Other Tools

- Performance Profiler
  > Are used to find performance issues in programs.

- Code Coverage
  > Measure (in percent) of the degree to which the source code of a program is executed when a particular test suite is run.

## 3. References

- NIST [list of SAST](https://www.nist.gov/itl/ssd/software-quality-group/source-code-security-analyzers) tools.
- GitHub [list of SAST](https://www.nist.gov/itl/ssd/software-quality-group/source-code-security-analyzers) tools.
- OWASP [SAST](https://owasp.org/www-community/Source_Code_Analysis_Tools) article.
- Synopsys [SAST](https://www.synopsys.com/glossary/what-is-sast.html) article.
- Synopsys [DAST](https://www.synopsys.com/glossary/what-is-dast.html) article.
- Google [dynamic analysis](https://static.googleusercontent.com/media/sre.google/de//static/pdf/building_secure_and_reliable_systems.pdf#page=313&zoom=100,0,600) book.
- Google [static analysis](https://static.googleusercontent.com/media/sre.google/de//static/pdf/building_secure_and_reliable_systems.pdf#page=326&zoom=100,0,600) book.
- Google [sanitize](https://static.googleusercontent.com/media/sre.google/de//static/pdf/building_secure_and_reliable_systems.pdf#page=303&zoom=100,0,530) book.
