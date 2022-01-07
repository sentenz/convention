# CI/CD Guide

- [1. CD](#1-cd)
  - [1.1. Semantic Release](#11-semantic-release)

## 1. CD

### 1.1. Semantic Release

[semantic-release](https://sentenz.github.io/backup-service/website/semantic-release.gitbook.io/semantic-release/index.html) is meant to be executed on the CI environment after every successful build on the release branch.

[FAQ](https://github.com/semantic-release/semantic-release/blob/master/docs/support/FAQ.md)

**Triggering a release** for each new commits added to one of the release branches (for example main, develop, feature), with git push or by merging a pull request or merging from another branch, a CI build is triggered and runs the semantic-release command to make a release if there are codebase changes since the last release that affect the package functionalities.
semantic-release offers various ways to control the timing, the content and the audience of published releases. See example workflows in the following recipes:

- [Using distribution channels](https://github.com/semantic-release/semantic-release/blob/master/docs/recipes/release-workflow/distribution-channels.md)
- [Maintenance releases](https://github.com/semantic-release/semantic-release/blob/master/docs/recipes/release-workflow/maintenance-releases.md)
- [Pre-releases](https://github.com/semantic-release/semantic-release/blob/master/docs/recipes/pre-releases.md)

Lint commit messages with [commitlint](https://github.com/conventional-changelog/commitlint). Alternatively, you can run [Commitlint Github Action](https://github.com/wagoid/commitlint-github-action) in the CI workflow.

Links to implement semantic release into github workflow

- [How to Automate Project Versioning and Releases with Continuous Deployment](https://css-tricks.com/how-to-automate-project-versioning-and-releases-with-continuous-deployment/).
- [Continuous Deployment with Semantic Release and GitHub Actions](https://github.com/semantic-release/semantic-release/blob/master/docs/recipes/release-workflow/pre-releases.md).

- [semantic-release](https://github.com/semantic-release/semantic-release) tool for an full automated release and changelog. Get more information in [GIT_GUIDE](https://github.com/sentenz/general/blob/main/docs/guide/convention/CICD_GUIDE.md#semantic-release).
  > Configure in the project.
  >
  > - [.releaserc.json](https://github.com/semantic-release/semantic-release/blob/master/docs/usage/configuration.md#configuration-file)
  > - [package.json](https://github.com/semantic-release/semantic-release/blob/master/package.json)
  > - [package-lock.json](https://github.com/semantic-release/semantic-release/blob/master/package-lock.json)
