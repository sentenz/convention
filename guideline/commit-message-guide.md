# Commit Message Guide

*This specification is inspired by [Angular](https://github.com/angular/angular/blob/master/CONTRIBUTING.md#commit) and follows the [Conventional Commits](https://sentenz.github.io/backup-service/website/conventionalcommits.org/en/v1.0.0/index.html).*

- [Commit Message Guideline](#commit-message-guideline)
  - [Header](#header)
    - [Type](#type)
    - [Scope](#scope)
    - [Summary](#summary)
  - [Body](#body)
  - [Footer](#footer)
- [Commit Message Upate](#commit-message-upate)

## Commit Message Guideline

A commit message consists of a **header**, a **body**, and a **footer**.

```txt
<header>
<BLANK LINE>
<body>
<BLANK LINE>
<footer>
```

The `header` is mandatory and must conform to the [Commit Message Header](#commit-message-header) format.

The `body` is mandatory for all commits except for those of type "docs".
When the body is present it must be at least 20 characters long and must conform to the [Commit Message Body](#commit-message-body) format.

The `footer` is optional. The [Commit Message Footer](#commit-message-footer) format describes what the footer is used for and the structure it must have.

Full example:

```txt
feat(compiler): propagate standalone flag to runtime (#44973) 

This commit carries the `standalone` flag forward from a directive/pipe
into its generated directive/pipe definition, allowing the runtime to
recognize standalone entities.

Closes #44973
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

For example:

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

## Commit Message Upate

A reviewer might often suggest changes to a commit message (for example, to add more context for a change or adhere to our [Commit Message Guideline](#commit-message-guideline)).

In order to update the commit message of the last commit on your branch:

1. Check out your branch:

    ```shell
    git checkout my-fix-branch
    ```

2. Amend the last commit and modify the commit message:

    ```shell
    git commit --amend
    ```

3. Push to your repository:

    ```shell
    git push --force-with-lease
    ```

> NOTE If you need to update the commit message of an earlier commit, you can use `git rebase` in interactive mode.
> See the [git docs](https://git-scm.com/docs/git-rebase#_interactive_mode) for more details.
