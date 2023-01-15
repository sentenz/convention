# `/linter`

- [1. Clang-Tidy](#1-clang-tidy)
- [2. Cpplint](#2-cpplint)
- [3. Cppcheck](#3-cppcheck)
- [4. Golangci-lint](#4-golangci-lint)
- [5. Shellcheck](#5-shellcheck)
- [6. Commitlint](#6-commitlint)
- [7. Makrdownlint](#7-makrdownlint)
- [8. Yamllint](#8-yamllint)
- [9. Jsonlint](#9-jsonlint)
- [10. Remark](#10-remark)
- [11. Dockerfilelint](#11-dockerfilelint)
- [12. Licensecheck](#12-licensecheck)
- [13. Licensing](#13-licensing)
- [14. Clang-Format](#14-clang-format)
- [15. gofmt](#15-gofmt)
- [16. shfmt](#16-shfmt)
- [17. Prettier](#17-prettier)
- [18. Markdown Link Check](#18-markdown-link-check)
- [19. Alex](#19-alex)
- [20. Codespell](#20-codespell)
- [21. Clang Analyzer](#21-clang-analyzer)

## 1. Clang-Tidy

[clang-tidy](https://clang.llvm.org/extra/clang-tidy/) is a clang-based C++ **linter** tool. Its purpose is to provide an extendable framework for diagnosing and fixing typical programming errors, like style violations, interface misuse, or bugs that can be derived via static analysis. clang-tidy is modular and provides a convenient interface for writing new checks.

### 1.1. Requirements

`apt` package management system for installing, upgrading, configuring, and removing software.

### 1.2. Install

```bash
sudo apt install -y clang-tidy
```

### 1.3. Usage

clang-tidy is a LibTooling-based tool, and it’s easier to work with if you set up a compile command database for your project (for an example of how to do this see [How To Setup Tooling For LLVM](https://clang.llvm.org/docs/HowToSetupToolingForLLVM.html)). You can also specify compilation options on the command line after `--`:

```bash
clang-tidy test.cpp -- -Imy_project/include -DMY_DEFINES ...
```

clang-tidy has its own checks and can also run Clang static analyzer checks. Each check has a name and the checks to run can be chosen using the `-checks=` option, which specifies a comma-separated list of positive and negative (prefixed with -) globs. Positive globs add subsets of checks, negative globs remove them. For example,

```bash
clang-tidy test.cpp -checks=-*,clang-analyzer-*,-clang-analyzer-cplusplus*
```

## 2. Cpplint

[cpplint](https://github.com/cpplint/cpplint) is a command-line tool to check C/C++ files for style issues following [Google's C++ style guide](https://google.github.io/styleguide/cppguide.html).

### 2.1. Requirements

Python 3.7 or higher.

### 2.2. Install

To install cpplint from PyPI, run:

```bash
sudo pip install cpplint
```

### 2.3. Usage

Run it with:

```bash
cpplint --exclude=node_modules --recursive .
```

For full usage instructions, run:

```bash
cpplint --help
```

### 2.4. Configuration

cpplint supports per-directory configurations specified in [CPPLINT.cfg](https://github.com/RobotLocomotion/drake/blob/master/CPPLINT.cfg) files. CPPLINT.cfg file can contains key=value pairs. The following options are supported:

```conf
set noparent
filter=+filter1,-filter2,...
exclude_files=regex
linelength=80
root=subdir
headers=x,y,...
```

Example:

```conf
set noparent
linelength=100
filter=-build/c++11
filter=-readability/casting
filter=-runtime/arrays
```

## 3. Cppcheck

[cppcheck](https://github.com/danmar/cppcheck) is designed for both C and C++.

### 3.1. Requirements

`apt` package management system for installing, upgrading, configuring, and removing software.

### 3.2. Install

```bash
sudo apt install -y cppcheck
```

### 3.3. Usage

```bash
cppcheck .

cppcheck --enable=warning --suppressions-list=cppcheck-suppressions.txt --template='[{file}:{line}]:({severity}),{id},{message}' .
```

### 3.4. Configuration

Configure `cppcheck-suppressions.txt` in the project.

Example:

```txt
missingIncludeSystem
unusedFunction
*:../../build
*:../../node_modules
```

## 4. Golangci-lint

[golangci-lint](https://github.com/golangci/golangci-lint) is a fast Go linters runner. It runs linters in parallel, uses caching, supports yaml config, has integrations with all major IDE and has dozens of linters included.

See a list of supported [linters](https://golangci-lint.run/usage/linters/).

### 4.1. Requirements

Go 1.15 or higher.

### 4.2. Install

Most [installations of golangci-lint](https://golangci-lint.run/usage/install/#local-installation) are performed for CI.

```bash
go install github.com/golangci/golangci-lint/cmd/golangci-lint@latest
go mod vendor
export PATH=${PATH}:${HOME}/go/bin
```

### 4.3. Usage

```bash
golangci-lint run ./...
```

### 4.4. Configuration

- [Editor Integration](https://golangci-lint.run/usage/integrations/)

  ```json
  "go.lintTool":"golangci-lint",
  "go.lintFlags": [
    "--fast"
  ]
  ```

- [Configuration File](https://golangci-lint.run/usage/configuration/)

  The configuration files are named [.golangci.yml](https://github.com/golangci/golangci-lint/blob/master/.golangci.reference.yml) and are automatically recognized.

  Enabled by your configuration linters:

  - asciicheck: Linter to check that your code does not contain non-ASCII identifiers `[fast: true, auto-fix: false]`
  - bidichk: Checks for dangerous unicode character sequences `[fast: true, auto-fix: false]`
  - bodyclose: checks whether HTTP response body is closed successfully `[fast: false, auto-fix: false]`
  - contextcheck: check the function whether use a non-inherited context `[fast: false, auto-fix: false]`
  - cyclop: checks function and package cyclomatic complexity `[fast: false, auto-fix: false]`
  - deadcode: Finds unused code `[fast: false, auto-fix: false]`
  - depguard: Go linter that checks if package imports are in a list of acceptable packages `[fast: false, auto-fix: false]`
  - dogsled: Checks assignments with too many blank identifiers, e.g. `x, _,_, \_, := f()` `[fast: true, auto-fix: false]`
  - dupl: Tool for code clone detection `[fast: true, auto-fix: false]`
  - durationcheck: check for two durations multiplied together `[fast: false, auto-fix: false]`
  - errcheck: Errcheck is a program for checking for unchecked errors in go programs. These unchecked errors can be critical bugs in some cases `[fast: false, auto-fix: false]`
  - errname: Checks that sentinel errors are prefixed with the `Err` and error types are suffixed with the `Error`. `[fast: false, auto-fix: false]`
  - errorlint: errorlint is a linter for that can be used to find code that will cause problems with the error wrapping scheme introduced in Go 1.13. `[fast: false, auto-fix: false]`
  - exhaustive: check exhaustiveness of enum switch statements `[fast: false, auto-fix: false]`
  - exhaustivestruct: Checks if all struct's fields are initialized `[fast: false, auto-fix: false]`
  - exportloopref: checks for pointers to enclosing loop variables `[fast: false, auto-fix: false]`
  - forbidigo: Forbids identifiers `[fast: true, auto-fix: false]`
  - forcetypeassert: finds forced type assertions `[fast: true, auto-fix: false]`
  - funlen: Tool for detection of long functions `[fast: true, auto-fix: false]`
  - gci: Gci control golang package import order and make it always deterministic. `[fast: true, auto-fix: true]`
  - gochecknoinits: Checks that no init functions are present in Go code `[fast: true, auto-fix: false]`
  - gocognit: Computes and checks the cognitive complexity of functions `[fast: true, auto-fix: false]`
  - goconst: Finds repeated strings that could be replaced by a constant `[fast: true, auto-fix: false]`
  - gocritic: Provides diagnostics that check for bugs, performance and style issues. `[fast: false, auto-fix: false]`
  - gocyclo: Computes and checks the cyclomatic complexity of functions `[fast: true, auto-fix: false]`
  - godot: Check if comments end with a dot `[fast: true, auto-fix: true]`
  - godox: Tool for detection of FIXME, TODO and other comment keywords `[fast: true, auto-fix: false]`
  - goerr113: Golang linter to check the errors handling expressions `[fast: false, auto-fix: false]`
  - gofmt: Gofmt checks whether code was gofmt-ed. By default this tool runs with -s option to check for code simplification `[fast: true, auto-fix: true]`
  - gofumpt: Gofumpt checks whether code was gofumpt-ed. `[fast: true, auto-fix: true]`
  - goheader: Checks is file header matches to pattern `[fast: true, auto-fix: false]`
  - goimports: In addition to fixing imports, goimports also formats your code in the same style as gofmt. `[fast: true, auto-fix: true]`
  - gomnd: An analyzer to detect magic numbers. `[fast: true, auto-fix: false]`
  - gomoddirectives: Manage the use of 'replace', 'retract', and 'excludes' directives in go.mod. `[fast: true, auto-fix: false]`
  - gomodguard: Allow and block list linter for direct Go module dependencies. This is different from depguard where there are different block types for example version constraints and module recommendations. `[fast: true, auto-fix: false]`
  - goprintffuncname: Checks that printf-like functions are named with `f` at the end `[fast: true, auto-fix: false]`
  - gosec (gas): Inspects source code for security problems `[fast: false, auto-fix: false]`
  - gosimple (megacheck): Linter for Go source code that specializes in simplifying a code `[fast: false, auto-fix: false]`
  - govet (vet, vetshadow): Vet examines Go source code and reports suspicious constructs, such as Printf calls whose arguments do not align with the format string `[fast: false, auto-fix: false]`
  - ifshort: Checks that your code uses short syntax for if-statements whenever possible `[fast: true, auto-fix: false]`
  - importas: Enforces consistent import aliases `[fast: false, auto-fix: false]`
  - ineffassign: Detects when assignments to existing variables are not used `[fast: true, auto-fix: false]`
  - ireturn: Accept Interfaces, Return Concrete Types `[fast: false, auto-fix: false]`
  - lll: Reports long lines `[fast: true, auto-fix: false]`
  - makezero: Finds slice declarations with non-zero initial length `[fast: false, auto-fix: false]`
  - misspell: Finds commonly misspelled English words in comments `[fast: true, auto-fix: true]`
  - nakedret: Finds returns in functions greater than a specified function length `[fast: true, auto-fix: false]`
  - nestif: Reports deeply nested if statements `[fast: true, auto-fix: false]`
  - nilerr: Finds the code that returns nil even if it checks that the error is not nil. `[fast: false, auto-fix: false]`
  - nilnil: Checks that there is no simultaneous return of `nil` error and an bad value. `[fast: false, auto-fix: false]`
  - nlreturn: nlreturn checks for a new line before return and branch statements to increase code clarity `[fast: true, auto-fix: false]`
  - noctx: noctx finds sending http request without context.Context `[fast: false, auto-fix: false]`
  - nolintlint: Reports ill-formed or insufficient nolint directives `[fast: true, auto-fix: false]`
  - paralleltest: paralleltest detects missing usage of t.Parallel() method in your Go test `[fast: true, auto-fix: false]`
  - predeclared: find code that shadows one of Go's predeclared identifiers `[fast: true, auto-fix: false]`
  - promlinter: Check Prometheus metrics naming via promlint `[fast: true, auto-fix: false]`
  - revive: Fast, configurable, extendable, flexible, and beautiful linter for Go. Drop-in replacement of golint. `[fast: false, auto-fix: false]`
  - rowserrcheck: checks whether Err of rows is checked successfully `[fast: false, auto-fix: false]`
  - sqlclosecheck: Checks that sql.Rows and sql.Stmt are closed. `[fast: false, auto-fix: false]`
  - staticcheck (megacheck): Staticcheck is a go vet on steroids, applying a ton of static analysis checks `[fast: false, auto-fix: false]`
  - structcheck: Finds unused struct fields `[fast: false, auto-fix: false]`
  - stylecheck: Stylecheck is a replacement for golint `[fast: false, auto-fix: false]`
  - tagliatelle: Checks the struct tags. `[fast: true, auto-fix: false]`
  - tenv: tenv is analyzer that detects using os.Setenv instead of t.Setenv since Go1.17 `[fast: false, auto-fix: false]`
  - testpackage: linter that makes you use a separate \_test package `[fast: true, auto-fix: false]`
  - thelper: thelper detects golang test helpers without t.Helper() call and checks the consistency of test helpers `[fast: false, auto-fix: false]`
  - tparallel: tparallel detects inappropriate usage of t.Parallel() method in your Go test codes `[fast: false, auto-fix: false]`
  - typecheck: Like the front-end of a Go compiler, parses and type-checks Go code `[fast: false, auto-fix: false]`
  - unconvert: Remove unnecessary type conversions `[fast: false, auto-fix: false]`
  - unparam: Reports unused function parameters `[fast: false, auto-fix: false]`
  - unused (megacheck): Checks Go code for unused constants, variables, functions and types `[fast: false, auto-fix: false]`
  - varcheck: Finds unused global variables and constants `[fast: false, auto-fix: false]`
  - varnamelen: checks that the length of a variable's name matches its scope `[fast: false, auto-fix: false]`
  - wastedassign: wastedassign finds wasted assignment statements `[fast: false, auto-fix: false]`
  - whitespace: Tool for detection of leading and trailing whitespace `[fast: true, auto-fix: true]`
  - wrapcheck: Checks that errors returned from external packages are wrapped `[fast: false, auto-fix: false]`
  - wsl: Whitespace Linter - Forces you to use empty lines `[fast: true, auto-fix: false]`

  Deactivated by your configuration linters:

  - gochecknoglobals: check that no global variables exist `[fast: true, auto-fix: false]`
  - prealloc: Finds slice declarations that could potentially be preallocated `[fast: true, auto-fix: false]`

  Deprecated linters:

  - golint: (since v1.41.0) - Golint differs from gofmt. Gofmt reformats Go source code, whereas golint prints out style mistakes `[fast: false, auto-fix: false]`
  - interfacer: (since v1.38.0) - Linter that suggests narrower interface types `[fast: false, auto-fix: false]`
  - maligned: (since v1.38.0) - Tool to detect Go structs that would take less memory if their fields were sorted `[fast: false, auto-fix: false]`
  - scopelint: (since v1.39.0) - Scopelint checks for unpinned variables in go programs `[fast: true, auto-fix: false]`

### 4.5. Troubleshoot

Issue [#14](https://github.com/actions/setup-go/issues/14) - Add $GOPATH/bin to $PATH.

## 5. Shellcheck

[shellcheck](https://github.com/koalaman/shellcheck) - a shell script static analysis tool.

### 5.1. Requirements

`apt` package management system for installing, upgrading, configuring, and removing software.

### 5.2. Install

```bash
sudo apt install shellcheck
```

### 5.3. Usage

```bash
shellcheck *.sh
```

### 5.4. Configuration

Unless --norc is used, ShellCheck will look for a file [.shellcheckrc](https://github.com/koalaman/shellcheck/issues/72) or shellcheckrc in the script's directory and each parent directory. If found, it will read key=value pairs from it and treat them as file-wide directives.

An example for .shellcheckrc:

```bash
# Don't suggest using -n in [ $var ]
disable=SC2244

# Allow using `which` since it gives full paths and is common enough
disable=SC2230
```

## 6. Commitlint

[commitlint](https://github.com/conventional-changelog/commitlint) checks if your commit messages meet the [conventional commit](https://www.conventionalcommits.org/en/v1.0.0/) format.

Related:

- [commitlint-github-action](https://github.com/wagoid/commitlint-github-action)
- [commitlint-azure-pipelines-cli](https://yarnpkg.com/package/commitlint-azure-pipelines-cli)

### 6.1. Requirements

- NPM 6.14.14 or higher.
- Node 12+

### 6.2. Install

```bash
sudo npm install -g @commitlint/cli @commitlint/config-conventional @commitlint/format
```

### 6.3. Uninstall

```bash
sudo npm uninstall -g @commitlint/cli @commitlint/config-conventional @commitlint/format
```

### 6.4. Usage

```bash
# Lint last commit from history
commitlint --from=HEAD~1 --config ".commitlintrc.js"

# Lint all commits from history
commitlint --from "$(git rev-parse --abbrev-ref remotes/origin/HEAD)" --to "$(git rev-parse --abbrev-ref HEAD)" --config ".commitlintrc.js"
```

### 6.5. Configuration

[Shared configuration](https://github.com/conventional-changelog/commitlint#shared-configuration) lists a number of shared configurations available to install and use with `commitlint`.

[Configuration file](https://github.com/conventional-changelog/commitlint#config) is picked up from:

- .commitlintrc
- .commitlintrc.json
- .commitlintrc.yaml
- .commitlintrc.yml
- .commitlintrc.js
- .commitlintrc.cjs
- .commitlintrc.ts
- commitlint.config.js
- commitlint.config.cjs
- commitlint.config.ts

[Reference configuration](https://github.com/conventional-changelog/commitlint/blob/master/docs/reference-configuration.md) for `.commitlintrc.js`:

```js
const Configuration = {
  /*
   * Resolve and load @commitlint/config-conventional from node_modules.
   * Referenced packages must be installed
   */
  extends: ["@commitlint/config-conventional"],
  /*
   * Resolve and load conventional-changelog-atom from node_modules.
   * Referenced packages must be installed
   */
  parserPreset: "conventional-changelog-atom",
  /*
   * Resolve and load @commitlint/format from node_modules.
   * Referenced package must be installed
   */
  formatter: "@commitlint/format",
  /*
   * Any rules defined here will override rules from @commitlint/config-conventional
   */
  rules: {
    "type-enum": [2, "always", ["foo"]],
  },
  /*
   * Functions that return true if commitlint should ignore the given message.
   */
  ignores: [(commit) => commit === ""],
  /*
   * Whether commitlint uses the default ignore rules.
   */
  defaultIgnores: true,
  /*
   * Custom URL to show upon failure
   */
  helpUrl:
    "https://github.com/conventional-changelog/commitlint/#what-is-commitlint",
  /*
   * Custom prompt configs
   */
  prompt: {
    messages: {},
    questions: {
      type: {
        description: "please input type:",
      },
    },
  },
}

module.exports = Configuration
```

## 7. Makrdownlint

[makrdownlint](https://github.com/markdownlint/markdownlint) a tool to check markdown files and flag style issues.

Related:

[makrdownlint - npm](https://github.com/DavidAnson/markdownlint)

### 7.1. Requirements

- NPM 6.14.14 or higher.
- Node 12+

### 7.2. Install

```bash
sudo npm install -g markdownlint markdownlint-cli
```

### 7.3. Uninstall

```bash
# Global & Local
sudo npm uninstall -g markdownlint && npm uninstall markdownlint
```

### 7.4. Usage

```bash
markdownlint -j -c '.markdownlint.json' -i ".markdownlintignore" '**/*.md'
```

### 7.5. Configuration

Markdownlint has several options you can configure.

- Resource file

`.markdownlint.json`

```json
{
  "default": true,
  "MD013": false,
  "MD024": {
    "allow_different_nesting": true
  },
  "MD007": {
    "indent": 2
  }
}
```

- Ignore file

`.markdownlintignore`

```txt
vendor/
node_modules/
CHANGELOG.md
```

## 8. Yamllint

[yamllint](https://github.com/adrienverge/yamllint) a linter for YAML files.

yamllint does not only check for syntax validity, but for weirdness like key repetition and cosmetic problems such as lines length, trailing spaces, indentation, etc.

### 8.1. Requirements

Python 3.7 or higher.

### 8.2. Install

Using pip, the Python package manager:

```bash
pip install --user yamllint
```

### 8.3. Usage

```bash
# Lint all YAML files in a directory
yamllint .

# Use a custom lint configuration
yamllint -c /path/to/myconfig file-to-lint.yaml

# Use a pre-defined lint configuration
yamllint -d relaxed file.yaml
```

### 8.4. Configuration

yamllint uses a set of rules to check source files for problems. Each rule is independent from the others, and can be turned on, turned off or tweaked. All these settings can be gathered in a [configuration file](https://yamllint.readthedocs.io/en/stable/configuration.html).

To use a custom configuration file, use the `-c` option:

If `-c` is not provided, yamllint will look for a configuration file in the following locations (by order of preference):

- .yamllint, .yamllint.yaml or .yamllint.yml in the current working directory
- the file referenced by $YAMLLINT_CONFIG_FILE, if set
- $XDG_CONFIG_HOME/yamllint/config
- ~/.config/yamllint/config

```yml
---
extends: default

locale: en_US.UTF-8

ignore: |
  ../../vendor/
  ../../node_modules/
  *.template.yaml

rules:
  indentation: enable
  line-length:
    max: 100
    allow-non-breakable-words: true
    allow-non-breakable-inline-mappings: false
```

## 9. Jsonlint

[jsonlint](https://github.com/zaach/jsonlint) a pure JavaScript version of the service provided at [jsonlint.com](https://jsonlint.com/).

### 9.1. Requirements

- NPM 6.14.14 or higher.
- Node 12+

### 9.2. Install

Install jsonlint with npm to use the command line interface:

```bash
# Local
npm install jsonlint

# Global
sudp npm install -g jsonlint
```

### 9.3. Uninstall

```bash
# Global & Local
sudo npm uninstall -g jsonlint && npm uninstall jsonlint
```

### 9.4. Usage

```bash
# Run json linting
find . -type d \( -name node_modules -o -name vendor -o -regex ".*(package.json|package-lock.json)($|.*)" \) -prune -false -o -regex "*.json" -exec jsonlint -c {} \;

# Overwrite the file
jsonlint --in-place *.json
```

## 10. Remark

[remark-lint](https://github.com/remarkjs/remark-lint) is plugins to lint Markdown.

### 10.1. Requirements

- NPM 6.14.14 or higher.
- Node 12+

### 10.2. Install

```bash
# Local
npm install remark-cli remark-preset-lint-recommended

# Global
sudo npm i -g remark-cli remark-preset-lint-recommended
```

### 10.3. Uninstall

```bash
# Global & Local
sudo npm uninstall -g remark && npm uninstall remark
```

### 10.4. Usage

```bash
remark readme.md
```

### 10.5. Configuration

[remark-lint config](https://github.com/remarkjs/remark-lint#configure) has own mechanism to use configuration files such as `.remarkrc`, `.remarkrc.yml`, or `package.json`.

For example, you can configure plugins via the following `.remarkrc.yml` file:

- Resource file

  ```yml
  ---
  plugins:
    # Presets
    remark-preset-lint-consistent: true
    remark-preset-lint-markdown-style-guide: true
    remark-preset-lint-recommended: true
    remark-validate-links: true

    # Rules
    remark-lint-list-item-indent: space
    remark-lint-maximum-line-length: 100
  ```

- Ignore file

  ```txt
  linter:
    remark_lint:
      ignore-path: vendor
  ```

## 11. Dockerfilelint

[dockerfilelint](https://github.com/replicatedhq/dockerfilelint) a linter for Docker files. dockerfilelint is an node module that analyzes a Dockerfile and looks for common mistakes and helps enforce best practices.

### 11.1. Requirements

- NPM 6.14.14 or higher.
- Node 12+

### 11.2. Install

```bash
sudo npm install -g dockerfilelint
```

### 11.3. Usage

- CLI:

  ```bash
  ./bin/dockerfilelint <path/to/Dockerfile>
  ```

### 11.4. Configuration

You can configure the linter by creating a `.dockerfilelintrc` with the following syntax:

```yaml
rules:
  uppercase_commands: off
```

The keys for the rules can be any file in the /lib/reference.js file. At this time, it's only possible to disable rules. They are all enabled by default.

The following rules are supported:

```txt
required_params
uppercase_commands
from_first
invalid_line
sudo_usage
apt-get_missing_param
apt-get_recommends
apt-get-upgrade
apt-get-dist-upgrade
apt-get-update_require_install
apkadd-missing_nocache_or_updaterm
apkadd-missing-virtual
invalid_port
invalid_command
expose_host_port
label_invalid
missing_tag
latest_tag
extra_args
missing_args
add_src_invalid
add_dest_invalid
invalid_workdir
invalid_format
apt-get_missing_rm
deprecated_in_1.13
```

## 12. Licensecheck

The [licensecheck](https://github.com/google/licensecheck) package scans source texts for known licenses. The design aims never to give a false positive. It also reports matches of known license URLs.

### 12.1. Requirements

`apt` package management system for installing, upgrading, configuring, and removing software.

### 12.2. Install

```bash
sudo apt install -y licensecheck
```

### 12.3. Usage

```bash
licensecheck --check '.*' --recursive --deb-machine --lines 0 *

licensecheck --copyright --deb-machine --recursive --lines 0 --check '.*' --ignore '.*\.ttf$' -- *
```

`.licensecheckignore`

```txt
^.*[^.]{5}$                                 match file without extension
|                                           or
[^\w](\.|\/\.)\w.+                          match hidden file
|                                           or
^.*\.(exe|txt|sh|md|log|js|json|mod|sum)$   match file extension
|                                           or
.*(vendor|scripts|node_modules)($|.*)       match directory
```

`.licensecheckrc`

```txt
^.*\.(go)$                                  match file extension
```

## 13. Licensing

[licensing](https://code.tools/man/1/licensing/) - a program for adding license notices to files.

### 13.1. Requirements

`apt` package management system for installing, upgrading, configuring, and removing software.

### 13.2. Install

```bash
sudo apt install -y licenseutils
```

### 13.3. Usage

```bash
licensing --help
```

## 14. Clang-Format

A tool to format C/C++/Java/JavaScript/Objective-C/Protobuf/C# code. Ensuring that changes to your code are properly formatted is an important part of your development workflow.

Related:

[clang-format](https://clang.llvm.org/docs/ClangFormatStyleOptions.html)
[clang-format - python](https://github.com/Sarcasm/run-clang-format)
[clang-format - npm](https://github.com/angular/clang-format)

### 14.1. Requirements

Require:

- Python to be globally available.
- `apt` or `npm` package manager.

### 14.2. Install

#### 14.2.1. apt

```bash
sudo apt install -y clang-format
```

#### 14.2.2. python wrapper

Copy [run-clang-format.py](https://github.com/Sarcasm/run-clang-format/blob/master/run-clang-format.py) script into your project.

#### 14.2.3. npm wrapper

node.js module which wraps the native clang-format executable.

```bash
sudo npm install -g clang-format
clang-format -help
```

### 14.3. Usage

Clang example:

```bash
# Run code formatting
clang-format -i *.cpp

# To format all .h, .c, .hpp, .cpp, .cu files together
find . -regex '.*\.\(cpp\|hpp\|cu\|c\|h\)' -exec clang-format -style=file -i {} \;
```

Python wrapper example:

```bash
# Run it recursively on directories, or specific files
./run-clang-format.py --recursive --in-place .

# It's possible to exclude paths from the recursive search
./run-clang-format.py -r \
    --exclude src/third_party \
    --exclude '*_test.cpp' \
    src include foo.cpp
```

Node wrapper example:

```bash
# Globing files
clang-format --glob=folder/**/*.js

# It's possible to exclude paths from the recursive search
./run-clang-format.py -r \
    --exclude src/third_party \
    --exclude '*_test.cpp' \
    src include foo.cpp
```

### 14.4. Configuration

#### 14.4.1. Resource file

A way to get a valid `.clang-format` file containing all configuration options of a certain predefined style is:

```bash
clang-format -style=google --dump-config > .clang-format
```

another way is to use the [clang-format configurator](https://zed0.co.uk/clang-format-configurator/).

#### 14.4.2. Ignore file

These exclude rules can be put in a `.clang-format-ignore` file, which also supports comments:

```txt
build/*
docs/*
external/*
third_party/*
node_modules/*
vendor/*
```

## 15. gofmt

### 15.1. Requirements

Go 1.15 or higher.

### 15.2. Install

Built-in

### 15.3. Usage

```bash
# To run go formatter recursively on all project’s files simply use
gofmt -s -w .

# To ignore folders from formation run
find . -type d \( -name node_modules -o -name .vscode -o -name vendor \) -prune -false -o -regex "${RE_FORMAT_FIND}" -exec gofmt -s -l -w {} \; &> "${LOG_FILE}"
```

## 16. shfmt

[shfmt](https://github.com/mvdan/sh) formats shell programs.

Related:

[shfmt - Manuel Page](https://www.mankier.com/1/shfmt#)

### 16.1. Requirements

Requires Go 1.15 or higher.

### 16.2. Install

shfmt is available as snap application. If your distribution has snap installed, you can install shfmt using command:

**Note** currently broken!

```bash
sudo snap install shfmt
```

The another way to install shfmt is by using the following one-liner command:

```bash
curl -sS https://webinstall.dev/shfmt | bash
export PATH="~/.local/bin:$PATH"
```

#### 16.2.1. Binary

Binary [releases](https://github.com/mvdan/sh/releases).

### 16.3. Usage

Do not use the `-s` option to simplify the code, as this violates the [Shell Style Guide](https://google.github.io/styleguide/shellguide.html).

```bash
# Run shell formatting
shfmt -l -kp -sr -ci -i 2 -d .

# Write result to file instead of stdout
shfmt -kp -sr -ci -i 2 -w .
```

### 16.4. Configuration

If any EditorConfig files are found, they will be used to apply formatting options. If any parser or printer flags are given to the tool, no EditorConfig files will be used.

Below is an example `.editorconfig` file setting end-of-line and indentation styles for Python and JavaScript files.

```conf
[*.sh]
# like -i=2
indent_style = space
indent_size = 2
```

## 17. Prettier

[Prettier](https://github.com/prettier/prettier) is an opinionated code formatter.

### 17.1. Requirements

- NPM 6.14.14 or higher.
- Node 12+

### 17.2. Install

```bash
# Local
npm install --save-dev prettier

# Global
sudo npm install -g prettier
```

### 17.3. Usage

```bash
prettier [options] [file/dir/glob ...]
```

Examples:

```bash
prettier -w .
```

### 17.4. Configuration

- [Configuration File](https://prettier.io/docs/en/configuration.html)

  The configuration file for configuration support with a handful of format [options](https://prettier.io/docs/en/options.html).

  Below is an example `.prettierrc.json` file.

  ```json
  {
    "trailingComma": "es5",
    "tabWidth": 2,
    "useTabs": false,
    "semi": false,
    "singleQuote": false
  }
  ```

- [Ignoring Code](https://prettier.io/docs/en/ignore.html)

  Use `.prettierignore` to ignore (i.e. not reformat) certain files and folders completely.

  Below is an example `.prettierignore` file.

  ```json
  # Ignore artifacts
  build
  vendor
  coverage

  # Ignore all HTML files
  *.html
  ```

  Use `prettier-ignore` comments to ignore parts of files.

  ```md
  <!-- prettier-ignore -->
  Do   not    format   this
  ```

## 18. Markdown Link Check

[markdown-link-check](https://github.com/tcort/markdown-link-check) extracts links from markdown texts and checks whether each link is alive or broken.

### 18.1. Requirements

- NPM 6.14.14 or higher.
- Node 12+

### 18.2. Install

To add the module to your project, run:

```bash
npm install --save-dev markdown-link-check
```

To install the command line tool globally, run:

```bash
npm install -g markdown-link-check
```

### 18.3. Usage

The [command line tool](https://github.com/tcort/markdown-link-check#command-line-tool) optionally takes 1 argument, the file name or http/https URL. If not supplied, the tool reads from standard input.

```bash
# Check links from a markdown file hosted on the web
markdown-link-check https://github.com/tcort/markdown-link-check/blob/master/README.md

# Check links from a local markdown file
markdown-link-check ./README.md

# Check links from a local markdown folder (recursive)
find . -name \*.md -exec markdown-link-check {} \;
```

### 18.4. Configuration

Command line options `-c` can also be specified in a config file.

Example:

```json
{
  "ignorePatterns": [
    {
      "pattern": "^http://example.net"
    }
  ],
  "replacementPatterns": [
    {
      "pattern": "^.attachments",
      "replacement": "file://some/conventional/folder/.attachments"
    },
    {
      "pattern": "^/",
      "replacement": "{{BASEURL}}/"
    }
  ],
  "httpHeaders": [
    {
      "urls": ["https://example.com"],
      "headers": {
        "Authorization": "Basic Zm9vOmJhcg==",
        "Foo": "Bar"
      }
    }
  ],
  "timeout": "20s",
  "retryOn429": true,
  "retryCount": 5,
  "fallbackRetryDelay": "30s",
  "aliveStatusCodes": [200, 206]
}
```


## 19. Alex

[alex](https://github.com/get-alex/alex) catch insensitive, inconsiderate writing.

### 19.1. Requirements

- NPM 6.14.14 or higher.
- Node 12+

### 19.2. Install

```bash
npm install -g alex
```

### 19.3. Usage

The CLI searches for files with a markdown or text extension when given directories (alex will find readme.md and path/to/file.txt).

```bash
alex .
```

### 19.4. Configuration

#### 19.4.1. [Ignoring files](https://github.com/get-alex/alex#ignoring-files)

To prevent files from being found, create an `.alexignore` file:

```bash
# `node_modules` is ignored by default.
CODE_OF_CONDUCT.md
vendor/
```

#### 19.4.2. [Resource files](https://github.com/get-alex/alex#configuration)

You can control alex through `.alexrc.yml` configuration files:

```yml
allow:
  - German
  - german
  - european
```

## 20. Codespell

[codespell](https://github.com/codespell-project/codespell) fix common misspellings in text files. It's designed primarily for checking misspelled words in source code, but it can be used with other files as well. It does not check for word membership in a complete dictionary, but instead looks for a set of common misspellings. This also means it shouldn't generate false-positives when you use a niche term it doesn't know about.

### 20.1. Requirements

Python 3.7 or higher.

### 20.2. Install

```bash
pip install codespell
```

### 20.3. Usage

For more in depth info please check usage with `codespell -h`.

Some noteworthy flags:

```bash
codespell -w, --write-changes
```

The `-w` flag will actually implement the changes recommended by codespell. Not running with `-w` flag is the same as with doing a dry run. It is recommended to run this with the `-i` or `--interactive` flag.:

```bash
# ".git" dir is not skipped by default: codespell-project/codespell#783
# Skipping nested dirs needs "./": codespell-project/codespell#99
codespell \
    --check-filenames \
    --check-hidden \
    --quiet-level 6 \
    --skip="*.json,*.txt,*.log,.git,./node_modules,./vendor"
```

### 20.4. Configuration

Command line options can also be specified in a config file.

When running codespell, it will check in the current directory for a file named `setup.cfg` or `.codespellrc` (or a file specified via --config), containing an entry named `[codespell]`. Each command line argument can be specified in this file (without the preceding dashes), for example:

```txt
[codespell]
skip = *.json,*.txt,*.log,.git,.spelling,*/node_modules,*/vendor
quiet-level = 3
check-filenames =
check-hidden =
```

## 21. Clang Analyzer

[scan-build](https://github.com/rizsotto/scan-build) is a package designed to wrap a build so that all calls to gcc/clang are intercepted and logged into a compilation database and/or piped to the clang static analyzer. Includes intercept-build tool, which logs the build, as well as scan-build tool, which logs the build and runs the clang static analyzer on it.

See [scan-build docs](http://clang-analyzer.llvm.org/scan-build.html)

### 21.1. Requirements

Python 3.7 or higher.

`pip` is the package installer for Python. You can use pip to install packages from the Python Package Index and other indexes.

### 21.2. Install

It's available from the Python Package Index.

```bash
pip install scan-build
```

### 21.3. Usage

Generally speaking, the `intercept-build` and `analyze-build` tools together does the same job as `scan-build` does. So, you can expect the same output from this line as scan-build would do:

```bash
# To run the Clang static analyzer against a project goes like this:
scan-build <your build command>

# To generate a compilation database file goes like this:
intercept-build <your build command>

# To run the Clang static analyzer against a project with compilation database goes like this:
analyze-build
```

### 21.4. Configuration

```bash

```
