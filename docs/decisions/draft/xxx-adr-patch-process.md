# XXX-ADR: Patch Process

Patch Process for Vulnerability Management of CVEs (Common Vulnerabilities and Exposures) within a software stack.

- [1. State](#1-state)
- [2. Context](#2-context)
- [3. Decision](#3-decision)
- [4. Implementation](#4-implementation)
- [5. Consequences](#5-consequences)
- [6. References](#6-references)

## 1. State

- Author(s): Sentenz
- Date: 2025-08-14
- Status: Proposed

## 2. Context

Effective vulnerability management is critical to maintaining the security posture of systems and applications. Industry best practices, such as those outlined by NIST SP 800-40 and ISO/IEC 27002, emphasize timely patching, risk-based prioritization, and robust communication. The organization’s environment contains heterogeneous systems with varying risk profiles, requiring a structured patch process that:

1. Decision Drivers

    - Timely Patching
      > Patch process designed to ensure timely and effective responses to security vulnerabilities, minimizing risk to the software stack.

    - Risk-Based Prioritization
      > The process prioritizes vulnerabilities based on their severity and potential impact, allowing for efficient resource allocation.
      > - Considers multiple risk scoring methods (CVSS and EPSS).
      > - Distinguishes between severity vulnerabilities.

    - Testing and Validation
      > Each patch is tested to ensure it does not introduce new issues, maintaining system stability and performance.
      > - Integrates testing, business impact assessment, and fallback plans (workarounds or risk acceptance).

    - Documentation and Communication
      > All actions taken in response to vulnerabilities are documented, and stakeholders are informed to ensure transparency and accountability. Maintain traceability through documentation and review cycles.

## 3. Decision

Adopt a structured risk-based patch process for managing CVEs in the software stack.

1. Rationale

    - Timely Patching
      > Structured failure handling avoids uncontrolled delays and ensures visibility of unresolved risks.

    - Risk-Based Prioritization
      > Risk-based approach ensures efficient allocation of patching resources, reducing exposure to high-impact vulnerabilities.
      > - Dual scoring with CVSS and EPSS inherent severity with exploit probability, improves accuracy in prioritization.

    - Documentation and Communication
      > Continuous documentation and communication support compliance, auditing, and knowledge retention.

2. Diagram

    ```mermaid
    flowchart TD
        %% Notification and Initiation
        A[New CVE Notifications] --> B([Start CVE Process])
        B --> C[Determine Criticality<br/><code>Research</code>]
        C --> D{Update Available?}

        %% Update available
        D -- Yes --> E[Prioritization]

        %% Prioritization based on security best practices
        E --> L1[[Critical<br/><code>CVSS ≥ 8</code><br/><code>EPSS ≥ 9</code>]]
        E --> L2[[High<br/><code>CVSS 7–7.9</code><br/><code>EPSS 7–8.9</code>]]
        E --> L3[[Medium<br/><code>CVSS 4–6.9</code><br/><code>EPSS 4–6.9</code>]]
        E --> L4[[Low<br/><code>CVSS &lt; 4</code><br/><code>EPSS &lt; 4</code>]]

        %% Patch and Test
        L1 --> H[Install Updates Immediately]
        L2 --> F[Test Updates Promptly]
        L3 --> F
        L4 --> F

        F --> G{Test OK?}
        G -- Yes --> H
        H --> I[Check Result & Document]
        I --> J[Communicate & Review]
        J --> K([End CVE Process])

        %% Test not OK
        G -- No (with fix) --> M[Risk Assessment & Business Impact]
        M --> N{Workaround Possible?}
        N -- Yes --> O[Develop Workaround<br/>Document & Communicate]
        O --> I
        N -- No --> P[Accept Risk<br/>Document & Communicate]
        P --> I

        %% No update available
        D -- No --> M

        %% Optional styling to visually distinguish the annotation nodes
        classDef option fill:#898989,stroke:#3D3D3D,stroke-width:1px,color:#000
        class L1,L2,L3,L4 option
    ````

## 4. Implementation

1. Notification and Initiation

   - Triggered by new CVE notifications.
   - Start CVE Process with a criticality assessment and supporting research.

2. Prioritization Criteria

    - Critical
      > CVSS ≥ 8 and/or EPSS ≥ 9

    - High
      > CVSS 7–7.9 and/or EPSS 7–8.9

    - Medium
      > CVSS 4–6.9 and/or EPSS 4–6.9

    - Low
      > CVSS < 4 and/or EPSS < 4

3. Patching and Testing

    - Critical
      > Apply patches immediately to minimize exposure to severe threats.

    - High
      > Conduct expedited testing and install patches as soon as possible.

    - Medium
      > Perform standard testing procedures before patch deployment.

    - Low
      > Schedule testing and installation as resources permit, address on a best-effort basis.

4. Failure Handling

   - If patch testing fails:

     - Assess business and security impact.
     - Determine workaround feasibility. If possible, develop and deploy.
     - If no workaround is possible, formally accept risk with documented justification.

5. Closure

   - Verify patch effectiveness, document actions, communicate outcomes, and review process performance.

## 5. Consequences

- Positive

  - Faster remediation for high-impact vulnerabilities.
  - Transparent prioritization logic, improving cross-team coordination.
  - Better preparedness for patch failures and unpatched vulnerabilities.

- Negative / Trade-offs

  - Requires integration of CVSS and EPSS scoring feeds into vulnerability management tools.
  - May require additional resources for testing high volumes of patches in short timeframes.
  - Risk acceptance may create long-term liabilities if not revisited periodically.

## 6. References

- CSRC [NIST SP 800-40 Rev. 4](https://csrc.nist.gov/pubs/sp/800/40/r4/final) page.
- ISO [ISO/IEC 27002:2022 - Management of Technical Vulnerabilities](https://www.iso.org/standard/75652.html) page.
- FIRST [Exploit Prediction Scoring System (EPSS)](https://www.first.org/epss/) page.
- FIRST [Common Vulnerability Scoring System (CVSS) v3.1 Specification](https://www.first.org/cvss/) page.
