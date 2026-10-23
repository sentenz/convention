# Versioning Guidance

Versioning guidance defines how software release identifiers are selected, validated, and published. This guide applies [Semantic Versioning (SemVer)](https://semver.org/spec/v2.0.0.html) to stable and pre-release versions and describes a release workflow compatible with different branching strategies, using [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/) for release automation and Git Flow as a worked example.

> [!NOTE]
> SemVer specifies version syntax and precedence, commit-message conventions, branch policies, testing stages, and release tooling are separate project decisions.

- [1. Category](#1-category)
  - [1.1. Semantic Versioning (SemVer)](#11-semantic-versioning-semver)
    - [1.1.1. Stable Release](#111-stable-release)
    - [1.1.2. Pre-release](#112-pre-release)
    - [1.1.3. Build Metadata](#113-build-metadata)
- [2. Best Practice](#2-best-practice)
  - [2.1. Release Determination and Automation](#21-release-determination-and-automation)
  - [2.2. Branching Workflow](#22-branching-workflow)
- [3. References](#3-references)

## 1. Category

This guidance uses SemVer as the release identifier scheme. Stable releases, pre-releases, and build metadata have distinct roles within that scheme. Alternative schemes, including Calendar Versioning (CalVer), are described in the [Versioning](../articles/versioning.md) article.

### 1.1. Semantic Versioning (SemVer)

The SemVer 2.0.0 specification assigns meaning to changes in a declared public application programming interface (API). A version has three required numeric components and may include pre-release identifiers and build metadata.

```plaintext
MAJOR.MINOR.PATCH[-PRERELEASE][+BUILD]
```

The bracketed portions in this representation are optional; brackets are not part of a version identifier. The required numeric components are non-negative integers without leading zeroes.

#### 1.1.1. Stable Release

A stable release has no pre-release suffix. Once a public API reaches version `1.0.0`, changes to that API determine which numeric component increases.

1. Concepts and Components

    - `MAJOR`
      > Increments for backward-incompatible API changes. The minor and patch components reset to zero.
      >
      > Example: `1.4.2` → `2.0.0`.

    - `MINOR`
      > Increments for backward-compatible functionality added to the public API. The patch component resets to zero.
      >
      > Example: `1.4.2` → `1.5.0`.

    - `PATCH`
      > Increments for backward-compatible bug fixes.
      >
      > Example: `1.4.2` → `1.4.3`.

2. Rules

    1. Public API Contract

        Define the public API before assigning compatibility meaning to version numbers. API contracts may be expressed in code, documentation, or both.

    2. Change Impact

        Select the highest-impact change included in a release. A breaking change takes precedence over backward-compatible features and fixes.

    3. Release Immutability

        Treat published release contents as immutable. A correction requires a new version rather than replacement of a published artifact.

    4. Initial Development Policy

        During initial development (`0.y.z`), the public API may change without the compatibility guarantees associated with `1.0.0` and later versions. The project must define its release policy for this phase.

#### 1.1.2. Pre-release

A pre-release appends a hyphen and dot-separated identifiers to a target version, such as `1.1.0-beta.1`. Every pre-release has lower precedence than the corresponding stable version. SemVer defines identifier syntax and ordering, but does not prescribe testing stages or release-readiness criteria.

1. Identifiers

    - Alpha (`alpha`)
      > A project-defined label commonly used for early integration and exploratory testing.
      >
      > Example: `1.1.0-alpha.0` → `1.1.0-alpha.1`.

    - Beta (`beta`)
      > A project-defined label commonly used for broader compatibility and acceptance testing.
      >
      > Example: `1.1.0-beta.0` → `1.1.0-beta.1`.

    - Release Candidate (`rc`)
      > A project-defined label commonly used for builds undergoing final release qualification.
      >
      > Example: `1.1.0-rc.0` → `1.1.0-rc.1`.

    - Next (`next`)
      > A project-defined label used by some release pipelines for iterative preview builds; it does not imply a SemVer-defined stage.
      >
      > Example: `1.1.0-next.1` → `1.1.0-next.2`.

2. Examples and Explanations

    The following sequence illustrates SemVer precedence for the same target stable version:

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

1. Examples and Explanations

    - Stable Build
      > `1.1.0+build.27` and `1.1.0+build.28` have equal SemVer precedence.

    - Pre-release Build
      > `1.1.0-rc.1+sha.a2e62b` identifies a release-candidate build without changing its precedence relative to `1.1.0-rc.1`.

2. Rules

    1. Identifier Syntax

        Build identifiers must be nonempty and contain only ASCII letters, digits, or hyphens.

    2. Version Precedence

        Do not use build metadata to express API compatibility or pre-release ordering.

    3. Artifact Traceability

        Preserve traceability from a published artifact to its source revision; build metadata does not replace an immutable release artifact or version tag.

## 2. Best Practice

Release practices map changes to version identifiers and govern when those identifiers are published. The following conventions combine SemVer with Conventional Commits and a repository-defined branching strategy; they are not additional requirements of the SemVer specification.

### 2.1. Release Determination and Automation

[Conventional Commits](../articles/commit.md#11-conventional-commits) provides machine-readable change descriptions that release tooling can map to SemVer increments. This mapping depends on correct commit classification and project-specific tool configuration.

1. Classification

    - Breaking Change
      > A commit marked with `!` after its type or scope, or a `BREAKING CHANGE:` footer, signals an incompatible API change and normally leads to a major release.

    - Feature (`feat`)
      > A backward-compatible feature normally leads to a minor release.

    - Fix (`fix`)
      > A backward-compatible defect correction normally leads to a patch release.

    - Other Changes
      > Documentation, maintenance, and other commit types do not necessarily trigger releases. Their effect depends on the configured release rules and any public API impact.

2. Rules

    1. Compatibility Assessment

        Evaluate changes against the declared public API. Commit-message types assist automation but do not establish compatibility on their own.

    2. Release Automation

        Configure release tooling to determine the next version, generate release notes or update `CHANGELOG.md`, and publish from a verified revision.

    3. Version Tags

        Use unique, immutable Git tags such as `v1.1.0` to identify published revisions. The `v` prefix is a repository tagging convention, not part of the SemVer version string.

    4. Publication Immutability

        Publish a new version for subsequent corrections. Do not move a published tag or replace an existing version's contents.

    5. Pre-release Channels

        Configure pre-release distribution channels and rules explicitly. A channel label does not, by itself, guarantee readiness or change the SemVer precedence algorithm.

### 2.2. Branching Workflow

A branching workflow coordinates change integration, release stabilization, qualification, and publication. Branch roles and merge operations depend on the selected [branching strategy](../articles/branching-strategies.md), not on SemVer. For example, trunk-based development can publish from a single integration branch, whereas Git Flow maintains separate integration, release, and stable branches.

The following worked example applies [Git Flow](../articles/branching-strategies.md#12-git-flow) to the first stable release of a payments software development kit (SDK). Feature integration occurs on `develop`, release stabilization on `release/1.0.0`, and stable publication on `main`. These branch assignments illustrate one implementation rather than a required release topology.

1. Concepts and Components

    - Feature Integration
      > Integrate reviewed changes into the project's designated integration branch. In the Git Flow example, create feature branches from `develop` and merge them through reviewed pull requests. Publish alpha snapshots from validated integration commits for early testing.

    - Release Stabilization
      > Qualify a selected release revision on the integration branch or, when isolation is required, on a dedicated release branch. In the Git Flow example, create `release/1.0.0` from `develop` when the release scope is complete. Publish beta versions for testing in merchant sandboxes and release candidates for final qualification. Restrict stabilization changes to release fixes, documentation, and version preparation.

    - Stable Publication
      > Validate the final revision and artifact before publishing the stable release with an immutable tag. In the Git Flow example, merge the approved release branch into `main`, validate the merge result, and publish `1.0.0`. Merge release fixes back into `develop` to preserve them in subsequent development.

2. Sequence and Diagram

    The Git Flow example uses project-defined `alpha`, `beta`, and `rc` stages. Its identifiers follow the [SemVer precedence rules](https://semver.org/spec/v2.0.0.html#spec-item-11):

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
    > Git tags in the diagram mark release revisions. The publication pipeline must validate the merged `main` revision and its artifact before making the final tag and stable release available.

3. Rules

    1. Release Qualification

        Apply release gates, including automated tests, compatibility checks, and artifact verification, before publishing each pre-release or stable release.

    2. Stage Counters

        Start numeric stage counters at `.0` for this workflow; the starting value is a repository convention.

    3. Candidate Corrections

        If final qualification reveals a release-blocking defect, correct the candidate's source revision and publish a new candidate, for example `1.0.0-rc.1`. In the Git Flow example, apply the correction on `release/1.0.0`.

    4. Release Publication

        Publish each version from a validated commit, create a unique version tag, and update `CHANGELOG.md`. Do not republish an existing version.

    5. Fix Reconciliation

        Ensure stabilization fixes are retained in ongoing development. The Git Flow example merges the release branch back into `develop` after merging into `main`; single-branch workflows do not require that additional merge.

## 3. References

- Sentenz [Versioning](../articles/versioning.md) article.
- Sentenz [Commit](../articles/commit.md) article.
- Sentenz [Changelog](../articles/changelog.md) article.
- Sentenz [Branching Strategies](../articles/branching-strategies.md) article.
- Semantic Versioning [Semantic Versioning 2.0.0](https://semver.org/spec/v2.0.0.html) specification.
- Conventional Commits [Conventional Commits 1.0.0](https://www.conventionalcommits.org/en/v1.0.0/) specification.
- Mermaid [GitGraph Diagrams](https://mermaid.js.org/syntax/gitgraph.html) documentation.
