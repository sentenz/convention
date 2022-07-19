# Branching Strategies Guide

[Branching strategies](../about/branching-strategies.md) defines how a team uses branching to achieve this level of concurrent development.

- [Git Flow](#git-flow)
- [Scaled Trunk-Based Development](#scaled-trunk-based-development)

## Git Flow

[Git Flow](../about/branching-strategies.md#git-flow) is a lightweight, branch-based workflow.

The repository contains two base branches with an infinite lifetime:

- `main` and `develop`.

Next to the base branches there are supporting branches with limited life time:

- `feature`, `release` and `fix`.

The strategy contains the following rules:

1. There are only two base branches, called *main* and *develop*.
   - Direct push to *main* and *develop* branches is forbidden.

2. *feature* branches are created from and merged back into *develop* branches.
   - Branch naming convention: `feature/[ISSUETYPE-ID]-[short-describe]`.
   - Pull requests (PR) of *feature* branches only into *develop* branch.
   - Merge *feature* branch into *develop* by select `Squash and merge` option on PR merge (Squashing will combine all commits into one).
   - Features should never interact directly with *main*.

3. Merge to *main* will create a new release version and deploy to production.
   - Merge of the *release* branch into the *main* branch will create a *tag* with the release version.
   - The release version is created according to the [semver convention](../convention/semantic-versioning.md) by analyzing the [commit messages](../convention/conventional-commits.md).

4. *release* branches support preparation of a new production release and deploy to staging.
   - Create *release* branch from *develop* (naming convention, i.e. `release/[1.2.x]`).
   - Identified bugs are fixed and committed directly to the *release* branch.
   - Pull requests (PR) of *release* branches first into *main* and next into *develop* branch.

5. *fix* branches of production issues that need an immediate fix of a production version.
   - Create a *fix* branch from *main* (naming convention, i.e. `fix/[ISSUETYPE-ID]-[short-describe]`).
   - Commit fix with commit message by [conventional commits](../convention/conventional-commits.md), i.e `fix(scope): what was fixed`.
   - Pull requests (PR) of *fix* branches first into *main* and next into *develop* branch.

6. Pull requests (PR) title should follow the [conventional commits](../convention/conventional-commits.md).

7. Supporting branches are to be deleted after merging.

## Scaled Trunk-Based Development

[Scaled Trunk-Based Development](../about/branching-strategies.md#scaled-trunk-based-development) is done with short-lived feature branches. One developer over a couple of days (max) and flowing through Pull-Request style code-review & automation (CI/CD) before integrating (merging) into the trunk (main) branch.

The repository contains one base branch with an infinite lifetime:

- `trunk` or `main`.

Next to the base branches there are supporting branches with limited life time:

- `feature` and `release`.

The strategy contains the following rules:

1. There is only one base branch, called *main*.
   - Direct push to *main* branch is forbidden.
   - All development happens on the *main* branch.
   - Pull requests (PR) of short-living *feature* branches still exist.
   - Unfinished features are hidden behind [feature flags](https://sentenz.github.io/backup-service/website/trunkbaseddevelopment.com/feature-flags/index.html) until they are publish with an official release.
   - Breaking changes stay behind [feature flags](https://sentenz.github.io/backup-service/website/trunkbaseddevelopment.com/feature-flags/index.html).
   - The *main* contains only backward-compatible changes and feature additions.

2. *feature* branches are created from and merged back into *main* branch.
   - Branch naming convention: `feature/[ISSUETYPE-ID]-[short-describe]`.
   - Pull requests (PR) of *feature* branches only into *main* branch.
   - Merge *feature* branch into *main* by select `Squash and merge` option on PR merge (Squashing will combine all commits into one).

3. Merge to *main* creates a release version.
   - Merge of the *feature* branch into the *main* branch will create a *tag* with the release version.
   - The release version is created according to the [semver convention](../convention/semantic-versioning.md) by analyzing the [commit messages](../convention/conventional-commits.md).

4. *release* branches are cut from a specific revision of the *main*.
   - Release from [main](https://sentenz.github.io/backup-service/website/trunkbaseddevelopment.com/release-from-trunk/index.html) retroactively by selecting the revision in the past to branch from.
   - Branch naming convention, i.e. `release/[1.2.x]`.

5. [Fix](https://sentenz.github.io/backup-service/website/trunkbaseddevelopment.com/branch-for-release/index.html#fix-production-bugs-on-trunk) production bugs.
   - Create a *feature* branch from *main* (naming convention, i.e. `feature/[ISSUETYPE-ID]-[fix]-[short-describe]`).
   - Fix bugs on the *feature* and cherry-picking them back to the release branch.

6. Pull requests (PR) title should follow the [conventional commits](../convention/conventional-commits.md).

7. Supporting branches are to be deleted after merging.
