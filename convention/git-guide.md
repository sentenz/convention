# Git Guide

- [1. Git](#1-git)
  - [1.1. Hooks](#11-hooks)
  - [1.2. Useful Git Commands](#12-useful-git-commands)
- [2. Branching Strategy](#2-branching-strategy)
  - [2.1. Git Flow](#21-git-flow)
  - [2.2. Trunk Based Development](#22-trunk-based-development)
    - [2.2.1. Scaled Trunk-Based Development](#221-scaled-trunk-based-development)
- [3. Conventions](#3-conventions)
  - [3.1. Semantic Versioning](#31-semantic-versioning)
    - [3.1.1. Pre-release](#311-pre-release)
  - [3.2. Conventional Commits](#32-conventional-commits)
- [4. Tools](#4-tools)
  - [4.1. Standard Version](#41-standard-version)
  - [4.2. Commitlint](#42-commitlint)
  - [4.3. Conventional Changelog](#43-conventional-changelog)
  - [4.4. Conventional Changelog Configuration Spec](#44-conventional-changelog-configuration-spec)
  - [4.5. Release Tools](#45-release-tools)

## 1. Git

[Git](https://sentenz.github.io/backup-service/website/git-scm.com/docs/git.html) is a free and open source distributed version control system.

### 1.1. Hooks

[githooks](https://sentenz.github.io/backup-service/website/git-scm.com/docs/githooks) - Hooks used by Git are programs you can place in a hooks directory to trigger actions at certain points in git command. By default the hooks directory is `$GIT_DIR/hooks`.

Some of currently supported hooks are described below:

- [applypatch-msg](https://sentenz.github.io/backup-service/website/git-scm.com/docs/githooks#_applypatch_msg)
- [pre-applypatch](https://sentenz.github.io/backup-service/website/git-scm.com/docs/githooks#_pre_applypatch)
- [post-applypatch](https://sentenz.github.io/backup-service/website/git-scm.com/docs/githooks#_post_applypatch)
- [pre-commit](https://sentenz.github.io/backup-service/website/git-scm.com/docs/githooks#_pre_commit)
- [pre-merge-commit](https://sentenz.github.io/backup-service/website/git-scm.com/docs/githooks#_pre_merge_commit)
- [prepare-commit-msg](https://sentenz.github.io/backup-service/website/git-scm.com/docs/githooks#_prepare_commit_msg)
- [commit-msg](https://sentenz.github.io/backup-service/website/git-scm.com/docs/githooks#_commit_msg)
- [post-commit](https://sentenz.github.io/backup-service/website/git-scm.com/docs/githooks#_post_commit)
- [pre-rebase](https://sentenz.github.io/backup-service/website/git-scm.com/docs/githooks#_pre_rebase)
- [post-checkout](https://sentenz.github.io/backup-service/website/git-scm.com/docs/githooks#_post_checkout)
- [post-merge](https://sentenz.github.io/backup-service/website/git-scm.com/docs/githooks#_post_merge)
- [pre-push](https://sentenz.github.io/backup-service/website/git-scm.com/docs/githooks#_pre_push)
- [pre-receive](https://sentenz.github.io/backup-service/website/git-scm.com/docs/githooks#pre-receive)
- [update](https://sentenz.github.io/backup-service/website/git-scm.com/docs/githooks#update)
- [proc-receive](https://sentenz.github.io/backup-service/website/git-scm.com/docs/githooks#proc-receive)
- [post-receive](https://sentenz.github.io/backup-service/website/git-scm.com/docs/githooks#post-receive)
- [post-update](https://sentenz.github.io/backup-service/website/git-scm.com/docs/githooks#post-update)
- [reference-transaction](https://sentenz.github.io/backup-service/website/git-scm.com/docs/githooks#_reference_transaction)

### 1.2. Useful Git Commands

- Diff

  This command shows the file differences which are not yet staged.

  ```bash
  git diff
  ```

  This command shows the differences between the two branches mentioned.

  ```bash
  git diff [first branch] [second branch]
  ```

- Amend

  Create a new message for last commit.

  ```bash
  git commit --amend
  ```

  Add a file to the last commit.

  > Append `--no-edit` to the commit command if you do not want to edit the `commit` message.

  ```bash
  git add <filename>
  git commit --amend
  ```

- Stashing

  Stash changes.

  ```bash
  git stash save
  ```

  Discard your stashed changes.

  ```bash
  git stash drop
  ```

  Apply and drop your stashed changes.

  ```bash
  git stash pop
  ```

- Refs and Log

  Use reflog to show the log of reference changes to HEAD.

  ```bash
  git reflog
  ```

  Check the Git history of a file.

  ```bash
  git log <file>
  ```

  Check the content of each change to a file.

  > Append `--follow` to the commit command, to follows it past file renames.

  ```bash
  gitk <file>
  ```

- Prune

Remove deleted and merged remote branches.

```bash
git fetch --prune
```

- Ignore

  Add it to .gitignore:

  ```bash
  echo <file> >> .gitignore
  ```

  Remove it from the index:

  ```bash
  git rm --cached <file>
  ```

  Add .gitignore to index:

  ```bash
  git add <file>
  ```

  Confirm:

  ```bash
  git status --ignored
  ```

## 2. Branching Strategy

### 2.1. Git Flow

[Git Flow](https://sentenz.github.io/backup-service/website/nvie.com/posts/a-successful-git-branching-model/index.html) branching strategy.

[The major branches](https://sentenz.github.io/backup-service/website/nvie.com/posts/a-successful-git-branching-model/index.html#the-main-branches):

- _main_
  > Consider main to be the branch where the source code of `HEAD` always reflects a _production-ready_ state.
- _develop_
  > Consider develop to be the `staging` branch where the source code of `HEAD` always reflects a state with the latest delivered development changes for the next release.

[Supporting branches](https://sentenz.github.io/backup-service/website/nvie.com/posts/a-successful-git-branching-model/index.html#supporting-branches):

- [feature](https://sentenz.github.io/backup-service/website/nvie.com/posts/a-successful-git-branching-model/index.html#feature-branches)
  > Feature branches are used to develop new features. Feature branches are created from and merged back into develop branches. Feature branches typically exist in developer repos only, not in _origin_.
- [release](https://sentenz.github.io/backup-service/website/nvie.com/posts/a-successful-git-branching-model/index.html#release-branches)
  > Release branches are created from develop branch, which contains a set of features & their associated bug fixes. Furthermore, they allow for minor bug fixes and preparing meta-data for a release (version number i.e [semver](#semantic-versioning), build dates, etc.). The release branch is then subjected to integration and regression testing. Any bugs identified during this phase is fixed and committed directly to the release branch. Once the release branch has been confirmed to be free of bugs, it is merged into the main branch and released into production. These fixes are also merged back into develop and other release branches if any exist.
- [fix](https://sentenz.github.io/backup-service/website/nvie.com/posts/a-successful-git-branching-model/index.html#hotfix-branches)
  > Fixes branches are created from main branch, when issues need an fix upon an undesired state of a live production version. Fix branches needs to be merged back into main and into develop, in order to safeguard that the bugfix is included in the next release.

The strategy contains the following rules:

1. There are only two major branches, called _main_ and _develop_.
   - Direct push to _main_ and _develop_ branches is forbidden.
2. _feature_ branches are created from and merged back into _develop_ branches.
   - Branch naming convention: `feature/ISSUETYPE-ID-short_describe`.
   - Pull requests (PR) of _feature_ branches only into _develop_ branch.
3. Merge to _develop_ branch will deploy to staging.
   - Merge _feature_ branch into _develop_ by select `Squash and merge` option on PR merge (Squashing will combine all your commits into one).
4. _release_ branches support preparation of a new production release.
   - Create _release_ branch from _develop_ (naming convention, i.e. `release/1.2.x`).
   - Pull requests (PR) of _release_ branches first into _main_ and next into _develop_ branch.
   - Release branches are deleted after they are merged. If you need a specific version, use git tags instead.
5. Merge to _main_ will create a new release version and deploy to production.
   - The merge of the _release_ branch into the _main_ branch will create a _tag_ with the release version.
   - The release version is created according to the [semver convention](#semantic-versioning) by analyzing the [commit messages](#conventional-commits).
6. _fix_ branches of production issues that need an immediate fix of a production version.
   - Create a _fix_ branch from _main_.
   - Commit fix with commit message by [commit convention](#conventional-commits), i.e `fix(scope): what was fixed`.
   - Pull requests (PR) of _fix_ branches first into _main_ and next into _develop_ branch.

### 2.2. Trunk Based Development

[Trunk-Based Development](https://sentenz.github.io/backup-service/website/trunkbaseddevelopment.com/index.html) is a source-control branching model, where developers collaborate on code in a single branch called `trunk`.

#### 2.2.1. Scaled Trunk-Based Development

[Scaled Trunk-Based Development](https://sentenz.github.io/backup-service/website/trunkbaseddevelopment.com/index.html#scaled-trunk-based-development) is done with short-lived feature branches. One developer over a couple of days (max) and flowing through Pull-Request style code-review & automation (CI/CD) before integrating (merging) into the trunk (main/mainline/major) branch.

The major branch:

- _trunk_
  > Consider trunk to be the branch where the source code of `HEAD` always contains the latest version.

Supporting branch:

- [feature](https://sentenz.github.io/backup-service/website/trunkbaseddevelopment.com/short-lived-feature-branches/index.html)
  > Short-living feature branches are used to develop new features. Feature branches are created from and merged back into _trunk_. Feature branches typically exist in developer repos only, not in _origin_. The [style](https://sentenz.github.io/backup-service/website/trunkbaseddevelopment.com/styles/index.html) of short-living feature branches is suitable for active committer counts [between 2 and 1000](https://sentenz.github.io/backup-service/website/trunkbaseddevelopment.com/styles/index.html#short-lived-feature-branches).
- [release](https://sentenz.github.io/backup-service/website/trunkbaseddevelopment.com/release-from-trunk/index.html)
  > Release branch is a cut from trunk with an optional number of cherry picks that are developed on trunk and then pulled into the branch.

The strategy and contains the following rules:

1. There is only one development branch, called _trunk_.
   - Direct push to _trunk_ branch is forbidden.
   - All development happens on the _trunk_ branch.
   - Pull requests (PR) of short-living _feature_ branches still exist.
   - Unfinished features are hidden behind [feature flags](https://sentenz.github.io/backup-service/website/trunkbaseddevelopment.com/feature-flags/index.html) until they are publish with an official release.
   - Breaking changes stay behind [feature flags](https://sentenz.github.io/backup-service/website/trunkbaseddevelopment.com/feature-flags/index.html).
   - The _trunk_ contains only backward-compatible changes and feature additions.
2. _feature_ branches are created from and merged back into _trunk_ branch.
   - Branch naming convention: _feature/ISSUETYPE-ID-short_describe_
   - Pull requests (PR) of _feature_ branches only into _trunk_ branch.
3. Merge to _trunk_ creates a release version according to the following [conventions](#conventions).
   - Merge _feature_ branch into _trunk_ by select `Squash and merge` option on PR merge (Squashing will combine all your commits into one).
   - Merging _feature_ branch into _trunk_ follows the [conventions](#conventions) style.
4. _release_ branches are cut from a specific revision of the _trunk_.
   - [Release from trunk](https://sentenz.github.io/backup-service/website/trunkbaseddevelopment.com/release-from-trunk/index.html) retroactively by selecting the revision in the past to branch from.
   - Branch naming convention, i.e. `release/1.2.x`.
5. [Fix](https://sentenz.github.io/backup-service/website/trunkbaseddevelopment.com/branch-for-release/index.html#fix-production-bugs-on-trunk) production bugs on Trunk.
   - fix bugs on the _trunk_ and cherry-picking them back to the release branch.

## 3. Conventions

### 3.1. Semantic Versioning

Semantic Versioning [SemVer](https://sentenz.github.io/backup-service/website/semver.org/index.html) is a versioning system that help us keep track of what’s going on in projects.

SemVer is a 3-component system in the format:

- `x` stands for a major version
- `y` stands for a minor version
- `z` stands for a patch

`Major`.`Minor`.`Patch`, increment cases:

- `Major` version when you make incompatible API changes
- `Minor` version when you add functionality in a backwards-compatible manner
- `Patch` version when you make backwards-compatible bug fixes

#### 3.1.1. Pre-release

With Semantic Versioning, pre-releases can be defined by appending a hyphen and an identifier to a version.

Regular releases to the `next` distribution channel from the branch `next` if it exists:

- 1.0.0 -> 1.0.0-next.1
- 1.0.0 -> 1.0.0-next.2

### 3.2. Conventional Commits

[Conventional commits](https://sentenz.github.io/backup-service/website/conventionalcommits.org/en/v1.0.0/index.html) is a specification for adding human and machine readable meaning to commit messages.

The commit message should be structured as follows:

```txt
<type>[optional scope]: <description>

[optional body]

[optional footer(s)]
```

The commit contains the following structural elements, to communicate intent to the consumers of your library:

1. _fix_
   > A commit of the type `fix` patches a bug in your codebase (this correlates with `PATCH` in [Semantic Versioning](#semantic-versioning)).
2. _feat_
   > A commit of the type `feat` introduces a new feature to the codebase (this correlates with `MINOR` in [Semantic Versioning](#semantic-versioning)).
3. _BREAKING CHANGE_
   > A commit that has a footer `BREAKING CHANGE:`, or appends a `!` after the type/scope, introduces a breaking API change (correlating with `MAJOR` in [Semantic Versioning](#semantic-versioning)). A BREAKING CHANGE can be part of commits of any type.
4. _types_ other than `fix` and `feat` are allowed:
   - _build_: Changes that affect the build system or external dependencies
   - _chore_: Other changes that don`t modify src or test files
   - _ci_: Changes to our CI configuration files and scripts
   - _docs_: Documentation only changes
   - _perf_: A code change that improves performance
   - _refactor_: A code change that neither fixes a bug nor adds a feature
   - _test_: Adding missing tests or correcting existing tests
   - _revert_: Revert a previous commit
5. _footers_ other than `BREAKING CHANGE: <description>` may be provided and follow a convention similar to [git trailer format](https://sentenz.github.io/backup-service/website/git-scm.com/docs/git-interpret-trailers/en.html).
6. _rules_ and _config_ of conventional commits [@commitlint/config-conventional](https://github.com/conventional-changelog/commitlint/tree/master/%40commitlint/config-conventional).

Additional types are not mandated by the Conventional Commits specification, and have no implicit effect in [Semantic Versioning](#semantic-versioning) (unless they include a BREAKING CHANGE). A scope may be provided to a commit’s type, to provide additional contextual information and is contained within parenthesis, e.g.:

```txt
feat(parser): allow provided config object to extend other configs

BREAKING CHANGE: `extends` key in config file is now used for extending other config files
```

## 4. Tools

[Tools](https://github.com/conventional-changelog) to generate changelogs and release notes from a project's commit messages and metadata.

### 4.1. Standard Version

A utility for automate [versioning](https://github.com/conventional-changelog/standard-version) using [Semantic Versioning](https://sentenz.github.io/backup-service/website/semver.org/index.html) and CHANGELOG generation powered by [Conventional Commits](https://sentenz.github.io/backup-service/website/conventionalcommits.org/en/v1.0.0/index.html).

### 4.2. Commitlint

[commitlint](https://github.com/conventional-changelog/commitlint) checks if the commit messages meet the [Conventional Commits](https://sentenz.github.io/backup-service/website/conventionalcommits.org/en/v1.0.0/index.html) format.

### 4.3. Conventional Changelog

[Generate changelogs](https://github.com/conventional-changelog/conventional-changelog) and release notes from a project's commit messages and metadata.

### 4.4. Conventional Changelog Configuration Spec

A spec describing the config options supported by [conventional-config](https://github.com/conventional-changelog/conventional-changelog-config-spec) for upstream tooling.

### 4.5. Release Tools

Create a GitHub/GitLab/etc. [release](https://github.com/conventional-changelog/releaser-tools) using a project's commit messages and metadata.
