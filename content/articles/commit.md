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
      > Conventional Commits define several standard types to categorize the purpose of a commit. Types provide a standardized way to convey the nature of changes, making it easier to understand the history of a project. Additionally, using Conventional Commits facilitates automated versioning and release note generation.

      - `feat`
        > A new feature introduced to the codebase.
        >
        > [!NOTE]
        > This correlates with `MINOR` in Semantic Versioning.

      - `fix`
        > A bug fix or correction to existing functionality.
        >
        > [!NOTE]
        > This correlates with `PATCH` in Semantic Versioning.

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

      - `!`
        > A commit that appends a `!` after the type or scope indicates a breaking API change. A `BREAKING CHANGE` can appear in commits of any type.

        > [!NOTE]
        > `!` correlates with `MAJOR` in Semantic Versioning.

    - Scope
      > The `scope` in Conventional Commits provides context by specifying the module, component, or area of the project that a commit affects. While the use of scopes is optional to organize and categorize changes precisely.
      >
      > Scopes provide a way to quickly identify the area of the codebase affected by a commit, enhancing the readability and organization of the commit history. However, the choice of scopes is project-specific and should reflect the structure and components of the particular codebase.

    - Description
      > The `description` section of a Conventional Commit is the one-line summary that describes the purpose or nature of the change. It is the first part of the commit message and provides a quick overview of the commit.
      >
      > The description is a brief and imperative statement summarizing the change and should be concise yet informative, conveying the essence of the commit in a single line.

    - Body
      > The `body` of Conventional Commits is an optional section that provides additional context and details about the changes in the commit. It follows the one-line description and is separated from it by a blank line. The body is often used to explain motivation, describe technical details, or provide relevant background.

    - Footer
      > The `footer` of Conventional Commits is an optional section after the body, separated by a blank line, that provides additional metadata about the commit. Footers are typically used for references to related issues, breaking changes, or other relevant details.
      >
      > The use of footers enhances the commit message with structured information, making it easier to understand the context and implications of the changes. Automated tools often utilize this metadata for tasks such as generating release notes or determining version bumps.

2. Examples and Explanations

    - Type

      - Commit message with `description` and `breaking change` in the `footer`.

        ```plaintext
        feat: allow provided config object to extend other configs

        BREAKING CHANGE: extends key in config file is now used for extending other config files.
        ```

      - Commit message with `!` to draw attention to breaking change.

        ```plaintext
        feat!: send an email to the customer when a product is shipped
        ```

      - Commit message with `scope` and `!` to draw attention to breaking change.

        ```plaintext
        feat(api)!: send an email to the customer when a product is shipped
        ```

      - Commit message with both `!` and `BREAKING CHANGE` in the `footer`.

        ```plaintext
        chore!: drop support for Node 6

        BREAKING CHANGE: use JavaScript features not available in Node 6.
        ```

      - Commit message with no `scope`, no `body`, and no `footer`.

        ```plaintext
        docs: correct spelling of CHANGELOG
        ```

      - Commit message with `scope`, a multi-paragraph `body`, and multiple `footers` in a single change request.

        ```plaintext
        fix(api): prevent racing of requests (#122)

        Introduce a request id and a reference to latest request. Dismiss incoming responses other than from latest request. Remove timeouts which were used to mitigate the racing issue but are obsolete now.

        Closes #123
        ```

    - Scope

      - Commit message with focus on the `scope`.

        ```plaintext
        feat(auth): changes related to authentication
        ```

        ```plaintext
        refactor(internal): modify domain API
        ```

        ```plaintext
        chore(external): updates or modifications to project dependencies
        ```

    - Description

      - Commit message with focus on the `description`.

        ```plaintext
        feat(auth): create password reset functionality
        ```

        ```plaintext
        refactor(auth): modify password reset functionality
        ```

    - Body

      - Commit message with focus on the `body`.

        ```plaintext
        feat(auth): create password reset functionality

        This change introduces a new endpoint for resetting user passwords. It is accessible at `/api/auth/reset-password` and accepts a `POST` request with the user's email address. The endpoint then sends an email to the user with a link to reset their password.
        ```

    - Footer

      - Commit message with focus on the `footer` reference to issues.

        ```plaintext
        feat(auth): create password reset functionality

        Closes #123
        ```

      - Commit message with focus on the `footer` reference to issues and pull requests.

        ```plaintext
        feat(auth): create password reset functionality

        Closes #123

        PR #42
        ```

      - Commit message with focus on the `footer` reference to breaking changes.

        ```plaintext
        refactor(auth): modify user authentication functionality

        This change is necessary to improve security and performance. The new algorithm is more secure and faster than the previous one. However, it is incompatible with the old algorithm, so existing users will need to reset their passwords.

        BREAKING CHANGE: update password hashing algorithm from `Bcrypt` to `Argon`.

        Closes #123
        ```

      - Commit message with focus on the `footer` reference to custom footers.

        ```plaintext
        refactor(ui): modify styling

        Reviewed-by @reviewer
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
