# Versioning Guidance

- [1. Category](#1-category)
  - [1.1. Semantic Versioning (SemVer)](#11-semantic-versioning-semver)
    - [1.1.1. Release](#111-release)
    - [1.1.2. Pre-release](#112-pre-release)
    - [1.1.3. Workflow](#113-workflow)
- [2. References](#2-references)

## 1. Category

### 1.1. Semantic Versioning (SemVer)

[Semantic Versioning (SemVer)](../articles/versioning.md#11-semantic-versioning-semver) and [Conventional Commits](../articles/commit.md#11-conventional-commits) are commonly used together to automate version tagging and updates to `CHANGELOG.md` in release pipelines.

#### 1.1.1. Release

[Semantic Versioning (SemVer)](../articles/versioning.md#11-semantic-versioning-semver) specifies a three-component version format: `MAJOR.MINOR.PATCH`.

1. Concepts and Components

    - `MAJOR`
      > Increments when backward-incompatible changes are introduced.
      >
      > Example: `1.0.0` -> `2.0.0`

    - `MINOR`
      > Increments when backward-compatible functionality is added.
      >
      > Example: `1.0.0` -> `1.1.0`

    - `PATCH`
      > Increments when backward-compatible bug fixes are introduced.
      >
      > Example: `1.0.0` -> `1.0.1`

2. Rules

    1. Commit messages should follow [Conventional Commits](../articles/commit.md#11-conventional-commits) to enable release tooling to detect change types.
    2. Versions should follow the `MAJOR.MINOR.PATCH` format, with the appropriate component incremented according to the changes included in each release.
    3. The release workflow should create a version tag and update `CHANGELOG.md`.

#### 1.1.2. Pre-release

Pre-release identifiers can be appended to a target version to distinguish a pre-release from its corresponding stable release.

1. Concepts and Components

    - `alpha`
      > An unstable pre-release identifier used for early testing.
      >
      > Example progression: `1.0.0` -> `1.1.0-alpha.0` -> `1.1.0-alpha.1` -> `1.1.0-alpha.2` -> `1.1.0`

    - `beta`
      > A pre-release identifier typically used for broader testing.
      >
      > Example progression: `1.0.0` -> `1.1.0-beta.0` -> `1.1.0-beta.1` -> `1.1.0-beta.2` -> `1.1.0`

    - `rc`
      > A pre-release identifier used for release candidates.
      >
      > Example progression: `1.0.0` -> `1.1.0-rc.0` -> `1.1.0-rc.1` -> `1.1.0`

    - `next`
      > A pre-release identifier used to distribute iterative builds of upcoming releases.
      >
      > Example progression: `1.0.0` -> `1.1.0-next.1` -> `1.1.0-next.2` -> `1.1.0`

2. Rules

    1. Pre-release versions are derived from the next planned stable version.
    2. Numeric suffixes (such as `.0`, `.1`, and `.2`) should increase sequentially for each pre-release identifier.
    3. To publish a stable release, remove the pre-release suffix and publish the resulting version.

#### 1.1.3. Workflow

Based on [Git Flow](../articles/branching-strategies.md#12-git-flow), the workflow illustrates how features are developed, integrated, and verified before the first stable release. Feature integration takes place on `develop`, release stabilization on a `release/*` branch, and stable releases on `main`.

1. Concepts and Components

    - Feature Integration
      > Feature branches are created from `develop` and merged back through reviewed pull requests. Alpha releases provide early snapshots for internal integration testing.

    - Release Stabilization
      > Once the planned scope is complete, create `release/1.0.0` from `develop`. Publish beta versions for testing in merchant sandboxes and release candidates for final qualification. Limit changes on this branch to release fixes, documentation, and version preparation.

    - Stable Release
      > Merge the approved release branch into `main`, validate the merge result and final artifact, and publish `1.0.0`. Merge the release branch back into `develop` to retain its fixes in subsequent development.

2. Sequence and Diagram

    The following version sequence follows the [SemVer precedence rules](https://semver.org/#spec-item-11):

    ```plaintext
    1.0.0-alpha.0 < 1.0.0-alpha.1 < 1.0.0-alpha.2 < 1.0.0-beta.0 < 1.0.0-beta.1 < 1.0.0-beta.2 < 1.0.0-rc.0 < 1.0.0
    ```

    ```mermaid
    gitGraph TB:
        commit id: "chore(sdk): initialize project"
        branch develop
        checkout develop

        branch "feature/api"
        commit id: "feat(payments): add payments and refunds"
        checkout develop
        merge "feature/api" id: "chore(merge): integrate payment API" tag: "v1.0.0-alpha.0"

        commit id: "fix(auth): correct authentication handling" tag: "v1.0.0-alpha.1"
        commit id: "feat(webhooks): add signature verification" tag: "v1.0.0-alpha.2"

        branch "release/1.0.0"
        checkout "release/1.0.0"
        commit id: "chore(release): prepare 1.0.0-beta.0" tag: "v1.0.0-beta.0"
        commit id: "fix(payments): prevent duplicate charges" tag: "v1.0.0-beta.1"
        commit id: "chore(release): prepare 1.0.0-beta.2" tag: "v1.0.0-beta.2"
        commit id: "chore(release): prepare 1.0.0-rc.0" tag: "v1.0.0-rc.0"

        checkout main
        merge "release/1.0.0" id: "chore(release): version 1.0.0" tag: "v1.0.0"

        checkout develop
        merge "release/1.0.0" id: "chore(merge): integrate release fixes"
    ```

    > [!NOTE]
    > Commit labels follow the [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/) specification.

3. Rules

    1. SemVer defines version precedence, whereas branch assignments and testing stages are project-specific conventions. A pre-release label alone does not establish release readiness.
    2. This workflow starts alpha, beta, and release-candidate numbering at `.0` (`alpha.0`, `beta.0`, and `rc.0`). These starting values are project conventions, not SemVer requirements.
    3. Pre-release identifiers are compared from left to right. Numeric identifiers are compared numerically (`alpha.0 < alpha.1 < alpha.2` and `beta.0 < beta.1 < beta.2`), while non-numeric identifiers are compared lexically in ASCII sort order (`alpha < beta < rc`). When preceding identifiers match, additional identifiers increase precedence. Every pre-release has lower precedence than the corresponding stable version.
    4. Publish each version from a validated commit, create a unique version tag, and update `CHANGELOG.md`. Do not replace a published version or move its release tag; publish a new version for subsequent changes.
    5. If a release-blocking defect is discovered during qualification, fix it on the release branch and publish another candidate, such as `1.0.0-rc.1`. Complete all release gates before publishing the stable version.

## 2. References

- Sentenz [Versioning](../articles/versioning.md) article.
- Sentenz [Commit](../articles/commit.md) article.
- Sentenz [Changelog](../articles/changelog.md) article.
- Sentenz [Branching Strategies](../articles/branching-strategies.md) article.
