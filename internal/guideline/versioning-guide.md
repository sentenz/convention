# Versioning Guide

[Semantic Versioning (SemVer)](../convention/semantic-versioning.md) is a system that aids in tracking versioning projects.

- [1. Versioning](#1-versioning)
  - [1.1. Release](#11-release)
  - [1.2. Pre-release](#12-pre-release)
- [2. Tools](#2-tools)
  - [2.1. Semantic Release](#21-semantic-release)
  - [2.2. Standard Version](#22-standard-version)
  - [2.3. Conventional Changelog](#23-conventional-changelog)
  - [2.4. Conventional Changelog Configuration Spec](#24-conventional-changelog-configuration-spec)
  - [2.5. Release Tools](#25-release-tools)

## 1. Versioning

The actions to create a `version tag` and a `CHANGELOG.md` file based on the `semantic versioning` convention rely on the [commit messages](../guideline/commit-message-guide.md) following the `conventional commits` convention.

An yaml file containing actions for [continuous release pipeline](../about/continuous-pipelines.md#6-continuous-release) is triggered from base branch.

### 1.1. Release

SemVer is a 3-component system `x`.`y`.`z`:

- `x`
  > Stands for a major version. Introduces a breaking change, code that contains incompatible or significant changes.

- `y`
  > Stands for a minor version. Introduces a feature change, code that includes new backward compatible changes.

- `z`
  > Stands for a patch. Introduces a bug fix, code that contains backward compatible fix changes.

`Major`.`Minor`.`Patch`, increment cases:

- `Major`
  > Increments the version tag `1.0.0` -> `2.0.0` and modifies the `CHANGELOG.md`.

- `Minor`
  > Increments the version tag `1.0.0` -> `1.1.0` and modifies the `CHANGELOG.md`.

- `Patch`
  > Increments the version tag `1.0.0` -> `1.0.1` and modifies the `CHANGELOG.md`.

### 1.2. Pre-release

With Semantic Versioning, pre-releases or release candidate (rc) for a given release can be defined by appending a hyphen and an identifier to a version.

Regular releases to the `next` distribution channel from the branch `next` if it exists:

- `1.0.0` -> `1.1.0-rc.1` -> `1.1.0-rc.2` -> `1.1.0`

or

- `1.0.0` -> `1.1.0-next.1` -> `1.1.0-next.2` -> `1.1.0`

## 2. Tools

Tools to generate changelogs and version tag from a commit messages and metadata.

### 2.1. Semantic Release

[semantic-release](https://sentenz.github.io/backup-service/website/semantic-release.gitbook.io/semantic-release/index.html) automates the whole package release workflow including: determining the next version number by `Semantic Versioning`, generating the release notes based on `Conventional Commits`, and publishing the package. Unlike `standard-version`,  `semantic-release` is meant to be executed on the CI environment after every successful build on the release branch.

### 2.2. Standard Version

[standard-version](https://github.com/conventional-changelog/standard-version) is a CLI utility for automate versioning and CHANGELOG generation based on `Semantic Versioning` and `Conventional Commits`.

### 2.3. Conventional Changelog

[Generate changelogs](https://github.com/conventional-changelog/conventional-changelog) and release notes from a project's commit messages and metadata.

### 2.4. Conventional Changelog Configuration Spec

A spec describing the config options supported by [conventional-config](https://github.com/conventional-changelog/conventional-changelog-config-spec) for upstream tooling.

### 2.5. Release Tools

Create a GitHub/GitLab/etc. [release](https://github.com/conventional-changelog/releaser-tools) using a project's commit messages and metadata.
