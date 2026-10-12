# 018-ADR: Software Supply Chain Security (SSCS)

Architectural Decision Record on establishing verifiable release acceptance across the software supply chain.

- [1. State](#1-state)
- [2. Context](#2-context)
- [3. Decision](#3-decision)
  - [3.1. Artifact Integrity](#31-artifact-integrity)
  - [3.2. Software Composition Analysis (SCA)](#32-software-composition-analysis-sca)
  - [3.3. Provenance and Attestation](#33-provenance-and-attestation)
  - [3.4. Signing and Verification](#34-signing-and-verification)
  - [3.5. Secure Update Distribution](#35-secure-update-distribution)
  - [3.6. Policy Enforcement](#36-policy-enforcement)
- [4. Considered](#4-considered)
  - [4.1. Artifact Integrity](#41-artifact-integrity)
    - [4.1.1. Source Integrity](#411-source-integrity)
    - [4.1.2. Dependency Integrity](#412-dependency-integrity)
    - [4.1.3. Build Environment Integrity](#413-build-environment-integrity)
    - [4.1.4. Build Integrity](#414-build-integrity)
  - [4.2. Software Composition Analysis (SCA)](#42-software-composition-analysis-sca)
    - [4.2.1. SBOM Management](#421-sbom-management)
    - [4.2.2. License Compliance](#422-license-compliance)
    - [4.2.3. Vulnerability Handling](#423-vulnerability-handling)
  - [4.3. Provenance and Attestation](#43-provenance-and-attestation)
  - [4.4. Signing and Verification](#44-signing-and-verification)
    - [4.4.1. Key-Based Signing](#441-key-based-signing)
    - [4.4.2. Keyless Signing](#442-keyless-signing)
  - [4.5. Secure Update Distribution](#45-secure-update-distribution)
  - [4.6. Policy Enforcement](#46-policy-enforcement)
- [5. Consequences](#5-consequences)
- [6. Implementation](#6-implementation)
- [7. References](#7-references)

## 1. State

- Author(s): Sentenz
- Date: 2026-10-12
- Status: Proposed
- Issue: [#566](https://github.com/sentenz/convention/issues/566)

## 2. Context

Source repositories, dependencies, build infrastructure, signing identities, and distribution services can each become an entry point for unauthorized software changes. A vulnerability scan alone cannot establish where an artifact originated or whether it was substituted after scanning. Consumers need evidence that connects the delivered bytes to an approved source revision and production process.

This ADR proposes one complementary control baseline for producing, releasing, and consuming software artifacts. It covers packages, container images, binaries, and firmware where applicable. It complements [ADR 016](016-adr-eu-cra-security-testing-and-analysis-for-c-cpp.md); it does not replace product security testing or claim that the controls are already deployed.

1. Decision Drivers

    - Explicit Trust
      > Isolation, immutable identifiers, and independent verification limit reliance on implicit trust.

    - Least Privilege
      > Identities, tokens, and build steps receive narrowly scoped permissions for the required duration.

    - Traceability
      > Released bytes remain attributable to source revisions, dependencies, builders, and release approvals.

    - Transparency
      > Component inventories, provenance, and signing evidence remain available for audit and incident response.

    - Integrity
      > Controls detect or prevent unauthorized changes before artifacts are accepted.

    - Compliance
      > Retained evidence supports NIST SSDF practices and product-specific compliance assessments, including CRA-related work addressed by ADR 016.

## 3. Decision

Adopt the following controls as a proposed baseline. Acceptance of this ADR authorizes staged implementation; a SLSA level or operational coverage must be demonstrated separately.

### 3.1. Artifact Integrity

Select protected source control, immutable dependency references, isolated builds, and digest-based artifact promotion. Use the approved [SLSA v1.2](https://slsa.dev/spec/v1.2/) Build and Source tracks as the assessment reference. Target Build L2 for release pipelines, with Build L3 as the hardening objective for high-risk products following a documented builder assessment.

Require review of source and release workflow changes, protected release references, locked dependency resolution with integrity checks, and ephemeral build environments. Separate untrusted pull request execution from release credentials and signing authority. Promote the same tested artifact digest between environments instead of rebuilding it.

These controls implement explicit trust, least privilege, and traceability. Reproducibility is an additional verification technique, not a property automatically established by adopting SLSA. Draft Dependency and Build Environment tracks remain informative until explicitly adopted through a later review.

### 3.2. Software Composition Analysis (SCA)

Select Trivy for supported component discovery, vulnerability scanning, and license detection; CycloneDX JSON as the canonical release SBOM format; and Dependency-Track for continuous portfolio monitoring. Permit SPDX exchange when a consumer requires it, with conversion and information loss assessed.

Bind each release SBOM to the final artifact digest, include direct and transitive components to the extent discoverable, and document coverage gaps. Require review of unknown or prohibited licenses. Track vulnerability applicability, remediation, ownership, and deadlines; use reviewed VEX statements for justified applicability decisions and CSAF for structured advisories where required.

This combination provides transparency and ongoing traceability after release. Scanning and license classification support decisions but do not establish legal compliance or prove absence of vulnerabilities.

### 3.3. Provenance and Attestation

Select SLSA build provenance represented by an in-toto Statement and signed attestations. Require evidence identifying the artifact digest, source revision, authorized builder, build definition, and relevant inputs and parameters. Record unresolved inputs as coverage limitations.

Generate provenance through the trusted build platform and protect it from modification by ordinary build steps. Bind SBOM and scan evidence to the same artifact, including scanner and database versions and scan time. This makes release decisions auditable and distinguishes an inventory from evidence about how an artifact was produced.

### 3.4. Signing and Verification

Select Cosign keyless signing for CI environments with approved OIDC identities and acceptable transparency requirements. Use HSM/KMS-backed key-based signing for disconnected or restricted environments through a documented signing profile.

Verification must match the artifact digest and authorized signer. For keyless signing, constrain the OIDC issuer and certificate identity to the approved workflow and release context, and validate the certificate and transparency evidence using trusted verification material. For key-based signing, trust only explicitly approved public keys and maintain rotation and compromise-response procedures.

This choice limits persistent CI credentials while retaining an alternative for constrained deployments. A valid signature identifies a trusted signing authority only when policy authorizes that identity; it does not prove that the artifact is safe.

### 3.5. Secure Update Distribution

Select The Update Framework (TUF) for products operating their own update repositories and clients. Require trusted root bootstrapping, role separation, threshold signing where appropriate, metadata expiration, version checks, and target digest verification.

Defer a SUIT implementation choice for constrained devices until a product-specific assessment covers device capabilities, trust provisioning, recovery, and update installation. RFC 9019 provides architectural guidance, not a ready-made updater.

This supports integrity beyond transport encryption. Platforms with an existing update mechanism must document equivalent protection against rollback, freeze, and artifact substitution before receiving an exception from the TUF profile.

### 3.6. Policy Enforcement

Select OPA/Rego for release acceptance policy, with Conftest for policy testing and CI integration. A trusted verification component first validates signatures and attestations; OPA evaluates the verified claims and scan results. OPA is not assumed to perform Cosign verification or enforce a deployment decision by itself.

Require gates before publication and again at deployment or installation. Reject missing or invalid mandatory evidence, digest mismatches, unauthorized identities or builders, prohibited licenses, and unresolved findings that violate the approved vulnerability policy. Scanner, verifier, or policy errors must not produce a passing result.

Exceptions require a named owner, independent approval, rationale, exact scope, compensating controls, and expiration. The gate enforces those limits and records its policy version and decision. This makes explicit trust enforceable at the point where software is accepted.

## 4. Considered

### 4.1. Artifact Integrity

[SLSA](https://slsa.dev/spec/v1.2/) provides versioned requirements for assessing production integrity. [Reproducible Builds](https://reproducible-builds.org/docs/definition/) provides a complementary way to compare independently produced outputs.

#### 4.1.1. Source Integrity

Protect branches and release references, require independent review, restrict administration, and audit changes to workflow definitions. Signed commits or tags add evidence of key control but do not establish reviewer approval or code safety.

- Pros
  - Reviewable History
    > Repository controls make unauthorized source and workflow changes harder to introduce unnoticed.
- Cons
  - Trusted Accounts
    > Compromised authorized accounts and colluding reviewers remain risks; signature verification does not replace access controls.

#### 4.1.2. Dependency Integrity

Lock versions and hashes, pin CI actions to commit SHAs and images to digests, restrict dependency sources, and verify upstream signatures or provenance where available. Review automated updates and prevent untrusted caches from contaminating release builds.

- Pros
  - Stable Inputs
    > Immutable references and verified downloads reduce substitution and unexpected dependency resolution.
- Cons
  - Upstream Risk
    > Pinning preserves known bytes, including malicious or vulnerable ones; continuous review and updates remain necessary.

The [SLSA Working Draft](https://slsa.dev/spec/draft/) includes a Dependency track. Its evolving requirements are not treated as an approved conformance baseline here.

#### 4.1.3. Build Environment Integrity

Use ephemeral runners, separate trust domains, pinned toolchains, restricted network access, and short-lived credentials. Protect shared caches, the build control plane, and provenance generation separately from workload execution.

- Pros
  - Reduced Persistence
    > Isolation reduces opportunities for cross-build contamination and credential reuse.
- Cons
  - Operational Cost
    > Isolation, dependency mirrors, and restricted network access require maintenance and may increase build time.

The Working Draft's Build Environment track informs future assessments; it is not evidence of runtime security or a currently claimed assurance level.

#### 4.1.4. Build Integrity

Use a hosted build platform that produces authenticated provenance and assess its isolation and tamper resistance against the chosen [SLSA Build level](https://slsa.dev/spec/v1.2/build-track-basics). Pursue hermetic builds and reproducibility where practical.

- Pros
  - Independent Evidence
    > Platform-generated provenance supports checks against the expected production process.
- Cons
  - Residual Trust
    > The builder remains a trust boundary, and deterministic output can still contain malicious source or compiler behavior.

### 4.2. Software Composition Analysis (SCA)

[Trivy](https://github.com/aquasecurity/trivy) and [Dependency-Track](https://docs.dependencytrack.org/) provide complementary scanning and portfolio monitoring.

#### 4.2.1. SBOM Management

[CycloneDX](https://cyclonedx.org/capabilities/sbom/) and [SPDX](https://spdx.dev/) represent component inventories. Choose CycloneDX for the primary pipeline because it aligns with Dependency-Track ingestion. Preserve the original SBOM when generating another format.

- Pros
  - Continued Visibility
    > Release inventories support later reassessment when new advisories appear.
- Cons
  - Incomplete Discovery
    > Vendored code, static linking, generated components, and opaque firmware may require additional inventory methods.

#### 4.2.2. License Compliance

Use [Trivy license scanning](https://trivy.dev/docs/latest/scanner/license/) to identify license information and apply a reviewed license policy.

- Pros
  - Repeatable Screening
    > Automated findings focus manual review on unknown terms, conflicts, and distribution obligations.
- Cons
  - Interpretation Required
    > License detection cannot resolve all contractual or distribution-specific obligations.

#### 4.2.3. Vulnerability Handling

[OpenVEX](https://github.com/openvex/spec) communicates vulnerability applicability; [CSAF](https://www.csaf.io/) structures security advisories. They complement vulnerability detection. Validate supported formats and product identifiers before integrating [Trivy VEX filtering](https://trivy.dev/docs/latest/supply-chain/vex/); the documented feature is experimental.

- Pros
  - Actionable Triage
    > Product-specific applicability and remediation records help prioritize work and explain justified exclusions.
- Cons
  - Suppression Risk
    > Stale, untrusted, or incorrectly scoped VEX can hide real exposure; preserve raw findings and require review before filtering.

Do not assume general CSAF ingestion by Trivy or interchangeable VEX support across tools. Test the selected tool versions and adapters against representative documents.

### 4.3. Provenance and Attestation

[SLSA build provenance](https://slsa.dev/spec/v1.2/build-provenance) describes production evidence. [Cosign attestations](https://docs.sigstore.dev/cosign/verifying/attestation/) support signed in-toto statements.

- Pros
  - Digest Binding
    > Signed statements connect claims to specific artifact bytes and an identifiable issuer.
- Cons
  - Claims Need Evaluation
    > A signature authenticates a statement, not its truth; consumers must assess the builder and expected claim values.

### 4.4. Signing and Verification

[Cosign verification](https://docs.sigstore.dev/cosign/verifying/verify/) supports identity-based and key-based trust models.

#### 4.4.1. Key-Based Signing

Use a controlled asymmetric key, preferably protected by an HSM or KMS, with public-key distribution and explicit authorization.

- Pros
  - Controlled Trust
    > Suitable for restricted networks and environments with established key custody.
- Cons
  - Key Lifecycle
    > Rotation, backup, access control, revocation policy, and compromise response create operational responsibilities.

#### 4.4.2. Keyless Signing

Use ephemeral keys and short-lived certificates associated with OIDC identities, with transparency evidence in the selected Sigstore deployment.

- Pros
  - Reduced Credential Persistence
    > CI jobs avoid storing a long-lived artifact-signing private key.
- Cons
  - Identity and Service Dependencies
    > OIDC, certificate issuance, and transparency infrastructure become trust and availability dependencies; public logs may disclose signing metadata.

Retain verification bundles and approved trust material for offline validation. Offline operation still requires a policy for refreshing trust and handling compromise; disabling verification is not a fallback.

### 4.5. Secure Update Distribution

[TUF](https://theupdateframework.io/docs/overview/) secures update metadata and target selection. [SUIT RFC 9019](https://datatracker.ietf.org/doc/html/rfc9019) addresses firmware update architecture for constrained devices.

- Pros
  - Update-Specific Controls
    > TUF addresses update freshness and rollback threats beyond individual artifact signatures.
- Cons
  - Client Integration
    > Trusted root provisioning, metadata renewal, persistent client state, and recovery require product engineering; SUIT requires a separate implementation choice.

### 4.6. Policy Enforcement

[OPA](https://www.openpolicyagent.org/docs) evaluates structured inputs against policy. Integrations must obtain trustworthy verification results and enforce the outcome.

- Pros
  - Consistent Acceptance
    > Versioned policies provide reviewable rules and reproducible decisions across release and deployment gates.
- Cons
  - Integration Risk
    > Untrusted inputs, bypass paths, or permissive error handling can defeat an otherwise correct policy.

A scan-only pipeline and signing without consumer verification are rejected as complete solutions because they leave provenance, substitution, and unauthorized release risks unresolved.

## 5. Consequences

- Positive
  - Auditable Releases
    > Source, inventory, production evidence, and release decisions become traceable through artifact digests.
  - Faster Response
    > Retained inventories and monitoring help identify affected releases after a new advisory or supplier compromise.
- Negative
  - Operational Overhead
    > Builders, trust roots, SBOM services, policy adapters, and retained evidence require ownership and maintenance.
  - Release Friction
    > Mandatory evidence and fail-closed gates can delay releases when tools fail or findings need review.
- Risks
  - Authorized Compromise
    > A compromised trusted builder or signer may produce valid evidence for malicious software; mitigate through isolation, independent approval, monitoring, and compromise exercises.
  - Incomplete Evidence
    > Discovery gaps and stale vulnerability data may produce false confidence; record coverage and freshness and retain manual assessment paths.
  - Availability and Disclosure
    > External service outages and public signing metadata require continuity and privacy review; use approved offline verification or restricted signing profiles without silently weakening acceptance.

## 6. Implementation

These steps are follow-up work for consuming projects. This documentation change does not deploy controls or assert conformance.

1. Establish Ownership and Policy

    Product maintainers inventory release artifacts, update channels, and support periods. Security and platform owners define approved builders, signing identities, trust roots, vulnerability thresholds, remediation deadlines, evidence freshness, retention, and exception approval. Record the selected specification and tool versions.

2. Harden Source, Dependencies, and Builds

    Apply branch and release protections, review workflow changes, pin dependencies and tools, and isolate untrusted execution. Start with one release pipeline and document evidence against the SLSA Build L2 target; assess L3 separately before claiming it.

3. Produce and Retain Release Evidence

    Generate the artifact and its SBOM, provenance, and scan results. Reuse applicable [Makefile](../../Makefile) tasks such as `sast-trivy-sbom-cyclonedx-image`, `sast-trivy-sbom-scan`, and `sast-trivy-sbom-license`; validate their outputs and gate behavior. Supplement missing inventory coverage. Store signed evidence alongside the immutable release and ingest the SBOM into Dependency-Track for the support period.

4. Integrate Verification and Acceptance Gates

    Platform owners implement signature verification and trusted claim normalization before OPA evaluation. Add protected policy tests through `policy-conftest-test`. Initially observe policy results to resolve integration gaps; switch to enforced release and deployment gates after the acceptance cases below pass.

5. Validate Acceptance and Failure Paths

    | Case | Required outcome |
    | --- | --- |
    | Approved digest, identity, builder, evidence, and policy results | Accept and record the decision and policy version. |
    | Artifact or SBOM substitution, changed attestation, or digest mismatch | Reject before publication or deployment. |
    | Wrong issuer, workflow identity, key, source revision, or builder | Reject even when a cryptographic signature is valid. |
    | Missing evidence, stale scan, unavailable verifier, or malformed policy input | Block acceptance; record the failure. |
    | Prohibited license or vulnerability exceeding the policy threshold | Block unless an applicable approved exception permits it. |
    | Untrusted VEX, wrong product version, or expired exception | Preserve the finding and reject the claimed exemption. |
    | Expired update metadata, rollback, or substituted update target | Reject installation under the update profile. |
    | Offline verification and signing-key rotation | Accept authorized evidence with provisioned trust; reject unauthorized keys without disabling checks. |

6. Operate and Reassess

    Security owners triage monitoring results, update reviewed VEX and advisories, and coordinate remediation. Release owners test trust rotation, compromised-key response, artifact quarantine, and update recovery. Review coverage and exceptions periodically; changes to the chosen trust model require a subsequent ADR.

## 7. References

- GitHub [Issue #566](https://github.com/sentenz/convention/issues/566), originating proposal.
- Sentenz [ADR 016: Security Testing for C/C++ under CRA](016-adr-eu-cra-security-testing-and-analysis-for-c-cpp.md).
- Sentenz [Makefile](../../Makefile), existing scanning and policy tasks.
- NIST [Secure Software Development Framework](https://csrc.nist.gov/projects/ssdf).
- SLSA [v1.2 specification](https://slsa.dev/spec/v1.2/), [Build track](https://slsa.dev/spec/v1.2/build-track-basics), and [build provenance](https://slsa.dev/spec/v1.2/build-provenance).
- SLSA [Working Draft](https://slsa.dev/spec/draft/), informative future tracks.
- Reproducible Builds [definition](https://reproducible-builds.org/docs/definition/).
- Trivy [repository](https://github.com/aquasecurity/trivy), [license scanning](https://trivy.dev/docs/latest/scanner/license/), and [VEX support](https://trivy.dev/docs/latest/supply-chain/vex/).
- OWASP [CycloneDX SBOM](https://cyclonedx.org/capabilities/sbom/) and [Dependency-Track](https://docs.dependencytrack.org/).
- Linux Foundation [SPDX](https://spdx.dev/).
- OpenVEX [specification](https://github.com/openvex/spec).
- OASIS [Common Security Advisory Framework](https://www.csaf.io/).
- Sigstore [Cosign verification](https://docs.sigstore.dev/cosign/verifying/verify/) and [in-toto attestations](https://docs.sigstore.dev/cosign/verifying/attestation/).
- The Update Framework [overview](https://theupdateframework.io/docs/overview/).
- IETF [RFC 9019: A Firmware Update Architecture for Internet of Things](https://datatracker.ietf.org/doc/html/rfc9019).
- Open Policy Agent [documentation](https://www.openpolicyagent.org/docs).
