# 016-ADR: EU CRA Security Testing and Security Analysis

Architectural Decision Records (ADR) on adopting an integrated security testing and security analysis strategy in compliance with the EU Cyber Resilience Act (CRA), Regulation (EU) 2024/2847.

- [1. State](#1-state)
- [2. Context](#2-context)
- [3. Decision](#3-decision)
  - [3.1. SAST](#31-sast)
  - [3.2. SCA and SBOM](#32-sca-and-sbom)
  - [3.3. DAST](#33-dast)
  - [3.4. Fuzz Testing](#34-fuzz-testing)
  - [3.5. Penetration Testing](#35-penetration-testing)
  - [3.6. Performance Testing](#36-performance-testing)
- [4. Considered](#4-considered)
  - [4.1. SAST](#41-sast)
  - [4.2. SCA and SBOM](#42-sca-and-sbom)
  - [4.3. DAST](#43-dast)
  - [4.4. Fuzz Testing](#44-fuzz-testing)
  - [4.5. Penetration Testing](#45-penetration-testing)
  - [4.6. Performance Testing](#46-performance-testing)
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

### 3.1. SAST

Selected for its ability to detect insecure code patterns and potential vulnerabilities directly in source code, before any code is executed or deployed. Integrating SAST as a mandatory quality gate on every pull request and main-branch push ensures that security issues are identified at the earliest possible stage of the development lifecycle, minimising remediation cost and satisfying CRA Annex I requirements for security by design.

1. Rationale

    - CRA Compliance
      > SAST produces documented evidence of source-code security evaluation required by CRA Annex I Part I (security by design, elimination of known vulnerability classes) and supports conformity-assessment documentation under CRA Article 13.

    - Vulnerability Management
      > Automated static analysis on every commit detects insecure patterns, hardcoded secrets, and known vulnerability classes at the point of introduction, enabling immediate remediation before code reaches production.

    - SSDLC Integration
      > SAST tools integrate natively into CI/CD pipelines and code-review workflows, enforcing security checks at the earliest development stage without disrupting developer productivity.

    - Auditability
      > Structured SAST reports stored as versioned pipeline artefacts constitute technical documentation demonstrating security evaluation of each code change, as required by CRA Article 13(3).

    - Attack Surface Reduction
      > Detection of insecure coding patterns, injection vulnerabilities, and unsafe API usage reduces the number of exploitable weaknesses in the codebase before deployment.

### 3.2. SCA and SBOM

Selected for its role in identifying vulnerabilities in third-party dependencies and producing a machine-readable Software Bill of Materials (SBOM) per release. SCA addresses the supply-chain dimension of CRA compliance, while SBOM generation fulfils CRA transparency obligations and enables downstream consumers to assess component risk.

1. Rationale

    - CRA Compliance
      > SCA identifies third-party components with known CVEs, satisfying CRA Annex I Part II obligations for monitoring and addressing vulnerabilities in dependencies. SBOM generation fulfils CRA transparency and supply-chain due-diligence requirements.

    - Vulnerability Management
      > Continuous dependency scanning against NVD, OSV, and vendor advisory databases detects newly disclosed vulnerabilities in third-party components and triggers remediation before release.

    - SBOM Transparency
      > SCA tooling generates a machine-readable SBOM in CycloneDX or SPDX format for every release, providing a complete inventory of software components and their licence and vulnerability status.

    - SSDLC Integration
      > SCA runs automatically within the CI/CD pipeline on every build, providing continuous visibility into dependency health without requiring manual inventory management.

    - Auditability
      > SBOM files and SCA scan reports stored per release serve as evidence of supply-chain due diligence and support conformity-assessment body requests for technical documentation.

### 3.3. DAST

Selected for its capacity to identify runtime vulnerabilities that are not detectable through static analysis alone. DAST exercises the running application by simulating real-world attack patterns, uncovering weaknesses that only manifest during execution and satisfying CRA requirements for runtime vulnerability evaluation.

1. Rationale

    - CRA Compliance
      > DAST provides evidence of runtime security evaluation required by CRA Annex I Part I, complementing SAST and SCA to achieve the multi-layer testing coverage expected under CRA Article 13 for higher-risk product classes.

    - Vulnerability Management
      > Dynamic scanning against the OWASP Top 10 and CWE Top 25 attack patterns detects authentication flaws, injection vulnerabilities, and misconfigurations that only appear when the application is running.

    - SSDLC Integration
      > DAST executes against a running application instance in the integration-test stage of the CI/CD pipeline, providing automated runtime security feedback without manual testing effort.

    - Auditability
      > DAST reports generated per integration build are stored as pipeline artefacts, providing documented evidence of runtime security testing for conformity assessments.

    - Attack Surface Reduction
      > Simulating adversarial HTTP requests and protocol-level attacks exposes runtime-exploitable weaknesses, reducing the effective attack surface of the deployed application.

### 3.4. Fuzz Testing

Selected for its ability to discover unexpected input-handling vulnerabilities and memory-safety issues that evade both static and dynamic analysis. Fuzz testing subjects components that process untrusted input to a high volume of malformed and edge-case inputs, uncovering crashes, hangs, and assertion failures that represent potential security vulnerabilities.

1. Rationale

    - CRA Compliance
      > Fuzz testing demonstrates adversarial input-handling robustness required by CRA Annex I Part I for attack surface minimisation and contributes to the documented security testing evidence required under CRA Article 13.

    - Vulnerability Management
      > Automated fuzz campaigns detect memory-corruption bugs, integer overflows, and input-validation failures that static and dynamic analysis tools do not reliably identify, reducing the residual vulnerability surface.

    - SSDLC Integration
      > Fuzz testing runs in a dedicated scheduled pipeline stage targeting components that process untrusted input, providing continuous adversarial validation without disrupting the main CI/CD pipeline.

    - Attack Surface Reduction
      > Exercising parsers, protocol handlers, and deserialisation routines with high volumes of malformed input identifies and enables remediation of input-handling edge cases before they can be exploited in production.

### 3.5. Penetration Testing

Selected for its ability to validate the overall security posture through independent adversarial assessment. Periodic penetration testing by an external party uncovers systemic weaknesses, validates the effectiveness of automated tooling, and produces the independent security evaluation documentation required for CRA conformity assessments of higher-risk product classes.

1. Rationale

    - CRA Compliance
      > An independent penetration test provides evidence of adversarial security validation required by CRA Annex I Part I and supports the technical documentation package for conformity assessments under CRA Article 13(3).

    - Vulnerability Management
      > Penetration testing identifies systemic weaknesses and attack-chain scenarios that automated tools cannot replicate, validating that the cumulative effect of SAST, DAST, SCA, and fuzz testing mitigations is sufficient.

    - Auditability
      > Penetration-test reports documenting findings, remediation actions, and retesting outcomes constitute formal security evaluation evidence for conformity-assessment bodies and market-surveillance authorities.

    - Attack Surface Reduction
      > Independent expert assessment of the full system under realistic adversarial conditions identifies residual systemic weaknesses that automated pipeline tooling does not cover.

### 3.6. Performance Testing

Selected for its ability to uncover security-relevant failure modes that only emerge under load, such as resource exhaustion, denial-of-service susceptibility, and latency-amplifying vulnerabilities. Performance testing encompasses two complementary disciplines: load and stress testing, which validates system behaviour under peak external traffic, and benchmark testing, which measures the execution time and memory footprint of individual components to detect performance regressions and resource-exhaustion conditions within the codebase itself. Tooling is selected to match the target technology stack — HTTP services and containers, embedded C/C++, and Go — ensuring coverage across the full deployment surface.

1. Rationale

    - CRA Compliance
      > Performance testing provides evidence that the product maintains operational availability and resilience under load, supporting CRA Annex I Part I requirements for protection against availability attacks and contributing to conformity-assessment documentation under CRA Article 13.

    - Vulnerability Management
      > Load, stress, and benchmark tests expose resource-exhaustion vulnerabilities, memory leaks, unthrottled endpoints, and regression-inducing code changes that SAST, DAST, and fuzz testing do not cover, enabling remediation before they can be exploited as denial-of-service vectors.

    - SSDLC Integration
      > Stack-specific tooling integrates natively into the CI/CD pipeline: k6 or Locust for HTTP services and containerised workloads; Google Benchmark or perf for embedded C/C++ components; and `go test -bench` with pprof and benchstat for Go services. Benchmark tests run on every pull request to catch regressions at the point of introduction; load tests run in a dedicated scheduled or pre-release stage.

    - Auditability
      > Performance test reports recording baseline thresholds, load profiles, benchmark results, and regression deltas are stored as versioned pipeline artefacts, providing documented evidence of availability and resilience validation.

    - Attack Surface Reduction
      > Identifying and remediating rate-limiting gaps, unthrottled API endpoints, memory-allocation hotspots, and resource-exhaustion paths reduces the attack surface available to denial-of-service and amplification attacks.

## 4. Considered

### 4.1. SAST

[SAST (Static Application Security Testing)](https://owasp.org/www-community/Source_Code_Analysis_Tools) analyses source code or compiled bytecode without executing the program to identify security vulnerabilities, insecure coding patterns, and compliance violations.

- Pros

  - CRA Compliance
    > Produces documented evidence of source-code security evaluation that supports CRA conformity-assessment requirements.

  - Vulnerability Management
    > Detects a broad range of known vulnerability classes (injection, hardcoded credentials, insecure APIs) at commit time, before deployment.

  - SSDLC Integration
    > Integrates natively into CI/CD pipelines and code-review workflows with low execution overhead.

- Cons

  - Coverage
    > Cannot detect vulnerabilities that only manifest at runtime, such as authentication flaws, server-side request forgery, or dynamic injection paths.

  - False Positives
    > High false-positive rates for certain rule sets require ongoing triage effort and careful tuning to avoid alert fatigue.

### 4.2. SCA and SBOM

[SCA (Software Composition Analysis)](https://owasp.org/www-community/Component_Analysis) identifies open-source and third-party components in a codebase, checks them against vulnerability databases, and generates a machine-readable SBOM documenting the software supply chain.

- Pros

  - SBOM Transparency
    > Generates a machine-readable SBOM in CycloneDX or SPDX format that fulfils CRA supply-chain transparency and due-diligence requirements.

  - Vulnerability Management
    > Continuously monitors third-party dependencies for newly disclosed CVEs and licence violations, enabling timely remediation.

  - Auditability
    > SBOM files and scan reports stored per release provide auditable supply-chain evidence for conformity-assessment bodies.

- Cons

  - Coverage
    > Limited to vulnerabilities with public CVE or OSV database entries; zero-day and supply chain tampering vulnerabilities (e.g., malicious packages) are not reliably detected.

  - Noise
    > Dependency graphs in large projects can generate a high volume of findings, including transitive dependencies, requiring prioritisation to manage remediation effort.

### 4.3. DAST

[DAST (Dynamic Application Security Testing)](https://owasp.org/www-community/Vulnerability_Scanning_Tools) tests a running application by simulating external attacks to identify vulnerabilities that are only exploitable at runtime, such as authentication bypasses, injection flaws, and security misconfigurations.

- Pros

  - CRA Compliance
    > Provides runtime vulnerability evidence that complements SAST, satisfying the multi-layer testing coverage expected by CRA Annex I.

  - Attack Surface Reduction
    > Identifies runtime-exploitable weaknesses, including those introduced by third-party frameworks and deployment configuration, that static analysis cannot detect.

- Cons

  - Pipeline Complexity
    > Requires a running application instance with representative configuration, adding test-environment provisioning overhead to the CI/CD pipeline.

  - Coverage
    > Black-box scanning cannot reach all application code paths; coverage depends on the quality of the test configuration and crawling depth.

### 4.4. Fuzz Testing

[Fuzz testing (fuzzing)](https://owasp.org/www-community/Fuzzing) automatically generates large volumes of malformed, unexpected, or random inputs to exercise software interfaces and uncover crashes, memory-safety violations, and assertion failures that indicate potential security vulnerabilities.

- Pros

  - Vulnerability Management
    > Discovers novel input-handling vulnerabilities—memory corruption, integer overflows, parser bugs—that neither SAST nor DAST reliably identifies.

  - Attack Surface Reduction
    > Exercises high-risk interfaces (parsers, protocol handlers, deserialisers) under adversarial input conditions, reducing residual input-handling vulnerabilities.

- Cons

  - Execution Time
    > Thorough fuzz campaigns require long run times, making them unsuitable for standard per-commit CI pipelines and better suited to scheduled or nightly builds.

  - Applicability
    > Most effective for components processing untrusted input; limited value for business-logic or UI layers with few external input surfaces.

### 4.5. Penetration Testing

[Penetration testing](https://owasp.org/www-project-web-security-testing-guide/) is a structured, adversarial security assessment conducted by independent experts who simulate real-world attacks against a system to identify exploitable vulnerabilities, attack chains, and systemic security weaknesses.

- Pros

  - CRA Compliance
    > Provides independent evidence of adversarial security evaluation that supports conformity-assessment documentation requirements under CRA Article 13(3).

  - Auditability
    > Produces formal reports documenting findings, risk ratings, remediation guidance, and retesting results that satisfy market-surveillance authority requests.

- Cons

  - Point-in-Time
    > Assessments are conducted at discrete intervals rather than continuously; vulnerabilities introduced between engagements accumulate undetected until the next test.

  - Cost
    > Independent penetration testing requires significant financial and scheduling investment, limiting feasibility to annual or pre-release engagements.

### 4.6. Performance Testing

[Performance testing](https://k6.io/docs/) evaluates how a system behaves under normal and peak load conditions, measuring throughput, latency, error rates, and resource utilisation to identify bottlenecks, denial-of-service susceptibility, and availability risks. It covers two complementary disciplines: load and stress testing (external, black-box) for validating system capacity, and benchmark testing (internal, white-box) for measuring execution time and memory footprint of individual components. Tool selection is matched to the technology stack: k6 or Locust for HTTP services and containerised workloads; [Google Benchmark](https://github.com/google/benchmark) or perf for embedded C/C++ components; and `go test -bench` with [pprof](https://pkg.go.dev/net/http/pprof) and [benchstat](https://pkg.go.dev/golang.org/x/perf/cmd/benchstat) for Go services.

- Pros

  - CRA Compliance
    > Demonstrates that the product maintains availability and resilience under load, complementing security-layer testing to satisfy CRA Annex I Part I availability and attack-resistance requirements.

  - Vulnerability Management
    > Detects resource-exhaustion vulnerabilities, unthrottled endpoints, memory leaks, and performance regressions that only appear under load or targeted benchmarking, which SAST, DAST, and fuzz testing do not cover.

  - Stack Coverage
    > Stack-specific tooling ensures meaningful coverage across embedded C/C++, Go services, HTTP APIs, and containerised workloads without requiring a single general-purpose tool that may produce inaccurate results on low-level or constrained-resource targets.

  - Auditability
    > Load test reports and benchmark result sets with defined baseline thresholds and pass/fail criteria provide documented evidence of availability validation for conformity-assessment bodies.

- Cons

  - Environment Dependency
    > Meaningful load and stress testing requires a production-representative environment with realistic data volumes and network conditions, increasing infrastructure cost and setup complexity.

  - Maintenance Overhead
    > Baseline thresholds, load profiles, and benchmark baselines must be updated as the application evolves; stale benchmarks produce misleading results and erode confidence in the test suite.

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

6. Integrate Performance Testing

    Adopt stack-specific performance and benchmark tooling across the technology surface: use k6 or Locust for load and stress testing of HTTP services and containerised workloads; use Google Benchmark or perf for embedded C/C++ components; and use `go test -bench` with pprof and benchstat for Go services. Run benchmark tests on every pull request to detect per-component performance regressions at the point of introduction. Run load and stress tests in a dedicated scheduled or pre-release pipeline stage against a production-representative environment. Define baseline thresholds for throughput, latency, error rate, and memory consumption and configure the pipeline to fail on threshold regressions. Include rate-limiting and resource-exhaustion scenarios in the load profile to validate denial-of-service resilience. Store performance and benchmark reports as versioned pipeline artefacts.

7. Establish Vulnerability Management Process

    Define a vulnerability management policy specifying severity classifications, remediation SLAs (e.g., critical within 24 hours of confirmed identification to meet CRA reporting obligations from September 11, 2026), and coordinated disclosure procedures. Maintain a vulnerability register updated by automated scan results and manual findings.

8. Compile and Maintain Technical Documentation

    Aggregate SAST reports, DAST reports, SCA findings, SBOM files, fuzz-test results, penetration-test summaries, and performance test reports into a versioned technical documentation package per release. Ensure this package is accessible to conformity-assessment bodies and market-surveillance authorities on request, as required by CRA Article 13(3).

9. Validate

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
- k6 [performance testing](https://k6.io/docs/) tool.
- Locust [load testing](https://locust.io/) tool.
- Google [Benchmark C++ microbenchmarking](https://github.com/google/benchmark) library.
- Go [testing benchmarks](https://pkg.go.dev/testing#hdr-Benchmarks) package.
- Go [pprof profiling](https://pkg.go.dev/net/http/pprof) package.
- Go [benchstat benchmark statistics](https://pkg.go.dev/golang.org/x/perf/cmd/benchstat) tool.
- Sentenz convention [002-ADR: Software Security](002-adr-software-security.md) record.
