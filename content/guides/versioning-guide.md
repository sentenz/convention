# Versioning Guide

- [1. Category](#1-category)
  - [Semantic Versioning (SemVer)](#semantic-versioning-semver)
    - [1.1. Release](#11-release)
    - [1.2. Pre-release](#12-pre-release)
- [2. References](#2-references)

## 1. Category

### Semantic Versioning (SemVer)

[Semantic Versioning (SemVer)](../articles/versioning.md#11-semantic-versioning-semver) and [Conventional Commits](../articles/commit.md#11-conventional-commits) are commonly combined to automate `version tags` and `CHANGELOG.md` updates in release pipelines.

#### 1.1. Release

[Semantic Versioning (SemVer)](../articles/versioning.md#11-semantic-versioning-semver) uses a three-component version format `MAJOR.MINOR.PATCH`.

1. Components and Features

    - `MAJOR`
      > Increments when incompatible changes are introduced.
      >
      > Example: `1.0.0` -> `2.0.0`

    - `MINOR`
      > Increments when new backward-compatible functionality is added.
      >
      > Example: `1.0.0` -> `1.1.0`

    - `PATCH`
      > Increments when backward-compatible fixes are introduced.
      >
      > Example: `1.0.0` -> `1.0.1`

2. Rules

    1. Commit messages should follow [Conventional Commits](../articles/commit.md#11-conventional-commits) to enable release tooling to detect change types.
    2. Versioning should follow the `MAJOR.MINOR.PATCH` format, incrementing according to the nature of changes introduced in the release.
    3. The release workflow should create a version tag and update `CHANGELOG.md`.

#### 1.2. Pre-release

Pre-release identifiers can be appended to the next target version to indicate that the release is not yet stable.

1. Components and Features

    - `rc`
      > Release candidate identifier.
      >
      > Example progression: `1.0.0` -> `1.1.0-rc.1` -> `1.1.0-rc.2` -> `1.1.0`

    - `next`
      > Distribution channel identifier for iterative upcoming releases.
      >
      > Example progression: `1.0.0` -> `1.1.0-next.1` -> `1.1.0-next.2` -> `1.1.0`

    - `alpha`
      > Unstable pre-release identifier for early testing.
      >
      > Example progression: `1.0.0` -> `1.1.0-alpha.1` -> `1.1.0-alpha.2` -> `1.1.0`

    - `beta`
      > More stable pre-release identifier for broader testing.
      >
      > Example progression: `1.0.0` -> `1.1.0-beta.1` -> `1.1.0-beta.2` -> `1.1.0`

2. Rules

    1. Pre-release versions are created from the next planned release version.
    2. Numeric suffixes (`.1`, `.2`, ...) should increment sequentially per identifier.
    3. Promoting to stable removes the pre-release suffix and publishes the final version.

## 2. References

- Sentenz [Versioning](../articles/versioning.md) article.
- Sentenz [Commit](../articles/commit.md) article.
- Sentenz [Changelog](../articles/changelog.md) article.
