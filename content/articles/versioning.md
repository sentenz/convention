# Versioning

Versioning is the practice of assigning unique identifiers to software releases. It makes it possible to track and distinguish different iterations, ensuring that changes are managed systematically over time.

- [1. Category](#1-category)
  - [1.1. Semantic Versioning (SemVer)](#11-semantic-versioning-semver)
  - [1.2. Calendar Versioning (CalVer)](#12-calendar-versioning-calver)
- [2. References](#2-references)

## 1. Category

### 1.1. Semantic Versioning (SemVer)

[Semantic Versioning (SemVer)](https://semver.org/) is a versioning convention designed for software libraries and applications to communicate the nature of changes in a standardized way. SemVer follows a three-part version number format `MAJOR.MINOR.PATCH`.

1. Conventions and Standards

    - MAJOR
      > Increments the MAJOR version in case of incompatible API changes.
      >
      > Example: `1.0.0` → `2.0.0`

    - MINOR
      > Increments the MINOR version when adding backward-compatible functionality.
      >
      > Example: `1.0.0` → `1.1.0`

    - PATCH
      > Increments the PATCH version for backward-compatible bug fixes.
      >
      > Example: `1.0.0` → `1.0.1`

    - Pre-release
      > A pre-release version indicates that the release is unstable and might not satisfy the intended compatibility requirements denoted by its associated normal version.
      >
      > Examples: `1.0.0-alpha`, `1.0.0-alpha.1`, `1.0.0-0.3.7`, `1.0.0-x.7.z.92`.

    - Build metadata
      > Build metadata `MAY` be denoted by appending a plus sign and a series of dot-separated identifiers immediately following the patch or pre-release version. Identifiers `MUST` comprise only ASCII alphanumerics and hyphen `[0-9A-Za-z-]`. Identifiers `MUST NOT` be empty. Build metadata `SHOULD` be ignored when determining version precedence. Thus, two versions that differ only in build metadata have the same precedence.
      >
      > Examples: `1.0.0-alpha+001`, `1.0.0+20130313144700`, `1.0.0-beta+exp.sha.5114f85`.

2. Tools and Frameworks

    - [semantic-release](https://github.com/semantic-release/semantic-release)
      > semantic-release automates the package release workflow, including determining the next version number, generating the release notes, and publishing the package. A utility for versioning using `SemVer` and `CHANGELOG` generation powered by `Conventional Commits`.

    - [commit-and-tag-version](https://github.com/absolute-version/commit-and-tag-version)
      > commit-and-tag-version automates the versioning and CHANGELOG generation process. A utility for versioning using `SemVer` and `CHANGELOG` generation powered by `Conventional Commits`.

    - [release-please](https://github.com/googleapis/release-please)
      > release-please automates CHANGELOG generation, the creation of GitHub releases, and version tags. A utility for versioning using `SemVer` and `CHANGELOG` generation powered by `Conventional Commits`.

### 1.2. Calendar Versioning (CalVer)

[Calendar Versioning (CalVer)](https://calver.org/) is a versioning scheme that uses dates as the basis for version numbers, providing a human-readable and chronological representation of software releases. CalVer commonly uses date-based identifiers such as `YYYY.MM.DD` and can be extended with an additional segment like `MICRO`.

> [!NOTE]
> The components allow flexibility in choosing the level of granularity for versioning, depending on the project's needs. Combine these components to form version numbers based on the desired level of detail and chronological representation. For example, a version could be represented as `YYYY.MM`, `YY.0M`, `YY.0M.MICRO`, or `YY.WW`.

1. Conventions and Standards

    - `YYYY`
      > Full year.
      >
      > Example: 2006, 2016, 2106

    - `YY`
      > Short year.
      >
      > Example: 6, 16

    - `0Y`
      > Short year with zero padding.
      >
      > Example: 06, 16

    - `MM`
      > Month of the year.
      >
      > Example: 1, 2, 11, 12

    - `0M`
      > Month of the year with a zero-padded.
      >
      > Example: 01, 02, 11, 12

    - `WW`
      > Week of the year.
      >
      > Example: 1, 2, 33, 52

    - `0W`
      > Week of the year with a zero-padded.
      >
      > Example: 01, 02, 33, 52

    - `DD`
      > Day of the month.
      >
      > Example: 1, 2, 30, 31

    - `0D`
      > Day of the month with a zero-padded.
      >
      > Example: 01, 02, 30, 31

    - `MICRO`
      > A counter for releases on the same day. Numerical value indicating a micro version or build identifier. Optionally add a modifier to the version, such as `dev`, `alpha`, `beta`, or `rc1`.
      >
      > Example: 1, 8, 21, 103, 21-alpha, 103-rc1

2. Tools and Frameworks

    - [release-calver](https://github.com/Practically/Conventional-Tools)
      > release-calver automates the versioning and CHANGELOG generation process.

## 2. References

- Sentenz [Commit](../articles/commit.md) article.
- Sentenz [Changelog](../articles/changelog.md) article.
