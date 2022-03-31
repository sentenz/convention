# Branching Strategies // TODO

A branching strategy refers to the strategy that a software development team uses when writing, merging, and shipping code in the context of a version control system (VCS) such as Git.

- [Git Flow](#git-flow)
- [GitHub Flow // TODO](#github-flow--todo)
- [Release Flow // TODO](#release-flow--todo)
- [Trunk-Based Development](#trunk-based-development)
- [Scaled Trunk-Based Development](#scaled-trunk-based-development)
- [See also](#see-also)

A branching strategy defines how a team uses branching to achieve this level of concurrent development.

## Git Flow

[Git flow](https://nvie.com/posts/a-successful-git-branching-model/) is a branching model for Git, created by Vincent Driessen in 2010.

The strategy of Git flow is to isolate the work into different types of branches. The two primary branches in Git flow are `main` and `develop`. There are three types of supporting branches with different intended purposes: `feature`, `release`, and `hotfix`.

[The major branches](https://sentenz.github.io/backup-service/website/nvie.com/posts/a-successful-git-branching-model/index.html#the-main-branches):

- _main_
  > Consider main to be the branch where the source code of `HEAD` always reflects a _production-ready_ state.

- _develop_
  > Consider develop to be the `staging` branch where the source code of `HEAD` always reflects a state with the latest delivered development changes for the next release.

[Supporting branches](https://sentenz.github.io/backup-service/website/nvie.com/posts/a-successful-git-branching-model/index.html#supporting-branches):

- [feature](https://sentenz.github.io/backup-service/website/nvie.com/posts/a-successful-git-branching-model/index.html#feature-branches)
  > Feature branches are used to develop new features. Feature branches are created from and merged back into develop branches. Feature branches typically exist in developer repos only, not in _origin_.

- [release](https://sentenz.github.io/backup-service/website/nvie.com/posts/a-successful-git-branching-model/index.html#release-branches)
  > Release branches are created every iteration (i.e. sprint) from develop branch, which contains a set of features and their associated bug fixes. Furthermore, they allow for minor bug fixes and preparing meta-data for a release (version number i.e [semver](#semantic-versioning), build dates, etc.). The release branch is then subjected to deployed to the staging (integration and regression testing). Any bugs identified during this phase is fixed and committed directly to the release branch. Once the release branch has been confirmed to be free of bugs, it is merged into the main branch and released into production. These fixes are also merged back into develop and other release branches if any exist.

- [fix](https://sentenz.github.io/backup-service/website/nvie.com/posts/a-successful-git-branching-model/index.html#hotfix-branches)
  > Fixes branches are created from main branch, when issues need an fix upon an undesired state of a live production version. Fix branches needs to be merged back into main and into develop, in order to safeguard that the bugfix is included in the next release.

## GitHub Flow // TODO

[GitHub flow](https://docs.github.com/en/get-started/quickstart/github-flow) is a lightweight, branch-based workflow.

In GitHub flow, the `main` branch contains your production-ready code. The other branches, `feature` branches, should contain work on new features and bug fixes and will be merged back into the main branch when the work is finished and properly reviewed.

The major branch:

- main

Supporting branch:

- feature

## Release Flow // TODO

[Release flow](http://releaseflow.org/#home) is an industry-standard approach.

## Trunk-Based Development

[Trunk-Based Development](https://trunkbaseddevelopment.com/) is a source-control branching model, where developers collaborate on code in a single branch called `trunk` (main in Git nomenclature), resist any pressure to create other long-lived development branches by employing documented techniques. They therefore avoid merge conflicts, do not break the build.

The major branch:

- _trunk_
  > Consider trunk to be the branch where the source code of `HEAD` always contains the latest version.

## Scaled Trunk-Based Development

[Scaled Trunk-Based Development](https://sentenz.github.io/backup-service/website/trunkbaseddevelopment.com/index.html#scaled-trunk-based-development) is done with short-lived `feature` branches. One developer over a couple of days (max) and flowing through Pull-Request style code-review and automation (CI/CD) before integrating (merging) into the `trunk` (main in Git nomenclature) branch.

The major branch:

- _trunk_
  > Consider trunk to be the branch where the source code of `HEAD` always contains the latest version.

Supporting branch:

- [feature](https://sentenz.github.io/backup-service/website/trunkbaseddevelopment.com/short-lived-feature-branches/index.html)
  > Short-living feature branches are used to develop new features. Feature branches are created from and merged back into _trunk_. Feature branches typically exist in developer repos only, not in _origin_. The [style](https://sentenz.github.io/backup-service/website/trunkbaseddevelopment.com/styles/index.html) of short-living feature branches is suitable for active committer counts [between 2 and 1000](https://sentenz.github.io/backup-service/website/trunkbaseddevelopment.com/styles/index.html#short-lived-feature-branches).

- [release](https://sentenz.github.io/backup-service/website/trunkbaseddevelopment.com/release-from-trunk/index.html)
  > Release branch is a cut from trunk with an optional number of cherry picks that are developed on trunk and then pulled into the branch.

## See also

- Github [TBD](https://github.com/paul-hammant/tbd) repository.
- Github [GitHub Flow](https://docs.github.com/en/get-started/quickstart/github-flow) article.
- Azure DevOps [Release Flow](https://devblogs.microsoft.com/devops/release-flow-how-we-do-branching-on-the-vsts-team/) article.
- YouTube [branching patterns and anti-patterns](https://www.youtube.com/watch?v=ykZbBD-CmP8) video.
