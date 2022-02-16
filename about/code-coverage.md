# Code Coverage // TODO

In computer science, test coverage is a measure (in percent) of the degree to which the source code of a program is executed when a particular test suite is run. A program with high test coverage has more of its source code executed during testing, which suggests it has a lower chance of containing undetected software bugs compared to a program with low test coverage. Many different metrics can be used to calculate test coverage. Some of the most basic are the percentage of program subroutines and the percentage of program statements called during execution of the test suite.

- [C/C++](#cc)
- [Golang](#golang)
- [See also](#see-also)

## C/C++

```bash
gcov
```

## Golang

```bash
go test -race -coverprofile=coverage.out -covermode=atomic ./...
```

## See also

- About [Codecov](https://about.codecov.io/).
