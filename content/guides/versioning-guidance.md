# Versioning Guidance

Versioning guidance defines how software release identifiers are selected, validated, and published. This guide applies [Semantic Versioning (SemVer)](https://semver.org/spec/v2.0.0.html) to stable and pre-release versions and describes a release workflow.

> [!NOTE]
> SemVer specifies version syntax and precedence, commit-message conventions, and branching strategies are separate project decisions.

- [1. Category](#1-category)
  - [1.1. Semantic Versioning (SemVer)](#11-semantic-versioning-semver)
    - [1.1.1. Stable Release](#111-stable-release)
    - [1.1.2. Pre-release](#112-pre-release)
    - [1.1.3. Build Metadata](#113-build-metadata)
- [2. Best Practice](#2-best-practice)
  - [2.1. Branching Workflow](#21-branching-workflow)
- [3. References](#3-references)

## 1. Category

### 1.1. Semantic Versioning (SemVer)

The Semantic Versioning (SemVer) specification defines three required numeric components and with optional pre-release identifiers and build metadata.

Stable releases, pre-releases, and build metadata have distinct roles within that scheme.

```plaintext
MAJOR.MINOR.PATCH[-PRERELEASE][+BUILD]
```

> [!NOTE]
> The bracketed portions in the representation are optional. The required numeric components are non-negative integers without leading zeroes.

#### 1.1.1. Stable Release

A stable release has no pre-release suffix. Once a public API reaches version `1.0.0`, changes to that API determine which numeric component increases.

1. Concepts and Components

    | Component | Description | Example |
    | --- | --- | --- |
    | `MAJOR` | Increments for backward-incompatible API changes. The minor and patch components reset to zero. | `1.4.2` → `2.0.0` |
    | `MINOR` | Increments for backward-compatible functionality added to the public API. The patch component resets to zero. | `1.4.2` → `1.5.0` |
    | `PATCH` | Increments for backward-compatible bug fixes. | `1.4.2` → `1.4.3` |

2. Examples and Explanations

    The sequence illustrates successive stable releases and their SemVer precedence:

    ```plaintext
    1.4.2 < 1.4.3 < 1.5.0 < 2.0.0
    ```

    Starting from `1.4.2`, a backward-compatible bug fix produces `1.4.3`. Adding backward-compatible public API functionality then produces `1.5.0`, resetting the patch component to zero. A subsequent backward-incompatible API change produces `2.0.0`, resetting both the minor and patch components to zero.

    When a release combines multiple change types, the highest-impact change determines the increment. For example, a release containing both a backward-compatible feature and a bug fix advances `1.4.2` to `1.5.0`.

3. Rules

    1. Public API Contract

        Define the public API before assigning compatibility meaning to version numbers. API contracts may be expressed in code, documentation, or both.

    2. Change Impact

        Select the highest-impact change included in a release. A breaking change takes precedence over backward-compatible features and fixes.

    3. Release Immutability

        Treat published release contents as immutable. A correction requires a new version rather than replacement of a published artifact.

    4. Initial Development Policy

        During initial development (`0.y.z`), the public API may change without the compatibility guarantees associated with `1.0.0` and later versions. The project must define its release policy for this phase.

#### 1.1.2. Pre-release

A pre-release appends a hyphen and dot-separated identifiers to a target version, such as `1.1.0-beta.1`. Every pre-release has lower precedence than the corresponding stable version.

> [!NOTE]
> SemVer defines identifier syntax and ordering, but does not prescribe testing stages or release-readiness criteria.

1. Concepts and Components

    | Identifier | Description | Example |
    | --- | --- | --- |
    | Alpha (`alpha`) | A project-defined label commonly used for early integration and exploratory testing. | `1.1.0-alpha.0` → `1.1.0-alpha.1` |
    | Beta (`beta`) | A project-defined label commonly used for broader compatibility and acceptance testing. | `1.1.0-beta.0` → `1.1.0-beta.1` |
    | Release Candidate (`rc`) | A project-defined label commonly used for builds undergoing final release qualification. | `1.1.0-rc.0` → `1.1.0-rc.1` |
    | Next (`next`) | A project-defined label used by some release pipelines for iterative preview builds; it does not imply a SemVer-defined stage. | `1.1.0-next.1` → `1.1.0-next.2` |

2. Examples and Explanations

    The sequence illustrates SemVer precedence for the same target stable version:

    ```plaintext
    1.1.0-alpha.0 < 1.1.0-alpha.1 < 1.1.0-beta.0 < 1.1.0-rc.0 < 1.1.0
    ```

    Labels are ordered lexically when compared as non-numeric identifiers. Consequently, `next` does not inherently precede `alpha`, `beta`, or `rc` in a release process; for the same core version, `beta` sorts before `next` and `next` sorts before `rc`.

3. Rules

    1. Identifier Syntax

        Separate pre-release identifiers with periods. Each identifier must be nonempty and contain only ASCII letters, digits, or hyphens; purely numeric identifiers must not contain leading zeroes.

    2. Identifier Precedence

        Compare identifiers from left to right: numeric identifiers compare numerically, non-numeric identifiers compare in ASCII lexical order, and numeric identifiers have lower precedence than non-numeric identifiers. When shared identifiers are equal, additional identifiers increase precedence.

    3. Stage Numbering

        Incrementing suffixes such as `alpha.0`, `alpha.1`, and `beta.0` and starting counters at `.0` are project conventions, not SemVer requirements.

    4. Stable Release Qualification

        Publish a stable version without the pre-release suffix only after completing the project's release gates.

#### 1.1.3. Build Metadata

Build metadata appends a plus sign and dot-separated identifiers to a stable or pre-release version. It identifies build provenance without changing SemVer precedence.

1. Concepts and Components

    | Metadata | Description | Example |
    | --- | --- | --- |
    | Build Number (`build`) | A project-defined build number used to distinguish builds without changing SemVer precedence. | `1.1.0+build.27` |
    | Source Revision (`sha`) | A project-defined source revision identifier used to trace a build to its source commit without changing SemVer precedence. | `1.1.0-rc.1+sha.a2e62b` |

2. Examples and Explanations

    The comparisons illustrate equal SemVer precedence despite differences in build metadata:

    ```plaintext
    1.1.0+build.27 = 1.1.0+build.28
    1.1.0-rc.1+sha.a2e62b = 1.1.0-rc.1
    ```

    The `=` denotes equal precedence, not identical version strings or artifact contents. The build numbers `27` and `28` distinguish builds, but do not affect their ordering. Similarly, `sha.a2e62b` records a source revision without changing the precedence of `1.1.0-rc.1`.

    Build metadata does not promote a pre-release to a stable release: `1.1.0-rc.1+build.28` still has lower precedence than `1.1.0+build.27`. Labels such as `build` and `sha` are project conventions, not SemVer-defined metadata types.

3. Rules

    1. Identifier Syntax

        Build identifiers must be nonempty and contain only ASCII letters, digits, or hyphens.

    2. Version Precedence

        Do not use build metadata to express API compatibility or pre-release ordering.

    3. Artifact Traceability

        Preserve traceability from a published artifact to its source revision; build metadata does not replace an immutable release artifact or version tag.

## 2. Best Practice

### 2.1. Branching Workflow

A branching workflow coordinates change integration, release stabilization, qualification, and publication. Branch roles and merge operations depend on the selected [branching strategy](../articles/branching-strategies.md), not on SemVer.

> [!NOTE]
> The worked example applies [Git Flow](../articles/branching-strategies.md#12-git-flow) to the first stable release of a software development kit (SDK). Feature integration occurs on `develop`, release stabilization on `release/1.0.0`, and stable publication on `main`.

> [!NOTE]
> Commit labels in the diagram follow [Conventional Commits](../articles/commit.md#11-conventional-commits). The `v` prefix on Git tags is a repository convention, not part of the SemVer version string.

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

## 3. References

- Sentenz [Versioning](../articles/versioning.md) article.
- Sentenz [Commit](../articles/commit.md) article.
- Sentenz [Changelog](../articles/changelog.md) article.
- Sentenz [Branching Strategies](../articles/branching-strategies.md) article.
- Semantic Versioning [Semantic Versioning 2.0.0](https://semver.org/spec/v2.0.0.html) specification.
- Conventional Commits [Conventional Commits 1.0.0](https://www.conventionalcommits.org/en/v1.0.0/) specification.
- Mermaid [GitGraph Diagrams](https://mermaid.js.org/syntax/gitgraph.html) documentation.
