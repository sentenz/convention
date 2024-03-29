# Commit Message Guide

*This specification is inspired by [Angular](https://github.com/angular/angular/blob/master/CONTRIBUTING.md#commit) and follows the [Conventional Commits](../convention/conventional-commits.md).*

- [1. Commit Message](#1-commit-message)
  - [1.1. Header](#11-header)
    - [1.1.1. Type](#111-type)
    - [1.1.2. Scope](#112-scope)
  - [1.2. Body](#12-body)
  - [1.3. Footer](#13-footer)
    - [1.3.1. Referencing Issues](#131-referencing-issues)
    - [1.3.2. Breaking Changes](#132-breaking-changes)
- [2. Merge Commit Message](#2-merge-commit-message)
- [3. Update a Commit Message](#3-update-a-commit-message)
- [4. Lint a Commit Message](#4-lint-a-commit-message)
- [5. References](#5-references)

## 1. Commit Message

A commit message consists of a `header`, a `body`, and a `footer`.

```txt
<header>

<body>

<footer>
```

The `header` is mandatory and must conform to the [Commit Message Header](#11-header) format The `header` should not be longer than 70 characters.

The `body` is mandatory for all commits except for those of type *docs*. When the body is present it must be at least 20 characters long and should be wrapped at 80 characters, and must conform to the [Commit Message Body](#12-body) format.

The `footer` is optional. The [Commit Message Footer](#13-footer) format describes what the footer is used for and the structure it must have.

Provide in the `subject` field a succinct description of the change:

- use the imperative, present tense: `change` not `changed` nor `changes`
- includes motivation for the change and contrasts with previous behavior
- don't capitalize the first letter
- no period (.) at the end

Full example:

```txt
fix(middleware): ensure Range headers adhere more closely to RFC 2616

Add one new dependency, use `range-parser` (express dependency) to compute
range. It is more well-tested in the wild.
```

### 1.1. Header

The `<type>` and `<subject>` fields are mandatory. The `(<scope>)` field is optional, e.g. if the change is a global or difficult to assign to a single component. The `type` and `scope` should always be lowercase.

```txt
<type>(<scope>): <subject>
```

#### 1.1.1. Type

- **fix**
   > A bug fix (this correlates with `PATCH` in [semantic versioning](../guides/versioning-guide.md#11-release)).

- **feat**
   > A new feature (this correlates with `MINOR` in [Semantic Versioning](../guides/versioning-guide.md#11-release)).

- **build**
  > Changes that affect the build system or external dependencies.

- **chore**
  > Other changes that don`t modify src or test files.

- **ci**
  > Changes to our CI configuration files and scripts.

- **docs**
  > Documentation only changes.

- **perf**
  > A code change that improves performance.

- **refactor**
  > A code change that neither fixes a bug nor adds a feature.

- **test**
  > Adding missing tests or correcting existing tests.

- **revert**
  > Revert a previous commit

#### 1.1.2. Scope

A scope can be provided to a commit’s type, to provide additional contextual information and is contained within parenthesis.

```txt
feat(parser): allow provided config object to extend other configs
```

or

```txt
refactor(internal): modify function to provide additional information
```

### 1.2. Body

Use the imperative, present tense: `fix` not `fixed` nor `fixes`.

Explain the motivation for the change in the commit message body. This commit message should explain *why* you are making the change. Include a comparison of the previous behavior with the new behavior in order to illustrate the impact of the change.

### 1.3. Footer

#### 1.3.1. Referencing Issues

Closed issues should be listed on a separate line in the footer prefixed with `Closes` keyword like this:

```txt
Closes #<issue number>
```

or in the case of multiple issues:

```txt
Closes #<issue number>, #<issue number>, #<issue number>
```

#### 1.3.2. Breaking Changes

The footer can contain information about `breaking changes` and `deprecations` and is also the place to reference Azure stories, GitHub issues, Jira tickets, and other PRs that this commit closes or is related to.

Breaking change section should start with the phrase `BREAKING CHANGE:` followed by a `subject` of the breaking change, a blank line, and a detailed description of the breaking change that also includes migration instructions.

```txt
BREAKING CHANGE: <breaking change subject>

<breaking change description + migration instructions>

Fixes #<issue number>
```

Similarly, a Deprecation section should start with `DEPRECATED:` followed by a short description of what is deprecated, a blank line, and a detailed description of the deprecation that also mentions the recommended update path.

```txt
DEPRECATED: <what is deprecated>

<deprecation description + recommended update path>

Closes #<issue number>, #<issue number>, #<issue number>
```

> NOTE A commit that has a footer `BREAKING CHANGE:`, or appends a `!` after the type/scope, introduces a breaking API change (correlating with `MAJOR` in [Semantic Versioning](../guides/versioning-guide.md#11-release)).

For example:

```txt
feat: modify validation tooling (#6658)

BREAKING CHANGE: bash analyzer scripts are deprecated

The bash analyzer scripts are replaced with the pre-commit tool.

Closes #5684
```

## 2. Merge Commit Message

Unlike the standard commit messages, a merge commit message consists of additional information about the related Azure stories, GitHub issues, Jira tickets, and other PRs that are closed with this merge commit.

- header

  A commit message to merge a pull request (PR) modifies the `header` with the associated PR number.

  ```txt
  <type>(<scope>): <subject> (<pr number>)
  ```

  For example:

  ```txt
  feat(compiler): propagate standalone flag to runtime (#44973) 
  ```

- footer

  The `footer` includes related work items like Azure stories, GitHub issues or Jira tickets.

  For example:

  ```txt
  Closes #<issue number>
  ```

Full example:

```txt
feat(compiler): propagate standalone flag to runtime (#44973) 

This commit carries the `standalone` flag forward from a directive/pipe
into its generated directive/pipe definition, allowing the runtime to
recognize standalone entities.

Closes #43484
```

## 3. Update a Commit Message

A reviewer might often suggest changes to a commit message (e.g., to add more context to a change or to comply with the [commit message guide](../guides/commit-message-guide.md)).

In order to update the commit message of the last commit on the feature branch:

1. Check out the feature branch:

    ```bash
    git checkout feature/7845-fix-opreation
    ```

2. Amend the last commit and modify the commit message:

    ```bash
    git commit --amend
    ```

3. Push to repository:

    ```bash
    git push --force-with-lease
    ```

> NOTE If a commit message of an earlier commit need to update, use `git rebase` in interactive mode. See the [git docs](https://git-scm.com/docs/git-rebase#_interactive_mode) for more details.

## 4. Lint a Commit Message

[commitlint](https://github.com/conventional-changelog/commitlint) tooling for conventional commits. Checks if the commit messages meet the [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/) format.

## 5. References

- Karma [git commit message](http://karma-runner.github.io/1.0/dev/git-commit-msg.html) guideline.
