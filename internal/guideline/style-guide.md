# Style Guide

- [1. C/C++](#1-cc)
  - [1.1. Convention](#11-convention)
  - [1.2. Library](#12-library)
  - [1.3. Code Analysis](#13-code-analysis)
  - [1.4. Build System](#14-build-system)
  - [1.5. Package Manager](#15-package-manager)
  - [1.6. Software Testing](#16-software-testing)
  - [1.7. Compiler](#17-compiler)
  - [1.8. Architecture](#18-architecture)
  - [1.9. Editor](#19-editor)
- [2. Go](#2-go)
  - [2.1. Convention](#21-convention)
  - [2.2. Library](#22-library)
    - [2.2.1. UI](#221-ui)
  - [2.3. Code Analysis](#23-code-analysis)
  - [2.4. Software Testing](#24-software-testing)
  - [2.5. Architecture](#25-architecture)
  - [2.6. Editor](#26-editor)
  - [2.7. Links](#27-links)
- [3. Python](#3-python)
  - [3.1. Convention](#31-convention)
  - [3.2. Library](#32-library)
  - [3.3. Code Analysis](#33-code-analysis)
  - [3.4. Software Testing](#34-software-testing)
  - [3.5. Tool](#35-tool)
  - [3.6. Architecture](#36-architecture)
  - [3.7. Editor](#37-editor)
- [4. Kotlin](#4-kotlin)
  - [4.1. Convention](#41-convention)
  - [4.2. Code Analysis](#42-code-analysis)
  - [4.3. Guides](#43-guides)
  - [4.4. Editor](#44-editor)
- [5. Rust](#5-rust)
  - [5.1. Convention](#51-convention)
  - [5.2. Code Analysis](#52-code-analysis)
  - [5.3. Software Testing](#53-software-testing)
- [6. Shell](#6-shell)
  - [6.1. Convention](#61-convention)
  - [6.2. Code Analysis](#62-code-analysis)
  - [6.3. Editor](#63-editor)
- [7. Git](#7-git)
  - [7.1. Convention](#71-convention)
  - [7.2. Code Analysis](#72-code-analysis)
- [8. Markdown](#8-markdown)
  - [8.1. Convention](#81-convention)
  - [8.2. Code Analysis](#82-code-analysis)
  - [8.3. Editor](#83-editor)
- [9. CMake](#9-cmake)
  - [9.1. Convention](#91-convention)
  - [9.2. Code Analysis](#92-code-analysis)
  - [9.3. Editor](#93-editor)

## 1. C/C++

| Documentation | Build System | Package Manager | Software Testing | Code Coverage | Code Formatting | Code Linting | Cross-Compilation |
| ------------- | ------------ | --------------- | ---------------- | ------------- | --------------- | ------------ | ----------------- |
| Dependency    | Dependency   | Dependency      | Dependency       | Dependency    | Dependency      | Dependency   | Dependency        |

### 1.1. Convention

- [Google C++ Style Guide](https://sentenz.github.io/backup-service/repository/github/google/styleguide/cppguide.html)
- [C++ Core Guidelines](https://github.com/isocpp/CppCoreGuidelines)

### 1.2. Library

- [Doxygen](https://github.com/doxygen/doxygen) documentation package for C/C++ projects.

### 1.3. Code Analysis

Code Check

- [clang-tidy](https://clang.llvm.org/extra/clang-tidy/) tool and [doc](https://clang.llvm.org/extra/clang-tidy/#id2)
  > Configure [.clang-tidy](https://github.com/googleapis/google-cloud-cpp/blob/main/.clang-tidy) in the project.

- [Cpplint](https://pypi.org/project/cpplint/)
  >
  > - Detect style errors, see [cpplint.py](https://raw.githubusercontent.com/google/styleguide/gh-pages/cpplint/cpplint.py) tool.
  > - Configure [CPPLINT.cfg](https://github.com/google/conscrypt/blob/master/CPPLINT.cfg) in the root project.
  > - False positives can be ignored by putting `// NOLINT` at the end of the line or `// NOLINTNEXTLINE` in the previous line.

- [scan-build](https://github.com/rizsotto/scan-build)
  > Tool for [clang-analyzer](http://clang-analyzer.llvm.org/scan-build.html).

- [Cppcheck](https://github.com/danmar/cppcheck)
  >
  > - Configure [cppcheck-suppressions.txt](https://github.com/open62541/open62541/blob/master/cppcheck-suppressions.txt) in the project.
  > - See [manual](http://cppcheck.sourceforge.net/manual.pdf).

- [Infer](https://github.com/facebook/infer)
  > A static analyzer for Java, C, C++, and Objective-C.

Code Format

- [clang-format](https://clang.llvm.org/docs/ClangFormat.html)
  > Configure in the root project.
  >
  > - [.clang-format](https://github.com/googleapis/google-cloud-cpp/blob/main/.clang-format)
  > - [.clang-format-ignore](https://github.com/mozilla/gecko-dev/blob/master/.clang-format-ignore)
  > - Use [clang-format-configurator](https://zed0.co.uk/clang-format-configurator/) to modify a .clang-format file.

Sanitizers

- [Valgrind](https://valgrind.org/)
- [Google Sanitizers](https://github.com/google/sanitizers)

### 1.4. Build System

- CMake

### 1.5. Package Manager

- Conan

### 1.6. Software Testing

- [GoogleTest](https://github.com/google/googletest)
  > Unit-testing framework with testing with mocking and fixtures support.

- [Google Benchmark](https://github.com/google/benchmark)
  > A microbenchmark support library.
  >
  > Documentation [guide](https://google.github.io/benchmark/) for benchmark.

- [gcov](https://gcc.gnu.org/onlinedocs/gcc/Gcov.html)
  > Test code coverage tool.

- [OSS-Fuzz](https://github.com/google/oss-fuzz)
  > Ffuzzing technique for automated injections.

- [FuzzBench](https://github.com/google/fuzzbench)
  > Fuzzer benchmarking as a service.

### 1.7. Compiler

See [Compiler User Guides](https://www.keil.com/support/man/docs/armclang_intro/default.htm) for the complete option list.

1. [Using Common Compiler Options](https://www.keil.com/support/man/docs/armclang_intro/armclang_intro_mtw1469708501316.htm)
   - [Selecting source language options](https://www.keil.com/support/man/docs/armclang_intro/armclang_intro_sir1472741527970.htm)
   - [Selecting optimization options](https://www.keil.com/support/man/docs/armclang_intro/armclang_intro_fnb1472741490155.htm) and [Options That Control Optimization](https://gcc.gnu.org/onlinedocs/gcc/Optimize-Options.html)
2. [Writing Optimized Code](https://www.keil.com/support/man/docs/armclang_intro/armclang_intro_oph1469708556921.htm)
   - [Effect of the volatile keyword](https://www.keil.com/support/man/docs/armclang_intro/armclang_intro_chr1385110934192.htm)
   - [Optimizing loops](https://www.keil.com/support/man/docs/armclang_intro/armclang_intro_hpz1474359444075.htm)
   - [Inlining functions](https://www.keil.com/support/man/docs/armclang_intro/armclang_intro_kff1474359729131.htm)
   - [Stack use in C and C++](https://www.keil.com/support/man/docs/armclang_intro/armclang_intro_hla1474359990839.htm)
3. [Embedded Software Development](https://www.keil.com/support/man/docs/armclang_intro/armclang_intro_lfh1505904047779.htm)
   - [Default memory map](https://www.keil.com/support/man/docs/armclang_intro/armclang_intro_clm1505906242639.htm)
   - [Run-time memory models](https://www.keil.com/support/man/docs/armclang_intro/armclang_intro_ldq1505906267474.htm)
   - [The vector table](https://www.keil.com/support/man/docs/armclang_intro/armclang_intro_kqu1505906156419.htm)
4. Code size optimization
   - [-ffunction-sections, -fdata-sections, & --gc-sections](https://interrupt.memfault.com/blog/best-and-worst-gcc-clang-compiler-flags#-ffunction-sections--fdata-sections----gc-sections)

### 1.8. Architecture

- [Project Layout](https://api.csswg.org/bikeshed/?force=1&url=https://raw.githubusercontent.com/vector-of-bool/pitchfork/develop/data/spec.bs)

### 1.9. Editor

- [Visual Studio Code](https://code.visualstudio.com/download)

## 2. Go

| Documentation | Build System | Package Manager | Software Testing | Code Coverage | Code Formatting | Code Linting | Cross-Compilation |
| ------------- | ------------ | --------------- | ---------------- | ------------- | --------------- | ------------ | ----------------- |
| Built-in      | Built-in     | Built-in        | Built-in         | Built-in      | Built-in        | Built-in     | Built-in          |

### 2.1. Convention

- [Effective Go](https://golang.org/doc/effective_go)
- [Golang Code Review Comments](https://github.com/golang/go/wiki/CodeReviewComments)
- [Uber Go Style Guide](https://github.com/uber-go/guide/blob/master/style.md)

### 2.2. Library

- [Go kit](https://github.com/go-kit/kit)
  > Standard library for microservices or elegant monoliths.

- [GORM](https://github.com/go-gorm/gorm)
  > Object-Relational Mapping (ORM) library for query and manipulate databases.

- [Cobra](https://github.com/spf13/cobra)
  > Library for CLI apps.

- [cli](https://github.com/urfave/cli)
  > Library for CLI apps.

- [fuzzy](https://github.com/sahilm/fuzzy)
  > Library that provides fuzzy string matching.

- [lo](https://github.com/samber/lo)
  > Lodash for Go library.

- [Gonum](https://github.com/gonum/gonum)
  > Set of packages designed to writing numerical and scientific algorithms.

- [grpc-go](https://github.com/grpc/grpc-go)
  > Go language implementation of gRPC.

#### 2.2.1. UI

- [go-echarts](https://github.com/go-echarts/go-echarts)
- [go-chart](https://github.com/wcharczuk/go-chart)
- [Statsview](https://github.com/go-echarts/statsview)
- [Gonum Plot](https://github.com/gonum/plot)
- [Go GUI Projects](https://github.com/go-graphics/go-gui-projects)

### 2.3. Code Analysis

- [golangci-lint](https://github.com/golangci/golangci-lint)
  > Configure [.golangci.yml](https://github.com/golangci/golangci-lint/blob/master/.golangci.yml) in the project.
- [Awesome Go Linters](https://github.com/golangci/awesome-go-linters)

### 2.4. Software Testing

- [go test](https://pkg.go.dev/testing@go1.18)
  > Package testing provides support for automated testing of Go packages.
  >
  > - Support for [Benchmarks](https://pkg.go.dev/testing@go1.18#hdr-Benchmarks).
  > - Support for [Examples](https://pkg.go.dev/testing@go1.18#hdr-Examples).
  > - Support for [Fuzzing](https://pkg.go.dev/testing@go1.18#hdr-Fuzzing) see [docs](https://go.dev/doc/fuzz/).
  > - Support for [Skipping](https://pkg.go.dev/testing@go1.18#hdr-Skipping).
  > - Support for [Main](https://pkg.go.dev/testing@go1.18#hdr-Main).

- [OSS-Fuzz](https://github.com/google/oss-fuzz)
  > Fuzzing technique for automated injections with a [Go project support](https://google.github.io/oss-fuzz/getting-started/new-project-guide/go-lang/).

- [FuzzBench](https://github.com/google/fuzzbench)
  >  Fuzzer benchmarking as a service.

### 2.5. Architecture

- [Project Layout](https://github.com/golang-standards/project-layout)
- [Project Layout Generator](https://github.com/insidieux/inizio/tree/v1.1.1)
- [Go Clean Template](https://github.com/evrone/go-clean-template)

### 2.6. Editor

- [Visual Studio Code](https://code.visualstudio.com/download)

### 2.7. Links

- [FAQ](https://golang.org/doc/faq)

## 3. Python

| Documentation | Build System | Package Manager | Software Testing | Code Coverage | Code Formatting | Code Linting | Cross-Compilation |
| ------------- | ------------ | --------------- | ---------------- | ------------- | --------------- | ------------ | ----------------- |
| Dependency    | Built-in     | Built-in        | Dependency       | Dependency    | Dependency      | Dependency   | Dependency        |

### 3.1. Convention

- [Google Python Style Guide](https://sentenz.github.io/backup-service/repository/github/google/styleguide/pyguide.html)
- [PEP8](https://www.python.org/dev/peps/pep-0008/)
- [PEP257](https://www.python.org/dev/peps/pep-0257/)
- [PEP484](https://www.python.org/dev/peps/pep-0484/)

### 3.2. Library

- [Click](https://github.com/pallets/click)
  > Package for creating CLI apps.

- [Pandas](https://github.com/pandas-dev/pandas)
  > Package that provides flexible and expressive data structures.

- [Faker](https://github.com/joke2k/faker)
  > Package that generates fake data.

- [Pendulum](https://github.com/sdispater/pendulum)
  > Package for datetimes.

- [grpcio](https://github.com/grpc/grpc/tree/master/src/python/grpcio)
  > Python language implementation of gRPC.

- [Sphinx](https://github.com/sphinx-doc/sphinx)
  > Documentation package for Python projects.

### 3.3. Code Analysis

Code Check

- [Pylint](https://github.com/PyCQA/pylint)
  > Static code analysis tool.

- [Flake8](https://github.com/PyCQA/flake8)
  > Wrapper of tools to check code style and quality.

- [Bandit](https://github.com/PyCQA/bandit)
  > Find security issues in code.

- [Pylama](https://github.com/klen/pylama)
  > Code audit tool.

- [MyPy](https://github.com/python/mypy)
  > Optional static typing.

- [pytype](https://github.com/google/pytype)
  > A static type analyzer.

- [Pyre](https://github.com/facebook/pyre-check)
  > Performant type-checking.

Code Format

- [Black](https://github.com/psf/black)
  > Uncompromising code formatter.

- [yapf](https://github.com/google/yapf)
  > Code formatter for PEP8 or Google style.

- [autopep8](https://github.com/hhatto/autopep8)
  > Code formatter to conform to the PEP8 style guide.

- [isort](https://github.com/PyCQA/isort)
  > Sort imports alphabetically.

- [autoflake](https://github.com/PyCQA/autoflake)
  > Removes unused imports and unused variables.

### 3.4. Software Testing

- [pytest](https://github.com/pytest-dev/pytest)
  > Unit-testing framework.

- [pytest-xdist](https://github.com/pytest-dev/pytest-xdist)
  > pytest plugin for distributed testing and loop-on-failures testing modes.

- [pytest fixtures](https://docs.pytest.org/en/6.2.x/fixture.html)
  > Fixtures initialize test functions.

- [pytest-mock](https://github.com/pytest-dev/pytest-mock)
  > Supports mock test for pytest.

- [pytest-cov](https://github.com/pytest-dev/pytest-cov)
  > Supports test code coverage for pytest.

- [atheris fuzzing](https://github.com/google/atheris)
  > Fuzzing technique for automated injections.

- [OSS-Fuzz](https://github.com/google/oss-fuzz)
  > Fuzzing technique for automated injections with a [Python project support](https://google.github.io/oss-fuzz/getting-started/new-project-guide/python-lang/).

- [FuzzBench](https://github.com/google/fuzzbench)
  > Fuzzer benchmarking as a service.

### 3.5. Tool

- [virtualenv](https://github.com/pypa/virtualenv)
  > Tool for creating isolated virtual python environments.

- [tox](https://github.com/tox-dev/tox)
  > Command line (CLI) driven CI frontend and development task automation tool.

### 3.6. Architecture

- [PyScaffold](https://github.com/pyscaffold/pyscaffold)
  > Python project generator.

- [python-blueprint](https://github.com/johnthagen/python-blueprint)
  > Python project using best practices.

- [Python Project Template](https://github.com/rochacbruno/python-project-template)

### 3.7. Editor

- [Visual Studio Code](https://code.visualstudio.com/download)
  > Getting Started with [Python](https://code.visualstudio.com/docs/python/python-tutorial) in VS Code.

## 4. Kotlin

| Documentation | Build System | Package Manager | Software Testing | Code Coverage | Code Formatting | Code Linting | Cross-Compilation |
| ------------- | ------------ | --------------- | ---------------- | ------------- | --------------- | ------------ | ----------------- |
|               |              |                 |                  |               |                 |              |                   |

### 4.1. Convention

- [Kotlin Style Guide](https://developer.android.com/kotlin/style-guide)

### 4.2. Code Analysis

Code Check

- [Kotlin Lint](https://developer.android.com/studio/write/lint)
  > [Manually run inspections](https://developer.android.com/studio/write/lint#manuallyRunInspections)

### 4.3. Guides

- Learn Kotlin with [Getting Started](https://kotlinlang.org/docs/reference/).

### 4.4. Editor

- [Android Studio](https://developer.android.com/studio)

## 5. Rust

| Documentation | Build System | Package Manager | Software Testing | Code Coverage | Code Formatting | Code Linting | Cross-Compilation |
| ------------- | ------------ | --------------- | ---------------- | ------------- | --------------- | ------------ | ----------------- |
|               |              |                 |                  |               |                 |              |                   |

### 5.1. Convention

- [TODO](https://example.com/)

### 5.2. Code Analysis

Code Check

- [Miri](https://github.com/rust-lang/miri)

### 5.3. Software Testing

- [OSS-Fuzz](https://github.com/google/oss-fuzz)
  > Fuzzing technique for automated injections with a [Rust project support](https://google.github.io/oss-fuzz/getting-started/new-project-guide/rust-lang/).

- [FuzzBench](https://github.com/google/fuzzbench)
  > Fuzzer benchmarking as a service.

## 6. Shell

### 6.1. Convention

- [Google Shell Style Guide](https://sentenz.github.io/backup-service/repository/github/google/styleguide/shellguide.html)
  > [Gitlab Shell Scripting Recommendation](https://docs.gitlab.com/ee/development/shell_scripting_guide/)

### 6.2. Code Analysis

Code Check

- [shellcheck](https://github.com/koalaman/shellcheck)
  > Configure [.shellcheckrc](https://github.com/koalaman/shellcheck/issues/725) in the root project.

Code Format

- [shfmt](https://github.com/mvdan/sh)

### 6.3. Editor

- [Visual Studio Code](https://code.visualstudio.com/download)

## 7. Git

### 7.1. Convention

- [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/)
- [Semantic Versioning](https://sentenz.github.io/backup-service/website/semver.org/index.html)

### 7.2. Code Analysis

Commit Check

- [commitlint](https://github.com/conventional-changelog/commitlint)
  > Configure in the root project.
  >
  > - [.commitlintrc.js](https://github.com/conventional-changelog/commitlint#config)
  > - [git-husky-commitlint](https://remarkablemark.org/blog/2019/05/29/git-husky-commitlint/#test) in `commit-msg`

- [commitlint-github-action](https://github.com/wagoid/commitlint-github-action)
  > Commit check for CI

## 8. Markdown

### 8.1. Convention

- [Google Markdown Style Guide](https://google.github.io/styleguide/docguide/style.html)
- [Cirosantilli Markdown Style Guide](https://cirosantilli.com/markdown-style-guide/)

### 8.2. Code Analysis

Code Check

- [markdownlint](https://github.com/markdownlint/markdownlint)
  > Description of all [markdown rules](https://github.com/markdownlint/markdownlint/blob/master/docs/RULES.md).

- [markdownlint](https://github.com/DavidAnson/markdownlint)
  > Code check for NPM - A Node.js style checker and lint tool.
  >
  > Configure in the root project.
  >
  > - [.markdownlint.json](https://github.com/DavidAnson/markdownlint/blob/main/schema/.markdownlint.jsonc)

- [markdownlint-cli](https://github.com/DavidAnson/markdownlint)
  > Code check for CLI - A Command Line Interface for MarkdownLint.
  >
  > Configure in the root project.
  >
  > - [.markdownlint.json](https://github.com/DavidAnson/markdownlint/blob/main/.markdownlint.json)

- [markdownlint](https://github.com/actionshub/markdownlint)
  > Code check for CI - A Github Action tool.

- [markdown-link-check](https://github.com/tcort/markdown-link-check)
  > Link check for markdown.
  >
  > Configure in the root project.
  >
  > - [.markdown-link-check.json](https://github.com/tcort/markdown-link-check#config-file-format)

Spell Check

- [markdown-spellcheck](https://github.com/lukeapage/node-markdown-spellcheck)
  > Configure in the root project.
  >
  > - [.spelling](https://github.com/lukeapage/node-markdown-spellcheck/blob/master/.spelling)

- [alex](https://github.com/get-alex/alex) catch insensitive, inconsiderate writing.
  > Configure in the root project.
  >
  > - [.alexrc.yml](https://github.com/get-alex/alex#configuration)
  > - [.alexignore](https://github.com/get-alex/alex/blob/main/.alexignore)

### 8.3. Editor

- [Visual Studio Code](https://code.visualstudio.com/download)

## 9. CMake

### 9.1. Convention

- [KDE CMake Coding Style](https://community.kde.org/Policies/CMake_Coding_Style)
- [CMake Developer](https://cmake.org/cmake/help/latest/manual/cmake-developer.7.html#modules)

### 9.2. Code Analysis

Code Check

- [cmake-lint](https://github.com/cmake-lint/cmake-lint)

Code Format

- [cmake_format](https://github.com/cheshirekow/cmake_format)
  > Configure in the root project.
  >
  > - [cmake-format](https://cmake-format.readthedocs.io/en/latest/configuration.html)
  > - [VS Code Extension](https://marketplace.visualstudio.com/items?itemName=cheshirekow.cmake-format)

### 9.3. Editor

- [Visual Studio Code](https://code.visualstudio.com/download)
