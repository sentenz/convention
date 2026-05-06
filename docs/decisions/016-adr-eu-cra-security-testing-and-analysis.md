# 016-ADR: EU CRA Security Testing and Security Analysis

Architectural Decision Records (ADR) on adopting an integrated security testing and security analysis strategy in compliance with the EU Cyber Resilience Act (CRA), Regulation (EU) 2024/2847.

- [1. State](#1-state)
- [2. Context](#2-context)
- [3. Decision](#3-decision)
  - [3.1. Integrated Multi-Layer Security Testing and Analysis](#31-integrated-multi-layer-security-testing-and-analysis)
- [4. Considered](#4-considered)
  - [4.1. Integrated Multi-Layer Security Testing and Analysis](#41-integrated-multi-layer-security-testing-and-analysis)
  - [4.2. Static-Only Analysis](#42-static-only-analysis)
- [5. Consequences](#5-consequences)
- [6. Implementation](#6-implementation)
- [7. References](#7-references)

## 1. State

- Author(s): Sentenz
- Date: 2026-05-06
- Status: Proposed

## 2. Context

The EU Cyber Resilience Act (CRA), Regulation (EU) 2024/2847, entered into force on December 10, 2024 and imposes mandatory cybersecurity obligations on manufacturers of products with digital elements (PDEs) sold in the EU market. Vulnerability and incident reporting obligations apply from September 11, 2026, and full conformity requirements are enforceable from December 11, 2027. Article 13 and Annex I of the CRA require manufacturers to design, develop, and maintain PDEs in accordance with essential cybersecurity requirements, including documented security risk assessments, vulnerability management, and evidence of security testing throughout the product lifecycle. Non-compliance can result in market withdrawal, fines of up to €15 million or 2.5 % of global annual turnover, and exclusion from the EU market. To satisfy these obligations the project must adopt an integrated, evidence-producing security testing and analysis strategy that covers source code, runtime behaviour, third-party dependencies, and overall system resilience.

1. Decision Drivers

    - CRA Compliance
      > Satisfy the essential cybersecurity requirements in CRA Annex I and the manufacturer obligations in Article 13, including documented risk assessments and evidence of security testing at every lifecycle stage.

    - Vulnerability Management
      > Detect and remediate security vulnerabilities in first-party code and third-party dependencies continuously, not only at release time, to meet CRA Annex I Part II requirements for ongoing vulnerability handling.

    - SBOM Transparency
      > Maintain a machine-readable Software Bill of Materials (SBOM) for each release to fulfil CRA transparency and supply-chain due-diligence obligations.

    - SSDLC Integration
      > Embed security testing and analysis into the CI/CD pipeline so that every code change is evaluated automatically, minimising the cost of late-stage remediation.

    - Auditability
      > Produce artefacts—scan reports, SBOM, risk-assessment results, penetration-test summaries—that can be presented to conformity-assessment bodies and market-surveillance authorities on request.

    - Attack Surface Reduction
      > Identify and eliminate vulnerabilities across code, runtime, and dependency layers to reduce the effective attack surface of the product, as required by CRA Annex I Part I.

## 3. Decision

### 3.1. Integrated Multi-Layer Security Testing and Analysis

An integrated, multi-layer strategy combining Static Application Security Testing (SAST), Dynamic Application Security Testing (DAST), Software Composition Analysis (SCA) with SBOM generation, fuzz testing, and periodic penetration testing is selected. This approach covers all CRA-mandated testing dimensions—source code, runtime behaviour, third-party components, and adversarial resilience—within the existing CI/CD pipeline and produces the documented evidence required by CRA Article 13 and Annex I.

1. Rationale

    - CRA Compliance
      > The combined use of SAST, DAST, SCA, fuzzing, and penetration testing satisfies the essential requirements of CRA Annex I Part I (security by design, attack surface minimisation) and Part II (vulnerability management, security updates), and produces documented evidence for conformity assessments under CRA Article 13.

    - Vulnerability Management
      > Automated SAST and SCA scans run on every commit; DAST and fuzz tests execute against every integration build; periodic penetration tests validate system-level resilience. Together they ensure vulnerabilities are detected and remediated continuously, fulfilling CRA Annex I Part II obligations for timely patching and disclosure.

    - SBOM Transparency
      > SCA tooling generates a machine-readable SBOM (CycloneDX or SPDX format) for every release, satisfying CRA transparency requirements and enabling downstream consumers to assess supply-chain risk.

    - SSDLC Integration
      > All automated tools are integrated into the CI/CD pipeline as quality gates, enforcing security checks at the code-review, build, and integration stages without requiring manual intervention for routine scans.

    - Auditability
      > Each tool produces structured reports stored as CI/CD artefacts. SBOM files, SAST/DAST/SCA findings, fuzz-test results, and penetration-test summaries constitute the technical documentation required by CRA Article 13(3) and support market-surveillance inspections.

    - Attack Surface Reduction
      > SAST detects insecure code patterns; DAST exercises the running application to find runtime-exposed weaknesses; SCA flags vulnerable third-party components; fuzzing uncovers input-handling edge cases; penetration testing validates systemic resilience. The combination addresses all CRA Annex I Part I attack-surface minimisation requirements.

## 4. Considered

### 4.1. Integrated Multi-Layer Security Testing and Analysis

Combination of SAST, DAST, SCA with SBOM generation, fuzz testing, and periodic penetration testing integrated into the CI/CD pipeline.

- Pros

  - CRA Compliance
    > Produces evidence across all CRA Annex I testing dimensions and satisfies conformity-assessment documentation requirements, reducing compliance risk.

  - Vulnerability Management
    > Continuous, multi-vector detection (static, dynamic, dependency, adversarial) maximises the probability of identifying vulnerabilities before release.

  - Attack Surface Reduction
    > Layered tooling addresses code-level, runtime, supply-chain, and systemic attack vectors simultaneously.

  - Auditability
    > Generates structured, version-stamped reports and an SBOM that serve as audit evidence without additional manual documentation effort.

- Cons

  - SSDLC Integration
    > Increases CI/CD pipeline complexity and execution time; requires initial investment in tool configuration, tuning, and false-positive triage.

  - Vulnerability Management
    > Tool sprawl may generate overlapping findings across SAST, DAST, and SCA layers, increasing triage overhead for development teams.

### 4.2. Static-Only Analysis

Adoption of SAST and SCA tools exclusively, without DAST, fuzzing, or penetration testing.

- Pros

  - SSDLC Integration
    > Simpler pipeline integration with lower execution overhead; easier to implement and maintain than a multi-layer approach.

  - Vulnerability Management
    > Covers the most common vulnerability classes in source code and third-party dependencies with well-established tooling.

- Cons

  - CRA Compliance
    > Does not satisfy CRA requirements for runtime vulnerability detection (DAST) or adversarial resilience validation (penetration testing), leaving the conformity assessment incomplete.

  - Attack Surface Reduction
    > Misses runtime-only vulnerabilities, input-handling edge cases exposed only during execution, and systemic weaknesses that appear only under adversarial conditions.

  - Auditability
    > Produces insufficient evidence for CRA Article 13 conformity assessments, which require documentation of both static and dynamic security evaluations.

## 5. Consequences

- Positive

  - CRA Market Access
    > Documented security testing evidence and a maintained SBOM satisfy CRA Article 13 and Annex I requirements, enabling lawful placement and maintenance of the product on the EU market from December 11, 2027.

  - Reduced Security Debt
    > Continuous automated scanning detects vulnerabilities at the point of introduction, reducing the cost and effort of remediation compared to periodic manual reviews.

  - Supply-Chain Transparency
    > A machine-readable SBOM generated per release enables customers and downstream integrators to assess third-party component risk and comply with their own CRA obligations.

  - Improved Security Posture
    > Layered testing across static, dynamic, dependency, and adversarial dimensions provides defence-in-depth assurance aligned with CRA Annex I Part I attack-surface minimisation requirements.

- Negative

  - Increased Pipeline Duration
    > Integrating DAST and fuzz testing into the CI/CD pipeline extends build and test execution time, which may affect developer feedback cycles and release cadence.

  - Tooling and Maintenance Overhead
    > Configuring, updating, and triaging findings from multiple security tools requires sustained engineering effort and increases the operational burden on development and security teams.

- Risks

  - False-Positive Fatigue
    > High false-positive rates from SAST or DAST tools may desensitise teams to genuine findings and erode trust in the pipeline. Mitigation: establish a baseline, tune tool configurations iteratively, and enforce a triage policy that gates releases on unresolved high-severity findings.

  - Evolving CRA Guidance
    > CRA implementing acts and harmonised standards are still being finalised; conformity requirements may change before the December 2027 deadline. Mitigation: monitor ENISA publications and harmonised standard updates quarterly and revise the testing strategy accordingly.

  - Coverage Gaps
    > No single tool or combination guarantees complete vulnerability detection. Residual unknown vulnerabilities may remain after all automated scans pass. Mitigation: conduct annual penetration tests by an independent party, maintain a coordinated vulnerability disclosure policy, and apply CRA Annex I Part II post-market monitoring obligations.

## 6. Implementation

1. Integrate SAST

    Add a SAST tool (e.g., CodeQL, Semgrep, or an equivalent IEC 62443-4-1-aligned scanner) to the CI/CD pipeline as a mandatory quality gate on every pull request and main-branch push. Configure rule sets appropriate to the project languages and enforce a policy that blocks merging on high-severity findings. Store scan reports as versioned pipeline artefacts.

2. Integrate SCA and SBOM Generation

    Add a Software Composition Analysis tool (e.g., Trivy, Syft, or Dependency-Track) to produce a machine-readable SBOM in CycloneDX or SPDX format on every release build. Configure the tool to flag components with known CVEs against the NVD and OSV databases and block releases on critical or high-severity dependency findings. Publish the SBOM alongside each release artefact.

3. Integrate DAST

    Deploy a DAST tool (e.g., OWASP ZAP or Nuclei) in the integration-test stage to scan a running instance of the application against the OWASP Top 10 and CWE Top 25 attack patterns. Automate scan execution on every integration build and store the HTML or JSON report as a pipeline artefact for auditability.

4. Integrate Fuzz Testing

    Introduce fuzz testing (e.g., AFL++, libFuzzer, or OSS-Fuzz) for components that process untrusted input, such as parsers, protocol handlers, and deserialization routines. Run fuzz campaigns in a dedicated nightly or scheduled pipeline stage, triage identified crashes promptly, and document confirmed findings in the project vulnerability register.

5. Conduct Periodic Penetration Testing

    Schedule at least one independent penetration test annually and after significant architectural changes. Use the results to validate the effectiveness of automated tooling, identify systemic weaknesses, and update the CRA risk assessment. Document findings, remediation actions, and retesting outcomes as part of the technical documentation required by CRA Article 13(3).

6. Establish Vulnerability Management Process

    Define a vulnerability management policy specifying severity classifications, remediation SLAs (e.g., critical within 24 hours of confirmed identification to meet CRA reporting obligations from September 11, 2026), and coordinated disclosure procedures. Maintain a vulnerability register updated by automated scan results and manual findings.

7. Compile and Maintain Technical Documentation

    Aggregate SAST reports, DAST reports, SCA findings, SBOM files, fuzz-test results, and penetration-test summaries into a versioned technical documentation package per release. Ensure this package is accessible to conformity-assessment bodies and market-surveillance authorities on request, as required by CRA Article 13(3).

8. Validate

    Verify pipeline integration by confirming that each tool executes and produces a structured report on every CI run. Perform a quarterly review of tool configurations, rule sets, and false-positive rates. Annually assess the overall strategy against published ENISA guidance and updated CRA harmonised standards to ensure continued compliance.

## 7. References

- EU [Cyber Resilience Act – Regulation (EU) 2024/2847](https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=OJ:L_202402847) regulation.
- European Commission [Cyber Resilience Act overview](https://digital-strategy.ec.europa.eu/en/policies/cyber-resilience-act) page.
- ENISA [EU Cyber Resilience Act standards mapping](https://www.enisa.europa.eu/topics/cybersecurity-standardisation/eu-cyber-resilience-act) page.
- OWASP [Top 10 Web Application Security Risks](https://owasp.org/www-project-top-ten/) project.
- OWASP [ZAP Dynamic Application Security Testing](https://www.zaproxy.org/) tool.
- NIST [National Vulnerability Database (NVD)](https://nvd.nist.gov/) database.
- OSV [Open Source Vulnerability database](https://osv.dev/) database.
- CycloneDX [SBOM standard specification](https://cyclonedx.org/) page.
- SPDX [Software Package Data Exchange specification](https://spdx.dev/) page.
- GitHub [CodeQL static analysis](https://codeql.github.com/) tool.
- Semgrep [static analysis](https://semgrep.dev/) tool.
- Trivy [vulnerability and SBOM scanner](https://aquasecurity.github.io/trivy/) tool.
- Sentenz convention [002-ADR: Software Security](002-adr-software-security.md) record.
