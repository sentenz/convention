# Branching Strategies Guide

- [1. Category](#1-category)
  - [1.1. Git Flow](#11-git-flow)
  - [1.2. Scaled Trunk-Based Development](#12-scaled-trunk-based-development)
- [2. References](#2-references)

## 1. Category

### 1.1. Git Flow

[Git Flow](../articles/branching-strategies.md#12-git-flow) is a lightweight branch-based workflow that separates integration and release activities.

1. Components and Features

    - Base Branches

      - `main`
        > Production-Ready Code
        >
        > The `main` branch contains production-ready code only. Direct pushes to `main` are forbidden.

      - `develop`
        > Integration Point
        >
        > The `develop` branch is the default integration branch for ongoing development. Direct pushes to `develop` are forbidden.

    - Support Branches

      - `feature`
        > Isolated Development
        >
        > Feature branches are created from `develop` and merged back into `develop` only. Branch naming convention: `feature/[issue-id]-[short-describe]`.

      - `release`
        > Preparation for Deployment
        >
        > Release branches are created from `develop` (for example `release/1.2.x`) to prepare production releases and stage final stabilization.

      - `fix`
        > Urgent Production Fixes
        >
        > Fix branches are created from `main` (for example `fix/[issue-id]-[short-describe]`) for urgent production issues.

2. Rules

      1. Pull requests from `feature` branches target `develop` only.
      2. Feature branches never interact directly with `main`.
      3. Merge `feature` branches using `Squash and merge`.
      4. Merge `release` and `fix` branches first into `main`, then back into `develop`.
      5. Merging `release` into `main` creates a version tag.
      6. Versioning follows [Semantic Versioning](../articles/versioning.md#11-semantic-versioning-semver).
      7. Commit and pull request titles follow [Conventional Commits](../articles/commit.md#11-conventional-commits) specification.
      8. Supporting branches are deleted after merge.

### 1.2. Scaled Trunk-Based Development

[Scaled Trunk-Based Development](../articles/branching-strategies.md#11-trunk-based-development-tbd) uses short-lived feature branches, pull-request reviews, and CI/CD automation before integrating into `main`.

1. Components and Features

    - Base Branches

      - `main` (or `trunk`)
        > Shared Integration Branch
        >
        > The `main` branch is the single long-lived branch. Direct pushes to `main` are forbidden.

    - Support Branches

      - `feature`
        > Short-Lived Development Branches
        >
        > Feature branches are created from `main` and merged back into `main` through pull requests. Branch naming convention: `feature/[issue-id]-[short-describe]`.

      - `release`
        > Release Stabilization
        >
        > Release branches are cut from selected revisions of `main` (for example `release/1.2.x`) when a stabilization stream is required.

2. Rules

    1. All integration happens through `main`.
    2. Pull requests from `feature` branches target `main` only.
    3. Merge `feature` branches using `Squash and Merge` or `Rebase and Merge`.
    4. Incomplete changes stay behind [Feature Flags](../articles/feature-flags.md).
    5. The `main` branch should remain backward-compatible and continuously releasable.
    6. Merging into `main` creates release tags and versions.
    7. Versioning follows [Semantic Versioning](../articles/versioning.md#11-semantic-versioning-semver).
    8. Production fixes are developed on `feature` branches and can be cherry-picked into release branches when needed.
    9. Commit and pull request titles follow [Conventional Commits](../articles/commit.md#11-conventional-commits) specification.
    10. Supporting branches are deleted after merge.

## 2. References

- Sentenz [Branching strategies](../articles/branching-strategies.md) article.
