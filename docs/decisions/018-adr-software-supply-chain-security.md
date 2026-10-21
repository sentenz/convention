# ADR-018: Software Supply Chain Security (SSCS)

Architectural Decision Records (ADR) on controls that protect the integrity, traceability, and transparency of software from source to distribution.

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
- Date: 2026-10-11
- Status: Proposed

## 2. Context

Software production and delivery rely on source repositories, third-party dependencies, build infrastructure, and distribution channels, each of which can introduce vulnerabilities or allow unauthorized modifications. A Software Supply Chain Security (SSCS) approach aims to improve transparency across the software supply chain, preserve traceability from source to distribution, and enable independent verification of artifacts and their provenance.

1. Decision Drivers

    - Explicit Trust
      > Isolation, least privilege, immutable identifiers, and independent verification reduce the number of systems and credentials that must be trusted implicitly.

    - Least Privilege
      > Identities, tokens, and build steps receive only the permissions they need, for only as long as they need them.

    - Traceability
      > Every artifact can be traced back to its source revision, dependencies, build process, and release approval.

    - Transparency
      > Component inventories, provenance, and signing events are visible and auditable to producers and consumers.

    - Integrity
      > Integrity controls reduce the opportunity for unauthorized source, dependency, build, or release modifications to become accepted software artifacts.

    - Compliance
      > Controls support regulatory and framework expectations, such as the EU Cyber Resilience Act (CRA) and the NIST Secure Software Development Framework (SSDF).

## 3. Decision

Adopt a layered Software Supply Chain Security (SSCS) posture that combines artifact integrity, Software Composition Analysis (SCA) with SBOM/VEX, provenance and attestation, signing, secure update distribution, and policy-based enforcement.

### 3.1. Artifact Integrity

Adopt the SLSA tracks for source, dependency, build environment, and build integrity to ensure that every artifact is produced from verified, integrity-protected inputs in an isolated, auditable build.

1. Rationale

    - Explicit Trust
      > SLSA tracks replace implicit trust in the build pipeline with verifiable, independently checkable evidence at each stage.

    - Integrity
      > Signed commits, verified dependencies, and hermetic builds reduce the opportunity for unauthorized modifications to reach accepted artifacts.

    - Traceability
      > Each track records the source revision, dependency set, and build parameters needed to reconstruct and audit an artifact.

### 3.2. Software Composition Analysis (SCA)

Adopt SBOM generation in CycloneDX and SPDX formats, continuous scanning with Trivy, centralized monitoring with Dependency-Track, and VEX/CSAF for vulnerability handling.

1. Rationale

    - Transparency
      > SBOMs provide a machine-readable, auditable inventory of all components and their relationships.

    - Compliance
      > SBOM, VEX, and CSAF artifacts support CRA and NIST SSDF expectations for component disclosure and vulnerability communication.

    - Integrity
      > Continuous scanning against vulnerability databases detects compromised or vulnerable dependencies before release.

### 3.3. Provenance and Attestation

Adopt SLSA provenance with in-toto metadata and Cosign attestations to record and cryptographically bind evidence about the origin and build process of each artifact.

1. Rationale

    - Traceability
      > in-toto records source revisions, builders, inputs, and parameters, enabling end-to-end reconstruction of an artifact's production.

    - Explicit Trust
      > Signed attestations allow consumers to verify provenance independently rather than trusting the producer.

    - Transparency
      > Attestations are inspectable evidence that supports audits and incident forensics.

### 3.4. Signing and Verification

Adopt keyless signing via Sigstore and Cosign as the default mechanism, with key-based signing (HSM/KMS-backed) available for regulated environments that require long-lived, organization-controlled keys.

1. Rationale

    - Least Privilege
      > Keyless signing uses short-lived certificates bound to OIDC identities, avoiding long-lived secrets and minimizing credential exposure.

    - Explicit Trust
      > The Rekor transparency log provides an independent, append-only record of signing events that consumers can verify.

    - Compliance
      > Key-based signing with HSM/KMS-backed keys satisfies environments that mandate organization-controlled key custody.

