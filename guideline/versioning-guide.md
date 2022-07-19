# Versioning Guide

- [Semantic Versioning](#semantic-versioning)
  - [Release](#release)
  - [Pre-release](#pre-release)
- [Tooling](#tooling)
  - [Semantic Release](#semantic-release)
  - [Standard Version](#standard-version)
  - [Conventional Changelog](#conventional-changelog)
  - [Conventional Changelog Configuration Spec](#conventional-changelog-configuration-spec)
  - [Release Tools](#release-tools)

## Semantic Versioning

To create a version tag follow the [semantic versioning](../convention/semantic-versioning.md). SemVer is a system that helps to keep track of versioning projects.

### Release

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

### Pre-release

With Semantic Versioning, pre-releases or release candidate (rc) for a given release can be defined by appending a hyphen and an identifier to a version.

Regular releases to the `next` distribution channel from the branch `next` if it exists:

- 1.1.0 -> 1.1.0-next.1
- 1.1.0 -> 1.1.0-rc.1

## Tooling

Tools to generate changelogs and version tag from a commit messages and metadata.

### Semantic Release

[semantic-release](https://sentenz.github.io/backup-service/website/semantic-release.gitbook.io/semantic-release/index.html) automates the whole package release workflow including: determining the next version number by `Semantic Versioning`, generating the release notes based on `Conventional Commits`, and publishing the package. Unlike `standard-version`,  `semantic-release` is meant to be executed on the CI environment after every successful build on the release branch.

### Standard Version

[standard-version](https://github.com/conventional-changelog/standard-version) is a CLI utility for automate versioning and CHANGELOG generation based on `Semantic Versioning` and `Conventional Commits`.

### Conventional Changelog

[Generate changelogs](https://github.com/conventional-changelog/conventional-changelog) and release notes from a project's commit messages and metadata.

### Conventional Changelog Configuration Spec

A spec describing the config options supported by [conventional-config](https://github.com/conventional-changelog/conventional-changelog-config-spec) for upstream tooling.

### Release Tools

Create a GitHub/GitLab/etc. [release](https://github.com/conventional-changelog/releaser-tools) using a project's commit messages and metadata.
