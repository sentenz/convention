# 013-ADR: Git Hooks Manager

Architectural Decision Records (ADR) on implementing a Git Hooks Manager for Software Projects.

- [1. State](#1-state)
- [2. Context](#2-context)
- [3. Decision](#3-decision)
  - [3.1. Lefthook](#31-lefthook)
- [4. Considered](#4-considered)
  - [4.1. Husky](#41-husky)
  - [4.2. Lefthook](#42-lefthook)
  - [4.3. Pre-commit](#43-pre-commit)
- [5. Consequences](#5-consequences)
- [6. Implementation](#6-implementation)
- [7. References](#7-references)

## 1. State

- Author(s): Sentenz
- Date: 2026-04-30
- Status: Proposed

## 2. Context

A Git hooks manager automates tasks during the Git workflow, such as linting, formatting, and enforcing commit message conventions. Managing raw Git hooks as shell scripts lacks consistency, portability, and ease of onboarding. A dedicated Git hooks manager will standardize hook definitions, improve developer experience, and integrate seamlessly with our multi-language toolchain.

1. Decision Drivers

    - Ease of Use
      > The tool should provide a simple setup and configuration experience across all team members.

    - Cross-Platform Support
      > The tool should work consistently on Linux, macOS, and Windows without requiring platform-specific workarounds.

    - Performance
      > Hook execution should be fast and support parallel execution to minimize friction in the developer workflow.

    - Language Agnostic
      > The tool should not be tied to a specific programming language or runtime, supporting our multi-language environment.

    - Configuration
      > The configuration should be declarative, human-readable, and easy to maintain.

    - Integration
      > The tool should integrate with existing linters, formatters, and CI/CD workflows.

    - Community and Ecosystem
      > The tool should be actively maintained with good documentation and community support.

## 3. Decision

### 3.1. Lefthook

Lefthook is selected as the Git hooks manager due to its language-agnostic design, fast parallel execution, cross-platform support, and YAML-based declarative configuration that aligns with our existing toolchain conventions.

1. Rationale

    - Ease of Use
      > Lefthook uses a single `lefthook.yml` configuration file at the project root, making setup straightforward for all team members regardless of their primary programming language.

    - Cross-Platform Support
      > Lefthook is distributed as a standalone binary with no runtime dependencies, ensuring consistent behavior on Linux, macOS, and Windows.

    - Performance
      > Lefthook supports parallel execution of hook commands and runs only on staged files by default, minimizing execution time and developer disruption.

    - Language Agnostic
      > Lefthook requires no specific runtime (e.g., Node.js or Python) and integrates with any tool or script available in the shell environment, making it suitable for our multi-language repository.

    - Configuration
      > The YAML-based `lefthook.yml` is declarative, version-controlled, and easy to read and update, consistent with other configuration files in the project.

    - Integration
      > Lefthook integrates natively with CI/CD pipelines and can invoke any existing linting, formatting, or testing commands without additional wrappers.

    - Community and Ecosystem
      > Lefthook is actively maintained by Evil Martians, has comprehensive documentation, and supports a growing ecosystem of integrations.

## 4. Considered

### 4.1. Husky

Husky is a widely used Git hooks manager for JavaScript and Node.js projects. It relies on `npm` scripts and stores hook definitions in the `.husky/` directory.

```json
{
  "scripts": {
    "prepare": "husky install"
  }
}
```

```sh
# .husky/pre-commit
npx lint-staged
```

- Pros:

  - Ease of Use
    > Simple setup for Node.js projects via `npm install`.

  - Adoption
    > Widely adopted in the JavaScript ecosystem with extensive community resources.

  - Integration
    > Tight integration with `lint-staged` for running checks only on staged files.

- Cons:

  - Runtime Dependency
    > Requires Node.js and `npm` as a runtime dependency, which is not suitable for our multi-language environment.

  - Configuration
    > Hook configuration is split across multiple shell scripts rather than a single declarative file.

  - Performance
    > Does not support parallel execution of hook commands natively.

### 4.2. Lefthook

Lefthook is a fast, language-agnostic Git hooks manager distributed as a standalone binary. It uses a single `lefthook.yml` configuration file to define all hooks.

```yaml
# lefthook.yml
pre-commit:
  parallel: true
  commands:
    lint:
      run: make run-linter-staged
    spell:
      run: make run-spell-check

commit-msg:
  commands:
    lint:
      run: make run-linter-commit {1}
```

- Pros:

  - Language Agnostic
    > No runtime dependencies beyond the binary itself, making it suitable for multi-language environments.

  - Performance
    > Supports parallel execution of multiple commands within a single hook.

  - Configuration
    > Single declarative YAML configuration file for all hooks.

  - Cross-Platform Support
    > Cross-platform binaries available for Linux, macOS, and Windows.

  - Staged Files
    > Supports filtering commands to run only on staged or changed files.

  - Community and Ecosystem
    > Actively maintained with comprehensive documentation.

- Cons:

  - Binary Dependency
    > Requires installing the `lefthook` binary on all development machines.

  - Adoption
    > Less established than Husky in the JavaScript ecosystem.

### 4.3. Pre-commit

Pre-commit is a framework for managing and maintaining multi-language pre-commit hooks. It is configured via a `.pre-commit-config.yaml` file and pulls hook definitions from remote repositories.

```yaml
# .pre-commit-config.yaml
repos:
  - repo: https://github.com/pre-commit/pre-commit-hooks
    rev: v4.5.0
    hooks:
      - id: trailing-whitespace
      - id: end-of-file-fixer
```

- Pros:

  - Ecosystem
    > Rich ecosystem of ready-made hooks from the pre-commit community.

  - Language Agnostic
    > Hook definitions that can invoke tools from various runtimes.

  - Environment Management
    > Automatic virtual environment management for Python-based hooks.

- Cons:

  - Runtime Dependency
    > Requires Python as a runtime dependency for the framework itself.

  - External Dependencies
    > Hook definitions are fetched from remote repositories, introducing external dependencies and potential network latency.

  - Hook Coverage
    > Configuration is limited to the `pre-commit` hook by default; other hooks require additional setup.

  - Performance
    > Slower compared to Lefthook due to virtual environment management overhead.

## 5. Consequences

- Positive

  - Consistency
    > Standardized hook definitions in a single `lefthook.yml` file improve consistency and reduce onboarding time for new team members.

  - Performance
    > Parallel execution of hook commands reduces wait time for developers during the Git workflow.

  - Portability
    > No runtime dependency beyond the binary ensures hooks work identically across all supported operating systems and CI/CD environments.

  - Maintainability
    > Declarative YAML configuration is easy to read, update, and review in code reviews.

- Negative

  - Binary Dependency
    > All developers and CI/CD runners must have the `lefthook` binary installed, requiring updates to onboarding documentation and setup scripts.

  - Migration Effort
    > Existing raw shell-based Git hooks in the `githooks/` directory need to be migrated to Lefthook configuration, requiring testing to ensure equivalent behavior.

## 6. Implementation

1. Install the `lefthook` binary on all development machines and CI/CD runners.
2. Create a `lefthook.yml` configuration file at the project root, defining hooks for `pre-commit`, `commit-msg`, `pre-push`, `post-checkout`, and `pre-rebase`.
3. Migrate the existing hook logic from the `githooks/` shell scripts into the corresponding Lefthook commands.
4. Run `lefthook install` to register the hooks in the local `.git/hooks/` directory.
5. Update the project README and onboarding documentation to include Lefthook setup instructions.
6. Validate hook execution in CI/CD pipelines to ensure consistent behavior across environments.

## 7. References

- Sentenz [Manager Tools](../articles/manager-tools.md) article.
- Lefthook [Official Documentation](https://lefthook.dev/) page.
- Lefthook [GitHub Repository](https://github.com/evilmartians/lefthook) page.
- Husky [Official Documentation](https://typicode.github.io/husky/) page.
- Pre-commit [Official Documentation](https://pre-commit.com/) page.
