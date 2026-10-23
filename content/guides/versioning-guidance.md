# Versioning Guidance

Versioning guidance defines how software release identifiers are selected, validated, and published. This guide applies [Semantic Versioning (SemVer)](https://semver.org/spec/v2.0.0.html) to stable and pre-release versions and describes a branching-strategy-independent release workflow that uses [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/) for release automation.

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

Release practices map changes to version identifiers and govern when those identifiers are published. The following conventions are recommended for repositories using SemVer, Conventional Commits, and Git Flow; they are not additional requirements of the SemVer specification.

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

A branching workflow determines where changes are integrated, release candidates are prepared, and stable versions are published. These activities are independent of the version identifier format. The selected [branching strategy](../articles/branching-strategies.md) may use a single shared branch, separate integration and production branches, or an optional short-lived release branch.

The following lifecycle applies across these strategies. Branch names and merge operations follow the repository's branching policy rather than requirements imposed by SemVer.

1. Concepts and Components

    - Change Integration
      > Integrate approved features and fixes into the repository's designated integration branch. In trunk-based workflows this is commonly `main` or `trunk`; other workflows may use `develop`. Validated integration revisions may be published as alpha pre-releases.

    - Release Preparation
      > Select the target stable version and the source revision for release qualification. Prepare beta releases and release candidates on the shared integration branch or a dedicated stabilization branch when isolation is required.

    - Release Qualification
      > Test each candidate against compatibility, security, and artifact requirements. Restrict changes during stabilization to corrections needed for the intended release.

    - Stable Publication
      > Publish the stable version from a verified source revision and artifact, using a unique, immutable version tag. The publishing branch and any required merges depend on the selected branching strategy.

    - Fix Reconciliation
      > Ensure that changes made during release stabilization remain part of ongoing development. A single-branch workflow may require no additional merge; workflows with separate branches must propagate the fixes to the applicable integration branch.

2. Sequence and Diagram

    The following example illustrates version progression toward `1.0.0`. The `alpha`, `beta`, and `rc` stages are optional project conventions; version precedence follows the [SemVer specification](https://semver.org/spec/v2.0.0.html#spec-item-11):

    ```plaintext
    1.0.0-alpha.0 < 1.0.0-alpha.1 < 1.0.0-alpha.2 < 1.0.0-beta.0 < 1.0.0-beta.1 < 1.0.0-beta.2 < 1.0.0-rc.0 < 1.0.0
    ```

    The release lifecycle does not assume a particular branch topology:

    ```mermaid
    flowchart TD
        A["Integrate approved changes"] --> B["Select target version and release source"]
        B --> C["Build and validate release candidate"]
        C --> D{"Release gates passed?"}
        D -->|No| E["Apply fixes and prepare next candidate"]
        E --> C
        D -->|Yes| F["Verify final release revision and artifact"]
        F --> G["Create immutable version tag and publish"]
        G --> H["Reconcile fixes with ongoing development"]
    ```

    > [!NOTE]
    > A pre-release may be published from a validated candidate for testing. A stable release requires separate confirmation of the final published revision and artifact. Branch promotion, merge direction, and release-channel configuration are defined by the repository's workflow.

3. Rules

    1. Branch Selection

        Define the integration and publication branches according to the selected strategy. For example, trunk-based development may publish directly from `main`, whereas a multi-branch workflow may integrate on `develop` and publish from `main`.

    2. Stabilization Branches

        Create a dedicated release branch only when release-specific stabilization or parallel maintenance requires it. Branch creation is not a SemVer requirement.

    3. Release Qualification

        Apply release gates, including automated tests, compatibility checks, and artifact verification, before publishing each pre-release or stable release.

    4. Stage Counters

        Starting numeric pre-release stage counters at `.0` is a repository convention, not a SemVer requirement.

    5. Candidate Corrections

        Apply release-blocking corrections to the candidate's source revision or branch and publish a new pre-release identifier, for example `1.0.0-rc.1`, rather than replacing an existing release.

    6. Release Publication

        Publish from a validated commit, create a unique version tag, and update `CHANGELOG.md`. Do not move a published tag or overwrite a published version.

    7. Fix Reconciliation

        Propagate stabilization fixes to all relevant development or maintenance branches. A single-branch workflow may already contain the fixes, whereas a multi-branch workflow may require a merge or cherry-pick.

## 3. References

- Sentenz [Versioning](../articles/versioning.md) article.
- Sentenz [Commit](../articles/commit.md) article.
- Sentenz [Changelog](../articles/changelog.md) article.
- Sentenz [Branching Strategies](../articles/branching-strategies.md) article.
- Semantic Versioning [Semantic Versioning 2.0.0](https://semver.org/spec/v2.0.0.html) specification.
- Conventional Commits [Conventional Commits 1.0.0](https://www.conventionalcommits.org/en/v1.0.0/) specification.
- Mermaid [Flowcharts](https://mermaid.js.org/syntax/flowchart.html) documentation.
