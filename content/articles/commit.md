# Commit

Committing is the process of saving changes to a local repository. It is a fundamental part of version control and is used to track the history of changes in a project. Commits are accompanied by commit messages that briefly describe the changes.

- [1. Category](#1-category)
  - [1.1. Conventional Commits](#11-conventional-commits)
- [2. References](#2-references)

## 1. Category

### 1.1. Conventional Commits

The [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/) specification is a standardized convention for writing commit messages. It introduces a structured and semantic way to convey the purpose and nature of changes made in a commit. A Conventional Commit contains structural elements that communicate intent to consumers of an application or library.

```plaintext
<type>(<optional scope>): <description>

[optional body]

[optional footer(s)]
```

> [!NOTE]
> Conventional Commits are often used with automated [Versioning](../articles/versioning.md) tools to generate release notes and determine version bumps based on commit history.

1. Conventions and Standards

    - Type
      > The `type` in Conventional Commits indicates the nature of the change being made. It is a required element that provides a high-level categorization of the commit, helping to convey the intent and impact of the changes to other developers and tools.

      - `feat`
        > A new feature introduced to the codebase.
        >
        > [!NOTE]
        > Correlates with `MINOR` in Semantic Versioning.

      - `fix`
        > A bug fix or correction to existing functionality.
        >
        > [!NOTE]
        > Correlates with `PATCH` in Semantic Versioning.

      - `!`
        > A commit that appends a `!` after the type or scope indicates a breaking API change. A `BREAKING CHANGE` can appear in commits of any type.
        >
        > [!NOTE]
        > Correlates with `MAJOR` in Semantic Versioning.

      - `chore`
        > Routine tasks, maintenance, or tooling changes that don't impact the user-facing features.

      - `docs`
        > Documentation-related changes, including updates or additions.

      - `style`
        > Changes that do not affect the meaning of the code, such as formatting or typographical error (typo).

      - `refactor`
        > Code restructuring or changes that do not add new features or fix bugs.

      - `test`
        > Creating, modifying, or removing testing procedures or test cases.

      - `build`
        > Changes related to the build system or external dependencies.

      - `ci`
        > Modifications to the continuous pipelines configuration and scripts.

      - `perf`
        > Performance improvements or optimizations.

      - `revert`
        > Reverting a previous commit.

    - Scope
      > The `scope` in Conventional Commits is an optional element that provides additional context about the area of the codebase affected by the commit. It is enclosed in parentheses immediately following the `type` and serves to further categorize the commit, making it easier for developers and tools to understand the specific part of the project that is impacted.

    - Description
      > The `description` in Conventional Commits is a concise summary of the changes made in the commit. It follows the `type` and optional `scope`, separated by a colon and a space. The description should be brief yet informative, providing enough context for other developers to understand the purpose of the commit at a glance.

    - Body
      > The `body` in Conventional Commits is an optional section that provides a more detailed explanation of the changes made in the commit. It follows the `description` and is separated by a blank line. The body can include additional context, rationale, or any relevant information that helps other developers understand the intent and implications of the changes.

    - Footer
      > The `footer` in Conventional Commits is an optional section that appears at the end of the commit message. It is used to reference issues, pull requests, or any other relevant information related to the commit. The footer can also include a `BREAKING CHANGE` declaration if the commit introduces a breaking API change.

2. Examples and Explanations

    - Type

      ```plaintext
      feat: commit message with focus on the `type`
      ```

      ```plaintext
      chore!: commit message with focus on the `type` and `breaking change`
      ```

    - Scope

      ```plaintext
      feat(auth): commit message with focus on the `scope`
      ```

      ```plaintext
      refactor(internal)!: commit message with focus on the `scope` and `breaking change`
      ```

    - Description

      ```plaintext
      chore: commit message with focus on the `description`
      ```

      ```plaintext
      feat: commit message with focus on the `description` (#122)
      ```

    - Body

      ```plaintext
      fix(api): commit message with focus on the `body` (#123)

      Introduce a request id and a reference to latest request. Dismiss incoming responses other than from latest request. Remove timeouts which were used to mitigate the racing issue but are obsolete now.
      ```

    - Footer

      ```plaintext
      feat(auth): commit message with focus on the `footer` reference to issues (#2)

      Closes #1
      ```

      ```plaintext
      refactor!: commit message with focus on the `footer` reference to `body` and `breaking change` (#4)

      Change to improve security and performance by updating the password hashing algorithm.

      BREAKING CHANGE: update password hashing algorithm from `Bcrypt` to `Argon`.

      Closes #3
      ```

3. Tools and Frameworks

    [Tooling for Conventional Commits](https://www.conventionalcommits.org/en/about/#tooling-for-conventional-commits) maintain a structured and consistent approach to version control, commit messages, and release management in software projects.

    - [Commitizen](https://commitizen.github.io/cz-cli/)
      > A tool that helps contributors adhere to Conventional Commit conventions by guiding them through the commit process and generating well-formatted commit messages.

    - [cz-customizable](https://github.com/leonardoanalista/cz-customizable)
      > An extension for Commitizen that allows projects to customize commit message prompts and styles according to their specific needs.

    - [Semantic Release](https://semantic-release.gitbook.io/semantic-release/)
      > Automates versioning and package publishing based on the semantic meaning of commit messages. It determines the version bump and generates release notes.

    - [Conventional Commits CLI](https://www.npmjs.com/package/conventional-commits-cli)
      > A Command Line Interface (CLI) for Conventional Commits, providing a simple way to generate commit messages following the convention.

    - [Commitlint](https://commitlint.js.org/)
      > A tool for linting commit messages, ensuring they adhere to specified conventions. Used in conjunction with Conventional Commits and Git Hooks for automated enforcement.

## 2. References

- Sentenz [Versioning](../articles/versioning.md) article.
- Sentenz [Changelog](../articles/changelog.md) article.
