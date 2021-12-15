# Style Guides

- [1. C](#1-c)
  - [1.1. Convention](#11-convention)
  - [1.2. Architecture](#12-architecture)
  - [1.3. Lint](#13-lint)
  - [1.4. Unit-Testing Frameworks](#14-unit-testing-frameworks)
  - [1.5. Compiler](#15-compiler)
  - [1.6. Editor](#16-editor)
- [2. C++](#2-c)
  - [2.1. Convention](#21-convention)
  - [2.2. Architecture](#22-architecture)
  - [2.3. Lint](#23-lint)
  - [2.4. Unit-Testing Frameworks](#24-unit-testing-frameworks)
  - [2.5. Compiler](#25-compiler)
  - [2.6. Editor](#26-editor)
- [3. Python](#3-python)
  - [3.1. Convention](#31-convention)
- [4. Shell](#4-shell)
  - [4.1. Convention](#41-convention)
  - [4.2. Lint](#42-lint)
  - [4.3. Editor](#43-editor)
- [5. Kotlin](#5-kotlin)
  - [5.1. Convention](#51-convention)
  - [5.2. Lint](#52-lint)
  - [5.3. Guides](#53-guides)
  - [5.4. Editor](#54-editor)
- [6. Go](#6-go)
  - [6.1. Convention](#61-convention)
  - [6.2. Static Analysis](#62-static-analysis)
  - [6.3. Lint](#63-lint)
  - [6.4. Architecture](#64-architecture)
  - [6.5. UI](#65-ui)
  - [6.6. Editor](#66-editor)
  - [6.7. Links](#67-links)
- [7. Rust](#7-rust)
  - [7.1. Convention](#71-convention)
  - [7.2. Lint](#72-lint)
- [8. Git](#8-git)
  - [8.1. Convention](#81-convention)
  - [8.2. Lint](#82-lint)
- [9. Markdown](#9-markdown)
  - [9.1. Convention](#91-convention)
  - [9.2. Lint](#92-lint)
  - [9.3. Editor](#93-editor)
- [10. CMake](#10-cmake)
  - [10.1. Convention](#101-convention)
  - [10.2. Lint](#102-lint)
  - [10.3. Editor](#103-editor)

## 1. C

### 1.1. Convention

- See [C++](#2-c)

### 1.2. Architecture

- See [C++](#2-c)

### 1.3. Lint

- See [C++](#2-c)

### 1.4. Unit-Testing Frameworks

- [TODO](https://www.jetbrains.com/lp/devecosystem-2021/cpp/#Which-unit-testing-frameworks-do-you-regularly-use).

### 1.5. Compiler

- See [C++](#2-c)

### 1.6. Editor

- [Visual Studio Code](https://code.visualstudio.com/download)

## 2. C++

### 2.1. Convention

- [Google C++ Style Guides](https://sentenz.github.io/essay/github/google/styleguide/cppguide.html)

### 2.2. Architecture

- [Project Layout](https://api.csswg.org/bikeshed/?force=1&url=https://raw.githubusercontent.com/vector-of-bool/pitchfork/develop/data/spec.bs)

### 2.3. Lint

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
    > - Use [clang-format-configurator](https://zed0.co.uk/clang-format-configurator/) to create a .clang-format file.
    >
- Memory Check
  - [Valgrind](https://valgrind.org/)

### 2.4. Unit-Testing Frameworks

- [TODO](https://www.jetbrains.com/lp/devecosystem-2021/cpp/#Which-unit-testing-frameworks-do-you-regularly-use)

### 2.5. Compiler

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

### 2.6. Editor

- [Visual Studio Code](https://code.visualstudio.com/download)

## 3. Python

### 3.1. Convention

- [Google Python Guides](https://sentenz.github.io/essay/github/google/styleguide/pyguide.html)

## 4. Shell

### 4.1. Convention

- [Google Shell Style Guides](https://sentenz.github.io/essay/github/google/styleguide/shellguide.html)
  > [Gitlab Shell Scripting Recommendation](https://docs.gitlab.com/ee/development/shell_scripting_guide/)

### 4.2. Lint

- Code Format
  - [shfmt](https://github.com/mvdan/sh)
- Code Check
  - [shellcheck](https://github.com/koalaman/shellcheck)
    > Configure [.shellcheckrc](https://github.com/koalaman/shellcheck/issues/725) in the root project.

### 4.3. Editor

- [Visual Studio Code](https://code.visualstudio.com/download)

## 5. Kotlin

### 5.1. Convention

- [Kotlin Style Guide](https://developer.android.com/kotlin/style-guide)

### 5.2. Lint

- Code Check
  - [Kotlin Lint](https://developer.android.com/studio/write/lint)
    > [Manually run inspections](https://developer.android.com/studio/write/lint#manuallyRunInspections)

### 5.3. Guides

- Learn Kotlin with [Getting Started](https://kotlinlang.org/docs/reference/).

### 5.4. Editor

- [Android Studio](https://developer.android.com/studio)

## 6. Go

### 6.1. Convention

- [Effective Go](https://golang.org/doc/effective_go)
- [Golang Code Review Comments](https://github.com/golang/go/wiki/CodeReviewComments)

### 6.2. Static Analysis

- [Awesome Go Linters](https://github.com/golangci/awesome-go-linters)

### 6.3. Lint

- [golangci-lint](https://github.com/golangci/golangci-lint)
  > Configure [.golangci.yml](https://github.com/golangci/golangci-lint/blob/master/.golangci.yml) in the project.

### 6.4. Architecture

- [Project Layout](https://github.com/golang-standards/project-layout)
- [Project Layout Generator](https://github.com/insidieux/inizio/tree/v1.1.1)
- [Go Clean Template](https://github.com/evrone/go-clean-template)

### 6.5. UI

- [go-echarts](https://github.com/go-echarts/go-echarts)
- [go-chart](https://github.com/wcharczuk/go-chart)
- [Statsview](https://github.com/go-echarts/statsview)
- [Gonum Plot](https://github.com/gonum/plot)
- [Go GUI Projects](https://github.com/go-graphics/go-gui-projects)

### 6.6. Editor

- [Visual Studio Code](https://code.visualstudio.com/download)

### 6.7. Links

- [FAQ](https://golang.org/doc/faq)

## 7. Rust

### 7.1. Convention

- [TODO](https://example.com/)

### 7.2. Lint

- Code Check
  - [Miri](https://github.com/rust-lang/miri)

## 8. Git

### 8.1. Convention

- [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/)

### 8.2. Lint

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

- [Markdown Rules](https://github.com/markdownlint/markdownlint/blob/master/docs/RULES.md)

### 9.2. Lint

- Code Check
  - [markdownlint](https://github.com/markdownlint/markdownlint)
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

### 10.2. Lint

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
