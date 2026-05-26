# Zero Trust Architecture (ZTA)

Zero Trust Architecture (ZTA) is a cybersecurity architecture and operating model that assumes no implicit trust is granted to users, devices, workloads, or networks based solely on location, ownership, or prior access. Every access request must be continuously verified using identity, device posture, context, policy, and observed behavior before access to a resource is granted.

- [1. Category](#1-category)
  - [1.1. De-Perimeterization](#11-de-perimeterization)
  - [1.2. Least Privilege](#12-least-privilege)
    - [1.2.1. Privileged Access Management (PAM)](#121-privileged-access-management-pam)
  - [1.3. Continuous Verification](#13-continuous-verification)
  - [1.4. Microsegmentation](#14-microsegmentation)
- [2. References](#2-references)

## 1. Category

Zero Trust Architecture applies Zero Trust principles to enterprise systems, cloud platforms, operational technology, and SaaS environments. It shifts security design away from broad network trust zones toward explicit, policy-driven access decisions that are evaluated for each request.

### 1.1. De-Perimeterization

De-perimeterization decouples trust from network location. Users, devices, and workloads may operate from corporate networks, remote offices, public networks, or cloud environments, so network presence alone cannot be treated as proof of legitimacy.

In a Zero Trust model, access decisions are made as close as possible to the protected resource using identity, device health, policy, and contextual signals. This reduces dependence on the traditional notion of a trusted internal network and limits the value of lateral movement after a compromise.

### 1.2. Least Privilege

Least privilege restricts access to only the minimum permissions required to perform a specific task. Zero Trust enforces this principle through fine-grained authorization, short-lived access, and dynamic policy evaluation based on user role, workload identity, device posture, time, location, and risk.

The objective is to minimize the blast radius of compromised credentials, sessions, devices, or services. Rather than granting persistent broad access, Zero Trust favors narrowly scoped permissions that can be re-evaluated and revoked quickly when risk changes.

#### 1.2.1. Privileged Access Management (PAM)

Privileged Access Management (PAM) is a core capability for controlling elevated access in a Zero Trust Architecture. Administrative accounts, break-glass accounts, service identities, and other high-impact roles should be isolated, strongly authenticated, monitored, and granted only when required.

Typical PAM controls in a Zero Trust model include just-in-time access, approval workflows, session recording, credential vaulting, and periodic privilege reviews. These controls help ensure that privileged access is explicit, temporary, auditable, and resistant to misuse.

### 1.3. Continuous Verification

Continuous verification means access is not validated once and then trusted indefinitely. Identity, device posture, behavioral telemetry, and policy compliance should be re-assessed throughout a session so that access can be step-up authenticated, constrained, or revoked when conditions change.

This principle applies equally to human users, machine identities, APIs, and workloads. A previously valid session should no longer be trusted if the device becomes non-compliant, the token is suspected of compromise, or the requested action exceeds normal behavior.

### 1.4. Microsegmentation

Microsegmentation limits communication paths between systems and workloads by dividing environments into smaller, policy-controlled zones. Instead of allowing broad east-west traffic inside a network, Zero Trust enforces explicit rules for which services, identities, and devices may communicate.

This reduces lateral movement opportunities for attackers and improves containment when a component is compromised. In practice, microsegmentation is often implemented through identity-aware proxies, host-based firewalls, service mesh policies, workload identities, and application-layer authorization controls.

## 2. References

- NIST [Zero Trust Architecture](https://nvlpubs.nist.gov/nistpubs/SpecialPublications/NIST.SP.800-207.pdf) publication.
- Red Hat [What is Zero Trust?](https://www.redhat.com/en/topics/security/what-is-zero-trust) article.
- Sentenz [Software Design Principles](../articles/software-design-principles.md#1113-principle-of-least-privilege) article.
- Sentenz [Threat Modeling](../articles/threat-modeling.md) article.
