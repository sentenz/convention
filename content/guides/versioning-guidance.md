# Versioning Guidance

- [1. Category](#1-category)
  - [1.1. Semantic Versioning (SemVer)](#11-semantic-versioning-semver)
    - [1.1.1. Release](#111-release)
    - [1.1.2. Pre-release](#112-pre-release)
    - [1.1.3. Workflow](#113-workflow)
- [2. References](#2-references)

## 1. Category

### 1.1. Semantic Versioning (SemVer)

[Semantic Versioning (SemVer)](../articles/versioning.md#11-semantic-versioning-semver) and [Conventional Commits](../articles/commit.md#11-conventional-commits) are commonly combined to automate `version tags` and `CHANGELOG.md` updates in release pipelines.

#### 1.1.1. Release

[Semantic Versioning (SemVer)](../articles/versioning.md#11-semantic-versioning-semver) uses a three-component version format `MAJOR.MINOR.PATCH`.

1. Concepts and Components

    - `MAJOR`
      > Increments when incompatible changes are introduced.
      >
      > Example: `1.0.0` -> `2.0.0`

    - `MINOR`
      > Increments when new backward-compatible functionality is added.
      >
      > Example: `1.0.0` -> `1.1.0`

    - `PATCH`
      > Increments when backward-compatible fixes are introduced.
      >
      > Example: `1.0.0` -> `1.0.1`

2. Rules

    1. Commit messages should follow [Conventional Commits](../articles/commit.md#11-conventional-commits) to enable release tooling to detect change types.
    2. Versioning should follow the `MAJOR.MINOR.PATCH` format, incrementing according to the nature of changes introduced in the release.
    3. The release workflow should create a version tag and update `CHANGELOG.md`.

#### 1.1.2. Pre-release

Pre-release identifiers can be appended to the next target version to indicate that the release is not yet stable.

1. Concepts and Components

    - `alpha`
      > Unstable pre-release identifier for early testing.
      >
      > Example progression: `1.0.0` -> `1.1.0-alpha.1` -> `1.1.0-alpha.2` -> `1.1.0`

    - `beta`
      > More stable pre-release identifier for broader testing.
      >
      > Example progression: `1.0.0` -> `1.1.0-beta.1` -> `1.1.0-beta.2` -> `1.1.0`

    - `rc`
      > Release candidate identifier.
      >
      > Example progression: `1.0.0` -> `1.1.0-rc.1` -> `1.1.0-rc.2` -> `1.1.0`

    - `next`
      > Distribution channel identifier for iterative upcoming releases.
      >
      > Example progression: `1.0.0` -> `1.1.0-next.1` -> `1.1.0-next.2` -> `1.1.0`

2. Rules

    1. Pre-release versions are created from the next planned release version.
    2. Numeric suffixes (`.1`, `.2`, ...) should increment sequentially per identifier.
    3. Promoting to stable removes the pre-release suffix and publishes the final version.

#### 1.1.3. Workflow

Based on [Git Flow](../articles/branching-strategies.md#12-git-flow), the workflow illustrates how features are developed, integrated, and verified before the first stable release. Feature integration occurs on `develop`, release stabilization takes place on a `release/*` branch, and stable releases are maintained on `main`.

1. Concepts and Components

    - Feature Integration
      > Feature branches originate from `develop` and are merged back through reviewed pull requests. Alpha releases provide early snapshots for internal integration testing.

    - Release Stabilization
      > Once the planned scope is complete, create `release/1.0.0` from `develop`. Publish beta versions for merchant sandbox testing and release candidates for final qualification. Restrict this branch to release fixes, documentation, and version preparation.

    - Stable Release
      > Merge the approved release branch into `main`, validate the merge result and final artifact, and publish `1.0.0`. Merge the release branch back into `develop` so subsequent development retains the release fixes.

2. Representation and Diagrams

    The diagram follows the [SemVer precedence rules](https://semver.org/#spec-item-11):

    ```plaintext
    1.0.0-alpha < 1.0.0-alpha.1 < 1.0.0-alpha.beta < 1.0.0-beta < 1.0.0-beta.1 < 1.0.0-beta.2 < 1.0.0-rc.1 < 1.0.0
    ```

    ```mermaid
    gitGraph TB:
        commit id: "chore(sdk): initialize project"
        branch develop
        checkout develop

        branch "feature/api"
        commit id: "feat(payments): add payments and refunds"
        checkout develop
        merge "feature/api" id: "chore(merge): integrate payment API" tag: "v1.0.0-alpha"

        commit id: "fix(auth): correct authentication handling" tag: "v1.0.0-alpha.1"
        commit id: "feat(webhooks): add signature verification" tag: "v1.0.0-alpha.beta"

        branch "release/1.0.0"
        checkout "release/1.0.0"
        commit id: "chore(release): prepare 1.0.0-beta" tag: "v1.0.0-beta"
        commit id: "fix(payments): prevent duplicate charges" tag: "v1.0.0-beta.1"
        commit id: "chore(release): prepare 1.0.0-beta.2" tag: "v1.0.0-beta.2"
        commit id: "chore(release): prepare 1.0.0-rc.1" tag: "v1.0.0-rc.1"

        checkout main
        merge "release/1.0.0" id: "chore(release): version 1.0.0" tag: "v1.0.0"

        checkout develop
        merge "release/1.0.0" id: "chore(merge): integrate release fixes"
    ```

    > [!NOTE]
    > Commit labels follow [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/).

3. Rules

    1. SemVer defines version precedence; branch placement and testing stages are project conventions. A pre-release label does not by itself establish release readiness.
    2. `alpha.beta` is a valid pre-release identifier sequence, not a standardized stage between alpha and beta. It appears here to reproduce the specification example. Prefer numbered identifiers such as `alpha.1`, `beta.1`, and `rc.1` for routine release automation.
    3. Numeric identifiers compare numerically (`beta.1 < beta.2`), numeric identifiers precede non-numeric identifiers (`alpha.1 < alpha.beta`), and non-numeric identifiers compare in ASCII sort order (`alpha < beta < rc`). When preceding identifiers match, additional identifiers increase precedence (`alpha < alpha.1`). Every pre-release has lower precedence than the corresponding stable version.
    4. Publish each version from a validated commit, create a unique version tag, and update `CHANGELOG.md`. Never replace an already published version or move its release tag; publish a new version for subsequent changes.
    5. If qualification finds a release-blocking defect, fix it on the release branch and publish another candidate, such as `1.0.0-rc.2`. Complete the release gates before publishing the stable version.

## 2. References

- Sentenz [Versioning](../articles/versioning.md) article.
- Sentenz [Commit](../articles/commit.md) article.
- Sentenz [Changelog](../articles/changelog.md) article.
- Sentenz [Branching Strategies](../articles/branching-strategies.md) article.
