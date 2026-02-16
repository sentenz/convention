# Branching Strategies

Branching strategies are methodologies for managing code changes in version control systems. They provide a structured approach to organizing and integrating code changes, facilitating collaboration among developers, and ensuring a smooth development workflow.

- [1. Category](#1-category)
  - [1.1. Trunk-Based Development (TBD)](#11-trunk-based-development-tbd)
  - [1.2. Git Flow](#12-git-flow)
  - [1.3. GitHub Flow](#13-github-flow)
  - [1.4. GitLab Flow](#14-gitlab-flow)
  - [1.5. Release Flow](#15-release-flow)
- [2. Principles](#2-principles)
- [3. Best Practice](#3-best-practice)
- [4. Terminology](#4-terminology)
- [5. References](#5-references)

## 1. Category

### 1.1. Trunk-Based Development (TBD)

[Trunk-Based Development (TBD)](https://trunkbaseddevelopment.com/) is a branching strategy that emphasizes a single shared branch, called `trunk` or `main`. All developers commit their changes directly to the trunk branch, ensuring that all changes are integrated and tested regularly. TBD promotes continuous integration and delivery, enabling teams to release software quickly and reliably.

1. Components and Features

    - Base Branches

      - `main`
        > Production-Ready and Non-Production-Ready Code
        >
        > The trunk branch is the central repository for all code changes. It serves as the single source of truth for the codebase and is the branch deployed to production. Developers commit their changes directly to the trunk branch, ensuring that all changes are integrated and tested regularly.

    - Support Branches (Optional)

      - `feature`
        > Isolated Development
        >
        > While feature branches are not strictly required in TBD, they can be used for longer-running development tasks or when working with complex features. The `feature` branches are created from the `trunk` branch to isolate changes for specific features or bug fixes. Once the `feature` is complete and thoroughly tested, it is merged back into the `trunk` branch.

2. Representation and Diagrams

    ```mermaid
    gitGraph
        commit tag: "v1.0.0"
        commit
        commit tag: "v1.0.1"
        commit tag: "v1.0.2"
        commit
        commit tag: "v1.0.3"
        commit tag: "v1.1.0"
        commit
        commit tag: "v2.0.0"
        commit
    ```

### 1.2. Git Flow

[Git Flow](https://nvie.com/posts/a-successful-git-branching-model/) is a branching strategy for Git that helps teams manage the lifecycle of code changes.

1. Components and Features

    - Base Branches

      - `main`
        > Production-Ready Code
        >
        > The main branch is the central repository of all production-ready code and is the branch deployed to production. Changes are merged into `main` through reviewed `pull requests` from short-lived branches.

      - `develop`
        > Integration Point
        >
        > The develop branch is the branch where all new features and bug fixes are merged before they are released. It is the `default` branch for development work. All feature branches should be merged into the develop branch before they are ready for release.

    - Support Branches

      - `feature`
        > Isolated Development
        >
        > The `feature` branches are created from the `develop` branch for the development of specific features or bug fixes. They are isolated from the main and develop branches, allowing developers to work on their own tasks without affecting the codebase for other features or bug fixes. Once a feature branch is complete, it is merged into the develop branch.

      - `release`
        > Preparation for Deployment
        >
        > The `release` branches are created from the `develop` branch for the preparation of a new release. They are used to test and integrate the code changes that will be included in the release. Once the release is ready, the release branch is merged into the `main` branch and then `tagged` with the release version.

      - `hotfix`
        > Urgent Bug Fixes
        >
        > The `hotfix` branches are created from the `main` branch to address critical bugs that need to be fixed urgently. They are used to quickly develop and implement the hotfix, and then the `hotfix` is merged back into the `main` branch and the `develop` branch.

2. Representation and Diagrams

    ```mermaid
    gitGraph
        commit tag: "v1.0.0"
        branch hotfix
        checkout main
        branch develop
        checkout develop
        commit
        branch feature1
        checkout feature1
        commit
        checkout hotfix
        commit
        checkout develop
        commit
        checkout main
        merge hotfix tag: "v1.0.1"
        checkout develop
        branch feature2
        commit
        checkout feature1
        commit
        checkout develop
        merge hotfix
        checkout feature2
        commit
        checkout develop
        merge feature2
        branch release
        checkout release
        checkout develop
        checkout release
        commit
        checkout develop
        merge release
        checkout main
        merge release tag: "v1.1.0"
        checkout feature1
        commit
        checkout develop
        merge feature1
    ```

### 1.3. GitHub Flow

[GitHub Flow](https://githubflow.github.io/) is a simplified branching strategy that focuses on a single main branch and short-lived feature branches. It is designed for teams that want to release software frequently and emphasizes continuous integration and delivery.

1. Components and Features

    - Base Branches

      - `main`
        > Production-Ready Code
        >
        > The main branch is the central repository of all production-ready code and is the branch deployed to production. Changes are merged into `main` through reviewed `pull requests` from short-lived branches.

    - Support Branches

      - `feature`
        > Isolated Development
        >
        > Feature branches are created for the development of new features. They are isolated from the main branch, allowing developers to work on their own tasks without affecting the codebase for the main branch. Once a `feature` branch is complete, it is merged into the `main` branch.

2. Representation and Diagrams

    ```mermaid
    gitGraph
        commit tag: "v1.0.0"
        branch feature1
        checkout feature1
        commit
        checkout main
        branch feature2
        checkout feature2
        commit
        checkout feature1
        commit
        checkout main
        merge feature1 tag: "v1.1.0"
        checkout feature2
        commit
    ```

### 1.4. GitLab Flow

[GitLab Flow](https://docs.gitlab.com/ee/topics/gitlab_flow.html) is a branching strategy that combines the best practices of Git Flow and GitHub Flow. It emphasizes a single main branch for production-ready code and short-lived feature branches for development. GitLab Flow also incorporates environment-specific branches for staging and production, allowing for a more flexible and efficient development workflow.

1. Components and Features

    - Base Branches

      - `main`
        > Production-Ready Code
        >
        > The main branch is the central repository of all production-ready code. It is the branch that is deployed to production, and it should only contain stable and well-tested code.

    - Support Branches

      - `feature`
        > Isolated Development
        >
        > The `feature` branches are created from the `main` branch to work on specific features or bug fixes. They are isolated from the main branch, allowing developers to work on their own tasks without affecting the shared codebase. Once a `feature` branch is complete, it is merged into the `main` branch.

      - `staging`
        > Staging Environment
        >
        > GitLab Flow may involve environment-specific `staging` branches for an additional `software testing` stage.

      - `production`
        > Production Environment
        >
        > GitLab Flow may involve environment-specific `production` branches for the deployment stage.

2. Representation and Diagrams

    ```mermaid
    gitGraph
        commit tag: "v1.0.0"
        branch feature1
        checkout feature1
        commit
        checkout main
        branch feature2
        checkout feature2
        commit
        checkout main
        merge feature1 tag: "v1.1.0"
        checkout main
        branch staging
        checkout staging
        commit
        branch production
        checkout production
        commit
        checkout feature2
        commit
        checkout main
        merge feature2 tag: "v1.1.1"
        checkout staging
        merge main
        checkout production
        merge staging
    ```

### 1.5. Release Flow

[Release Flow](http://releaseflow.org/) is a branching strategy that focuses on managing releases and hotfixes. It emphasizes a single main branch for production-ready code and short-lived branches for development, release preparation, and hotfixes.

1. Components and Features

    - Base Branches

      - `main`
        > Production-Ready Code
        >
        > Represents the latest development state of the codebase and where Continuous Integration (CI) is always applied. The `main` branch is the primary branch for the project and should always be in a deployable state. The `main` branch is tagged with a version number to mark a release.

      - `release`
        > Preparation for Deployment
        >
        > Release branches are named after the `major` and `minor` versions, followed by an `x` for the `patch` version, i.e. `release/1.1.x`. The `x` for `patch` indicates that this segment of the release will change on the branch. Release branches can be deleted after release activities, as they can be recreated from release tags.

    - Support Branches

      - `feature`
        > Isolated Development
        >
        > Feature branches are created from the main branch to isolate changes for specific features, tasks or bug fixes. They allow developers to work on their tasks without affecting the main branch or other feature branches. Once a `feature` branch is complete and thoroughly tested, it is merged back into the `main` branch.

      - `fix`
        > Bug Fixes
        >
        > Fixes are made on a dedicated `fix` branch, branched off from the `release` branch. A `fix` branch is then created for making necessary changes, and a change request is raised to merge the fix into the `release` branch. If the fix is critical, it can be merged into the `main` branch and tagged with a new release version. The `fix` branch can be deleted once the fix is complete.

2. Representation and Diagrams

    ```mermaid
    gitGraph
        commit tag: "v1.0.0"
        branch featureA
        checkout featureA
        commit
        checkout main
        checkout featureA
        commit
        checkout main
        merge featureA tag: "v1.1.0"
        branch featureB
        branch release
        checkout release
        commit
        checkout featureB
        commit
        checkout release
        branch fix
        commit
        checkout release
        merge fix tag: "v1.1.1"
        checkout main
        merge fix tag: "v1.1.1"
        checkout featureB
        commit
    ```

## 2. Principles

- Separation of Concerns
  > Branching strategies should clearly distinguish between different stages of the development process, such as development, testing, and release. This separation helps maintain a clean codebase, reduces the risk of merge conflicts, and ensures that stable code is deployed to production.

- Isolation of Changes
  > Branching should isolate changes to specific features or bug fixes, preventing them from affecting other parts of the codebase. This isolation minimizes the risk of introducing regressions or breaking existing functionality.

- Consistency and Standardization
  > Consistent branching naming conventions, branching rules, and review processes promote clarity and predictability across the development team. Standardization ensures that everyone follows a common approach, reducing confusion and errors.

- Integration and Merging
  > Branching strategies should facilitate efficient integration and merging of changes. Clear guidelines should be established for merging branches, ensuring that conflicts are resolved effectively and that the codebase remains stable.

- Continuous Integration and Delivery (CI/CD)
  > Effective branching strategies should align with CI/CD practices. Branches should be integrated regularly into a central repository to enable continuous testing and feedback. This integration should be automated to streamline the development process.

- Adaptability and Flexibility
  > Branching strategies should be adaptable to the specific needs and size of the project. As the project evolves, the branching strategy may need to be adjusted to accommodate changing requirements, team size, and release cadence.

- Documentation and Communication
  > Clear documentation of the branching strategy, including naming conventions, branching rules, and review processes, is crucial for team communication and knowledge sharing.

## 3. Best Practice

- Committing
  > Follow a consistent format for commit messages, e.g. `Conventional Commits`.

- Branch Naming Conventions
  > Define rules for naming branches, ensuring clarity, e.g. `feature/issue-name` or `release/1.0.x`.

- Versioning
  > Establish a versioning scheme for releases, e.g. `Semantic Versioning`.

- Code Review Guidelines
  > Clearly define what makes a pull request ready for review and merging.

## 4. Terminology

- Branch
  > A distinct version of the codebase that allows developers to work on specific features or bug fixes without affecting the main branch.

- Main Branch (Production-Ready Code)
  > The central repository for all production-ready code. It is the branch that is deployed to production and should only contain stable and well-tested code.

- Develop Branch (Integration Point)
  > The develop branch acts as the integration point for code changes from feature branches. It is where all new features and bug fixes are merged before they are released. The develop branch should always be in a releasable state.

- Feature Branch (Isolated Development)
  > Feature branches are created from the base branches to isolate changes for specific features or bug fixes. They allow developers to work on their tasks without affecting the main branch or other feature branches.

- Release Branch (Preparation for Deployment)
  > Release branches are dedicated branches created from the develop branch to prepare for a new release. They are used to gather all the changes that are ready for release, perform final testing, and prepare the release documentation.

- Hotfix Branch (Urgent Bug Fixes)
  > A branch created from the main branch to address critical bugs that need to be fixed immediately. Hotfix branches are developed and tested quickly to resolve the bug, and then the hotfix is merged back into the main branch and deployed to production.

- Pull Request (PR)
  > A proposed set of changes submitted for review and merging into the main branch.

- Merge Request (MR)
  > Similar to a pull request, used in platforms like GitLab for proposing and merging changes.

- Versioning
  > Applying version numbers or tags to mark specific points in the project's history, often associated with releases.

- Continuous Integration (CI)
  > A process where code changes are automatically integrated into a central repository, triggering automated testing and feedback.

- Continuous Delivery (CD)
  > A process that automates the deployment of code changes to production, ensuring that changes are delivered to users quickly and reliably.

- Feature Freeze
  > A period during which no new features are added to the codebase, often before a release.

- Rollback
  > Reverting code changes to a previous state to address issues or ensure stability.

- Merge Conflict
  > A situation that occurs when two branches contain conflicting changes that need to be resolved before merging them together.

## 5. References

- Sentenz [Commits](../articles/commit.md) article.
- Sentenz [Versioning](../articles/versioning.md) article.
