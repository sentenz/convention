# Unit-Testing Frameworks // TODO

- [Unit Testing](#unit-testing)
  - [Google Test](#google-test)
  - [Catch](#catch)
  - [CppUnit](#cppunit)
  - [Boost.Test](#boosttest)
  - [CppUTest](#cpputest)
  - [Embunit](#embunit)
  - [pytest](#pytest)
- [Code Coverage](#code-coverage)
  - [C/C++](#cc)
  - [Golang](#golang)
- [See also](#see-also)

## Unit Testing

Unit Testing is a basic and considerable practice step in the software testing process. It is concerned with testing individual units of source code.

### Google Test

### Catch

### CppUnit

### Boost.Test

### CppUTest

### Embunit

[Embunit](https://www.embunit.com/) is an open source unit testing framework for embedded software in C or C++ for programmers and testers developing software. It is aimed at embedded software development, but can be used to create unit tests for any software written in C or C++.

### pytest

The [pytest](https://github.com/pytest-dev/pytest/) framework allows to write small, readable tests, and can be scaled to support complex functional tests for applications and libraries.

## Code Coverage

In computer science, test coverage is a measure (in percent) of the degree to which the source code of a program is executed when a particular test suite is run. A program with high test coverage has more of its source code executed during testing, which suggests it has a lower chance of containing undetected software bugs compared to a program with low test coverage. Many different metrics can be used to calculate test coverage. Some of the most basic are the percentage of program subroutines and the percentage of program statements called during execution of the test suite.

### C/C++

```bash
gcov
```

### Golang

```bash
go test -race -coverprofile=coverage.out -covermode=atomic ./...
```

## See also

- About [Codecov](https://about.codecov.io/).
