# 011-ADR: Task Runner

Task Runner for streamlining development workflows and reducing manual effort. Focuses on automating repetitive tasks in software development, such as building, testing, linting, and deploying code.

- [1. State](#1-state)
- [2. Context](#2-context)
- [3. Decision](#3-decision)
  - [3.1. Taskfile](#31-taskfile)
- [4. Considered](#4-considered)
  - [4.1. Makefile](#41-makefile)
  - [4.2. Justfile](#42-justfile)
  - [4.3. Taskfile](#43-taskfile)
  - [4.4. Mage](#44-mage)
  - [4.5. Earthly](#45-earthly)
  - [4.6. Rake](#46-rake)
  - [4.7. NPM](#47-npm)
- [5. Consequences](#5-consequences)
- [6. Implementation](#6-implementation)
- [7. References](#7-references)

## 1. State

- Author(s): Sentenz
- Date: 2025-01-23
- Status: Proposed

## 2. Context

We need a task management tool to automate repetitive tasks in our software development workflow, such as building, testing, linting, and deploying the application.

1. Decision Drivers

    - Ease of Use
      > The tool should have a simple and intuitive syntax.

    - Maintainability
      > The configuration should be easy to read and update.

    - Cross-Platform Support
      > The tool should work consistently across different operating systems.

    - Community and Ecosystem
      > The tool should have good documentation and community support.

    - Flexibility
      > The tool should support complex workflows if needed.

    - Language Familiarity
      > The tool should align with the team's expertise and project's primary programming language.

## 3. Decision

### 3.1. Taskfile

Taskfile is selected as the task runner due to its YAML-based declarative configuration, built-in cross-platform support, and native support for variables and task dependencies that streamlines the development workflow.

1. Rationale

    - Ease of Use
      > Taskfile's YAML syntax is intuitive and easy to understand, making it accessible to all team members.

    - Maintainability
      > The structured nature of YAML ensures that the configuration is clean and easy to update.

    - Cross-Platform Support
      > Taskfile works seamlessly across different operating systems without requiring additional setup.

    - Community and Ecosystem
      > While Taskfile is less mature than `make`, it has a growing community and sufficient documentation for our needs.

    - Flexibility
      > Taskfile supports variables, dependencies, and complex workflows, which will accommodate our current and future requirements.

    - Language Familiarity
      > Taskfile uses YAML for configuration, which is language-agnostic and widely familiar across the team, requiring no knowledge of a specific programming language.

## 4. Considered

### 4.1. Makefile

[Makefile](https://www.gnu.org/software/make/) is a build automation tool that has been around since the 1970s, using rules and dependencies to automate software compilation and deployment via the `make` utility.

```makefile
build:
    gcc -o program main.c utils.c
```

- Pros

  - Maturity
    > Mature and widely used in the industry, with decades of adoption across software build systems.

  - Flexibility
    > Highly flexible and powerful for complex build systems with extensive support for custom rules.

  - Platform Support
    > Natively supported on almost all Unix-based platforms without additional installation.

- Cons

  - Syntax
    > Cryptic syntax and platform-specific behavior make it difficult for non-experts to read and maintain.

  - Readability
    > Limited readability and maintainability for developers unfamiliar with Makefile conventions.

  - Cross-Platform
    > Requires additional tools for cross-platform compatibility (e.g., `make` on Windows).

### 4.2. Justfile

[Justfile](https://github.com/casey/just) is a command runner focused on simplicity and ease of use for defining and running tasks, serving as a modern alternative to `make`.

```justfile
build:
    gcc -o program main.c utils.c

test:
    ./program --test
```

- Pros

  - Readability
    > Simple and human-readable syntax designed specifically for task automation.

  - Cross-Platform Support
    > Cross-platform support out of the box without requiring additional setup.

  - Ease of Use
    > Easy to learn and use, serving as a modern alternative to `make`.

- Cons

  - Ecosystem
    > Lacks the flexibility and ecosystem maturity of more established task runners.

### 4.3. Taskfile

[Taskfile](https://taskfile.dev/) is a task runner using YAML-based declarative configuration, inspired by Makefiles but designed to be more modern, user-friendly, and cross-platform.

```yaml
version: '3'

tasks:
  build:
    cmds:
      - gcc -o program main.c utils.c

  test:
    cmds:
      - ./program --test
```

- Pros

  - Readability
    > Uses YAML, which is easy to read and write, with a structured and declarative syntax.

  - Cross-Platform Support
    > Cross-platform support without additional setup or configuration.

  - Features
    > Built-in support for variables, dependencies, and complex task workflows.

- Cons

  - Verbosity
    > YAML can be verbose for simple tasks compared to more concise task runner formats.

  - Maturity
    > Less mature compared to `make`, with a smaller plugin ecosystem.

### 4.4. Mage

[Mage](https://magefile.org/) is a Go-based task runner that uses standard Go files to define and execute build tasks, making it ideal for Go projects or teams familiar with Go.

```go
// magefile.go
package main

import (
    "os/exec"
)

// Build compiles the program.
func Build() error {
    return exec.Command("go", "build", "-o", "program", ".").Run()
}
```

- Pros

  - Go Integration
    > Go-based syntax is familiar to Go developers and integrates naturally with Go projects.

  - Performance
    > Fast and efficient execution leveraging the Go runtime.

- Cons

  - Language Dependency
    > Requires knowledge of Go, limiting adoption in non-Go environments.

  - Ecosystem
    > Limited to Go ecosystems and not suitable for multi-language projects.

### 4.5. Earthly

[Earthly](https://earthly.dev/) is a build automation tool that uses Docker-like syntax to define reproducible, containerized builds and CI/CD pipelines.

```earthfile
VERSION 0.6
FROM golang:1.15
WORKDIR /go/src/app

build:
    COPY main.go .
    RUN go build -o output .
    SAVE ARTIFACT output AS LOCAL ./output
```

- Pros

  - Reproducibility
    > Reproducible builds using containers ensure consistent execution across environments.

  - CI/CD Integration
    > Suitable for containerized builds and CI/CD pipelines with a simple declarative syntax.

- Cons

  - Container Dependency
    > Requires Docker or a container runtime, adding infrastructure overhead.

### 4.6. Rake

[Rake](https://github.com/ruby/rake) is a Ruby-based build automation tool that uses Ruby DSL scripts to define and compose tasks, making it ideal for Ruby projects or teams familiar with Ruby.

```ruby
task :build do
  sh 'gcc -o program main.c utils.c'
end

task :test => :build do
  sh './program --test'
end
```

- Pros

  - Flexibility
    > Powerful and flexible, leveraging Ruby's expressive syntax for defining and composing tasks.

  - Readability
    > Ruby-based scripts are easy to read and extend for developers familiar with Ruby.

- Cons

  - Language Dependency
    > Requires knowledge of Ruby, limiting adoption in non-Ruby environments.

  - Ecosystem
    > Limited to Ruby ecosystems and not suitable for multi-language projects.

### 4.7. NPM

[NPM scripts](https://docs.npmjs.com/cli/v10/using-npm/scripts) is a built-in task automation feature of Node.js projects that defines tasks in the `scripts` section of the `package.json` file.

```json
{
  "scripts": {
    "build": "tsc",
    "test": "jest",
    "lint": "eslint ."
  }
}
```

- Pros

  - No Additional Dependencies
    > No additional tools required, as NPM scripts are bundled with Node.js.

  - Node.js Integration
    > Built into Node.js projects, making it immediately accessible for JavaScript/TypeScript developers.

- Cons

  - Scope
    > Limited to Node.js projects and not suitable for our multi-language environment.

  - Complexity
    > Not as powerful for complex workflows compared to dedicated task runners.

## 5. Consequences

- Positive

  - Readability
    > Improved readability and maintainability of task definitions through YAML-based declarative configuration.

  - Onboarding
    > Easier onboarding for new team members due to Taskfile's intuitive syntax and structured configuration.

  - Consistency
    > Consistent behavior across development environments with cross-platform support.

- Negative

  - Verbosity
    > YAML syntax may become verbose for very simple tasks compared to more concise alternatives.

  - Additional Dependency
    > Requires installing the `task` utility on all development machines, adding an external dependency.

## 6. Implementation

1. Install Task Utility

    Install the `task` utility on all development machines.

2. Create Taskfile

    Create a `Taskfile.yml` in the project root to define common tasks (e.g., build, test, lint).

3. Documentation

    Document the usage of Taskfile in the project README.

4. Team Training

    Train the team on how to use and update the Taskfile.

## 7. References

- Sentenz [Build Systems](../articles/build-systems.md) article.
- Taskfile [Official Documentation](https://taskfile.dev/) page.
- Taskfile [GitHub Repository](https://github.com/go-task/task) page.
