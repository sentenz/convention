# Style Guides

- [1. Go](#1-go)
  - [1.1. Convention](#11-convention)
  - [1.2. Library](#12-library)
    - [1.2.1. UI](#121-ui)
  - [1.3. Linter](#13-linter)
  - [1.4. Architecture](#14-architecture)
  - [1.5. Editor](#15-editor)
  - [1.6. Links](#16-links)
- [2. C](#2-c)
  - [2.1. Convention](#21-convention)
  - [2.2. Linter](#22-linter)
  - [2.3. Unit-Testing Frameworks](#23-unit-testing-frameworks)
  - [2.4. Architecture](#24-architecture)
  - [2.5. Compiler](#25-compiler)
  - [2.6. Editor](#26-editor)
- [3. C++](#3-c)
  - [3.1. Convention](#31-convention)
  - [3.2. Architecture](#32-architecture)
  - [3.3. Linter](#33-linter)
  - [3.4. Unit-Testing Frameworks](#34-unit-testing-frameworks)
  - [3.5. Compiler](#35-compiler)
  - [3.6. Editor](#36-editor)
- [4. Python](#4-python)
  - [4.1. Convention](#41-convention)
  - [4.2. Library](#42-library)
  - [4.3. Linter](#43-linter)
  - [4.4. Unit-Testing Frameworks](#44-unit-testing-frameworks)
- [5. Shell](#5-shell)
  - [5.1. Convention](#51-convention)
  - [5.2. Linter](#52-linter)
  - [5.3. Editor](#53-editor)
- [6. Kotlin](#6-kotlin)
  - [6.1. Convention](#61-convention)
  - [6.2. Linter](#62-linter)
  - [6.3. Guides](#63-guides)
  - [6.4. Editor](#64-editor)
- [7. Rust](#7-rust)
  - [7.1. Convention](#71-convention)
  - [7.2. Linter](#72-linter)
- [8. Git](#8-git)
  - [8.1. Convention](#81-convention)
  - [8.2. Linter](#82-linter)
- [9. Markdown](#9-markdown)
  - [9.1. Convention](#91-convention)
  - [9.2. Linter](#92-linter)
  - [9.3. Editor](#93-editor)
- [10. CMake](#10-cmake)
  - [10.1. Convention](#101-convention)
  - [10.2. Linter](#102-linter)
  - [10.3. Editor](#103-editor)

## 1. Go

| Documentation | Build System | Package Manager | Unit Test | Code Coverage | Code Formatting | Code Linting | Cross-Compilation |
| ------------- | ------------ | --------------- | --------- | ------------- | --------------- | ------------ | ----------------- |
| Built-in      | Built-in     | Built-in        | Built-in  | Built-in      | Built-in        | Built-in     | Built-in          |

### 1.1. Convention

- [Effective Go](https://golang.org/doc/effective_go)
- [Golang Code Review Comments](https://github.com/golang/go/wiki/CodeReviewComments)
- [Uber Go Style Guide](https://github.com/uber-go/guide/blob/master/style.md)

### 1.2. Library

- [Go kit](https://github.com/go-kit/kit) a standard library for microservices or elegant monoliths.
- [GORM](https://github.com/go-gorm/gorm) a ORM library for query and manipulate databases.
- [Cobra](https://github.com/spf13/cobra) a library for CLI apps.
- [cli](https://github.com/urfave/cli) a library for CLI apps.
- [fuzzy](https://github.com/sahilm/fuzzy) a library that provides fuzzy string matching.
- [lo](https://github.com/samber/lo) a Lodash for Go library.
- [Gonum](https://github.com/gonum/gonum) is a set of packages designed to writing numerical and scientific algorithms.

#### 1.2.1. UI

- [go-echarts](https://github.com/go-echarts/go-echarts)
- [go-chart](https://github.com/wcharczuk/go-chart)
- [Statsview](https://github.com/go-echarts/statsview)
- [Gonum Plot](https://github.com/gonum/plot)
- [Go GUI Projects](https://github.com/go-graphics/go-gui-projects)

### 1.3. Linter

- [golangci-lint](https://github.com/golangci/golangci-lint)
  > Configure [.golangci.yml](https://github.com/golangci/golangci-lint/blob/master/.golangci.yml) in the project.
- [Awesome Go Linters](https://github.com/golangci/awesome-go-linters)

### 1.4. Architecture

- [Project Layout](https://github.com/golang-standards/project-layout)
- [Project Layout Generator](https://github.com/insidieux/inizio/tree/v1.1.1)
- [Go Clean Template](https://github.com/evrone/go-clean-template)

### 1.5. Editor

- [Visual Studio Code](https://code.visualstudio.com/download)

### 1.6. Links

- [FAQ](https://golang.org/doc/faq)

## 2. C

| Documentation | Build System | Package Manager | Unit Test  | Code Coverage | Code Formatting | Code Linting | Cross-Compilation |
| ------------- | ------------ | --------------- | ---------- | ------------- | --------------- | ------------ | ----------------- |
| Doxygen       | CMake        | Conan           | Dependency | Dependency    | Dependency      | cDependency  | Dependency        |

### 2.1. Convention

- See [C++](#3-c)

### 2.2. Linter

- See [C++](#3-c)

### 2.3. Unit-Testing Frameworks

- See [C++](#3-c)

### 2.4. Architecture

- See [C++](#3-c)

### 2.5. Compiler

- See [C++](#3-c)

### 2.6. Editor

- See [C++](#3-c)

## 3. C++

| Documentation | Build System | Package Manager | Unit Test  | Code Coverage | Code Formatting | Code Linting | Cross-Compilation |
| ------------- | ------------ | --------------- | ---------- | ------------- | --------------- | ------------ | ----------------- |
| Doxygen       | CMake        | Conan           | Dependency | Dependency    | Dependency      | Dependency   | Dependency        |

### 3.1. Convention

- [Google C++ Style Guide](https://sentenz.github.io/backup-service/repository/github/google/styleguide/cppguide.html)

### 3.2. Architecture

- [Project Layout](https://api.csswg.org/bikeshed/?force=1&url=https://raw.githubusercontent.com/vector-of-bool/pitchfork/develop/data/spec.bs)

### 3.3. Linter

- Code Check
  - [clang-tidy](https://clang.llvm.org/extra/clang-tidy/) tool and [doc](https://clang.llvm.org/extra/clang-tidy/#id2)
    > Configure [.clang-tidy](https://github.com/googleapis/google-cloud-cpp/blob/main/.clang-tidy) in the project.
  - [Cpplint](https://pypi.org/project/cpplint/)
    >
    > - Detect style errors, see [cpplint.py](https://raw.githubusercontent.com/google/styleguide/gh-pages/cpplint/cpplint.py) tool.
    > - Configure [CPPLINT.cfg](https://github.com/google/conscrypt/blob/master/CPPLINT.cfg) in the root project.
    > - False positives can be ignored by putting `// NOLINT` at the end of the line or `// NOLINTNEXTLINE` in the previous line.
    >
  - [scan-build](https://github.com/rizsotto/scan-build) tool for [clang-analyzer](http://clang-analyzer.llvm.org/scan-build.html).
  - [Cppcheck](https://github.com/danmar/cppcheck)
    >
    > - Configure [cppcheck-suppressions.txt](https://github.com/open62541/open62541/blob/master/cppcheck-suppressions.txt) in the project.
    > - See [manual](http://cppcheck.sourceforge.net/manual.pdf).
    >
- Code Format
  - [clang-format](https://clang.llvm.org/docs/ClangFormat.html)
    > Configure in the root project.
    >
    > - [.clang-format](https://github.com/googleapis/google-cloud-cpp/blob/main/.clang-format)
    > - [.clang-format-ignore](https://github.com/mozilla/gecko-dev/blob/master/.clang-format-ignore)
    > - Use [clang-format-configurator](https://zed0.co.uk/clang-format-configurator/) to modify a .clang-format file.
    >
- Memory Check
  - [Valgrind](https://valgrind.org/)

### 3.4. Unit-Testing Frameworks

- [GoogleTest](https://github.com/google/googletest)
- [gcov](https://gcc.gnu.org/onlinedocs/gcc/Gcov.html)

### 3.5. Compiler

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

### 3.6. Editor

- [Visual Studio Code](https://code.visualstudio.com/download)

## 4. Python

| Documentation | Build System | Package Manager | Unit Test  | Code Coverage | Code Formatting | Code Linting | Cross-Compilation |
| ------------- | ------------ | --------------- | ---------- | ------------- | --------------- | ------------ | ----------------- |
|               |              | Built-in        | Dependency | Dependency    | Dependency      | Dependency   |                   |

### 4.1. Convention

- [Google Python Style Guide](https://sentenz.github.io/backup-service/repository/github/google/styleguide/pyguide.html)
- [PEP8](https://www.python.org/dev/peps/pep-0008/)
- [PEP257](https://www.python.org/dev/peps/pep-0257/)
- [PEP484](hhttps://www.python.org/dev/peps/pep-0484/)

### 4.2. Library

- [Click](https://github.com/pallets/click) is a package for creating command line interfaces.
- [Pandas](https://github.com/pandas-dev/pandas) is a package that provides flexible and expressive data.structures.
- [Faker](https://github.com/joke2k/faker) is a package that generates fake data.
- [Pendulum](https://github.com/sdispater/pendulum) is a package for datetimes.
  
### 4.3. Linter

- Code Check
  - [Pylint](https://github.com/PyCQA/pylint)
  - [Flake8](https://github.com/PyCQA/flake8)
  - [Bandit](https://github.com/PyCQA/bandit)
  - [Pylama](https://github.com/klen/pylama)
  - [MyPy](https://github.com/python/mypy)
- Code Format
  - [Black](https://github.com/psf/black)
  - [yapf](https://github.com/google/yapf)
  - [autopep8](https://github.com/hhatto/autopep8)
  - [isort](https://github.com/PyCQA/isort)
  - [autoflake](https://github.com/PyCQA/autoflake)

### 4.4. Unit-Testing Frameworks

- [PyTest](https://github.com/pytest-dev/pytest)
- [pytest-cov](https://github.com/pytest-dev/pytest-cov)

## 5. Shell

### 5.1. Convention

- [Google Shell Style Guide](https://sentenz.github.io/backup-service/repository/github/google/styleguide/shellguide.html)
  > [Gitlab Shell Scripting Recommendation](https://docs.gitlab.com/ee/development/shell_scripting_guide/)

### 5.2. Linter

- Code Format
  - [shfmt](https://github.com/mvdan/sh)
- Code Check
  - [shellcheck](https://github.com/koalaman/shellcheck)
    > Configure [.shellcheckrc](https://github.com/koalaman/shellcheck/issues/725) in the root project.

### 5.3. Editor

- [Visual Studio Code](https://code.visualstudio.com/download)

## 6. Kotlin

### 6.1. Convention

- [Kotlin Style Guide](https://developer.android.com/kotlin/style-guide)

### 6.2. Linter

- Code Check
  - [Kotlin Lint](https://developer.android.com/studio/write/lint)
    > [Manually run inspections](https://developer.android.com/studio/write/lint#manuallyRunInspections)

### 6.3. Guides

- Learn Kotlin with [Getting Started](https://kotlinlang.org/docs/reference/).

### 6.4. Editor

- [Android Studio](https://developer.android.com/studio)

## 7. Rust

### 7.1. Convention

- [TODO](https://example.com/)

### 7.2. Linter

- Code Check
  - [Miri](https://github.com/rust-lang/miri)

## 8. Git

### 8.1. Convention

- [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/)
- [Semantic Versioning](https://sentenz.github.io/backup-service/website/semver.org/index.html)

### 8.2. Linter

- Commit Check
  - [commitlint](https://github.com/conventional-changelog/commitlint)
    >
    > - Configure [.commitlintrc.js](https://github.com/conventional-changelog/commitlint#config) in the project.
    > - Configure [git-husky-commitlint](https://remarkablemark.org/blog/2019/05/29/git-husky-commitlint/#test) in commit-msg.
    > - Configure [pre-commit] to perform a test before a transfer is made.
    >
- Commit Check for CI
  - [commitlint-github-action](https://github.com/wagoid/commitlint-github-action)

## 9. Markdown

### 9.1. Convention

- [Google Markdown Style Guide](https://google.github.io/styleguide/docguide/style.html)
- [Cirosantilli Markdown Style Guide](https://cirosantilli.com/markdown-style-guide/)

### 9.2. Linter

- Code Check
  - [markdownlint](https://github.com/markdownlint/markdownlint)
    > Description of all [markdown rules](https://github.com/markdownlint/markdownlint/blob/master/docs/RULES.md).
- Code Check for NPM
  - [markdownlint](https://github.com/DavidAnson/markdownlint) a Node.js style checker and lint tool.
    > Configure [.markdownlint.json](https://github.com/DavidAnson/markdownlint/blob/main/schema/.markdownlint.jsonc) in the project.
- Code Check for CLI
  - [markdownlint-cli](https://github.com/DavidAnson/markdownlint) a Command Line Interface for MarkdownLint.
    > Configure [.markdownlint.json](https://github.com/DavidAnson/markdownlint/blob/main/.markdownlint.json) in the project.
- Code Check for CI
  - [markdownlint](https://github.com/actionshub/markdownlint) a Github Action tool.
- Link Check
  - [markdown-link-check](https://github.com/tcort/markdown-link-check)
    > Configure [.markdown-link-check.json](https://github.com/tcort/markdown-link-check#config-file-format) in the project.
- Spell Check
  - [markdown-spellcheck](https://github.com/lukeapage/node-markdown-spellcheck)
    > Configure [.spelling](https://github.com/lukeapage/node-markdown-spellcheck/blob/master/.spelling) in the root project.
  - [alex](https://github.com/get-alex/alex) catch insensitive, inconsiderate writing.
    > Configure in the root project.
    >
    > - [.alexrc.yml](https://github.com/get-alex/alex#configuration)
    > - [.alexignore](https://github.com/get-alex/alex/blob/main/.alexignore)

### 9.3. Editor

- [Visual Studio Code](https://code.visualstudio.com/download)

## 10. CMake

### 10.1. Convention

- [KDE CMake Coding Style](https://community.kde.org/Policies/CMake_Coding_Style)
- [CMake Developer](https://cmake.org/cmake/help/latest/manual/cmake-developer.7.html#modules)

### 10.2. Linter

- Code Check
  - [cmake_format](https://github.com/cheshirekow/cmake_format)
    >
    > - Configure [cmake-format](https://cmake-format.readthedocs.io/en/latest/configuration.html) configuration files.
    > - Add cmake-format to your [pre-commit](https://cmake-format.readthedocs.io/en/latest/installation.html#pre-commit) configuration.
    > - Official [VS Code](https://marketplace.visualstudio.com/items?itemName=cheshirekow.cmake-format) extension.
    >
  - [cmake-lint](https://github.com/cmake-lint/cmake-lint)

### 10.3. Editor

- [Visual Studio Code](https://code.visualstudio.com/download)