### 3.5. Secure Update Distribution

Adopt The Update Framework (TUF) for secure update distribution, with SUIT for constrained IoT devices.

1. Rationale

    - Integrity
      > TUF's role-based signing and metadata verification ensure updates are authentic and untampered in transit.

    - Explicit Trust
      > TUF separates signing roles (root, timestamp, snapshot, target) so no single compromised key can forge an update.

    - Traceability
      > Signed update metadata provides an auditable chain from release to deployed version.

### 3.6. Policy Enforcement

Adopt Open Policy Agent (OPA) with Rego policies to verify signatures, attestations, and SBOM requirements before artifacts are accepted or deployed.

1. Rationale

    - Explicit Trust
      > Policy gates reject unsigned or unverifiable artifacts, enforcing trust decisions rather than assuming them.

    - Least Privilege
      > Policies can encode fine-grained acceptance criteria per environment, limiting what is permitted to deploy.

    - Compliance
      > Centralized, version-controlled policies provide a consistent, auditable enforcement point across the supply chain.

## 4. Considered

### 4.1. Artifact Integrity

#### 4.1.1. Source Integrity

Protect the integrity of the source code by ensuring that changes are attributable, reviewed, and verified through cryptographic methods. Signed commits (GPG/SSH) provide cryptographic assurance of authorship and integrity.

