# XXX-ADR: C/C++ Test Framework for TDD

- [1. State](#1-state)
- [2. Context](#2-context)
- [3. Decision](#3-decision)
  - [3.1. GoogleTest](#31-googletest)
- [4. Considered](#4-considered)
  - [4.1. GoogleTest](#41-googletest)
  - [4.2. Catch2](#42-catch2)
  - [4.3. CppUnit](#43-cppunit)
  - [4.4. Boost.Test](#44-boosttest)
  - [4.5. CppUTest](#45-cpputest)
  - [4.6. MSTest](#46-mstest)
- [5. Consequences](#5-consequences)
- [6. Implementation](#6-implementation)
- [7. References](#7-references)

## 1. State

- Author(s): ALKL
- Date: 2025-03-10
- Status: Proposed

## 2. Context

Efficient software development requires a robust test framework for C/C++ to support Test-Driven Development (TDD). Its to choose a framework that integrates well with the existing tools and workflows while providing comprehensive testing capabilities.

1. Decision Drivers

    - Unit Testing
      > Ability to write and run comprehensive unit tests.

    - Fuzz Testing
      > Support for fuzz testing to identify edge cases and security vulnerabilities.

    - Benchmark
      > Built-in or integrable microbenchmark facilities are essential to measure and optimize performance.

    - Test Doubles
      > Effective use of mocks and stubs for isolating dependencies.

    - Test Fixtures
      > Support for systematic setup and teardown procedures enhances test reliability.

    - Code Coverage
      > Integration with external coverage analysis tools like gcov, lcov is critical for maintaining high standards of test completeness.

    - Sanitizer
      > Compatibility with sanitizers (AddressSanitizer, UndefinedBehaviorSanitizer) is required to detect memory and undefined behavior errors.

    - Compiler (GCC)
      > Compatibility with GCC toolchain.

    - Build System (CMake)
      > Smooth integration with CMake to facilitate cross-platform builds and dependency management.

    - CI/CD Pipeline
      > Seamless integration with continuous integration/deployment workflows.

## 3. Decision

### 3.1. GoogleTest

Adopt a multi-tool approach with **GoogleTest (GTest)** as the primary C/C++ testing framework for implementing Test-Driven Development (TDD). Augmented with **GoogleMock (GMock)** for test doubles and complementary tool, **Google FuzzTest** for fuzz testing, **Google Benchmark** for performance metrics, compiler-based **Google Sanitizers (ASan, UBSan)**, and GCC gcov/lcov for **Code Coverage**.

1. Rationale

    - Unit Testing
      > GoogleTest provides comprehensive and widely-used support for unit testing with JUnit XML format reports.

    - Fuzz Testing
      > Google FuzzTest integrates smoothly with GoogleTest, providing robust fuzzing capabilities.

    - Benchmark
      > Incorporate Google Benchmark to enable performance testing with accurate measurement of code execution times.

    - Test Doubles
      > GoogleMock (augmented by GoogleTest) offers powerful mocking functionalities.

    - Test Fixtures
      > Native support within GoogleTest simplifies reusable setup and teardown logic.

    - Code Coverage
      > Compatible with coverage tools like gcov, gcovr, lcov, llvm-cov and Cobertura XML format reports.

    - Sanitizer
      > Seamless integration of Google Sanitizers with AddressSanitizer (ASan), UndefinedBehaviorSanitizer (UBSan), ThreadSanitizer (TSan), and MemorySanitizer (MSan).

    - Compiler (GCC)
      > Fully compatible with the GCC compiler.

    - Build System (CMake)
      > GoogleTest integrates seamlessly with CMake for cross-platform builds and dependency management.

    - CI/CD Pipelines
      > Widely supported and easy to integrate with major CI/CD platforms like Jenkins, GitHub Actions, GitLab CI, and Azure DevOps.

## 4. Considered

### 4.1. GoogleTest

[GoogleTest (GTest)](https://github.com/google/googletest) is a C++ testing framework developed and maintained by Google. It provides a rich set of assertions, test fixtures, and mocking capabilities through the included GMock library.

- Pros:
  - Unit Testing
    > Comprehensive assertion library with clear failure messages for unit tests.
  - Test Doubles
    > GMock framework included for creating test doubles (mocks).
  - Test Fixtures
    > Native support for test fixtures via macros.
  - Compiler/Build System
    > Compatibility with GCC and seamless integration with CMake (FindGTest module).
  - CI/CD
    > CI/CD pipeline compatibility with JUnit XML output format support.
  - Code Coverage
    > Compatible with standard code coverage tools like gcov/lcov.
  - Sanitizer
    > GCC compiler compatible integration with sanitizers (ASan, UBSan, TSan).
  - Documentation
    > Well-documented with extensive examples and tutorials.

- Cons:
  - Complexity
    > Requires integration of multiple complementary tools to address all decision drivers with additional setup and configuration.
  - Learning Curve
    > Build system integration and the extensive feature set can be complex.
  - Fuzz Testing
    > Limited built-in support, requires separate tools like Google FuzzTest.
  - Benchmark
    > No direct support, requires Google Benchmark as a separate dependency.

### 4.2. Catch2

[Catch2 (C++ Automated Test Cases in a Header)](https://github.com/catchorg/Catch2) is a modern, C++-native, header-only test framework for unit-tests, TDD and BDD.

- Pros:
  - Simplicity
    > Header-only library with minimal setup required, without additional dependencies or build configurations.
  - Unit Testing
    > TDD-style and BDD-style syntax (e.g., SCENARIO, GIVEN).
  - Benchmark
    > Built-in microbenchmark capabilities.
  - Test Fixtures
    > Native support for test fixtures via macros.
  - Compiler/Build System
    > Compatibility with GCC and integration with CMake Catch2 package.
  - Learning Curve
    > Lower learning curve compared to GoogleTest, excellent for quick prototyping and smaller projects.
  - Documentation
    > Good documentation with examples.

- Cons:
  - Maturity
    > Less mature than GoogleTest, potentially fewer community resources and limited built-in mocking capabilities compared to GoogleTest.
  - Test Doubles
    > No native mocking framework, requires manual doubles.
  - Fuzz Testing
    > Limited to property-based testing via generators.
  - CI/CD
    > Test output report is less customizable for CI/CD pipelines.

### 4.3. CppUnit

[CppUnit](https://sourceforge.net/projects/cppunit/) is a traditional xUnit-style C++ unit testing framework, modeled after JUnit for Java.

- Pros:
  - Simplicity
    > Supports header-only integration, allowing easy inclusion in existing projects without additional build configurations.

- Cons:
  - Maturity
    > Legacy framework with established history (xUnit family) with limited support for newer C++ features and less active development.
  - Learning Curve
    > Steeper learning curve for modern C++ developers with verbose and less modern syntax.
  - Test Doubles
    > No built-in mocking support.
  - Benchmark
    > No built-in benchmark support.
  - Fuzz Testing
    > No direct support for fuzz testing.
  - CMake
    > CMake integration requires more configuration.
  - Documentation
    > Sparse documentation and examples.

### 4.4. Boost.Test

[Boost.Test](https://github.com/boostorg/test) is part of the Boost C++ Libraries collection, providing tools for implementing test programs, organizing tests into test cases and test suites, and controlling the runtime execution.

- Pros:
  - Maturity
    > Part of the Boost ecosystem, benefits from its stability and maintenance.
  - Test Fixtures
    > Strong support for fixtures via macros.
  - Compiler
    > Fully compatible with GCC.
  - CI/CD
    > Multiple test output formats supported (XML, HRF) for CI/CD pipelines.

- Cons:
  - Complexity
    > Complex setup and configuration, heavier dependency due to Boost requirements.
  - Learning Curve
    > Steeper learning curve and less intuitive integration for CI/CD pipelines compared to GoogleTest.
  - Test Doubles
    > No built-in mocking framework, requires external tools for mocking.
  - Benchmark
    > No native benchmark support.
  - Fuzz Testing
    > No native fuzz testing support.
  - CMake
    > Complex setup for non-Boost projects.
  - Documentation
    > Limited documentation compared to GoogleTest.

### 4.5. CppUTest

[CppUTest](https://github.com/cpputest/cpputest) is a C/C++ unit testing framework specifically designed for embedded systems, though it supports any C/C++ environment. Its lightweight and focuses on simplicity, making it particularly suitable for resource-constrained systems and projects requiring minimal dependencies.

- Pros:
  - Footprint
    > Extremely light footprint, suitable for constrained environments with minimal dependencies.
  - Test Doubles
    > Built-in mocks support.
  - Sanitizer
    > GCC compiler compatible integration with sanitizers (ASan, UBSan, TSan).
  - Compiler
    > Lightweight and GCC-compatible.

- Cons:
  - Maturity
    > Less active development, smaller community and ecosystem, and limited built-in features compared to larger frameworks.
  - Test Doubles
    > Basic mocking support, less sophisticated than GMock.
  - Fuzz Testing
    > No native fuzz testing support.
  - Benchmark
    > No built-in benchmark capabilities, requires external tools.
  - Documentation
    > Minimal documentation compared to other frameworks.

### 4.6. MSTest

The [MSTest (Microsoft Testing Framework)](https://github.com/microsoft/testfx) Microsoft testing framework that supports C++ through the Visual Studio C++ Test Framework. Its designed to integrate seamlessly with Visual Studio and the broader Microsoft development ecosystem.

- Pros:
  - IDE Integration
    > Native integration with Visual Studio environment and debugging in MSVC.
  - Code Coverage
    > Supports code coverage with Microsoft Code Coverage extension.
  - Test Doubles
    > Supports stubs and shims with Microsoft Fakes extension.
  - Test Fixtures
    > Native support for test fixtures.
  - Documentation
    > Extensive documentation within Microsoft ecosystem.

- Cons:
  - Platform Limitation
    > Limited to Windows/Visual Studio environments, MSTest is not a standalone framework.
  - Benchmark
    > Limited benchmark capabilities.
  - Fuzz Testing
    > No built-in support for fuzz testing.
  - Sanitizer
    > Limited MSVC compiler support for sanitizers (ASan, KASan).
  - Compiler/Build System
    > Poor support for GCC and CMake, requires Visual Studio or related tooling.
  - CI/CD
    > Limited to Windows-based agents for CI/CD pipelines with Microsoft Testing Platform (MTP) support in MSTest Runner.

## 5. Consequences

- Positive
  - Comprehensive
    > Team will have access to a full-featured testing framework that can handle a wide variety of testing scenarios.

- Negative
  - Learning Curve
    > Team members unfamiliar with Software Testing Methodologies and Test Framework will need time to learn the conventions and idioms.
  - Complexity
    > Integration with build system requires more configuration than header-only alternatives.

## 6. Implementation

Projects will standardize on Test Frameworks with documentation provided to developers detailing best practices for writing and maintaining tests. Integration with CI/CD and coverage reporting tools will be configured during the initial project setup phase.

1. Education and Training

    - Software Testing Methodologies
      > Conduct education and training sessions on software testing methodologies such as Test-Driven Development (TDD).
    - Software Testing Techniques
      > Train team members on testing techniques including Test Doubles (Mocks, Stubs) and Test Fixtures.
    - Software Testing Patterns
      > Introduce and encourage the consistent application of testing patterns such as Arrange-Act-Assert (AAA), In-Got-Want, and Table-Driven Tests to enhance test clarity and maintainability.

2. Templates and Documentation

    - Templates
      > Create template files and examples for common testing scenarios.
    - Documentation
      > Maintain internal documentation of best practices and patterns.

3. Integration and Legacy Strategy

    - Build System
      > Develop standardized CMake modules for easy integration across projects.
    - Legacy Code
      > Create a phased approach for introducing Test Frameworks to legacy codebases.

## 7. References

- Sentenz [Software Testing](../internal/articles/software-testing.md) article.
