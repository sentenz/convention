# 015-ADR: TLS-PSK

Architectural Decision Records (ADR) on selecting a TLS Pre-Shared Key (PSK) handshake mode for secure session establishment.

- [1. State](#1-state)
- [2. Context](#2-context)
- [3. Decision](#3-decision)
  - [3.1. TLS-PSK with 1-RTT and Nonce](#31-tls-psk-with-1-rtt-and-nonce)
- [4. Considered](#4-considered)
  - [4.1. TLS-PSK with 0-RTT and Nonce](#41-tls-psk-with-0-rtt-and-nonce)
  - [4.2. TLS-PSK with 1-RTT and Nonce](#42-tls-psk-with-1-rtt-and-nonce)
- [5. Consequences](#5-consequences)
- [6. Implementation](#6-implementation)
- [7. References](#7-references)

## 1. State

- Author(s): Sentenz
- Date: 2026-05-05
- Status: Proposed

## 2. Context

TLS 1.3 (RFC 8446) introduces Pre-Shared Key (PSK) authentication as a first-class handshake mode, enabling session establishment without a full certificate exchange. PSK is particularly relevant in resource-constrained environments (e.g., IoT, embedded systems) and session-resumption scenarios where repeated full handshakes are undesirable. Two primary PSK handshake modes are defined: 0-RTT (early data) and 1-RTT (standard PSK handshake). Both modes rely on a per-record nonce constructed by XORing the 64-bit sequence number with the static write IV (RFC 8446 §5.3) to ensure AEAD uniqueness within a session. The choice between modes introduces trade-offs across latency, forward secrecy, and replay-attack exposure.

1. Decision Drivers

    - Latency
      > Minimize the number of round trips required to establish a secure session, particularly for high-frequency or latency-sensitive connections.

    - Forward Secrecy
      > Ensure that compromise of a long-term PSK does not retroactively expose previously recorded session traffic.

    - Replay Attack Protection
      > Prevent an adversary from replaying captured messages to trigger unintended server-side processing, as described in RFC 8446 §8.

    - Nonce Uniqueness
      > Guarantee that the per-record nonce is never reused under the same AEAD key across any two sessions or records, as required by RFC 8446 §5.3.

    - Authentication Strength
      > Provide mutual endpoint authentication using a pre-shared secret in accordance with RFC 9257 guidance for external PSKs.

    - Resource Constraints
      > Support deployment on constrained devices where asymmetric-key operations (e.g., RSA, ECDSA) are prohibitively expensive.

## 3. Decision

### 3.1. TLS-PSK with 1-RTT and Nonce

TLS-PSK 1-RTT mode with DHE (`psk_dhe_ke`) and per-record nonce is selected as the standard PSK handshake mode. The PSK-DHE combination provides authentication from the PSK and forward secrecy from the ephemeral Diffie-Hellman exchange. The per-record nonce (sequence counter XOR static write IV, per RFC 8446 §5.3) guarantees AEAD uniqueness without requiring external nonce synchronization. RFC 9257 explicitly recommends `psk_dhe_ke` over `psk_ke` for external PSKs to gain this forward-secrecy property.

1. Rationale

    - Latency
      > One round trip is required before application data is exchanged; this is acceptable for the target use cases and avoids the security constraints imposed by 0-RTT mode.

    - Forward Secrecy
      > The ephemeral DHE key exchange combined with the PSK ensures that session keys cannot be derived from the PSK alone, protecting recorded traffic even if the PSK is later compromised.

    - Replay Attack Protection
      > Application data is sent only after the server has verified the PSK binder and transmitted its Finished message, eliminating the 0-RTT replay-attack window described in RFC 8446 §8.

    - Nonce Uniqueness
      > Per-record nonces are derived from the sequence counter XOR the static write IV (RFC 8446 §5.3); distinct session keys per connection guarantee nonce uniqueness across sessions without additional state management.

    - Authentication Strength
      > The PSK binder in the ClientHello cryptographically binds the PSK to the full handshake transcript, preventing PSK confusion and cross-protocol attacks as specified in RFC 9257.

    - Resource Constraints
      > PSK-DHE avoids certificate-based asymmetric operations; the DHE step uses lightweight elliptic-curve groups (e.g., X25519) supported by constrained TLS 1.3 implementations.

## 4. Considered

### 4.1. TLS-PSK with 0-RTT and Nonce

[TLS-PSK 0-RTT](https://www.rfc-editor.org/rfc/rfc8446#section-2.3) transmits application data in the first client flight before receiving any server response, using keys derived solely from the PSK and a ticket nonce established in a prior session.

- Pros

  - Latency
    > Reduces connection establishment to zero round trips for the application payload, offering the lowest possible latency for connection-oriented request-response protocols.

  - Resource Constraints
    > Minimizes active processing and radio time on constrained devices by eliminating the server-response wait before data transmission.

- Cons

  - Replay Attack Protection
    > Early data is inherently replayable; an adversary can retransmit captured ClientHello and early-data records to any server instance that does not maintain per-ticket anti-replay state, as detailed in RFC 8446 §8.

  - Forward Secrecy
    > Data sent in the first flight is encrypted under keys derived only from the PSK and ticket nonce; no DHE exchange is performed for early data, so compromise of the PSK retroactively exposes all 0-RTT records.

  - Nonce Uniqueness
    > Two separate sessions using the same PSK both initialize their sequence counters at zero; without per-session key diversification via DHE, nonce reuse is possible if the PSK is reused across connections, violating AEAD security requirements.

### 4.2. TLS-PSK with 1-RTT and Nonce

[TLS-PSK 1-RTT](https://www.rfc-editor.org/rfc/rfc8446#section-2.3) performs a standard TLS 1.3 handshake authenticated by the PSK, optionally combined with an ephemeral Diffie-Hellman exchange (`psk_dhe_ke` mode) for forward secrecy. The per-record nonce is constructed per RFC 8446 §5.3.

- Pros

  - Forward Secrecy
    > `psk_dhe_ke` mode derives session keys from both the PSK and an ephemeral DH share, ensuring that past sessions remain confidential even after PSK compromise.

  - Replay Attack Protection
    > Application data is exchanged only after the server has verified the PSK binder and sent its Finished message, removing the replay window present in 0-RTT.

  - Nonce Uniqueness
    > Per-record nonces are derived from the sequence counter XOR the static write IV (RFC 8446 §5.3); distinct session keys per connection guarantee nonce uniqueness across sessions.

  - Authentication Strength
    > The PSK binder cryptographically binds the PSK identity to the handshake transcript; RFC 9257 mandates a single hash algorithm per PSK to prevent cross-protocol confusion.

- Cons

  - Latency
    > Requires one full round trip before application data can be sent, introducing higher latency compared to 0-RTT mode.

## 5. Consequences

- Positive

  - Forward Secrecy
    > Session traffic remains confidential even if the long-term PSK is later exposed, reducing the blast radius of a key-compromise event.

  - Simplified Nonce Management
    > The per-record nonce is derived automatically from the sequence counter and the session-specific write IV; no external nonce state needs to be synchronized between parties.

  - Reduced Attack Surface
    > Eliminating 0-RTT early data removes the replay-attack class described in RFC 8446 §8, simplifying server-side anti-replay logic.

- Negative

  - Increased Latency
    > 1-RTT mode requires one additional round trip compared to 0-RTT, which may be unacceptable for ultra-low-latency applications or severely constrained radio environments.

  - DHE Overhead
    > The ephemeral DH key generation in `psk_dhe_ke` mode increases CPU and memory usage relative to PSK-only (`psk_ke`) mode, which may be significant on deeply constrained devices.

- Risks

  - PSK Compromise
    > If the pre-shared key is leaked through insecure provisioning or storage, all sessions authenticated by that PSK are compromised. Mitigation: enforce secure out-of-band PSK provisioning, rotate PSKs regularly, and use distinct PSKs per device pair as recommended by RFC 9257.

  - PSK Reuse Across Contexts
    > Reusing the same PSK across multiple endpoints or hash algorithms may enable cross-protocol attacks. Mitigation: follow RFC 9257 guidance to bind each external PSK to a single TLS hash algorithm and assign a unique PSK identity per communicating endpoint pair.

## 6. Implementation

1. Configure PSK Mode

    Configure the TLS 1.3 stack to advertise only `psk_dhe_ke` in the `psk_key_exchange_modes` extension of the ClientHello, disabling `psk_ke` (PSK-only without DHE) to enforce forward secrecy on all PSK-authenticated sessions.

2. PSK Provisioning

    Provision external PSKs out-of-band using a secure channel (e.g., device manufacturing pipeline, encrypted configuration bundle). Assign a unique PSK identity per communicating endpoint pair and bind each PSK to a single hash algorithm as specified in RFC 9257.

3. Nonce Derivation

    Rely on the TLS 1.3 record-layer nonce construction defined in RFC 8446 §5.3: pad the 64-bit sequence number to the IV length and XOR it with the static write IV derived during the handshake. Do not implement custom nonce logic outside of the TLS stack.

4. Disable 0-RTT

    Disable 0-RTT early data at the server configuration level unless a bounded, idempotent use case with server-side anti-replay state (per RFC 8446 §8) explicitly justifies its activation.

5. Validate

    Verify that all TLS sessions use `psk_dhe_ke` by inspecting captured handshakes with a TLS 1.3-capable analyser (e.g., Wireshark with a TLS secrets log file) and confirm that a `key_share` extension is present in both ClientHello and ServerHello.

## 7. References

- IETF [RFC 9257 – Guidance for External PSK Usage in TLS](https://www.rfc-editor.org/rfc/rfc9257.html) standard.
- IETF [RFC 8446 – The Transport Layer Security (TLS) Protocol Version 1.3](https://www.rfc-editor.org/rfc/rfc8446) standard.
- IETF [RFC 8446 §2.3 – TLS 1.3 PSK Handshake Modes](https://www.rfc-editor.org/rfc/rfc8446#section-2.3) section.
- IETF [RFC 8446 §5.3 – Per-Record Nonce](https://datatracker.ietf.org/doc/html/rfc8446#section-5.3) section.
- IETF [RFC 8446 §8 – 0-RTT and Anti-Replay](https://datatracker.ietf.org/doc/html/rfc8446#section-8) section.
