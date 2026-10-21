# 019-ADR: Digital Signatures with Raw Public Keys

Architectural Decision Records (ADR) on signing application data and verifying asymmetric digital signatures using authenticated public keys without requiring an X.509 certificate chain.

- [1. State](#1-state)
- [2. Context](#2-context)
- [3. Decision](#3-decision)
  - [3.1. Ed25519 (PureEdDSA)](#31-ed25519-pureeddsa)
  - [3.2. Authenticated Public-Key Pinning](#32-authenticated-public-key-pinning)
- [4. Considered](#4-considered)
  - [4.1. Ed25519 (PureEdDSA)](#41-ed25519-pureeddsa)
  - [4.2. ECDSA P-256 with SHA-256](#42-ecdsa-p-256-with-sha-256)
  - [4.3. RSA-PSS with SHA-256](#43-rsa-pss-with-sha-256)
  - [4.4. Authenticated Public-Key Pinning](#44-authenticated-public-key-pinning)
  - [4.5. X.509 Certificate-Based Trust](#45-x509-certificate-based-trust)
- [5. Consequences](#5-consequences)
- [6. Implementation](#6-implementation)
- [7. References](#7-references)

## 1. State

- Author(s): Sentenz
- Date: 2026-10-21
- Status: Proposed

## 2. Context

Application artifacts, commands, configuration, and other serialized payloads may require integrity and origin authentication when the signer and verifier are separate processes or devices. A digital signature proves possession of a corresponding private key; verifying that signature with an arbitrary public key does **not** establish the signer's identity or authorization. Where a small and pre-established set of trusted signers is sufficient, certificate-chain processing introduces infrastructure and operational dependencies that may not be necessary.

This record concerns **application-layer detached digital signatures**, not TLS handshakes, key exchange, confidentiality, legal non-repudiation, or certificate issuance. Here, a *raw Ed25519 public key* means its 32-byte RFC 8032 public-key value without an X.509 certificate. It is distinct from an RFC 7250 TLS *RawPublicKey*, which conveys a DER-encoded SubjectPublicKeyInfo structure (including an algorithm identifier). These representations must not be silently interchanged.

1. Decision Drivers

    - Integrity and Origin Authentication
      > Reject modified payloads and signatures made with keys not authorized for the intended operation.

    - Compactness and Performance
      > Minimize verification footprint, transmitted signature size, and implementation overhead for constrained clients.

    - Interoperability
      > Choose a standards-defined algorithm, explicit byte encodings, and reproducible test vectors.

    - Trust Establishment
      > Bind public keys to authenticated signer identities and permissible purposes independently of the signature operation.

    - Key Lifecycle Security
      > Support protected private-key storage, authenticated provisioning, rotation, revocation, and compromise recovery.

    - Protocol Robustness
      > Prevent algorithm confusion, ambiguous message encodings, cross-protocol signature reuse, and unauthenticated trust-store updates.

## 3. Decision

### 3.1. Ed25519 (PureEdDSA)

Select **Ed25519 PureEdDSA** (RFC 8032) as the default algorithm for detached application-data signatures. An Ed25519 public key occupies 32 bytes and a signature occupies 64 bytes. Sign and verify exactly the application-defined canonical byte sequence; do not substitute a custom prehash, treat Ed25519ph as interchangeable, or apply an additional caller-selected digest. Algorithms and encodings are fixed by a versioned signing profile rather than accepted from an untrusted message header.

1. Rationale

    - Compactness and Performance
      > Short public keys and signatures suit embedded systems and small signed artifacts.

    - Interoperability
      > RFC 8032 defines test vectors and signature behavior; RFC 8410 defines its SubjectPublicKeyInfo representation where a standard key container is needed.

    - Protocol Robustness
      > PureEdDSA avoids caller-managed per-signature randomness, while a fixed signing profile reduces algorithm-negotiation ambiguity.

### 3.2. Authenticated Public-Key Pinning

Select **authenticated provisioning and pinning of signer public keys** as the trust model. The verifier maintains a protected mapping between an authorized signer identity, allowed key usage or operation, algorithm, and approved public-key bytes. An in-band public key or key identifier may help locate a candidate record but must never independently confer trust.

For this application-layer profile, represent an Ed25519 key as exactly 32 public-key bytes in the trusted store. If DER SubjectPublicKeyInfo is required for interchange, parse it explicitly under RFC 8410, check the Ed25519 algorithm identifier, and convert it into the same trusted key representation. An X.509 certificate chain is not required for signature verification under this profile.

1. Rationale

    - Trust Establishment
      > Provisioning over a separately authenticated channel binds a key to the signer and permitted signing purposes.

    - Compactness and Performance
      > Verifiers avoid certificate-path discovery and validation where a constrained trusted-signer population is sufficient.

    - Key Lifecycle Security
      > Versioned, authenticated trust-store updates make rotation and revocation explicit rather than relying on implicit certificate services.

## 4. Considered

### 4.1. Ed25519 (PureEdDSA)

[RFC 8032](https://www.rfc-editor.org/rfc/rfc8032) standardizes a deterministic Edwards-curve signature algorithm at approximately 128-bit classical security strength.

- Pros

  - Compact Signatures
    > A 32-byte public key and 64-byte signature minimize storage and bandwidth.

  - Deterministic Signing
    > Signature generation does not depend on a fresh ECDSA-style random nonce for each message.

  - Standards-Based Verification
    > Test vectors and well-supported library APIs enable independent interoperability testing.

- Cons

  - Platform Compatibility
    > Some legacy hardware, protocols, or validated cryptographic-module configurations may not support Ed25519; a particular implementation's FIPS validation must be checked separately.

  - Algorithm-Specific API
    > PureEdDSA may require one-shot message signing and verification rather than a generic streaming digest API.

### 4.2. ECDSA P-256 with SHA-256

[FIPS 186-5](https://csrc.nist.gov/pubs/fips/186-5/final) specifies ECDSA, including its cryptographic requirements.

- Pros

  - Ecosystem Compatibility
    > P-256 is widely implemented in existing cryptographic accelerators and certificate-oriented infrastructure.

  - Standards Alignment
    > Recognized profiles can support deployments constrained by organizational cryptographic requirements.

- Cons

  - Nonce Management
    > Insecure or reused per-message nonce generation can expose signing keys; deterministic ECDSA or approved nonce generation must be implemented correctly.

  - Encoding Choices
    > Public-point encodings, signature encoding, and signature normalization require an explicitly agreed profile.

### 4.3. RSA-PSS with SHA-256

[RFC 8017](https://www.rfc-editor.org/rfc/rfc8017) defines RSA Probabilistic Signature Scheme (RSASSA-PSS).

- Pros

  - Compatibility
    > Supported by many enterprise verification stacks and hardware security modules.

- Cons

  - Larger Artifacts
    > RSA public keys and signatures are generally larger than Ed25519 equivalents for comparable classical security levels.

  - Parameter Complexity
    > Padding mode, hash function, salt length, and minimum key size need consistent enforcement.

### 4.4. Authenticated Public-Key Pinning

[NIST SP 800-57 Part 1](https://csrc.nist.gov/pubs/sp/800/57/pt1/r5/final) provides guidance on public-key ownership assurance, distribution, and lifecycle management.

- Pros

  - Small Trust Surface
    > An authenticated set of known signer keys requires no runtime certificate-chain infrastructure.

  - Operational Control
    > Authorization, key rotation, and permitted key usage are directly represented in the verifier's trust store.

- Cons

  - Provisioning Burden
    > Each verifier needs a secure initial trust anchor and an authenticated update mechanism.

  - No Inherent Revocation Service
    > Key replacement, emergency revocation, and stale-trust-store handling are application responsibilities.

### 4.5. X.509 Certificate-Based Trust

[RFC 5280](https://www.rfc-editor.org/rfc/rfc5280) defines PKIX certification paths and validation procedures.

- Pros

  - Scalable Delegation
    > Certificate authorities and certificate policies support larger populations of independently enrolled signers.

  - Established Tooling
    > Certificate provisioning, expiry, and validation can integrate with existing organizational PKI.

- Cons

  - Complexity
    > Path validation, trust-anchor management, identity policy, and revocation handling add code and operational dependencies.

  - Unnecessary for Closed Trust Sets
    > A small population of pre-provisioned signers does not necessarily benefit from certificate issuance.

## 5. Consequences

- Positive

  - Portable Signature Profile
    > Ed25519 provides an explicit signature algorithm and compact, interoperable binary formats.

  - Certificate-Independent Verification
    > Known signers can be authenticated without distributing or validating X.509 certificate chains.

  - Separation of Responsibilities
    > Cryptographic signature validity, trusted signer identity, authorization, and freshness are verified as distinct requirements.

- Negative

  - Trust-Store Operations
    > Signing-key rollout, public-key pin updates, emergency revocation, and verifier recovery must be designed and maintained.

  - Compatibility Limitations
    > A second, explicitly approved profile may be necessary for environments that cannot support Ed25519.

  - No Confidentiality or Freshness
    > Digital signatures neither encrypt payloads nor prevent replay of previously valid signed content.

- Risks

  - Key Substitution
    > Reject keys supplied solely by the untrusted payload; authorize only authenticated and provisioned public keys.

  - Signature Reuse Across Contexts
    > Include an unambiguous purpose, protocol/version, and relevant operation or artifact identity in the canonical signed bytes.

  - Private-Key Compromise
    > Use protected key generation/storage, restrict signing access, rotate compromised keys, and distribute authenticated revocation state.

  - Replay and Rollback
    > For commands, updates, and state transitions, enforce application-specific sequence, version, expiration, or monotonic-counter policies outside signature verification.

  - Encoding Confusion
    > Check lengths and algorithm identifiers; never treat a bare 32-byte Ed25519 key as interchangeable with DER SubjectPublicKeyInfo or an X.509 certificate.

## 6. Implementation

1. Define the Signing Profile

    Specify exact payload canonicalization and byte encoding, signature version, domain separation, covered metadata, and maximum accepted sizes. Encode variable-length fields unambiguously (for example, with lengths) and include the intended operation and protocol context in the signed bytes. Do not allow a self-described algorithm to override verifier policy.

2. Generate and Protect Signer Keys

    Generate Ed25519 key pairs with a maintained cryptographic library and a suitable cryptographic random number generator. Keep private keys confidential and restrict their usage, preferably with hardware-backed or non-exportable key storage when available. Never embed private keys in firmware, logs, or distributable artifacts.

3. Provision Trusted Public Keys

    Authenticate initial provisioning independently (for example, a protected manufacturing channel or an already authenticated management channel). Record signer identity, permitted usage, algorithm, public-key bytes, trust-store version, and revocation status. Treat an external key ID as a lookup hint only; match the resolved key against the protected trust store.

4. Sign the Canonical Bytes

    Construct the exact signed byte sequence and generate a detached 64-byte Ed25519 signature. With OpenSSL, use the Ed25519 EVP signing API with a NULL digest parameter and one-shot signing; do not prepend an ad-hoc SHA-256 digest or replace PureEdDSA with Ed25519ph. Transmit the signature and key-selection metadata separately or in a versioned envelope.

5. Verify and Authorize

    Validate the envelope and expected sizes, resolve a provisioned Ed25519 public key, enforce identity and allowed-purpose policy, reconstruct the identical canonical bytes, and verify the signature using a maintained library. Reject malformed keys, unsupported profiles, revoked signers, mismatched purposes, and failed signatures. Do not accept a supplied public key as a trust anchor or infer authorization solely from a successful cryptographic check.

6. Rotate and Revoke Keys

    Distribute changes to the trusted-key set through an authenticated and rollback-protected update process. Support a bounded overlap of old and new signer keys when necessary, revoke compromised keys promptly, and define a recovery mechanism for verifiers that miss updates. Apply artifact version or replay protections at the application layer.

7. Validate Conformance

    Test RFC 8032 known-answer vectors and interoperability across independent implementations. Include negative cases for altered payloads, truncated or malformed keys/signatures, unknown signers, wrong purpose, different canonicalization, spoofed key IDs, revocation, key rotation, and replay. Fuzz untrusted envelope and key-parsing paths; enforce these tests in CI and document the provisioning and recovery review.

8. Define Scope Boundaries

    Keep TLS transport authentication separate; [015-ADR: TLS-PSK](015-adr-tls-psk.md) addresses a different decision. RFC 7250 TLS raw-public-key handshakes use DER SubjectPublicKeyInfo and do not automatically establish the trust policy for application-layer signatures. If certificate-based trust, FIPS-validated module requirements, or additional signature algorithms become mandatory, document an explicit profile extension or superseding ADR.

## 7. References

- GitHub Issue [#579: Digital Signing and Signature Verification with Raw Public Keys](https://github.com/sentenz/convention/issues/579).
- IETF [RFC 8032: Edwards-Curve Digital Signature Algorithm (EdDSA)](https://www.rfc-editor.org/rfc/rfc8032).
- IETF [RFC 8410: Ed25519 and Related Public-Key Algorithm Identifiers](https://www.rfc-editor.org/rfc/rfc8410).
- IETF [RFC 7250: Using Raw Public Keys in TLS and DTLS](https://www.rfc-editor.org/rfc/rfc7250).
- IETF [RFC 8017: PKCS #1 RSA Cryptography Specifications](https://www.rfc-editor.org/rfc/rfc8017).
- IETF [RFC 5280: Internet X.509 Public Key Infrastructure Certificate and CRL Profile](https://www.rfc-editor.org/rfc/rfc5280).
- NIST [FIPS 186-5: Digital Signature Standard](https://csrc.nist.gov/pubs/fips/186-5/final).
- NIST [SP 800-57 Part 1 Rev. 5: Recommendation for Key Management](https://csrc.nist.gov/pubs/sp/800/57/pt1/r5/final).
- OpenSSL [EVP_SIGNATURE-ED25519](https://docs.openssl.org/3.0/man7/EVP_SIGNATURE-ED25519/).
- Related repository ADR [015-ADR: TLS-PSK](015-adr-tls-psk.md).
