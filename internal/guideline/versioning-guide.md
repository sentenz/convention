# Versioning Guide

[Semantic Versioning (SemVer)](../../internal/convention/semantic-versioning.md) is a system that aids in tracking versioning projects.

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

The actions to create a `version tag` and a `CHANGELOG.md` file based on the `semantic versioning` convention rely on the [commit messages](../../internal/guideline/commit-message-guide.md) following the `conventional commits` convention.

An yaml file containing actions for [continuous release pipeline](../../internal/about/continuous-pipelines.md#6-continuous-release) is triggered from base branch.

### 1.1. Release

SemVer is a 3-component system in the format:

- `x`
  > Stands for a major version.

- `y`
  > Stands for a minor version.

- `z`
  > Stands for a patch.

`Major`.`Minor`.`Patch`, increment cases:

- `Major`
  > Version when code is incompatible or contains significant changes

- `Minor`
  > Version when code has been changed but the changes are backwards compatible

- `Patch`
  > Version when backwards-compatible bug fixes have been made

### 1.2. Pre-release

With Semantic Versioning, pre-releases or release candidate (rc) for a given release can be defined by appending a hyphen and an identifier to a version.

Regular releases to the `next` distribution channel from the branch `next` if it exists:

- 1.1.0 -> 1.1.0-next.1
- 1.1.0 -> 1.1.0-rc.1

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
