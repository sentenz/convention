# Changelog

A [changelog](https://keepachangelog.com/en/1.1.0/) is a document or file that tracks and records the changes, updates, and additions made to a software project over time. It serves as a historical record of the project's evolution and provides a summary of the modifications introduced in each version or release.

- [1. Category](#1-category)
- [2. References](#2-references)

## 1. Category

Changelogs are commonly used in software development to keep stakeholders, users, and developers informed about the changes implemented in the software. They typically include information about new features, bug fixes, improvements, known issues, and other relevant details.

Changelogs can be maintained manually by the development team, or they can be automatically generated based on commit messages, pull requests, or other version control system data.

Components of Changelog:

1. Version

    Each version or release is typically assigned a unique identifier, such as a version number or a release name. This helps in tracking and distinguishing different iterations of the software.

2. Date

    The date when the release was made or the changes were implemented.

3. Categories

    Changelogs often organize changes into different categories or sections, such as `feat`, `fix`, `refactor` or `deprecated`. This grouping helps users quickly locate relevant updates based on their interests or concerns.

4. Descriptions

    Each change or update is described concisely, providing details about the specific modifications made, new features added, bugs fixed, or any other relevant information.

5. References

    Changelogs may include references to related items, such as issue tracking numbers, pull requests, or commit hashes.

Benefits of Changelog:

1. Transparency

    Users and stakeholders can easily see what changes have been made and what to expect from each software release.

2. Documentation

    Changelogs serve as historical documentation of a software project, allowing developers to understand the evolution of the codebase over time.

3. Communication

    Changelogs facilitate effective communication within the development team and with users, ensuring that everyone is aware of the changes and updates in the software.

4. Troubleshooting

    Changelogs can help users identify whether a particular issue they are experiencing has been addressed in a recent release or if it requires further investigation.

Example of Changelog in Markdown:

```markdown
# [1.2.0](https://github.com/project/compare/v1.1.0...v1.2.0) (2023-03-03)


### Bug Fixes

* add `cpmopts` to `cmp` library ([#35](https://github.com/project/issues/35)) ([3365809](https://github.com/project/commit/336580)), closes [#34](https://github.com/project/issues/34)


### Features

* create a database infrastructure ([#43](https://github.com/project/issues/43)) ([bc93f4b](https://github.com/project/commit/bc93f4)), closes [#40](https://github.com/project/issues/40)

# 1.0.0 (2022-02-14)


### Features

* initial commit ([11d5eed](https://github.com/project/commit/11d5ee))
```

## 2. References

- Sentnez [conventional commits](../convention/conventional-commits.md) article.
- Sentnez [semantic versioning](../convention/semantic-versioning.md) article.
- Github [keep a changelog](https://github.com/olivierlacan/keep-a-changelog) repository.
- GNU [style of change logs](https://www.gnu.org/prep/standards/html_node/Style-of-Change-Logs.html#Style-of-Change-Logs) article.
- Github [managing releases in a repository](https://docs.github.com/en/repositories/releasing-projects-on-github/managing-releases-in-a-repository) article.
