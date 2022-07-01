# Unit-Testing Frameworks

- [Unit Testing](#unit-testing)
  - [GoogleTest](#googletest)
    - [Assertions](#assertions)
    - [Fixtures](#fixtures)
    - [Setup](#setup)
  - [Boost.Test](#boosttest)
    - [Fixtures](#fixtures-1)
    - [Setup](#setup-1)
  - [Catch2](#catch2)
    - [Setup](#setup-2)
  - [Doctest](#doctest)
    - [Setup](#setup-3)
  - [pytest](#pytest)
- [Code Coverage](#code-coverage)
  - [C/C++](#cc)
  - [Golang](#golang)
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

#### Assertions

In Google Test, the statements that check whether a condition is true are referred to as [assertions](https://github.com/google/googletest/blob/main/docs/primer.md#assertions). Non-fatal assertions have the `EXPECT_` prefix in their names, and assertions that cause fatal failure and abort the execution are named starting with `ASSERT_`. For example:

```cpp
TEST(SquareTest /*test suite name*/, PosZeroNeg /*test name*/) {
  EXPECT_EQ(9.0, (3.0 * 2.0));   // fail, test continues
  ASSERT_EQ(0.0, (0.0));         // success
  ASSERT_EQ(9, (3) * (-3.0));    // fail, test interrupts
  ASSERT_EQ(-9, (-3) * (-3.0));  // not executed due to the previous assert
}
```

Also, Google Test supports [predicate assertions](https://github.com/google/googletest/blob/main/docs/advanced.md#predicate-assertions-for-better-error-messages) which makes output messages more informative. For example, instead of `EXPECT_EQ(a, b)` use a predicate function that checks `a` and `b` for equivalency and returns a boolean result. In `EXPECT_PRED2`, *predN* is a predicate function with N arguments. Google Test currently supports predicate assertions of arity up to 5. In case of failure, the assertion will print values of the function arguments:

```cpp
bool IsEq(int a, int b) {
  if (a == b)
    return true;
  else
    return false;
}

TEST(BasicChecks, TestEq) {
  int a = 0;
  int b = 1;
  EXPECT_EQ(a, b);
  EXPECT_PRED2(IsEq, a, b);
}
```

```txt
Failure
    Value of: b
    Actual: 1
    Expected: a
    Which is: 0

Failure
    IsEq(a, b) evaluates to false, where
    a evaluates to 0
    b evaluates to 1
```

#### Fixtures

Google tests that share common objects or subroutines can be grouped into fixtures. Here is how a generalized fixture looks like:

```cpp
class myTestFixture: public ::testing::test {
    public:
         myTestFixture( ) {
             // initialization;
             // can also be done in SetUp()
         }

    void SetUp( ) {
         // initialization or some code to run before each test
    }

    void TearDown( ) {
         // code to run after each test;
         // can be used instead of a destructor,
         // but exceptions can be handled in this function only
     }

    ~myTestFixture( )  {
         //resources cleanup, no exceptions allowed
    }

     // shared user data
};
```

When used for a fixture, a `TEST()` macro should be replaced with `TEST_F()` to allow the test to access the fixture's members and functions:

```cpp
TEST_F( myTestFixture, TestName) {/*...*/}
```

#### Setup

There are [several options](https://github.com/google/googletest/tree/main/googletest#incorporating-into-an-existing-cmake-project) to include Google Test in a CMake project:

- Download the sources and copy them into the project structure.
- Add `gtest` as a `git submodule` for the project.
- Use CMake to download `gtest` as part of the build's configuration step.


### Boost.Test

| Mock   | Fixture  | Fuzzing | Code Coverage | Build System |
| ------ | -------- | :-----: | ------------- | ------------ |
| FakeIt | Built-in |    —    | gcov          | CMake        |

[Boost.Test](https://www.boost.org/doc/libs/1_71_0/libs/test/doc/html/index.html) unit testing frameworks for C++. Boost unit testing framework (Boost.Test) is a part of the Boost library. It is a fully-functional and scalable framework, with wide range of assertion macros, XML output, and other features.

Boost.Test doesn't provide mocking functionality. However, combine it with standalone mocking frameworks such as [Hippomocks](https://github.com/dascandy/hippomocks), [FakeIt](https://github.com/eranpeer/FakeIt), or [Trompeloeil](https://github.com/rollbear/trompeloeil).

#### Fixtures

To write a fixture with Boost, you can use either a regular `BOOST_AUTO_TEST_CASE` macro written after a fixture class declaration or a special `BOOST_FIXTURE_TEST_CASE` macro:

```cpp
struct SampleF {
  SampleF() : i(1) {}
  ~SampleF() {}
  int i;
};

BOOST_FIXTURE_TEST_CASE(SampleF_test, SampleF) {
  // accessing i from SampleF directly
  BOOST_CHECK_EQUAL(i, 1);
  BOOST_CHECK_EQUAL(i, 2);
  BOOST_CHECK_EQUAL(i, 3);
}
```

#### Setup

Choose between three [usage variants](https://www.boost.org/doc/libs/1_71_0/libs/test/doc/html/boost_test/usage_variants.html) for the framework:

- header-only
- static library
- shared library

When picking the most suitable option, keep in mind that Boost.Test used as header-only might require significant compilation time. Find an example of the [shared library usage variant](https://www.boost.org/doc/libs/1_71_0/libs/test/doc/html/boost_test/usage_variants.html#boost_test.usage_variants.shared_lib).

### Catch2

|  Mock  | Fixture  | Fuzzing | Code Coverage | Build System |
| :----: | -------- | :-----: | ------------- | ------------ |
| FakeIt | Built-in |    —    | gcov          | CMake        |

[Catch2](https://github.com/catchorg/Catch2) unit testing frameworks for C++. It's a header-only testing system: to create tests with Catch2, download and include only one header file, `catch.hpp`. The framework's name stands for `C++ Automated Test Cases in Headers (version two)`.

Catch2 doesn't provide mocking functionality. However, combine it with standalone mocking frameworks such as [Hippomocks](https://github.com/dascandy/hippomocks), [FakeIt](https://github.com/eranpeer/FakeIt), or [Trompeloeil](https://github.com/rollbear/trompeloeil).

#### Setup

To start using Catch2, download the `catch.hpp` header using the link from the documentation and copy it into the project tree.

### Doctest

| Mock   | Fixture  | Fuzzing | Code Coverage | Build System |
| ------ | -------- | :-----: | ------------- | ------------ |
| FakeIt | Built-in |    —    | gcov          | CMake        |

[Doctest](https://github.com/doctest/doctest) unit testing frameworks for C++. Doctest is a single-header framework with self-registering tests. Doctest was designed after Catch and shares some parts of the Catch's code.

Doctest doesn't provide mocking functionality. However, combine it with standalone mocking frameworks such as [Hippomocks](https://github.com/dascandy/hippomocks), [FakeIt](https://github.com/eranpeer/FakeIt), or [Trompeloeil](https://github.com/rollbear/trompeloeil).

#### Setup

To start using Doctest, download the latest version of [doctest.h](https://raw.githubusercontent.com/onqtam/doctest/master/doctest/doctest.h) and copy it into the project tree.

### pytest

| Mock        | Fixture         | Fuzzing         | Code Coverage | Build System |
| ----------- | --------------- | --------------- | ------------- | :----------: |
| pytest-mock | pytest fixtures | atheris fuzzing | pytest-cov    |      —       |

[pytest](https://github.com/pytest-dev/pytest/) unit testing frameworks for Python. The pytest framework allows to write small, readable tests, and can be scaled to support complex functional tests for applications and libraries.

## Code Coverage

In computer science, test coverage is a measure (in percent) of the degree to which the source code of a program is executed when a particular test suite is run. A program with high test coverage has more of its source code executed during testing, which suggests it has a lower chance of containing undetected software bugs compared to a program with low test coverage. Many different metrics can be used to calculate test coverage. Some of the most basic are the percentage of program subroutines and the percentage of program statements called during execution of the test suite.

### C/C++

```bash
gcov
```

When passing the coverage flags manually, one of the following options can be used, depending on which compiler and coverage tools is preferred:

- GCC
  > `-fprofile-arcs` `-ftest-coverage` or `--coverage`

- Clang/Clang-cl
  >
  > - Use the same flags as for GCC to get the gcov-style coverage collected with [llvm-cov gcov](https://llvm.org/docs/CommandGuide/llvm-cov.html#llvm-cov-gcov).
  > - Use `-fprofile-instr-generate` `-fcoverage-mapping` to invoke the Clang’s instrumentation-based profiling which uses a pair of the `llvm-profdata merge` and `llvm-cov` export commands.

- CMake
  > Provide the flags by setting the `CMAKE_CXX_FLAGS` variable (`CMAKE_C_FLAGS` for C projects) or using other alternatives like the `add_compile_options` command. On linker errors while building the project with gcov compiler flags, try passing the same flags to the linker through `add_link_options` or `set(CMAKE_EXE_LINKER_FLAGS "")`.

### Golang

```bash
go test -race -coverprofile=coverage.out -covermode=atomic ./...
```

## See also

- JetBrains [unit testing](https://www.jetbrains.com/help/clion/unit-testing-tutorial.html#0) article.
- JetBrains [code coverage](https://www.jetbrains.com/help/clion/code-coverage-clion.html#0) article.
- Codecov [about](https://about.codecov.io/) article.