> [!TIP]
> [SLSA Source Track](https://slsa.dev/spec/draft/#source-track) protects source repositories and commit history through signed commits, protected branches, and required review.

- Pros

  - Attributable Revisions
    > Signed commits bind each revision to an identity.

  - Enforced Review
    > Protected branches and required review prevent single-identity merges.

- Cons

  - Key or Identity Management
    > Developers need signing keys or keyless identities configured.

#### 4.1.2. Dependency Integrity

Verify the integrity of dependencies by checking cryptographic digest and lockfiles, and by ensuring that dependencies come from trusted sources.

> [!TIP]
> [SLSA Dependency Track](https://slsa.dev/spec/draft/#dependency-track) ensures that dependencies are verified and integrity-protected, reducing the risk of supply chain attacks. [Renovate](https://docs.renovatebot.com/) automates dependency updates to maintain integrity and security.

- Pros

  - Deterministic Resolution
    > Lockfiles with explicit versions and digests fix direct and transitive dependencies.

  - Tamper Detection
    > Digest verification rejects modified packages.

- Cons

  - Update Burden
    > Pinned versions require automated update tooling and regular review.

  - Uneven Ecosystem Support
    > Dependency managers differ in lockfile and digest support.

#### 4.1.3. Build Environment Integrity

Build environment integrity ensures that the build and runtime environments are protected against tampering and unauthorized modifications. This includes using hermetic build environments, verifying the integrity of build tools, and isolating builds from untrusted inputs.

> [!TIP]
> [SLSA Build Environment Track](https://slsa.dev/spec/draft/#build-environment-track) ensures that the build and runtime environments are integrity-protected and verifiable, reducing the risk of tampering and unauthorized modifications.

- Pros

  - Tamper Resistance
    > Hermetic build environments reduce the risk of unauthorized modifications.

  - Verifiable Builds
    > The integrity of build tools and processes can be independently verified.

  - Isolation
    > Builds are isolated from untrusted inputs, minimizing the attack surface.

- Cons

  - Tooling Limitations
    > Hermetic build environments may require specialized tooling and configuration, which can be a barrier to adoption.

#### 4.1.4. Build Integrity

Build integrity ensures that the build process produces consistent and verifiable outputs, reducing the risk of introducing vulnerabilities or tampering during the build process. This includes using reproducible builds, verifying build artifacts, and maintaining a secure build pipeline.

> [!TIP]
> [SLSA Build Track](https://slsa.dev/spec/draft/#build-track) enforces reproducible and verifiable builds, ensuring that the resulting artifacts are trustworthy. [Reproducible Builds](https://reproducible-builds.org/) provides guidelines and tools for achieving build integrity across different environments.

- Pros

  - Improved Security
    > Ensures that the build outputs are consistent and have not been tampered with, reducing the risk of introducing vulnerabilities.

- Cons

  - Complexity
    > Implementing and maintaining build integrity measures can be complex and require specialized knowledge.

  - Tooling Requirements
    > Ensuring build integrity may necessitate additional tooling and infrastructure, which can increase operational overhead.

### 4.2. Software Composition Analysis (SCA)

Software Composition Analysis (SCA) identifies open source components in a codebase, helping to manage and mitigate risks associated with third-party dependencies, and provides visibility into license compliance.

#### 4.2.1. SBOM Management

Software Bill of Materials (SBOM) involves creating, maintaining, and consuming SBOMs to improve visibility into software components and their dependencies, enhancing supply chain security. [CycloneDX](https://cyclonedx.org/) and [SPDX](https://spdx.dev/) are formats that provide machine-readable models of the components in a product and their relationships, and centralizes SBOM ingestion for continuous monitoring across an organization.

> [!TIP]
> [Trivy](https://github.com/aquasecurity/trivy) generates SBOMs for direct and transitive dependencies and scans SBOMs against vulnerability databases. [Dependency-Track](https://dependencytrack.org/) provides centralized SBOM ingestion for continuous monitoring against multiple vulnerability databases across an organization.

- Pros

  - Improved Visibility
    > Provides clear insight into the components and dependencies used in the software, aiding in risk management and compliance.

- Cons

  - Incomplete Discovery
    > Vendored code, static linking, generated components, and opaque firmware may require additional inventory methods.

#### 4.2.2. License Compliance

License compliance ensures that the use of open source and third-party components adheres to legal requirements, helping to mitigate legal and financial risks associated with non-compliance.

> [!TIP]
> [Trivy](https://github.com/aquasecurity/trivy) automates license compliance management by continuously monitoring dependencies and their licenses, ensuring that open source usage adheres to legal requirements.

- Pros

  - Legal Risk Mitigation
    > Helps ensure that the use of open source and third-party components complies with legal requirements, reducing the risk of legal and financial penalties.

- Cons

  - Confidence Limitation
    > Incomplete or inaccurate license information can lead to incorrect license detection and potential legal risks.

#### 4.2.3. Vulnerability Handling

[VEX (Vulnerability Exploitability eXchange)](https://github.com/openvex/spec) provides a standardized format for communicating the exploitability of vulnerabilities in software components, complementing SBOMs by indicating which vulnerabilities are relevant to a particular deployment. [Common Security Advisory Framework (CSAF)](https://www.csaf.io/) provides a standardized format for communicating security advisories and vulnerability information, complementing SBOMs and VEX by providing actionable security guidance.

> [!TIP]
> [Trivy](https://github.com/aquasecurity/trivy) supports scanning SBOMs, VEX documents, and CSAF advisories to identify vulnerabilities and security issues in software components.

- Pros

  - Actionable Triage
    > Provides clear guidance on which vulnerabilities need immediate attention, enabling efficient and effective remediation efforts.

  - Advisory Integration
    > Integrates with security advisories to provide timely and relevant information about vulnerabilities, enhancing the decision-making process for remediation.

- Cons

  - Suppression Risk
    > Suppressing or ignoring certain vulnerabilities may lead to unaddressed security risks, potentially compromising the security of the software.

### 4.3. Provenance and Attestation

Provenance and Attestation provide verifiable evidence about the origin, build process, and integrity of software artifacts, enabling trust and accountability in the supply chain.

> [!TIP]
> [SLSA Provenance and Attestation](https://slsa.dev/) provide verifiable evidence about the origin, build process, and integrity of software artifacts, enabling trust and accountability in the supply chain. [in-toto](https://in-toto.io/) records verifiable evidence about source revisions, builders, inputs, parameters, and other properties of the software production process. [Cosign Attestations](https://github.com/sigstore/cosign) with built-in support for in-toto provides a mechanism to sign and verify the authenticity of software artifacts.

- Pros

  - Verifiable Trust
    > Provides cryptographic attestations that link each artifact to its source, builder, and inputs.

- Cons

  - Trust Assumptions
    > The security of provenance and attestation mechanisms relies on the trustworthiness of the signing identity and the platform used to generate and verify the attestations.

### 4.4. Signing and Verification

#### 4.4.1. Key-Based Signing

Key-Based Signing uses cryptographic keys to sign software artifacts, ensuring that only authorized entities can produce valid signatures.

> [!TIP]
> [Cosign](https://github.com/sigstore/cosign) signs artifacts with asymmetric keys anchored in a PKI and protected in a Hardware Security Module (HSM) or KMS.

- Pros

  - Strong Authentication
    > Ensures that only authorized entities can sign artifacts, providing a robust mechanism for verifying the origin and integrity of software components.

  - Non-Repudiation
    > Cryptographic signatures provide evidence that a specific entity signed an artifact, preventing denial of authorship and enhancing accountability.

  - Offline Verification
    > Verification works with a public key and without online services.

- Cons

  - Key Management Overhead
    > Managing cryptographic keys securely requires additional infrastructure and operational effort, including key rotation, storage, and access control.

  - Compromise Impact
    > A stolen long-lived key undermines every artifact it signed.

#### 4.4.2. Keyless Signing

Keyless Signing allows signing software artifacts without managing long-lived cryptographic keys, often leveraging ephemeral credentials and identity-based mechanisms.

> [!TIP]
> [Sigstore](https://www.sigstore.dev/) signs with short-lived certificates bound to OIDC identities and records signing events in the public Rekor transparency log. [Cosign](https://github.com/sigstore/cosign) supports keyless signing using ephemeral keys and identity-based credentials, simplifying the signing process while maintaining security guarantees.

- Pros

  - Simplified Key Management
    > Keyless signing eliminates the need for long-lived cryptographic keys, reducing the operational burden and potential risks associated with key management.

  - Transparency Logs
    > Keyless signing records signing events in public transparency logs, providing an auditable trail of signing activities and enhancing trust.

- Cons

  - Identity and Service Dependencies
    > Relies on the security and availability of third-party services (e.g., Sigstore), OIDC identity providers, and the underlying infrastructure to issue ephemeral credentials and record signing events.

### 4.5. Secure Update Distribution

Secure Update Distribution ensures that software updates are delivered securely, maintaining integrity and authenticity throughout the distribution process.

> [!TIP]
> [The Update Framework (TUF)](https://theupdateframework.io/) provides guidelines and best practices for securely distributing software updates, ensuring that updates are authentic and have not been tampered with during transit. [SUIT (Software Updates for Internet of Things)](https://datatracker.ietf.org/doc/rfc9019/) provides a standardized framework for secure software updates in IoT devices.

- Pros

  - Authenticity and Integrity
    > Secure update distribution ensures that updates are authentic and have not been tampered with during transit.

- Cons

  - Infrastructure Complexity
    > Implementing secure update distribution may require additional infrastructure and coordination between update servers and clients.

### 4.6. Policy Enforcement

Policy Enforcement evaluates structured inputs against policy rules to ensure compliance before artifacts are accepted or deployed.

> [!TIP]
> [Open Policy Agent (OPA)](https://www.openpolicyagent.org/) evaluates policies written in Rego to verify signatures, attestations, and SBOM requirements before artifacts are accepted or deployed.

- Pros

  - Compliance Assurance
    > Automatically verifies that artifacts meet security and operational policies, reducing the risk of non-compliant deployments.

- Cons

  - Policy Management Overhead
    > Maintaining and updating policies across environments can be complex and requires ongoing attention.

## 5. Consequences

- Positive

  - End-to-End Trust
    > Combining integrity, provenance, signing, and policy enforcement yields artifacts whose origin and integrity can be independently verified at every stage.

  - Consumer Trust
    > Consumers can enforce their own trust policies against signed artifacts and attestations without trusting the producer.

  - Regulatory Compliance
    > SBOM, VEX, CSAF, and signed provenance directly support EU CRA obligations, reducing compliance effort.

  - Incident Response
    > Provenance attestations and component inventories accelerate root-cause analysis and impact assessment during supply chain incidents.

- Negative

  - Operational Complexity
    > Introducing artifact integrity, SCA, provenance, signing, and policy enforcement adds multiple tools and pipeline stages to operate and maintain.

  - Build Overhead
    > SBOM generation, scanning, attestation, and signing increase build time and require additional infrastructure (e.g., Dependency-Track, Rekor).

  - Key and Identity Management
    > Keyless signing depends on OIDC identity providers and the Sigstore infrastructure, while key-based signing requires HSM/KMS management.

- Risks

  - Tooling Fragmentation
    > Multiple tools (Trivy, Dependency-Track, Cosign, OPA) must be kept compatible and consistently configured.

  - Policy Drift
    > Enforcement policies may diverge across environments over time.

  - False Negatives in Scanning
    > Vulnerability databases may lag newly disclosed vulnerabilities.

## 6. Implementation

1. Harden Source and Dependencies

    - Enforce signed commits, protected branches, and required review on all source repositories to satisfy the SLSA Source Track.
    - Enable lockfiles and cryptographic digest pinning, and automated dependency updates to CI.

2. Harden Builds

    - Run builds to ephemeral, isolated, least-privilege runners with short-lived credentials.
    - Pin CI steps and build images by digest, remove network access from build stages, and track reproducibility.

3. Produce and Retain Evidence

    - Generate and Ingest SBOMs
      - Generate the artifact and its SBOM, provenance.
      - Ingest SBOMs into centralized continuous monitoring platform (e.g. Dependency-Track).

    - Produce Provenance and Attestations
      - Emit in-toto metadata during builds and attach SLSA provenance attestations using Cosign.

    - Signing Artifacts and Attestation
      - Sign artifacts and attestations with keyless signing, or with HSM/KMS-backed key-based signing where offline verification is required.
      - Store signed evidence alongside the immutable release artifacts.

4. Enforce Policies

    - Write OPA policies in Rego that verify signatures, attestations, and SBOM presence before artifacts are accepted or deployed.

5. Secure Update Distribution

    - Distribute updates through TUF (and SUIT for IoT), verifying signed metadata on the consumer side.

## 7. References

- SLSA [Specification](https://slsa.dev/spec/draft/) page.
- [Reproducible Builds](https://reproducible-builds.org/) page.
- [CycloneDX](https://cyclonedx.org/) page.
- [SPDX](https://spdx.dev/) page.
- [Trivy](https://github.com/aquasecurity/trivy) repository.
- [Dependency-Track](https://dependencytrack.org/) page.
- GitHub [OpenVEX](https://github.com/openvex/spec) specification.
- [Common Security Advisory Framework (CSAF)](https://www.csaf.io/) page.
- [in-toto](https://in-toto.io/) page.
- [Cosign](https://github.com/sigstore/cosign) repository.
- [Sigstore](https://www.sigstore.dev/) page.
- [The Update Framework (TUF)](https://theupdateframework.io/) page.
- IETF [SUIT (RFC 9019)](https://datatracker.ietf.org/doc/rfc9019/) specification.
- [Open Policy Agent (OPA)](https://www.openpolicyagent.org/) page.
