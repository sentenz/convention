<!-- omit in toc -->
# Git Guide

- [Git](#git)
  - [Branching Strategy](#branching-strategy)
    - [Git Flow](#git-flow)
    - [Trunk Based Development](#trunk-based-development)
      - [Scaled Trunk-Based Development](#scaled-trunk-based-development)
  - [Hooks](#hooks)
  - [Useful Git Commands](#useful-git-commands)
- [Conventions](#conventions)
  - [Semantic Versioning](#semantic-versioning)
    - [Pre-release](#pre-release)
  - [Conventional Commits](#conventional-commits)
- [Tools](#tools)
  - [Standard Version](#standard-version)
  - [Commitlint](#commitlint)
  - [Conventional Changelog](#conventional-changelog)
  - [Conventional Changelog Configuration Spec](#conventional-changelog-configuration-spec)
  - [Release Tools](#release-tools)

## Git

[Git](https://sentenz.github.io/essay/website/git-scm.com/docs/git.html) is a free and open source distributed version control system.

### Branching Strategy

#### Git Flow

[Git Flow](https://sentenz.github.io/essay/website/nvie.com/posts/a-successful-git-branching-model/index.html) branching strategy.

[The major branches](https://sentenz.github.io/essay/website/nvie.com/posts/a-successful-git-branching-model/index.html#the-main-branches):

- *main*
  > Consider main to be the branch where the source code of `HEAD` always reflects a *production-ready* state.
- *develop*
  > Consider develop to be the `staging` branch where the source code of `HEAD` always reflects a state with the latest delivered development changes for the next release.

[Supporting branches](https://sentenz.github.io/essay/website/nvie.com/posts/a-successful-git-branching-model/index.html#supporting-branches):

- [feature](https://sentenz.github.io/essay/website/nvie.com/posts/a-successful-git-branching-model/index.html#feature-branches)
  > Feature branches are used to develop new features. Feature branches are created from and merged back into develop branches. Feature branches typically exist in developer repos only, not in *origin*.
- [release](https://sentenz.github.io/essay/website/nvie.com/posts/a-successful-git-branching-model/index.html#release-branches)
  > Release branches are created from develop branch, which contains a set of features & their associated bug fixes. Furthermore, they allow for minor bug fixes and preparing meta-data for a release (version number i.e [semver](#semantic-versioning), build dates, etc.). The release branch is then subjected to integration and regression testing. Any bugs identified during this phase is fixed and committed directly to the release branch. Once the release branch has been confirmed to be free of bugs, it is merged into the main branch and released into production. These fixes are also merged back into develop and other release branches if any exist.
- [fix](https://sentenz.github.io/essay/website/nvie.com/posts/a-successful-git-branching-model/index.html#hotfix-branches)
  > Fixes branches are created from main branch, when issues need an fix upon an undesired state of a live production version. Fix branches needs to be merged back into main and into develop, in order to safeguard that the bugfix is included in the next release.

The strategy contains the following rules:

1. There are only two major branches, called *main* and *develop*.
   - Direct push to *main* and *develop* branches is forbidden.
2. *feature* branches are created from and merged back into *develop* branches.
   - Branch naming convention: `feature/ISSUETYPE-ID-short_describe`.
   - Pull requests (PR) of *feature* branches only into *develop* branch.
3. Merge to *develop* branch will deploy to staging.
   - Merge *feature* branch into *develop* by select `Squash and merge` option on PR merge (Squashing will combine all your commits into one).
4. *release* branches support preparation of a new production release.
   - Create *release* branch from *develop* (naming convention, i.e. `release/1.2.x`).
   - Pull requests (PR) of *release* branches first into *main* and next into *develop* branch.
   - Release branches are deleted after they are merged. If you need a specific version, use git tags instead.
5. Merge to *main* will create a new release version and deploy to production.
   - The merge of the *release* branch into the *main* branch will create a *tag* with the release version.
   - The release version is created according to the [semver convention](#semantic-versioning) by analyzing the [commit messages](#conventional-commits).
6. *fix* branches of production issues that need an immediate fix of a production version.
   - Create a *fix* branch from *main*.
   - Commit fix with commit message by [commit convention](#conventional-commits), i.e `fix(scope): what was fixed`.
   - Pull requests (PR) of *fix* branches first into *main* and next into *develop* branch.

#### Trunk Based Development

[Trunk-Based Development](https://sentenz.github.io/essay/website/trunkbaseddevelopment.com/index.html) is a source-control branching model, where developers collaborate on code in a single branch called `trunk`.

##### Scaled Trunk-Based Development

[Scaled Trunk-Based Development](https://sentenz.github.io/essay/website/trunkbaseddevelopment.com/index.html#scaled-trunk-based-development) is done with short-lived feature branches. One developer over a couple of days (max) and flowing through Pull-Request style code-review & automation (CI/CD) before integrating (merging) into the trunk (main/mainline/major) branch.

The major branch:

- *trunk*
  > Consider trunk to be the branch where the source code of `HEAD` always contains the latest version.

Supporting branch:

- [feature](https://sentenz.github.io/essay/website/trunkbaseddevelopment.com/short-lived-feature-branches/index.html)
  >  Short-living feature branches are used to develop new features. Feature branches are created from and merged back into *trunk*. Feature branches typically exist in developer repos only, not in *origin*. The [style](https://sentenz.github.io/essay/website/trunkbaseddevelopment.com/styles/index.html) of short-living feature branches is suitable for active committer counts [between 2 and 1000](https://sentenz.github.io/essay/website/trunkbaseddevelopment.com/styles/index.html#short-lived-feature-branches).
- [release](https://sentenz.github.io/essay/website/trunkbaseddevelopment.com/release-from-trunk/index.html)
  > Release branch is a cut from trunk with an optional number of cherry picks that are developed on trunk and then pulled into the branch.

The strategy and contains the following rules:

1. There is only one development branch, called *trunk*.
   - Direct push to *trunk* branch is forbidden.
   - All development happens on the *trunk* branch.
   - Pull requests (PR) of short-living *feature* branches still exist.
   - Unfinished features are hidden behind [feature flags](https://sentenz.github.io/essay/website/trunkbaseddevelopment.com/feature-flags/index.html) until they are publish with an official release.
   - Breaking changes stay behind [feature flags](https://sentenz.github.io/essay/website/trunkbaseddevelopment.com/feature-flags/index.html).
   - The *trunk* contains only backward-compatible changes and feature additions.
2. *feature* branches are created from and merged back into *trunk* branch.
   - Branch naming convention: *feature/ISSUETYPE-ID-short_describe*
   - Pull requests (PR) of *feature* branches only into *trunk* branch.
3. Merge to *trunk* creates a release version according to the following [conventions](#conventions).
   - Merge *feature* branch into *trunk* by select `Squash and merge` option on PR merge (Squashing will combine all your commits into one).
   - Merging *feature* branch into *trunk* follows the [conventions](#conventions) style.
4. *release* branches are cut from a specific revision of the *trunk*.
   - [Release from trunk](https://sentenz.github.io/essay/website/trunkbaseddevelopment.com/release-from-trunk/index.html) retroactively by selecting the revision in the past to branch from.
   - Branch naming convention, i.e. `release/1.2.x`.
5. [Fix](https://sentenz.github.io/essay/website/trunkbaseddevelopment.com/branch-for-release/index.html#fix-production-bugs-on-trunk) production bugs on Trunk.
   - fix bugs on the *trunk* and cherry-picking them back to the release branch.

### Hooks

[githooks](https://sentenz.github.io/essay/website/git-scm.com/docs/githooks) - Hooks used by Git are programs you can place in a hooks directory to trigger actions at certain points in git command. By default the hooks directory is `$GIT_DIR/hooks`.

Some of currently supported hooks are described below:

- [applypatch-msg](https://sentenz.github.io/essay/website/git-scm.com/docs/githooks#_applypatch_msg)
- [pre-applypatch](https://sentenz.github.io/essay/website/git-scm.com/docs/githooks#_pre_applypatch)
- [post-applypatch](https://sentenz.github.io/essay/website/git-scm.com/docs/githooks#_post_applypatch)
- [pre-commit](https://sentenz.github.io/essay/website/git-scm.com/docs/githooks#_pre_commit)
- [pre-merge-commit](https://sentenz.github.io/essay/website/git-scm.com/docs/githooks#_pre_merge_commit)
- [prepare-commit-msg](https://sentenz.github.io/essay/website/git-scm.com/docs/githooks#_prepare_commit_msg)
- [commit-msg](https://sentenz.github.io/essay/website/git-scm.com/docs/githooks#_commit_msg)
- [post-commit](https://sentenz.github.io/essay/website/git-scm.com/docs/githooks#_post_commit)
- [pre-rebase](https://sentenz.github.io/essay/website/git-scm.com/docs/githooks#_pre_rebase)
- [post-checkout](https://sentenz.github.io/essay/website/git-scm.com/docs/githooks#_post_checkout)
- [post-merge](https://sentenz.github.io/essay/website/git-scm.com/docs/githooks#_post_merge)
- [pre-push](https://sentenz.github.io/essay/website/git-scm.com/docs/githooks#_pre_push)
- [pre-receive](https://sentenz.github.io/essay/website/git-scm.com/docs/githooks#pre-receive)
- [update](https://sentenz.github.io/essay/website/git-scm.com/docs/githooks#update)
- [proc-receive](https://sentenz.github.io/essay/website/git-scm.com/docs/githooks#proc-receive)
- [post-receive](https://sentenz.github.io/essay/website/git-scm.com/docs/githooks#post-receive)
- [post-update](https://sentenz.github.io/essay/website/git-scm.com/docs/githooks#post-update)
- [reference-transaction](https://sentenz.github.io/essay/website/git-scm.com/docs/githooks#_reference_transaction)

### Useful Git Commands

- Diff

  This command shows the file differences which are not yet staged.
  
  ``` bash
  git diff
  ```

  This command shows the differences between the two branches mentioned.
  
  ``` bash
  git diff [first branch] [second branch]
  ```

- Amend

  Create a new message for last commit.
  
  ``` bash
  git commit --amend
  ```

  Add a file to the last commit.
  > Append `--no-edit` to the commit command if you do not want to edit the `commit` message.
  
  ``` bash
  git add <filename>
  git commit --amend
  ```

- Stashing

  Stash changes.
  
  ``` bash
  git stash save
  ```

  Discard your stashed changes.
  
  ``` bash
  git stash drop
  ```

  Apply and drop your stashed changes.
  
  ``` bash
  git stash pop
  ```

- Refs and Log

  Use reflog to show the log of reference changes to HEAD.
  
  ``` bash
  git reflog
  ```

  Check the Git history of a file.
  
  ``` bash
  git log <file>
  ```

  Check the content of each change to a file.
  > Append `--follow` to the commit command, to follows it past file renames.
  
  ``` bash
  gitk <file>
  ```

- Prune

Remove deleted and merged remote branches.

  ``` bash
  git fetch --prune
  ```

- Ignore
  
  Add it to .gitignore:

  ``` bash
  echo <file> >> .gitignore
  ```
  
  Remove it from the index:

  ``` bash
  git rm --cached <file>
  ```
  
  Add .gitignore to index:

  ``` bash
  git add <file>
  ```
  
  Confirm:

  ``` bash
  git status --ignored
  ```

## Conventions

### Semantic Versioning

Semantic Versioning [SemVer](https://sentenz.github.io/essay/website/semver.org/index.html) is a versioning system that help us keep track of what’s going on in projects.

SemVer is a 3-component system in the format:

- `x` stands for a major version
- `y` stands for a minor version
- `z` stands for a patch

`Major`.`Minor`.`Patch`, increment cases:

- `Major` version when you make incompatible API changes
- `Minor` version when you add functionality in a backwards-compatible manner
- `Patch` version when you make backwards-compatible bug fixes

#### Pre-release

With Semantic Versioning, pre-releases can be defined by appending a hyphen and an identifier to a version.

Regular releases to the `next` distribution channel from the branch `next` if it exists:

- 1.0.0 -> 1.0.0-next.1
- 1.0.0 -> 1.0.0-next.2

### Conventional Commits

[Conventional commits](https://sentenz.github.io/essay/website/conventionalcommits.org/en/v1.0.0/index.html) is a specification for adding human and machine readable meaning to commit messages.

The commit message should be structured as follows:

```txt
<type>[optional scope]: <description>

[optional body]

[optional footer(s)]
```

The commit contains the following structural elements, to communicate intent to the consumers of your library:

1. *fix*
   > A commit of the type `fix` patches a bug in your codebase (this correlates with `PATCH` in [Semantic Versioning](#semantic-versioning)).
2. *feat*
   > A commit of the type `feat` introduces a new feature to the codebase (this correlates with `MINOR` in [Semantic Versioning](#semantic-versioning)).
3. *BREAKING CHANGE*
   > A commit that has a footer `BREAKING CHANGE:`, or appends a `!` after the type/scope, introduces a breaking API change (correlating with `MAJOR` in [Semantic Versioning](#semantic-versioning)). A BREAKING CHANGE can be part of commits of any type.
4. *types* other than `fix` and `feat` are allowed:
   - *build*: Changes that affect the build system or external dependencies
   - *chore*: Other changes that don`t modify src or test files
   - *ci*: Changes to our CI configuration files and scripts
   - *docs*: Documentation only changes
   - *perf*: A code change that improves performance
   - *refactor*: A code change that neither fixes a bug nor adds a feature
   - *test*: Adding missing tests or correcting existing tests
   - *revert*: Revert a previous commit
5. *footers* other than `BREAKING CHANGE: <description>` may be provided and follow a convention similar to [git trailer format](https://sentenz.github.io/essay/website/git-scm.com/docs/git-interpret-trailers/en.html).
6. *rules* and *config* of conventional commits [@commitlint/config-conventional](https://github.com/conventional-changelog/commitlint/tree/master/%40commitlint/config-conventional).

Additional types are not mandated by the Conventional Commits specification, and have no implicit effect in [Semantic Versioning](#semantic-versioning) (unless they include a BREAKING CHANGE). A scope may be provided to a commit’s type, to provide additional contextual information and is contained within parenthesis, e.g.:

```txt
feat(parser): allow provided config object to extend other configs

BREAKING CHANGE: `extends` key in config file is now used for extending other config files
```

## Tools

[Tools](https://github.com/conventional-changelog) to generate changelogs and release notes from a project's commit messages and metadata.

### Standard Version

A utility for automate [versioning](https://github.com/conventional-changelog/standard-version) using [Semantic Versioning](https://sentenz.github.io/essay/website/semver.org/index.html) and CHANGELOG generation powered by [Conventional Commits](https://sentenz.github.io/essay/website/conventionalcommits.org/en/v1.0.0/index.html).

### Commitlint

[commitlint](https://github.com/conventional-changelog/commitlint) checks if the commit messages meet the [Conventional Commits](https://sentenz.github.io/essay/website/conventionalcommits.org/en/v1.0.0/index.html) format.

### Conventional Changelog

[Generate changelogs](https://github.com/conventional-changelog/conventional-changelog) and release notes from a project's commit messages and metadata.

### Conventional Changelog Configuration Spec

A spec describing the config options supported by [conventional-config](https://github.com/conventional-changelog/conventional-changelog-config-spec) for upstream tooling.

### Release Tools

Create a GitHub/GitLab/etc. [release](https://github.com/conventional-changelog/releaser-tools) using a project's commit messages and metadata.
