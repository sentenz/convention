# Git Guide

- [Branching Strategy](#branching-strategy)
  - [Git Flow](#git-flow)
  - [Scaled Trunk-Based Development](#scaled-trunk-based-development)
- [Merging Strategy](#merging-strategy)
- [Versioning](#versioning)
  - [Pre-release](#pre-release)
- [Tooling](#tooling)
  - [Semantic Release](#semantic-release)
  - [Standard Version](#standard-version)
  - [Commitlint](#commitlint)
  - [Conventional Changelog](#conventional-changelog)
  - [Conventional Changelog Configuration Spec](#conventional-changelog-configuration-spec)
  - [Release Tools](#release-tools)

## Branching Strategy

[Branching strategy](https://sentenz.github.io/z-guide/about/branching-strategies) defines how a team uses branching to achieve this level of concurrent development.

### Git Flow

[Git Flow](https://sentenz.github.io/backup-service/website/nvie.com/posts/a-successful-git-branching-model/index.html) is a lightweight, branch-based workflow.

The repository contains two major branches with an infinite lifetime: `main` and `develop`. Next to the major branches there are supporting branches with limited life time: `feature`, `release` and `fix`.

The strategy contains the following rules:

1. There are only two major branches, called _main_ and _develop_.
   - Direct push to _main_ and _develop_ branches is forbidden.

2. _feature_ branches are created from and merged back into _develop_ branches.
   - Branch naming convention: `feature/ISSUETYPE-ID-short_describe`.
   - Pull requests (PR) of _feature_ branches only into _develop_ branch.
   - Merge _feature_ branch into _develop_ by select `Squash and merge` option on PR merge (Squashing will combine all your commits into one).
   - Features should never interact directly with _main_.

3. _release_ branches support preparation of a new production release and deploy to staging.
   - Create _release_ branch from _develop_ (naming convention, i.e. `release/1.2.x`).
   - Identified bugs are fixed and committed directly to the _release_ branch.
   - Pull requests (PR) of _release_ branches first into _main_ and next into _develop_ branch.
   - Release branches are deleted after they are merged. If you need a specific version, use git tags instead.

4. Merge to _main_ will create a new release version and deploy to production.
   - The merge of the _release_ branch into the _main_ branch will create a _tag_ with the release version.
   - The release version is created according to the [semver convention](./../convention/semantic-versioning.md) by analyzing the [commit messages](./../convention/conventional-commits.md).

5. _fix_ branches of production issues that need an immediate fix of a production version.
   - Create a _fix_ branch from _main_ (naming convention, i.e. `fix/ISSUETYPE-ID-short_describe`).
   - Commit fix with commit message by [commit convention](#conventional-commits), i.e `fix(scope): what was fixed`.
   - Pull requests (PR) of _fix_ branches first into _main_ and next into _develop_ branch.

### Scaled Trunk-Based Development

[Scaled Trunk-Based Development](https://sentenz.github.io/backup-service/website/trunkbaseddevelopment.com/index.html#scaled-trunk-based-development) is done with short-lived feature branches. One developer over a couple of days (max) and flowing through Pull-Request style code-review & automation (CI/CD) before integrating (merging) into the trunk (main) branch.

The repository contains a major branch with an infinite lifetime: `trunk` or `main`. Besides the major branch, there is only one supporting branch with a finite lifetime: `feature`.

The strategy and contains the following rules:

1. There is only one development branch, called _trunk_.
   - Direct push to _trunk_ branch is forbidden.
   - All development happens on the _trunk_ branch.
   - Pull requests (PR) of short-living _feature_ branches still exist.
   - Unfinished features are hidden behind [feature flags](https://sentenz.github.io/backup-service/website/trunkbaseddevelopment.com/feature-flags/index.html) until they are publish with an official release.
   - Breaking changes stay behind [feature flags](https://sentenz.github.io/backup-service/website/trunkbaseddevelopment.com/feature-flags/index.html).
   - The _trunk_ contains only backward-compatible changes and feature additions.

2. _feature_ branches are created from and merged back into _trunk_ branch.
   - Branch naming convention: `feature/ISSUETYPE-ID-short_describe`.
   - Pull requests (PR) of _feature_ branches only into _trunk_ branch.

3. Merge to _trunk_ creates a release version.
   - Merge _feature_ branch into _trunk_ by select `Squash and merge` option on PR merge (Squashing will combine all your commits into one).
   - The release version is created according to the [semver convention](./../convention/semantic-versioning.md) by analyzing the [commit messages](./../convention/conventional-commits.md).

4. _release_ branches are cut from a specific revision of the _trunk_.
   - [Release from trunk](https://sentenz.github.io/backup-service/website/trunkbaseddevelopment.com/release-from-trunk/index.html) retroactively by selecting the revision in the past to branch from.
   - Branch naming convention, i.e. `release/1.2.x`.

5. [Fix](https://sentenz.github.io/backup-service/website/trunkbaseddevelopment.com/branch-for-release/index.html#fix-production-bugs-on-trunk) production bugs on Trunk.
   - fix bugs on the _trunk_ and cherry-picking them back to the release branch.

## Merging Strategy

## Versioning

We follow [SemVer](https://sentenz.github.io/backup-service/website/semver.org/index.html) semantic versioning to create versions. SemVer is a system that helps to keep track of versioning projects.

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

Tools to generate changelogs and release notes from a project's commit messages and metadata.

### Semantic Release

[semantic-release](https://sentenz.github.io/backup-service/website/semantic-release.gitbook.io/semantic-release/index.html) automates the whole package release workflow including: determining the next version number by `Semantic Versioning`, generating the release notes based on `Conventional Commits`, and publishing the package. Unlike `standard-version`,  `semantic-release` is meant to be executed on the CI environment after every successful build on the release branch.

### Standard Version

[standard-version](https://github.com/conventional-changelog/standard-version) is a CLI utility for automate versioning and CHANGELOG generation based on `Semantic Versioning` and `Conventional Commits`.

### Commitlint

[commitlint](https://github.com/conventional-changelog/commitlint) tooling for Conventional Commits. Checks if the commit messages meet the Conventional Commits format.

### Conventional Changelog

[Generate changelogs](https://github.com/conventional-changelog/conventional-changelog) and release notes from a project's commit messages and metadata.

### Conventional Changelog Configuration Spec

A spec describing the config options supported by [conventional-config](https://github.com/conventional-changelog/conventional-changelog-config-spec) for upstream tooling.

### Release Tools

Create a GitHub/GitLab/etc. [release](https://github.com/conventional-changelog/releaser-tools) using a project's commit messages and metadata.
