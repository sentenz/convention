# Changelog

A changelog is a record of notable changes made to a project, including features, fixes, improvements, and other modifications. It provides a chronological overview of releases and helps users and contributors understand how the software evolves over time.

- [1. Category](#1-category)
  - [1.1. Keep a Changelog](#11-keep-a-changelog)
- [2. References](#2-references)

## 1. Category

### 1.1. Keep a Changelog

[Keep a Changelog](https://keepachangelog.com/en/1.1.0/) is a convention for documenting changes in software development. It provides a structured approach to creating and maintaining changelogs, facilitating effective communication about the evolution of the software over different versions.

By adhering to this convention, teams can maintain a well-organized, readable, and consistently formatted changelog.

1. Files and Folders

    - `CHANGELOG.md`
      > A changelog file which contains a curated, chronologically ordered list of notable changes for each version of a project.

      ```markdown
      # Changelog

      ## [Unreleased]

      ### Added

      - add support for environment-based configuration loading

      ## [1.1.0] - 2019-02-15

      ### Added

      - create Danish translation (#297)
      - create Georgian translation (#337)

      ## [1.0.1] - 2018-01-11

      ### Fixed

      - change Italian translation (#332)
      - change Indonesian translation (#336)

      ## [1.0.0] - 2017-06-20

      ### Added

      - create Italian translation (#253)
      - create Indonesian translation (#321)
      ```

2. Components and Features

    - Version Header
      > Each version entry starts with a header containing the version number and release date. The version header in a changelog typically follows the Semantic Versioning (SemVer) format.
      >
      > The header clearly indicates the version number and release date. It serves as a marker for the beginning of a new section in the changelog, detailing the changes introduced in that particular release.

      ```markdown
      ## [Version Number] - Release Date
      ```

    - Readable Date Format
      > Using a readable date format in the version header enhances the clarity of the changelog. The date format represents a specific date in the ISO standard `YYYY-MM-DD`. [ISO 8601](https://www.iso.org/iso-8601-date-and-time-format.html) is an international standard for representing date and time in a machine-readable format. The date represents and provides a clear reference point for when a particular version was released.

      ```markdown
      ## [1.1.0] - 2019-02-15
      ```

    - Type Labels
      > Type labels categorize changes in a changelog, providing a clear indication of the nature of each modification. Each type label is followed by specific entries describing the corresponding changes made in that category. This categorization helps users and developers quickly understand the purpose of each modification in the software.

      - `Added`
        > Introducing new features or functionalities.

        ```markdown
        ### Added

        - introduce new authentication module
        ```

      - `Changed`
        > Modifications or updates to existing features.

        ```markdown
        ### Changed

        - update UI color scheme
        ```

      - `Deprecated`
        > Signifying features that are marked for removal in future releases.

        ```markdown
        ### Deprecated

        - MarkingFunction() will be removed in v2.0.0
        ```

      - `Removed`
        > Elimination of existing features or components.

        ```markdown
        ### Removed

        - remove deprecated API endpoint

        ### BREAKING CHANGES

        - version bump of the API endpoint from `v1` to `v2`
        ```

      - `Fixed`
        > Resolving bugs or issues.

        ```markdown
        ### Fixed

        - resolve bug causing app crash on startup
        ```

      - `Security`
        > Addressing security-related changes or patches.

        ```markdown
        ### Security

        - patch critical security vulnerability
        ```

    - Links to Issues
      > Links to relevant issues, pull requests, or commit hashes associated with each change for detailed context. This provides additional context and allows users or developers to access more detailed information if needed. By adding links, users and developers can access detailed information related to specific changes, enhancing the transparency and traceability of the development process.

      ```markdown
      ### Fixed

      - resolve null pointer exception, issue [#123](https://github.com/example/repo/issues/123), merge [#456](https://github.com/example/repo/pull/456)
      ```

    - Consistent Formatting
      > Consistent formatting in a changelog ensures a uniform structure for each entry to improve readability and helps readers quickly scan release notes.

      ```markdown
      ### Added

      - new feature description

      ### Changed

      - updated component XYZ to use asynchronous calls
      ```

3. Tools and Frameworks

    The generation and management of changelogs using these tools and frameworks streamlines the process of maintaining accurate and consistent changelogs in software development.

    - [semantic-release](https://github.com/semantic-release/semantic-release)
      > Automates versioning, releases, and generates a changelog using [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/) and [Semantic Versioning (SemVer)](https://semver.org/).

    - [Release Please](https://github.com/googleapis/release-please)
    > Release Please automates changelog generation, release pull requests, and version bumps for projects based on commit history conventions.

    - [auto-changelog](https://github.com/cookpete/auto-changelog)
      > A command-line tool that generates a changelog based on Git metadata.

    - [release-it](https://github.com/release-it/release-it)
      > Automates versioning, releases, and changelog generation with additional features like pre-release and post-release hooks.

    - [git-cliff](https://github.com/orhun/git-cliff)
      > git-cliff generates changelog files from Git history, supporting Conventional Commits.

    - [Changie](https://changie.dev/)
      > Automated tool for preparing releases with changelogs and version management.

    - [Commitizen](https://github.com/commitizen-tools/commitizen)
      > Commitizen is a release management tool to maintain consistent commit messages while automating version management with generated changelog.

## 2. References

- Sentenz [Commit](../articles/commit.md) article.
- Sentenz [Versioning](../articles/versioning.md) article.
