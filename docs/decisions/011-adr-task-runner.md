# XXX-ADR: Task Runner

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

## 1. State

- Author(s): ALKL
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
      > TODO

## 4. Considered

### 4.1. Makefile

Makefiles are used with the `make` utility, a build automation tool that has been around since the 1970s. They are primarily used to compile and build software projects.

```makefile
build:
    gcc -o program main.c utils.c
```

- Pros
  - Mature and widely used in the industry.
  - Highly flexible and powerful for complex build systems.
  - Supported on almost all platforms.

- Cons
  - Cryptic syntax and platform-specific behavior.
  - Limited readability and maintainability for non-experts.
  - Requires additional tools for cross-platform compatibility (e.g., `make` on Windows).

### 4.2. Justfile

Justfiles are used with the `just` command runner, a modern alternative to `make`. It focuses on simplicity and ease of use for defining and running tasks.

```justfile
build:
    gcc -o program main.c utils.c

test:
    ./program --test
```

- Pros
  - Simple and human-readable syntax.
  - Designed specifically for task automation.
  - Cross-platform support out of the box.
  - Easy to learn and use.

- Cons
  - Lacks the flexibility and ecosystem.

### 4.3. Taskfile

Taskfiles are used with the `task` command runner (Taskfile.yml), a tool inspired by Makefiles but designed to be more modern and user-friendly. It uses YAML for configuration.

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
  - Uses YAML, which is easy to read and write.
  - Structured and declarative syntax.
  - Cross-platform support.
  - Built-in support for variables and dependencies.

- Cons
  - YAML can be verbose for simple tasks.
  - Less mature compared to `make`.

### 4.4. Mage

Mage is a task runner written in Go. It uses Go scripts to define tasks, making it ideal for Go projects or teams familiar with Go.

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
  - Simple and Go-based syntax.
  - Fast and efficient.
  - Ideal for Go projects or teams familiar with Go.

- Cons
  - Requires knowledge of Go.
  - Limited to Go ecosystems.

### 4.5. Earthly

Earthly is a build automation tool that uses Docker-like syntax to define tasks. It is designed for reproducibility and portability, making it suitable for containerized builds and CI/CD pipelines.

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
  - Reproducible builds using containers.
  - Simple and declarative syntax.
  - Suitable for containerized builds and CI/CD pipelines.

- Cons
  - Requires Docker or container runtime.

### 4.6. Rake

Rake is a build automation tool written in Ruby. It uses Ruby scripts to define tasks, making it ideal for Ruby projects or teams familiar with Ruby.

```ruby
task :build do
  sh 'gcc -o program main.c utils.c'
end

task :test => :build do
  sh './program --test'
end
```

- Pros
  - Powerful and flexible.
  - Uses Ruby, which is expressive and easy to read.

- Cons
  - Requires knowledge of Ruby.
  - Limited to Ruby ecosystems.

### 4.7. NPM

NPM scripts (package.json) are a built-in feature of Node.js projects. They allow you to define tasks in the `scripts` section of the `package.json` file.

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
  - No additional dependencies required (comes with Node.js).
  - Builtin in Node.js projects, making it easy to use for JavaScript/TypeScript developers.

- Cons
  - Limited to Node.js projects.
  - Not suitable for our multi-language environment.
  - Not as powerful for complex workflows.

## 5. Consequences

- Positive
  - Improved readability and maintainability of task definitions.
  - Easier onboarding for new team members.
  - Consistent behavior across development environments.

- Negative
  - YAML syntax may become verbose for very simple tasks.
  - Requires installing the `task` utility, which is an additional dependency.

## 6. Implementation

1. Install the `task` utility on all development machines.
2. Create a `Taskfile.yml` in the project root to define common tasks (e.g., build, test, lint).
3. Document the usage of Taskfile in the project README.
4. Train the team on how to use and update the Taskfile.
