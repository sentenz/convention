# Conventional Commits

[Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/) is a commit message convention that provides a standardized and structured format for commit messages in software development projects. It aims to make commit messages more readable, informative, and useful for both humans and automated tools.

- [1. Category](#1-category)
  - [1.1. Structure](#11-structure)
  - [1.2. Types](#12-types)
- [2. Principles](#2-principles)
- [3. Best Practice](#3-best-practice)
- [4. Terminology](#4-terminology)
- [5. References](#5-references)

## 1. Category

Conventional Commits provide a consistent and informative commit message format, making it easier for developers, reviewers, and automated tools to understand the purpose and impact of each commit in a project.

Conventional Commits help with automated tools like release notes generators, [changelogs](../convention/changelog.md), and [semantic versioning](../convention/semantic-versioning.md) systems. By following this convention, teams can create more structured commit histories, making it easier to understand the changes made to the codebase over time.

> NOTE Conventional Commits is a convention and not a strict requirement. Its adoption and enforcement depend on the development team and the project's guidelines.

### 1.1. Structure

The structure of a Conventional Commit follows a specific format to provide a standardized and consistent way of writing commit messages. A Conventional Commit message consists of the `header`, the `body`, and the `footer`.

Structure of Conventional Commits:

1. Header

    The header is the first line of the commit message and contains essential information about the commit. It has the following format:

    ```markdown
    <type>(<scope>): <subject>
    ```

    - `<type>`
      > Indicates the type of the commit, such as a new feature (`feat`), bug fix (`fix`), documentation update (`docs`), etc.

    - `<scope>` (optional)
      > Denotes the scope or module of the project that the commit affects. It can be a specific component, file, or functionality. The scope is enclosed in parentheses.

    - `<subject>`
      > Briefly describes the commit's purpose in a concise and imperative manner (e.g., `add authentication module`, `fix validation bug`).

2. Body

    The body of the commit message provides additional information about the commit. It is optional but highly recommended, especially for complex changes. The body should be wrapped at 72 characters and provides more details about the motivation behind the change, any related issues, or any other relevant contextual information.

3. Footer

    The footer section is also optional and is used for providing any additional information related to the commit. Some common uses of the footer include referencing issues or tasks, documenting breaking changes, listing co-authored-by details, or including links to external resources.

Example of Conventional Commits:

Example of a complete Conventional Commit message with all three parts:

```markdown
feat(user): add password reset functionality

- Implement the password reset feature according to user requirements.
- Add an API endpoint for initiating password reset.
- Include email notification to the user with reset instructions.

Closes #123
```

In the example:

- The header indicates that it is a new feature (`feat`) related to the user module (`user`).
- The body provides a bulleted list describing the implementation details.
- The footer references the issue number `#123` that this commit resolves or relates to.

### 1.2. Types

Conventional Commits categorize commits into different types to provide more context and make it easier to understand the nature of the changes. While the conventional commit types can vary slightly depending on the project and team preferences.

> NOTE The convention also allows for additional commit types and scopes specific to the project's needs.

Types of Conventional Commits:

1. `feat`

    Used for commits that introduce new features or functionalities to the project. It indicates the addition of significant user-visible changes.

2. `fix`

    Commits categorized as `fix` address bug fixes or resolve issues in the codebase. They indicate corrections to existing features or functionality.

3. `docs`

    Documentation plays a vital role in software projects. The `docs` category is used for commits that update or add documentation, including readme files, API documentation, or user guides.

4. `style`

    The `style` category is used for commits that focus on code style changes, such as formatting, indentation, or whitespace modifications. These commits do not affect the functionality of the code but improve its readability and maintainability.

5. `refactor`

    Commits categorized as `refactor` involve making changes to the codebase that neither fix a bug nor add a new feature. Refactoring aims to improve code structure, organization, or efficiency without changing external behavior.

6. `test`

    Used for changes that add or modify test cases, test frameworks, or other related testing infrastructure.

7. `chore`

    Typically used for routine or miscellaneous tasks related to the project, such as code reformatting, updating dependencies, or making general project maintenance.

8. `build`

    Used when a commit affects the build system or external dependencies. It includes changes to build scripts, configurations, or tools used in the project.

9. `ci`

    Stands for `continuous integration`. This type is used for changes to the project's continuous integration or deployment configurations, scripts, or infrastructure.

10. `perf`

    Short for `performance`, this type is used when a commit improves the performance of the code or optimizes certain functionalities.

## 2. Principles

While Conventional Commits provide a specific structure and format for commit messages, there are some underlying principles and benefits associated with their adoption. By adhering to these principles, Conventional Commits foster clarity, collaboration, and maintainability in software development projects. They promote better communication and documentation practices, simplify versioning and release processes, and improve overall code quality and project management.

- Readability and Understandability
  > Conventional Commits aim to make commit messages more readable and understandable for humans. By following a standardized format and including clear and concise information, it becomes easier for developers, reviewers, and other stakeholders to grasp the purpose and impact of each commit.

- Semantic Versioning
  > Conventional Commits align with semantic versioning principles. By categorizing commits into types such as `feat` (new feature), `fix` (bug fix), or `chore` (maintenance), it becomes possible to automate the generation of release notes and determine the appropriate version numbers based on the types of changes introduced.

- Changelog Generation
  > Conventional Commits enable automated changelog generation. The structured commit messages provide the necessary information to generate changelogs, which summarize the changes between different versions of the software. This helps users and stakeholders easily track and understand the evolution of the project.

- Collaboration and Code Review
  > Consistent commit message formats improve collaboration within development teams. Clear commit messages enhance code review processes, allowing reviewers to understand the intent and impact of changes more efficiently. It helps maintain a clean commit history and makes it easier to trace back changes when needed.

- Documentation and Communication
  > Conventional Commits contribute to better documentation and communication practices. By providing meaningful commit messages, projects can establish a historical record of changes, including the reasoning behind each change. This documentation serves as a valuable resource for future developers, maintainers, and users who need to understand the evolution of the codebase.

- Tooling and Automation
  > Conventional Commits facilitate the development of tooling and automation around commit messages. Various tools, such as release note generators, semantic versioning plugins, and commit message linters, can leverage the structured commit format to automate tasks and extract useful information from commit messages.

## 3. Best Practice

The effective implementation of Conventional Commits in a project, improves code quality, leads to better collaboration and streamlined release processes.

- Consistency
  > Consistency is key to deriving the maximum benefit from Conventional Commits. Ensure that all developers in a project follow the convention consistently to maintain a unified commit history and facilitate automated tooling.

- Clear and Concise Messages
  > Write commit messages that are clear, concise, and describe the purpose of the change. Use imperative verbs in the subject line and provide additional details in the body when necessary.

- Scope Appropriately
  > Use the optional scope element in the header to indicate the specific module, component, or area of the project that the commit affects. Keep scopes meaningful and relevant to provide more context to readers.

- Separate Concerns
  > Keep commits focused on a single concern or change. If a commit involves multiple unrelated changes, consider splitting them into separate commits to maintain clarity and facilitate easier review.

- Use Body and Footer When Needed
  > Provide additional information in the body section when the commit requires more context or explanation. Use the footer to reference related issues, document breaking changes, or include other relevant details.

- Follow Semantic Versioning
  > Consider the impact of the commit and choose the appropriate commit type (`feat`, `fix`, etc.) according to semantic versioning guidelines. This helps automate versioning and release processes.

- Use Tooling and Automation
  > Leverage tools and plugins that support Conventional Commits. These tools can automate the generation of release notes, changelogs, and enforce commit message formats. They can also help ensure consistent adherence to the convention across the team.

- Integrate with Workflows
  > Integrate Conventional Commits into the development workflows and processes. For example, as a requirement for pull requests or code reviews, or incorporate it into the continuous integration/continuous delivery (CI/CD) pipeline.

- Educate and Communicate
  > Educate the development team about Conventional Commits and its benefits. Encourage open discussions and provide guidance on how to write effective commit messages. Clear communication and understanding within the team lead to better adoption and collaboration.

## 4. Terminology

The terms are fundamental to understanding and working with Conventional Commits. By using this terminology consistently, developers can effectively communicate and document the changes made to the codebase in a structured and standardized manner.

- Commit
  > In version control systems like Git, a commit represents a snapshot of the changes made to the codebase at a particular point in time. It includes a commit message describing the changes.

- Commit Message
  > A commit message is a textual description of the changes introduced in a commit. In the context of Conventional Commits, the commit message follows a specific format and structure to provide standardized and meaningful information about the commit.

- Header
  > The header is the first line of a commit message and contains the essential information about the commit, including the type, scope, and subject of the changes. It follows the format `<type>(<scope>): <subject>`.

- Type
  > The type represents the category or nature of the changes made in a commit. Common types include `feat` (new feature), `fix` (bug fix), `docs` (documentation update), `style` (code style changes), `refactor` (code refactoring), `test` (adding or modifying tests), and `chore` (maintenance tasks or non-functional changes).

- Scope
  > The scope (optional) provides additional context about the portion of the codebase that the commit affects. It can be a specific component, module, file, or functionality. The scope is enclosed in parentheses and helps narrow down the scope of the changes.

- Subject
  > The subject is a brief and concise description of the commit's purpose or the main change introduced. It should be written in an imperative form, starting with a verb. For example, `add authentication module` or `fix validation bug`.

- Body
  > The body (optional) is the section of the commit message that provides additional information and details about the changes made in the commit. It can include a more extensive description, motivations, references to related issues, or any other relevant contextual information.

- Footer
  > The footer (optional) is the section of the commit message that appears after an empty line following the body. It can include supplementary information such as references to related issues or tasks, breaking changes, co-authored-by details, or links to external resources.

## 5. References

- Sentnez [commit message guide](../guides/commit-message-guide.md) article.
- Sentnez [semantic versioning](../convention/semantic-versioning.md) article.
- Sentnez [changelog](../convention/changelog.md) article.
- Github [conventional commits](https://github.com/conventional-commits/conventionalcommits.org) repository.
