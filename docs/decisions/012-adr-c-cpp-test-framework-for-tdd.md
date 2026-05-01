# 012-ADR: C/C++ Test Framework for TDD

- [1. State](#1-state)
- [2. Context](#2-context)
- [3. Decision](#3-decision)
  - [3.1. GoogleTest](#31-googletest)
- [4. Considered](#4-considered)
  - [4.1. GoogleTest](#41-googletest)
  - [4.2. Catch2](#42-catch2)
  - [4.3. CppUnit](#43-cppunit)
  - [4.4. Boost.Test](#44-boosttest)
  - [4.5. Unity](#45-unity)
  - [4.6. CppUTest](#46-cpputest)
  - [4.7. MSTest](#47-mstest)
- [5. Consequences](#5-consequences)
- [6. Implementation](#6-implementation)
- [7. References](#7-references)

## 1. State

- Author(s): Sentenz
- Date: 2025-03-10
- Status: Proposed

## 2. Context

Efficient software development requires a robust test framework for C/C++ to support Test-Driven Development (TDD). It is important to choose a framework that integrates well with existing tools and workflows while providing comprehensive testing capabilities.

1. Decision Drivers

    - Unit Testing
      > Ability to write and run comprehensive unit tests with JUnit XML format reports.

    - Fuzz Testing
      > Support for fuzz testing to identify edge cases and security vulnerabilities.

    - Benchmark
      > Built-in or integrable microbenchmark facilities are essential to measure and optimize performance.

    - Test Doubles
      > Effective use of mocks and stubs for isolating dependencies.

    - Test Fixtures
      > Support for systematic setup and teardown procedures enhances test reliability.

    - Code Coverage
      > Integration with code coverage tools to measure test effectiveness with Cobertura XML format reports.

    - Sanitizer
      > Compatibility with sanitizers (AddressSanitizer, UndefinedBehaviorSanitizer) is required to detect memory and undefined behavior errors.

    - Compiler Interoperability
      > Ability to compile with multiple compilers (e.g., GCC, Clang, MSVC) to ensure broad platform and toolchain compatibility.

    - Build System (CMake/CTest)
      > Integration with CMake for cross-platform builds and dependency management, and CTest support for standardized test discovery and execution, enabling straightforward CI/CD integration.

    - CI/CD Pipeline
      > Seamless integration with continuous integration/deployment workflows.

    - IDE/Editor Support
      > Compatibility with CTest by IDEs (Visual Studio, CLion) and editors (VS Code, Vim) to enhance developer productivity.

    - Platform Portability
      > Support for multiple platforms (Linux, Windows, macOS) to ensure applicability.

    - On/Off-Target Testing
      > Support for both on-target testing (device-based e.g., embedded systems) and off-target testing (host-based e.g., development environment) to accommodate various development environments.

## 3. Decision

### 3.1. GoogleTest

Adopt a multi-tool approach, using GoogleTest (GTest) with GoogleMock (GMock) as the primary C/C++ testing framework for Test-Driven Development (TDD). Complement with Google FuzzTest for fuzz testing, Google Benchmark for performance metrics, compiler-based sanitizers (AddressSanitizer, UndefinedBehaviorSanitizer), and gcov/lcov for code coverage.

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

    - Compiler Interoperability
      > Fully compatible with GCC, Clang, and MSVC compilers.

    - Build System (CMake/CTest)
      > GoogleTest integrates well with CMake, and CTest provides standardized test discovery/execution, CDash-compatible reporting, and straightforward CI/CD integration.

    - CI/CD Pipeline
      > Widely supported and easy to integrate with major CI/CD platforms like Jenkins, GitHub Actions, GitLab CI, and Azure DevOps.

    - IDE/Editor Support
      > Supported by major IDEs (Visual Studio, CLion) and editors (VS Code, Vim) with CTest integration.

    - Platform Portability
      > Cross-platform support for Linux, Windows, and macOS.

    - On/Off-Target Testing
      > Supports host-based test execution out of the box and can be extended for device-based execution through CTest, toolchain files, and target-specific runners.

## 4. Considered

### 4.1. GoogleTest

[GoogleTest (GTest)](https://github.com/google/googletest) is a C++ testing framework developed and maintained by Google. It provides a rich set of assertions, test fixtures, and mocking capabilities through the included GMock library.

- Pros:

  - Unit Testing
    > Comprehensive assertion library with clear failure diagnostics and native JUnit XML report generation for CI/CD consumption.

  - Test Doubles
    > GMock framework included for creating test doubles (mocks).

  - Test Fixtures
    > Native support for test fixtures via macros.

  - Compiler Interoperability
    > Compatibility with GCC, Clang, and MSVC compilers.

  - Build System (CMake/CTest)
    > Seamless integration with CMake (FindGTest module).

  - CI/CD Pipeline
    > CI/CD pipeline compatibility with JUnit XML output format support.

  - Code Coverage
    > Compatible with standard code coverage tools like gcov/lcov.

  - Sanitizer
    > GCC, Clang, and MSVC (limited) compilers compatible integration with sanitizers (ASan, UBSan, TSan).

  - IDE/Editor Support
    > Supported by major IDEs (Visual Studio, CLion) and editors (VS Code, Vim) with CTest integration.

  - Platform Portability
    > Cross-platform support for Linux, Windows, and macOS.

  - On/Off-Target Testing
    > Strong off-target support and practical on-target integration through CMake/CTest with custom runners for embedded targets.

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
    > Expressive TDD/BDD syntax with broad unit-testing coverage and JUnit XML output support via reporter configuration.

  - Benchmark
    > Built-in microbenchmark capabilities.

  - Test Fixtures
    > Native support for test fixtures via macros.

  - Compiler Interoperability
    > Compatibility with GCC, Clang, and MSVC compilers.

  - Build System (CMake/CTest)
    > Integration with CMake Catch2 package.

  - Learning Curve
    > Lower learning curve compared to GoogleTest, excellent for quick prototyping and smaller projects.

  - Code Coverage
    > Compatible with standard code coverage tools like gcov/lcov.

  - Sanitizer
    > GCC, Clang, and MSVC (limited) compilers compatible integration with sanitizers (ASan, UBSan, TSan).

  - Platform Portability
    > Cross-platform support for Linux, Windows, and macOS.

  - Documentation
    > Good documentation with examples.

- Cons:

  - Maturity
    > Less mature than GoogleTest, potentially fewer community resources and limited built-in mocking capabilities compared to GoogleTest.

  - Test Doubles
    > No native mocking framework, requires manual doubles.

  - Fuzz Testing
    > Limited to property-based testing via generators.

  - CI/CD Pipeline
    > Test output report is less customizable for CI/CD pipelines.

  - IDE/Editor Support
    > Limited IDE integration compared to GoogleTest, relies on CTest for editor support.

  - On/Off-Target Testing
    > Good off-target experience, but on-target execution typically requires additional custom harness and runner integration.

### 4.3. CppUnit

[CppUnit](https://sourceforge.net/projects/cppunit/) is a traditional xUnit-style C++ unit testing framework, modeled after JUnit for Java.

- Pros:

  - Simplicity
    > Supports header-only integration, allowing easy inclusion in existing projects without additional build configurations.

  - Unit Testing
    > Provides xUnit-style unit testing with suites and assertions.

  - Test Fixtures
    > Support for test fixtures via `setUp()` and `tearDown()` methods.

  - Compiler Interoperability
    > Compatibility with GCC, Clang, and MSVC compilers.

  - Code Coverage
    > Compatible with standard code coverage tools like gcov/lcov.

  - Sanitizer
    > GCC, Clang, and MSVC (limited) compilers compatible integration with sanitizers (ASan, UBSan, TSan).

  - Platform Portability
    > Cross-platform support for Linux, Windows, and macOS.

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

  - Build System (CMake/CTest)
    > CMake integration requires more configuration, limited CTest support.

  - CI/CD Pipeline
    > Basic XML output support, requires additional configuration for CI/CD integration.

  - IDE/Editor Support
    > Limited IDE integration, minimal tooling support compared to modern frameworks.

  - Documentation
    > Sparse documentation and limited examples.

  - Unit Testing (JUnit XML)
    > XML reporting is available, but JUnit XML compatibility is limited and often requires adapters for standardized CI ingestion.

  - On/Off-Target Testing
    > No standardized built-in workflow for combining host-based and device-based test execution.

### 4.4. Boost.Test

[Boost.Test](https://github.com/boostorg/test) is part of the Boost C++ Libraries collection, providing tools for implementing test programs, organizing tests into test cases and test suites, and controlling the runtime execution.

- Pros:

  - Maturity
    > Part of the Boost ecosystem, benefits from its stability and maintenance.

  - Unit Testing
    > Comprehensive assertion library for unit tests and suites with XML reporting that can be integrated into JUnit-oriented pipelines.

  - Test Fixtures
    > Strong support for fixtures via macros.

  - Compiler Interoperability
    > Compatibility with GCC, Clang, and MSVC compilers.

  - Build System (CMake/CTest)
    > Integration with CMake Boost package (FindBoost module).

  - Code Coverage
    > Compatible with standard code coverage tools like gcov/lcov.

  - Sanitizer
    > GCC, Clang, and MSVC (limited) compilers compatible integration with sanitizers (ASan, UBSan, TSan).

  - CI/CD Pipeline
    > Multiple test output formats supported (XML, HRF) for CI/CD pipelines.

  - Platform Portability
    > Cross-platform support for Linux, Windows, and macOS as part of Boost ecosystem.

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

  - Build System (CMake/CTest)
    > Complex setup for non-Boost projects, requires FindBoost module configuration.

  - IDE/Editor Support
    > Limited IDE integration compared to GoogleTest, relies on CTest for editor support.

  - Documentation
    > Limited documentation compared to GoogleTest.

  - Unit Testing (JUnit XML)
    > JUnit XML compatibility is not first-class and may require output transformation for tools expecting strict JUnit schema.

  - On/Off-Target Testing
    > On-target support is possible but typically requires non-trivial custom integration for embedded deployment and execution.

### 4.5. Unity

[Unity Test Framework](https://github.com/ThrowTheSwitch/Unity) is a lightweight C unit testing framework designed for embedded and resource-constrained systems. Unity is part of the ThrowTheSwitch ecosystem and is commonly paired with CMock and Ceedling.

- Pros:

  - Footprint
    > Very small footprint, suitable for constrained embedded targets.

  - Unit Testing
    > Fast and deterministic C-focused unit testing with straightforward assertions, JUnit XML reporting is typically achieved via Ceedling plugins.

  - On/Off-Target Testing
    > Well-suited for both host-based execution and on-target embedded test runs.

  - Test Doubles
    > Strong ecosystem support via CMock for generating mocks and stubs.

  - Build System (CMake/CTest)
    > Can be integrated with CMake/CTest workflows, especially in mixed-toolchain environments.

  - CI/CD Pipeline
    > Lightweight test binaries are practical for CI pipelines and embedded regression suites.

  - Platform Portability
    > Broad portability across embedded toolchains and host platforms.

  - Documentation
    > Good documentation in the ThrowTheSwitch ecosystem with many embedded-focused examples.

- Cons:

  - Language Scope
    > Primarily C-oriented, the C++ support is limited compared to native C++ frameworks.

  - Unit Testing (JUnit XML)
    > JUnit XML is usually indirect (tooling/plugin-based), adding integration complexity for standardized reporting.

  - Benchmark
    > No built-in benchmark facilities, requiring external tools.

  - Fuzz Testing
    > No native fuzz testing support, an external fuzzing setup is required.

  - IDE/Editor Support
    > Less direct IDE integration than GoogleTest-centric C++ workflows.

  - Standardization
    > Team conventions may need additional guidance when mixing Unity/CMock/Ceedling with existing CMake setups.

### 4.6. CppUTest

[CppUTest](https://github.com/cpputest/cpputest) is a C/C++ unit testing framework specifically designed for embedded systems, though it supports any C/C++ environment. It is lightweight and focuses on simplicity, making it particularly suitable for resource-constrained systems and projects requiring minimal dependencies.

- Pros:

  - Footprint
    > Extremely light footprint, suitable for constrained environments with minimal dependencies.

  - Unit Testing
    > Straightforward unit testing support for embedded-focused code with practical JUnit XML reporting for CI pipelines.

  - Test Doubles
    > Built-in mocks and stubs support with CppUMock.

  - Test Fixtures
    > Native support for test fixtures via `setup()` and `teardown()` methods.

  - Sanitizer
    > GCC, Clang, and MSVC (limited) compilers compatible integration with sanitizers (ASan, UBSan, TSan).

  - Compiler Interoperability
    > Lightweight and compatible with GCC, Clang, and MSVC (limited).

  - Code Coverage
    > Compatible with standard code coverage tools like gcov/lcov.

  - Platform Portability
    > Cross-platform support for Linux, Windows, and macOS, with emphasis on embedded systems.

  - On/Off-Target Testing
    > Designed for embedded development and supports both host and target testing workflows with lightweight runtime requirements.

- Cons:

  - Maturity
    > Less active development, smaller community and ecosystem, and limited built-in features compared to larger frameworks.

  - Test Doubles
    > Basic mocking support with CppUMock, less sophisticated than GMock.

  - Fuzz Testing
    > No native fuzz testing support.

  - Benchmark
    > No built-in benchmark capabilities, requires external tools.

  - Build System (CMake/CTest)
    > CMake integration available but less documented, limited CTest support.

  - CI/CD Pipeline
    > Basic JUnit XML output support, requires additional configuration for CI/CD.

  - IDE/Editor Support
    > Limited IDE integration, primarily used via command-line or CTest.

  - Documentation
    > Minimal documentation compared to other frameworks.

### 4.7. MSTest

The [MSTest (Microsoft Testing Framework)](https://github.com/microsoft/testfx) is a Microsoft testing framework that supports C++ through the Visual Studio C++ Test Framework. It is designed to integrate seamlessly with Visual Studio and the broader Microsoft development ecosystem.

- Pros:

  - Unit Testing
    > Comprehensive unit testing in Visual Studio ecosystem, but native results are centered on TRX rather than JUnit XML.

  - IDE/Editor Support
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

  - Platform Portability
    > Limited to Windows platforms, reducing cross-platform applicability.

  - Benchmark
    > Limited benchmark capabilities.

  - Fuzz Testing
    > No built-in support for fuzz testing.

  - Sanitizer
    > Limited MSVC compiler support for sanitizers (ASan, KASan).

  - Compiler Interoperability
    > Limited to MSVC compiler, reducing compatibility with GCC and Clang.

  - Build System (CMake/CTest)
    > Limited CMake integration, primarily designed for Visual Studio projects.

  - CI/CD Pipeline
    > Limited to Windows-based agents for CI/CD pipelines with Microsoft Testing Platform (MTP) support in MSTest Runner.

  - Unit Testing (JUnit XML)
    > JUnit XML interoperability generally depends on conversion from TRX or additional tooling in cross-platform pipelines.

  - On/Off-Target Testing
    > Primarily host-based in Visual Studio/MSVC environments, with limited practicality for heterogeneous embedded on-target workflows.

## 5. Consequences

- Positive

  - Comprehensive
    > Team will have access to a full-featured testing framework that can handle a wide variety of testing scenarios.

  - On/Off-Target Coverage
    > Teams can validate logic quickly off-target while preserving confidence through selective on-target verification for device-specific behavior.

- Negative

  - Learning Curve
    > Team members unfamiliar with Software Testing Methodologies and Test Framework will need time to learn the conventions and idioms.

  - Complexity
    > Integration with build system requires more configuration than header-only alternatives.

  - Operational Overhead
    > Maintaining both host and target test pipelines introduces additional setup, infrastructure, and maintenance effort.

## 6. Implementation

Projects will standardize on Test Frameworks with documentation provided to developers detailing best practices for writing and maintaining tests. Integration with CI/CD and coverage reporting tools will be configured during the initial project setup phase, including explicit support for both off-target and on-target execution paths.

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
    - Target Profiles
      > Define host and device CMake/CTest profiles (toolchains, runners, labels) to execute tests consistently in off-target and on-target environments.
    - Legacy Code
      > Create a phased approach for introducing Test Frameworks to legacy codebases.

4. AI Agent Skills

    - Unit Test Generation
      > Leverage AI Agent Skills (e.g., Continue Agent Mode) to accelerate unit test creation by generating test scaffolds, assertions, and test doubles based on source code analysis.

5. Onboarding

    - Environment Setup
      > Provide Bootstrap scripts and CMake modules for configuring development environments with GoogleTest, GoogleMock, Google FuzzTest, Google Benchmark, sanitizers, and host/target test execution profiles.
    - Mentorship Pairing
      > Pair new team members with experienced developers for code review sessions focused on test quality and best practices.

## 7. References

- Sentenz [Software Testing](../articles/software-testing.md) article.
