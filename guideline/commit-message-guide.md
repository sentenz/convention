# Commit Message Guide

*This specification is inspired by [Angular](https://github.com/angular/angular/blob/master/CONTRIBUTING.md#commit) and follows the [Conventional Commits](https://sentenz.github.io/backup-service/website/conventionalcommits.org/en/v1.0.0/index.html).*

- [Commit Message](#commit-message)
  - [Header](#header)
    - [Type](#type)
    - [Scope](#scope)
    - [Summary](#summary)
  - [Body](#body)
  - [Footer](#footer)
- [Merge Commit Message](#merge-commit-message)
- [Update a Commit Message](#update-a-commit-message)
- [Lint a Commit Message](#lint-a-commit-message)

## Commit Message

A commit message consists of a `header`, a `body`, and a `footer`.

```txt
<header>
<BLANK LINE>
<body>
<BLANK LINE>
<footer>
```

The `header` is mandatory and must conform to the [Commit Message Header](#header) format. The `body` is mandatory for all commits except for those of type *docs*. When the body is present it must be at least 20 characters long and must conform to the [Commit Message Body](#body) format. The `footer` is optional. The [Commit Message Footer](#footer) format describes what the footer is used for and the structure it must have.

Full example:

```txt
feat(compiler): propagate standalone flag to runtime

This commit carries the `standalone` flag forward from a directive/pipe
into its generated directive/pipe definition, allowing the runtime to
recognize standalone entities.
```

### Header

The `<type>` and `<summary>` fields are mandatory, the `(<scope>)` field is optional.

```txt
<type>(<scope>): <short summary>
```

#### Type

- **fix**
   > A bug fix (this correlates with `PATCH` in [Semantic Versioning](#semantic-versioning)).

- **feat**
   > A new feature (this correlates with `MINOR` in [Semantic Versioning](#semantic-versioning)).

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

#### Scope

A scope can be provided to a commit’s type, to provide additional contextual information and is contained within parenthesis.

```txt
feat(parser): allow provided config object to extend other configs
```

or

```txt
refactor(internal): modify function to provide additional contextual information
```

#### Summary

Provide in the summary field a succinct description of the change:

- use the imperative, present tense: `change` not `changed` nor `changes`
- don't capitalize the first letter
- no period (.) at the end

### Body

As in the summary, use the imperative, present tense: `fix` not `fixed` nor `fixes`.

Explain the motivation for the change in the commit message body. This commit message should explain *why* you are making the change. Include a comparison of the previous behavior with the new behavior in order to illustrate the impact of the change.

### Footer

The footer can contain information about `breaking changes` and `deprecations` and is also the place to reference Azure stories, GitHub issues, Jira tickets, and other PRs that this commit closes or is related to.

```txt
BREAKING CHANGE: <breaking change summary>
<BLANK LINE>
<breaking change description + migration instructions>
<BLANK LINE>
<BLANK LINE>
Fixes #<issue number>
```

or

```txt
DEPRECATED: <what is deprecated>
<BLANK LINE>
<deprecation description + recommended update path>
<BLANK LINE>
<BLANK LINE>
Closes #<pr number>
```

Breaking change section should start with the phrase `BREAKING CHANGE:` followed by a summary of the breaking change, a blank line, and a detailed description of the breaking change that also includes migration instructions.

> NOTE A commit that has a footer `BREAKING CHANGE:`, or appends a `!` after the type/scope, introduces a breaking API change (correlating with `MAJOR` in [Semantic Versioning](#semantic-versioning)).

Similarly, a Deprecation section should start with `DEPRECATED:` followed by a short description of what is deprecated, a blank line, and a detailed description of the deprecation that also mentions the recommended update path.

For example:

```txt
feat: modify validation tooling (#6658)

BREAKING CHANGE: bash analyzer scripts are deprecated

The bash analyzer scripts are replaced with the pre-commit tool.


Closes #5684
```

## Merge Commit Message

Unlike the standard commit messages, a merge commit message consists of additional information about the related Azure stories, GitHub issues, Jira tickets, and other PRs that are closed with this merge commit.

- header

  A commit message to merge a pull request (PR) modifies the `header` with the associated PR number.

  ```txt
  <type>(<scope>): <short summary> (<pr number>)
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

## Update a Commit Message

A reviewer might often suggest changes to a commit message (e.g., to add more context to a change or to comply with the [commit message guideline](#commit-message-guideline)).

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

## Lint a Commit Message

[commitlint](https://github.com/conventional-changelog/commitlint) tooling for conventional commits. Checks if the commit messages meet the [Conventional Commits](https://sentenz.github.io/backup-service/website/conventionalcommits.org/en/v1.0.0/index.html) format.
