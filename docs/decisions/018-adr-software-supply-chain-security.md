# 018-ADR: Software Supply Chain Security

Architectural Decision Record (ADR) on adopting complementary controls to protect software dependencies, build infrastructure, release artifacts, and update delivery throughout the product lifecycle.

- [1. State](#1-state)
- [2. Context](#2-context)
- [3. Decision](#3-decision)
  - [3.1. Controlled Source and Dependency Intake](#31-controlled-source-and-dependency-intake)
  - [3.2. Isolated Builds and Least Privilege](#32-isolated-builds-and-least-privilege)
  - [3.3. SCA and SBOM Management](#33-sca-and-sbom-management)
  - [3.4. SLSA Build Provenance](#34-slsa-build-provenance)
  - [3.5. Artifact Signing and Verification](#35-artifact-signing-and-verification)
  - [3.6. Authenticated Update Delivery](#36-authenticated-update-delivery)
  - [3.7. Reproducible Builds](#37-reproducible-builds)
- [4. Considered](#4-considered)
  - [4.1. Controlled Source and Dependency Intake](#41-controlled-source-and-dependency-intake)
  - [4.2. Isolated Builds and Least Privilege](#42-isolated-builds-and-least-privilege)
  - [4.3. SCA and SBOM Management](#43-sca-and-sbom-management)
  - [4.4. SLSA Build Provenance](#44-slsa-build-provenance)
  - [4.5. Artifact Signing and Verification](#45-artifact-signing-and-verification)
  - [4.6. Authenticated Update Delivery](#46-authenticated-update-delivery)
  - [4.7. Reproducible Builds](#47-reproducible-builds)
- [5. Consequences](#5-consequences)
- [6. Implementation](#6-implementation)
- [7. References](#7-references)

## 1. State

- Author(s): Sentenz
- Date: 2026-09-14
- Status: Proposed

## 2. Context

Software can be compromised through an upstream dependency, an unauthorized source change, a build tool, or replacement of an otherwise legitimate release. Testing application behavior does not establish who produced the delivered artifact or whether it corresponds to the reviewed source.

This ADR defines a supply chain baseline for product repositories adopting these conventions, including C/C++ embedded software and firmware. The scope covers source, direct and transitive dependencies, build tools, CI/CD services, registries, release evidence, and update clients.

For products within the EU Cyber Resilience Act (CRA) scope, third-party component due diligence and vulnerability handling are relevant obligations.

1. Decision Drivers

    - Source and Artifact Integrity
      > Changes and delivered artifacts must be traceable to reviewed inputs and authorized producers.

    - Supply Chain Transparency
      > Component inventory must cover shipped dependencies and separately identify tools capable of influencing the build.

    - Trust Boundary Enforcement
      > Untrusted contributions, dependency code, build execution, and release authorization require distinct privileges and verification.

    - Lifecycle Security
      > Dependency updates, vulnerability triage, key rotation, and recovery must remain operational throughout product support.

    - Auditability
      > Each release must retain verifiable evidence linking its exact bytes to source, build configuration, inventory, and release approval.

    - Developer Experience
      > Automated checks must give actionable feedback and support controlled dependency updates without routine manual release assembly.

    - Embedded Applicability
      > Controls must accommodate cross-compilers, vendor SDKs, static libraries, binary blobs, and devices with limited connectivity.

## 3. Decision

Adopt the complementary controls as a unified software supply chain security baseline. Enforce verification at dependency intake, release promotion, and artifact consumption. Introduce reproducible builds as an additional assurance mechanism.

Basic checksum validation and vulnerability scanning are insufficient for comprehensive software supply chain security. They do not establish source authenticity, authorized build provenance, artifact authenticity and integrity, or secure software update delivery.

### 3.1. Controlled Source and Dependency Intake

Require reviewed changes to source, dependency declarations, lockfiles, build definitions, and trust policies. Resolve dependencies from approved origins and record immutable revisions and cryptographic digests. Review supplier maintenance, security contacts, licensing, and replacement options before adopting a component.

For C/C++ projects, include vendored code, submodules, header-only libraries, SDKs, and prebuilt binaries. When Conan is used, retain lockfiles and build/host profiles; separately record binary revisions and hashes. A lockfile stabilizes dependency resolution but does not establish trustworthy content or identical output bytes. See [Conan lockfiles](https://docs.conan.io/2/tutorial/versioning/lockfiles.html).

1. Rationale

    - Source and Artifact Integrity
      > Reviewed inputs and verified origin reduce opportunities for dependency substitution and unauthorized release changes.

    - Lifecycle Security
      > Owned dependencies and reviewed update proposals prevent immutable pins from becoming indefinite exposure to known defects.

    - Embedded Applicability
      > Explicit vendor and toolchain records cover inputs that package-manager discovery can miss.

### 3.2. Isolated Builds and Least Privilege

Run release builds on managed, disposable workers. Separate untrusted pull-request execution from release credentials and trusted caches. Scope repository, registry, and deployment permissions to the job that needs them; prefer short-lived workload credentials with restrictive identity policies.

For GitHub Actions, pin actions and reusable workflows to reviewed full commit SHAs. Do not execute untrusted source or downloaded scripts in privileged workflow contexts. Treat artifacts from other runs as untrusted inputs until their origin and content are checked. These controls follow the [GitHub Actions secure use guidance](https://docs.github.com/en/actions/reference/security/secure-use).

1. Rationale

    - Trust Boundary Enforcement
      > Isolation and scoped credentials limit the ability of a compromised build step to alter another build or authorize a release.

    - Auditability
      > Recorded worker images, permissions, and workflow revisions make the build environment reviewable.

### 3.3. SCA and SBOM Management

Generate a CycloneDX JSON Software Bill of Materials (SBOM) for each released artifact and target configuration. Use Software Composition Analysis (SCA) with Trivy where supported and ingest release SBOMs into OWASP Dependency-Track for continued monitoring. Accept SPDX exchanges where required, with validated conversion and preserved originals.

Reconcile generated inventory against package graphs, linker/build outputs, and supplier records. Distinguish components shipped in the product from dependencies used only during the build. Attach versioned Vulnerability Exploitability eXchange (VEX) assessments to specific product versions; require supporting evidence and reassessment triggers for a claim that a product is not affected. See [Dependency-Track](https://docs.dependencytrack.org/) and [CycloneDX VEX](https://cyclonedx.org/capabilities/vex/).

1. Rationale

    - Supply Chain Transparency
      > A release-specific inventory supports impact analysis when new advisories identify affected components.

    - Lifecycle Security
      > Continued monitoring and documented triage connect dependency findings to maintained products.

    - Embedded Applicability
      > Inventory reconciliation exposes gaps caused by static linking, vendor binaries, and incomplete package metadata.

### 3.4. SLSA Build Provenance

Adopt SLSA v1.2 Build provenance, targeting an assessed Build L2 baseline and progressing to Build L3 for release builders. These are adoption targets, not claims about current infrastructure. Generate authentic provenance through the trusted build platform and distribute it with releases. Signing a build script's self-reported JSON is insufficient to establish the targeted assurance. See [SLSA Build track basics](https://slsa.dev/spec/v1.2/build-track-basics) and [build requirements](https://slsa.dev/spec/v1.2/build-requirements).

Record the artifact digest, source revision, builder identity, build definition, and resolved inputs. Supplement provenance with toolchain, SDK, sysroot, linker-script, and configuration records where needed. Follow the [Build provenance specification](https://slsa.dev/spec/v1.2/build-provenance); an SBOM and build provenance serve different purposes.

1. Rationale

    - Auditability
      > Provenance links a released artifact to its producer and recorded build process.

    - Trust Boundary Enforcement
      > Platform-generated evidence reduces reliance on statements controlled entirely by tenant build scripts.

### 3.5. Artifact Signing and Verification

Use Sigstore Cosign for artifact signatures and attestations. Prefer workload identity signing in connected CI environments; use an approved KMS/HSM-backed signing service when offline or product trust requirements demand managed keys. Keep long-lived private keys outside repositories and general build workers. See [Sigstore verification](https://docs.sigstore.dev/cosign/verifying/verify/) and [KMS support](https://docs.sigstore.dev/cosign/key_management/overview/).

Before promotion, verify the actual artifact bytes, signature, authorized identity and issuer or trusted key, and relevant attestations. Check the provenance subject digest, trusted signer/builder pair, repository, source revision, build type, and permitted parameters against a reviewed policy. Reject missing evidence, unexpected parameters, and identity mismatches. Promote the verified bytes without rebuilding. See [SLSA artifact verification](https://slsa.dev/spec/v1.2/verifying-artifacts).

1. Rationale

    - Source and Artifact Integrity
      > Verification detects artifact substitution and binds release acceptance to an authorized producer.

    - Auditability
      > Retained signatures, verification bundles, and policy results allow later examination of the release decision.

### 3.6. Authenticated Update Delivery

Require authenticated release metadata and payload verification at the update client. Adopt The Update Framework (TUF) for repository-based update delivery where clients can support its trust, persistent-state, and expiry requirements. For constrained or offline firmware, require a documented equivalent design with trusted keys, signed manifests, product compatibility checks, rollback protection, and recovery procedures.

A CI signature alone does not authorize installation on a device. Distribute trust roots securely and define key rotation, compromised-key recovery, metadata freshness, and interrupted-update behavior before deployment. See the [TUF overview](https://theupdateframework.io/docs/overview/) and [TUF specification](https://theupdateframework.github.io/specification/latest/).

1. Rationale

    - Lifecycle Security
      > Verified update metadata extends release integrity into distribution, installation, and recovery.

    - Embedded Applicability
      > Explicit client requirements expose limitations in clocks, storage, and offline operation before field deployment.

### 3.7. Reproducible Builds

Pilot independent rebuilds of a representative release using a recorded source revision, environment, and build procedure. Compare output bytes within an explicitly defined scope and record differences. Defer a universal reproducibility gate until the pilot demonstrates feasibility across supported toolchains. See the [Reproducible Builds definition](https://reproducible-builds.org/docs/definition/).

1. Rationale

    - Source and Artifact Integrity
      > Independently matching output provides corroborating evidence when the original builder is the principal trust dependency.

    - Embedded Applicability
      > A scoped pilot identifies proprietary toolchain and firmware packaging constraints before broad adoption.

## 4. Considered

### 4.1. Controlled Source and Dependency Intake

Controlled source and dependency intake establishes reviewed source changes, approved component origins, and immutable dependency records before build execution.

> [!TIP]
> [NIST SSDF](https://csrc.nist.gov/pubs/sp/800/218/final) provides secure development and supplier communication practices. [Conan lockfiles](https://docs.conan.io/2/tutorial/versioning/lockfiles.html) record dependency versions and revisions to support controlled dependency resolution in C/C++ projects.

- Pros

  - Reviewable Changes
    > Dependency updates, source revisions, and build configuration changes can be evaluated before integration.

  - Supplier Accountability
    > Maintenance and support records help plan remediation or replacement of abandoned components.

- Cons

  - Residual Upstream Risk
    > An approved origin or pinned digest can still contain malicious or vulnerable code.

  - Maintenance Cost
    > Updates, vendor exceptions, and unavailable upstream artifacts require active ownership.

### 4.2. Isolated Builds and Least Privilege

Isolated builds separate execution environments, while least privilege limits access to repository data, credentials, and release services.

> [!TIP]
> [GitHub Actions security controls](https://docs.github.com/en/actions/reference/security/secure-use) and [SLSA build requirements](https://slsa.dev/spec/v1.2/build-requirements) guide workflow permissions, build isolation, and separation of build execution from trusted services.

- Pros

  - Reduced Compromise Scope
    > Disposable workers and separated privileges restrict persistence and access to release authority.

- Cons

  - Infrastructure Cost
    > Isolation, restricted network access, and safe cache management add operational work.

  - Trusted Platform Risk
    > Worker isolation does not eliminate compromise of the build platform or its administrators.

### 4.3. SCA and SBOM Management

Software Composition Analysis (SCA) identifies third-party components and known vulnerabilities, while Software Bill of Materials (SBOM) management maintains component inventories for released products.

> [!TIP]
> [Trivy](https://trivy.dev/docs/latest/target/sbom/) scans supported SBOM inventories for known vulnerabilities. OWASP [Dependency-Track](https://docs.dependencytrack.org/) monitors CycloneDX portfolios, and [CycloneDX VEX](https://cyclonedx.org/capabilities/vex/) records product-specific vulnerability assessments.

- Pros

  - Release Impact Analysis
    > Component records enable identification of affected products after a new advisory.

  - Interoperability
    > Standardized inventory and assessment formats support supplier and customer exchange.

- Cons

  - Inventory Gaps
    > Scanner support and supplier metadata determine coverage; schema validity does not establish inventory completeness.

  - Advisory Limits
    > Missing advisories, incorrect component identifiers, and configuration-dependent exposure require manual investigation.

### 4.4. SLSA Build Provenance

Build provenance records the source, inputs, producer, and build process associated with an artifact, supporting verification against expected release inputs.

> [!TIP]
> [SLSA v1.2](https://slsa.dev/spec/v1.2/build-track-basics) defines increasing levels of build assurance. Its [Build provenance specification](https://slsa.dev/spec/v1.2/build-provenance) provides a structured format for recording artifact digests, builder identity, build definitions, and resolved inputs.

- Pros

  - Traceability
    > Consumers can compare recorded source and build identities with expected release inputs.

  - Incremental Adoption
    > Teams can assess platform capabilities and strengthen assurance without changing the inventory format.

- Cons

  - Incomplete Inputs
    > Provenance dependency recording can remain incomplete and does not replace a reconciled SBOM.

  - Assurance Boundaries
    > Build L3 does not itself require hermetic or reproducible builds or eliminate trust in the build platform.

### 4.5. Artifact Signing and Verification

Artifact signing binds release content to a signing identity, while verification checks its integrity and authorization against a defined trust policy.

> [!TIP]
> [Sigstore Cosign](https://docs.sigstore.dev/cosign/verifying/verify/) verifies signatures on container images and arbitrary files, including software archives and firmware binaries, using identity-based or key-based trust.

- Pros

  - Artifact Coverage
    > The same release policy can cover container images, software archives, and firmware files.

  - Explicit Producer Identity
    > Verification can require the intended signer rather than accepting any cryptographically valid signature.

- Cons

  - Trust Operations
    > Identity policies, trust roots, verification bundles, and key lifecycle procedures require maintenance.

  - Signed Malicious Content
    > A compromised authorized producer can sign harmful software; signing does not assess application behavior.

### 4.6. Authenticated Update Delivery

Authenticated update delivery verifies release metadata and payloads before installation, protecting the path from the release repository to the product.

> [!TIP]
> [The Update Framework (TUF)](https://theupdateframework.github.io/specification/latest/) uses signed, versioned, expiring metadata and separated roles to protect update delivery against rollback, freeze, and metadata substitution attacks.

- Pros

  - Distribution Protection
    > Client verification addresses rollback, freeze, and metadata substitution threats beyond transport encryption.

- Cons

  - Device Constraints
    > Trust bootstrap, reliable freshness checks, persistent state, and recovery need product-specific engineering.

  - Separate Build Trust
    > Update metadata authenticates distribution decisions without proving how the payload was built.

### 4.7. Reproducible Builds

Reproducible builds allow independent parties to produce identical artifacts from specified source code, build environments, and instructions.

> [!TIP]
> [Reproducible Builds](https://reproducible-builds.org/docs/definition/) defines reproducibility and provides guidance on [recording build environments](https://reproducible-builds.org/docs/recording/) and handling [embedded signatures](https://reproducible-builds.org/docs/embedded-signatures/) when comparing independently rebuilt artifacts.

- Pros

  - Independent Corroboration
    > Comparing independently rebuilt output provides evidence beyond the original builder's statements.

- Cons

  - Toolchain Constraints
    > Proprietary SDKs, nondeterministic generators, timestamps, and unavailable build inputs can prevent matching output.

  - Comparison Scope
    > Embedded signatures may vary, requiring a precisely defined payload comparison and separate verification of the distributed signature.

## 5. Consequences

- Positive

  - Release Traceability
    > Every promoted artifact has an associated inventory, build record, verification result, and approval.

  - Faster Incident Scoping
    > Product and dependency records support targeted withdrawal, rebuilding, and customer remediation.

  - Consistent Automation
    > Shared verification policies reduce variation between product release pipelines.

- Negative

  - Operational Overhead
    > Teams must maintain builders, inventory quality, verification policies, signing infrastructure, and update clients.

  - Release Availability
    > Missing evidence or unavailable trust services can delay a release and require a tested recovery process.

- Risks

  - Correlated Compromise
    > A trusted maintainer or platform can produce malicious but validly signed artifacts; mitigate with independent review, separated release authority, security testing, and the reproducibility pilot.

  - Incomplete Inventory
    > Vendor binaries and build-time downloads can escape discovery; reconcile inventories and require supplier evidence with tracked gaps.

  - Verification Bypass
    > Ad hoc manual uploads can defeat pipeline controls; restrict release writes and audit every promotion path.

  - Trust Material Exposure
    > Public transparency services can reveal identity metadata; assess disclosure needs and use approved private infrastructure where required.

  - Stale Exceptions
    > Permanent suppressions can conceal unresolved risk; require an owner, justification, scope, expiry, and revalidation trigger.

## 6. Implementation

1. Establish Ownership and Scope

    Product engineering owns dependency manifests and inventory reconciliation. The platform team owns builders, registries, and verification services. Product security owns triage and trust policy; release engineering owns promotion and delivery. Record named owners, supported products, suppliers, and trust boundaries before rollout.

    In this repository, affected areas for subsequent implementation include dependency configuration, `.github/workflows/`, and the Makefile Trivy/Cosign tasks. Downstream product repositories, package registries, firmware update clients, and evidence storage also require integration. This ADR records the proposal; it does not deploy those controls.

2. Control Inputs and Updates

    Inventory dependencies and executable build inputs. Review immutable pins, approved registries, content hashes, vendor patches, and update proposals. Prevent private package names from falling back to public registries. Verify available supplier signatures and provenance before use; document unavailable evidence and compensating review. Treat package installation hooks and code generators as executable untrusted inputs.

3. Harden the Build Path

    Create disposable release workers with reviewed toolchain images and isolated caches. Limit network access to required origins and record additional fetched inputs. Separate release signing and publishing authority from general build jobs. Validate that untrusted contributions cannot obtain release credentials or modify trusted outputs.

4. Produce and Reconcile Release Evidence

    Generate inventory from the actual release configuration and augment it with vendor and build records. Record the scanner version, database timestamp, findings, and VEX decisions. Generate provenance through the trusted builder and attest the SBOM against the artifact digest. Preserve the original evidence when converting formats.

5. Enforce Promotion and Consumption Gates

    Apply the following acceptance checks to each release. Verification policy changes require review independently of the release being evaluated.

    | Boundary | Required check | Evidence |
    | --- | --- | --- |
    | Source to build | Approved revision, build definition, and input set | Review record and resolved inputs |
    | Dependency to build | Approved origin, pinned content, supplier assessment | Intake record and digest checks |
    | Build to staging | Artifact identity, reconciled SBOM, current triage | SBOM, scan report, and VEX |
    | Staging to release | Authorized signer, expected provenance, matching digest | Verification report and policy revision |
    | Release to client | Trusted manifest, product compatibility, freshness, rollback protection | Client validation and update tests |
    | Supported release to maintenance | New advisory assessment and remedial action | Product vulnerability register |

    Block promotion for missing or invalid mandatory evidence, unexplained inventory gaps, and unresolved critical/high findings pending product-specific triage. A justified VEX assessment may establish non-applicability; it must not silently suppress an affected vulnerability. Any exception requires a named approver, compensating controls, expiry, and recorded release scope. Exceptions cannot authorize a release that violates an applicable product obligation.

6. Operate Vulnerability Handling and Recovery

    Monitor supported release inventories, supplier advisories, and compromised signing identities. Define risk-based remediation targets and procedures to stop promotion, withdraw compromised artifacts, rotate trust material, and rebuild from reviewed inputs. Exercise update recovery on representative hardware.

    For CRA-covered manufacturers, reporting triggers and deadlines are separate from remediation targets: the 24-hour early warning and 72-hour notification concern qualifying actively exploited vulnerabilities or severe incidents, not every scanner finding. See the Commission's [reporting guidance](https://digital-strategy.ec.europa.eu/en/policies/cra-reporting).

7. Retain Evidence and Trust Material

    Archive release artifacts, manifests, SBOMs, provenance, verification bundles, policies, approvals, triage, and recovery records in access-controlled storage protected against unauthorized alteration. Test restoration and verification without relying on a live CI run or default CI retention.

    For CRA-covered products, align technical-documentation retention with Article 13(13): at least ten years after market placement or the support period, whichever is longer. Determine support from expected use under Article 13(8), including its five-year minimum and shorter-lifetime exception. Track update availability separately under Article 13(9). See [Regulation (EU) 2024/2847](https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=CELEX:32024R2847).

8. Validate Before Rollout

    Run a representative software or firmware release through the complete path. Confirm acceptance of valid evidence and rejection of a modified artifact, unauthorized signer, wrong issuer, substituted source revision, unexpected build parameter, missing SBOM, expired exception, poisoned cache input, and replayed update metadata. Test key rotation, offline verification where needed, and interrupted installation.

    Assess builder requirements before advertising a SLSA level. Pilot independent rebuilds using recorded environments; for signed firmware, define the unsigned payload comparison and verify the delivered signature separately. Record mismatches and the remaining scope before making reproducibility a release gate. See [environment recording](https://reproducible-builds.org/docs/recording/) and [embedded signatures](https://reproducible-builds.org/docs/embedded-signatures/).

## 7. References

- Sentenz convention [issue #556](https://github.com/sentenz/convention/issues/556), originating request.
- Sentenz convention [issue #476](https://github.com/sentenz/convention/issues/476), structural orientation and complementary security testing.
- Sentenz convention [ADR 014: Dependency Manager for C/C++](014-adr-dependency-manager-c-cpp.md).
- Sentenz convention [ADR 016: EU CRA Security Testing and Analysis for C/C++](016-adr-eu-cra-security-testing-and-analysis-for-c-cpp.md).
- Sentenz convention [Makefile](https://github.com/sentenz/convention/blob/main/Makefile), existing Trivy and Cosign task definitions.
- NIST [SP 800-218: Secure Software Development Framework](https://csrc.nist.gov/pubs/sp/800/218/final).
- SLSA v1.2 [Build track basics](https://slsa.dev/spec/v1.2/build-track-basics), [build requirements](https://slsa.dev/spec/v1.2/build-requirements), [Build provenance](https://slsa.dev/spec/v1.2/build-provenance), and [artifact verification](https://slsa.dev/spec/v1.2/verifying-artifacts).
- GitHub Actions [Secure use reference](https://docs.github.com/en/actions/reference/security/secure-use).
- Conan [Lockfiles](https://docs.conan.io/2/tutorial/versioning/lockfiles.html).
- Trivy [SBOM scanning](https://trivy.dev/docs/latest/target/sbom/).
- OWASP [Dependency-Track documentation](https://docs.dependencytrack.org/).
- CycloneDX [Vulnerability Exploitability eXchange](https://cyclonedx.org/capabilities/vex/).
- Sigstore [Signature verification](https://docs.sigstore.dev/cosign/verifying/verify/) and [key management](https://docs.sigstore.dev/cosign/key_management/overview/).
- The Update Framework [Overview](https://theupdateframework.io/docs/overview/) and [specification](https://theupdateframework.github.io/specification/latest/).
- Reproducible Builds [Definition](https://reproducible-builds.org/docs/definition/), [recording the environment](https://reproducible-builds.org/docs/recording/), and [embedded signatures](https://reproducible-builds.org/docs/embedded-signatures/).
- European Union [Regulation (EU) 2024/2847](https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=CELEX:32024R2847), particularly Article 13 and Annex I.
- European Commission [CRA overview](https://digital-strategy.ec.europa.eu/en/policies/cyber-resilience-act), [manufacturer guidance](https://digital-strategy.ec.europa.eu/en/policies/cra-manufacturers), and [reporting guidance](https://digital-strategy.ec.europa.eu/en/policies/cra-reporting).
