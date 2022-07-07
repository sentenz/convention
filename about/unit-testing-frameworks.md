# Unit-Testing Frameworks

- [Unit Testing](#unit-testing)
  - [GoogleTest](#googletest)
  - [Boost.Test](#boosttest)
  - [Catch2](#catch2)
  - [Doctest](#doctest)
  - [pytest](#pytest)
  - [go](#go)
- [Code Coverage](#code-coverage)
  - [gcov](#gcov)
  - [go](#go-1)
- [Profiling](#profiling)
  - [gprof](#gprof)
  - [go](#go-2)
- [See also](#see-also)

## Unit Testing

Unit testing aims to check individual units of the source code separately. A unit is the smallest part of code that can be tested in isolation.

Benefits of unit testing:

- Modularize code
  > As code's testability depends on its design, unit tests facilitate breaking it into specialized test pieces.

- Avoid regressions
  > A suite of unit tests can run it iteratively to ensure that everything [keeps working correctly](../about/software-testing.md#regression-testing) every time you add new functionality or introduce changes.

- Document code
  > Running, debugging, or even just reading tests can give a lot of information about how the original code works, [software testing](../about/software-testing.md) canbe used as implicit documentation.

Best practices for unit testing:

- Creating tests for all publicly exposed functions, including class constructors and operators.
- Covering all code paths and checking both trivial and edge cases, including those with incorrect input data (see negative testing).
- Assuring that each test works independently and does't prevent other tests from execution.
- Organizing tests in a way that the order in which you run them doesn't affect the results.

A single unit test is a method that checks some specific functionality and has clear pass/fail criteria. The generalized structure of a single test looks like this:

```txt
Test (TestGroupName, TestName)   {
    1 - setup block
    2 - running the under-test functionality
    3 - checking the results (assertions block)
}
```

### GoogleTest

| Mock     | Fixture  | Fuzzing  | Code Coverage | Build System  |
| -------- | -------- | -------- | ------------- | ------------- |
| Built-in | Built-in | Built-in | gcov          | CMake / Bazel |

[GoogleTest](https://github.com/google/googletest) framework is portable, it includes a rich set of fatal and non-fatal assertions, provides instruments for creating fixtures and test groups, gives informative messages, and exports the results in XML. Probably the only drawback is a need to build gtest/gmock in your project in order to use it.

To learn more about Google Test, explore the [samples](https://github.com/google/googletest/blob/main/docs/samples.md) in the framework's repository. Also, take a look at [Advanced options](https://github.com/google/googletest/blob/main/docs/advanced.md#advanced-googletest-topics) for details of other noticeable Google Test features such as [value-parametrized tests](https://github.com/google/googletest/blob/main/docs/advanced.md#value-parameterized-tests) and [type-parameterized tests](https://github.com/google/googletest/blob/main/docs/advanced.md#type-parameterized-tests).

### Boost.Test

| Mock   | Fixture  | Fuzzing | Code Coverage | Build System |
| ------ | -------- | :-----: | ------------- | ------------ |
| FakeIt | Built-in |    —    | gcov          | CMake        |

[Boost.Test](https://www.boost.org/doc/libs/1_71_0/libs/test/doc/html/index.html) unit testing frameworks for C++. Boost unit testing framework (Boost.Test) is a part of the Boost library. It is a fully-functional and scalable framework, with wide range of assertion macros, XML output, and other features.

Boost.Test doesn't provide mocking functionality. However, combine it with standalone mocking frameworks such as [Hippomocks](https://github.com/dascandy/hippomocks), [FakeIt](https://github.com/eranpeer/FakeIt), or [Trompeloeil](https://github.com/rollbear/trompeloeil).


### Catch2

|  Mock  | Fixture  | Fuzzing | Code Coverage | Build System |
| :----: | -------- | :-----: | ------------- | ------------ |
| FakeIt | Built-in |    —    | gcov          | CMake        |

[Catch2](https://github.com/catchorg/Catch2) unit testing frameworks for C++. It's a header-only testing system: to create tests with Catch2, download and include only one header file, `catch.hpp`. The framework's name stands for `C++ Automated Test Cases in Headers (version two)`.

Catch2 doesn't provide mocking functionality. However, combine it with standalone mocking frameworks such as [Hippomocks](https://github.com/dascandy/hippomocks), [FakeIt](https://github.com/eranpeer/FakeIt), or [Trompeloeil](https://github.com/rollbear/trompeloeil).

### Doctest

| Mock   | Fixture  | Fuzzing | Code Coverage | Build System |
| ------ | -------- | :-----: | ------------- | ------------ |
| FakeIt | Built-in |    —    | gcov          | CMake        |

[Doctest](https://github.com/doctest/doctest) unit testing frameworks for C++. Doctest is a single-header framework with self-registering tests. Doctest was designed after Catch and shares some parts of the Catch's code.

Doctest doesn't provide mocking functionality. However, combine it with standalone mocking frameworks such as [Hippomocks](https://github.com/dascandy/hippomocks), [FakeIt](https://github.com/eranpeer/FakeIt), or [Trompeloeil](https://github.com/rollbear/trompeloeil).

### pytest

| Mock        | Fixture         | Fuzzing         | Code Coverage | Build System |
| ----------- | --------------- | --------------- | ------------- | :----------: |
| pytest-mock | pytest fixtures | atheris fuzzing | pytest-cov    |      —       |

[pytest](https://github.com/pytest-dev/pytest/) unit testing frameworks for Python. The pytest framework allows to write small, readable tests, and can be scaled to support complex functional tests for applications and libraries.

### go

## Code Coverage

In computer science, test coverage is a measure (in percent) of the degree to which the source code of a program is executed when a particular test suite is run. A program with high test coverage has more of its source code executed during testing, which suggests it has a lower chance of containing undetected software bugs compared to a program with low test coverage. Many different metrics can be used to calculate test coverage. Some of the most basic are the percentage of program subroutines and the percentage of program statements called during execution of the test suite.

### gcov

[Gcov](https://en.wikipedia.org/wiki/Gcov) is a source code coverage analysis and statement-by-statement profiling tool. Gcov generates exact counts of the number of times each statement in a program is executed and annotates source code to add instrumentation. Gcov comes as a standard utility with the GNU Compiler Collection (GCC) suite. The gcov utility gives information on how often a program executes segments of code. It produces a copy of the source file, annotated with execution frequencies.

When passing the coverage flags manually, one of the following options can be used, depending on which compiler and coverage tools is preferred:

- GCC
  > `-fprofile-arcs` `-ftest-coverage` or `--coverage`

- Clang/Clang-cl
  >
  > - Use the same flags as for GCC to get the gcov-style coverage collected with [llvm-cov gcov](https://llvm.org/docs/CommandGuide/llvm-cov.html#llvm-cov-gcov).
  > - Use `-fprofile-instr-generate` `-fcoverage-mapping` to invoke the Clang’s instrumentation-based profiling which uses a pair of the `llvm-profdata merge` and `llvm-cov` export commands.

- CMake
  > Provide the flags by setting the `CMAKE_CXX_FLAGS` variable (`CMAKE_C_FLAGS` for C projects) or using other alternatives like the `add_compile_options` command. On linker errors while building the project with gcov compiler flags, try passing the same flags to the linker through `add_link_options` or `set(CMAKE_EXE_LINKER_FLAGS "")`.

### go

```bash
go test -race -coverprofile=coverage.out -covermode=atomic ./...
```

## Profiling

### gprof

### go

## See also

- JetBrains [unit testing](https://www.jetbrains.com/help/clion/unit-testing-tutorial.html#0) article.
- JetBrains [code coverage](https://www.jetbrains.com/help/clion/code-coverage-clion.html#0) article.
- Codecov [about](https://about.codecov.io/) article.
