# 016-ADR: Security Testing for C/C++

Architectural Decision Records (ADR) on selecting a complementary multi-layer security testing strategy for C/C++ embedded products to achieve EU Cyber Resilience Act (CRA) compliance.

- [1. State](#1-state)
- [2. Context](#2-context)
- [3. Decision](#3-decision)
  - [3.1. Unit Testing with Sanitizers](#31-unit-testing-with-sanitizers)
  - [3.2. Fuzz Testing with Sanitizers](#32-fuzz-testing-with-sanitizers)
  - [3.3. SAST (Static Application Security Testing)](#33-sast-static-application-security-testing)
  - [3.4. SCA (Software Composition Analysis) & SBOM Management](#34-sca-software-composition-analysis--sbom-management)
  - [3.5. Penetration Testing (Binary Exploitation)](#35-penetration-testing-binary-exploitation)
- [4. Considered](#4-considered)
  - [4.1. Sanitizers](#41-sanitizers)
  - [4.2. Unit Testing](#42-unit-testing)
  - [4.3. Fuzz Testing (Fuzzing)](#43-fuzz-testing-fuzzing)
  - [4.4. SAST (Static Application Security Testing)](#44-sast-static-application-security-testing)
  - [4.5. DAST (Dynamic Application Security Testing)](#45-dast-dynamic-application-security-testing)
  - [4.6. SCA (Software Composition Analysis) & SBOM Management](#46-sca-software-composition-analysis--sbom-management)
  - [4.7. Penetration Testing (Binary Exploitation)](#47-penetration-testing-binary-exploitation)
- [5. Consequences](#5-consequences)
- [6. Implementation](#6-implementation)
- [7. References](#7-references)

## 1. State

- Author(s): Sentenz
- Date: 2026-06-24
- Status: Proposed

## 2. Context

The EU Cyber Resilience Act (CRA) Regulation mandates strict security baselines for hardware and software products entering the EU market. The CRA requires that manufacturers implement active vulnerability identification, maintain complete software transparency, and offer continuous verification throughout the software development lifecycle (SDLC).

C/C++ embedded products present unique challenges due to their lack of inherent memory safety, resource-constrained execution environments, and complex supply chain dependencies. A multi-layered security testing strategy is necessary to satisfy CRA requirements, mitigate risks, and provide auditable evidence of systematic security testing.

1. Decision Drivers

    - CRA Regulatory Compliance
      > The CRA mandates proactive vulnerability identification, security-by-default design, software transparency via SBOM, and documented evidence of systematic security testing throughout the entire product lifecycle per Annex I and Article 13.

    - CIA Triad (Confidentiality, Integrity, Availability)
      > Ensure that the system maintains confidentiality, integrity, and availability of data and services, aligning with the core principles of information security.

    - Supply Chain Transparency
      > CRA Annex II requires a complete, auditable SBOM of all third-party and open-source dependencies, including known CVE exposure mappings, to ensure supply chain security.

    - Evidence-based Retention
      > Systematic security testing must produce machine-parseable artifacts that are versioned and archived for a minimum of 10 years to satisfy CRA Article 13(13) documentation requirements.

    - Memory Safety
      > C/C++'s lack of inherent memory safety requires systematic detection of buffer overflows, use-after-free, and undefined behavior to prevent exploitable vulnerabilities.

    - Developer Experience
      > Seamlessly integrate into existing developer workflows and Editor/IDE setup without extensive configuration.

    - CI/CD Compliance
      > Integrate security testing into CI/CD pipelines to provide automated, repeatable, and auditable evidence of systematic security testing.

## 3. Decision

Adopt a multi-layered security testing strategy for C/C++ embedded products to satisfy CRA compliance requirements.

### 3.1. Unit Testing with Sanitizers

Adopt automated security Unit Testing with Sanitizer instrumentation to detect memory safety violations and undefined behavior in C/C++ code paths.

1. Rationale

    - CRA Regulatory Compliance
      > Unit Testing with Sanitizers satisfies CRA Annex I §1(2)(a) proactive vulnerability identification with structured Sanitizer output.

    - CIA Triad (Availability)
      > Unit tests with Sanitizers help ensure system availability by detecting and mitigating potential crashes and undefined behavior that could lead to downtime or service disruption.

    - Memory Safety
      > Sanitizers detect memory corruption, use-after-free, and undefined behavior in C/C++ code paths that are exercised by unit tests, providing early detection of exploitable vulnerabilities before integration.

    - Developer Experience
      > Unit tests run under Sanitizer instrumentation provide immediate feedback to developers, enabling rapid remediation of memory safety issues without requiring specialized hardware or external test runners.

    - CI/CD Compliance
      > Unit tests with Sanitizers executed in CI pipelines, providing automated detection of memory safety violations and undefined behavior, ensuring continuous security assurance.

    - Evidence-based Retention
      > Sanitizer logs and unit test results are archived as versioned CI artifact uploads, providing auditable evidence of systematic security testing and vulnerability identification for CRA compliance.

### 3.2. Fuzz Testing with Sanitizers

Adopt coverage-guided fuzz testing with Sanitizer instrumentation to discover memory corruption, integer overflows, and parsing errors in C/C++ code paths not exercised by unit tests.

1. Rationale

    - CRA Regulatory Compliance
      > Fuzz testing with Sanitizers satisfies CRA Annex I §1(2)(a) proactive vulnerability identification with fuzzing campaign results and crash reproducers.

    - CIA Triad (Integrity)
      > Fuzz testing helps ensure system integrity by identifying and mitigating potential vulnerabilities that could be exploited to compromise the integrity of the system or its data.

    - Memory Safety
      > Fuzz testing discovers hidden edge-case crashes, boundary violations, and deeply nested logical flaws in C/C++ code paths that are not exercised by unit tests, providing early detection of exploitable vulnerabilities before integration.

    - Developer Experience
      > Fuzz testing campaigns run under Sanitizer instrumentation provide immediate feedback to developers, enabling rapid remediation of memory safety issues without requiring specialized hardware or external test runners.

    - CI/CD Compliance
      > Fuzz testing campaigns executed in CI pipelines, providing automated discovery of memory safety violations and undefined behavior, ensuring continuous security assurance.

    - Evidence-based Retention
      > Fuzzing campaign results, crash reproducers, and corpus snapshots are archived as versioned CI artifact uploads, providing auditable evidence of systematic security testing and vulnerability identification for CRA compliance.

### 3.3. SAST (Static Application Security Testing)

Adopt SAST tools to perform source-level vulnerability detection and enforce secure coding standards in C/C++ code.

1. Rationale

    - CRA Regulatory Compliance
      > SAST satisfies CRA Annex I §1(2)(a) proactive vulnerability identification with SAST reports and rule violation logs.

    - CIA Triad (Confidentiality)
      > SAST helps ensure system confidentiality by identifying and mitigating potential vulnerabilities that could be exploited to compromise sensitive data or information.

    - Memory Safety
      > SAST detects unsafe coding patterns, tainted data flows, and rule violations in C/C++ code, providing early detection of exploitable vulnerabilities before integration.

    - Developer Experience
      > SAST tools provide immediate feedback to developers, enabling rapid remediation of security issues without requiring specialized hardware.

    - CI/CD Compliance
      > SAST executed in CI pipelines, providing automated detection of security weaknesses and unsafe patterns, ensuring continuous security assurance.

    - Evidence-based Retention
      > SAST SARIF reports and rule violation logs are archived as versioned CI artifact uploads, providing auditable evidence of systematic security testing and vulnerability identification for CRA compliance.

### 3.4. SCA (Software Composition Analysis) & SBOM Management

Adopt SCA tools to generate and manage SBOMs, identify third-party dependencies, and match components against vulnerability databases for known CVE exposure.

1. Rationale

    - CRA Regulatory Compliance
      > SCA satisfies CRA Annex II §1(2)(a) transparency requirements with SBOM generation and vulnerability matching reports.

    - CIA Triad (Confidentiality, Integrity)
      > SCA helps ensure system confidentiality and integrity by identifying and mitigating potential vulnerabilities in third-party dependencies that could be exploited to compromise sensitive data or information.

    - Supply Chain Transparency
      > SCA generates standardized CycloneDX/SPDX SBOMs of all third-party libraries, providing visibility into the software supply chain and enabling proactive vulnerability management.

    - CI/CD Compliance
      > SCA executed in CI pipelines, providing automated identification of known vulnerabilities in third-party dependencies, ensuring continuous security assurance.

    - Evidence-based Retention
      > SBOMs and vulnerability matching reports are archived as versioned CI artifact uploads, providing auditable evidence of systematic security testing and vulnerability identification for CRA compliance.

### 3.5. Penetration Testing (Binary Exploitation)

Adopt periodic penetration testing on production binaries to validate that residual vulnerabilities are not practically exploitable and that compiler hardening mitigations resist bypass.

1. Rationale

    - CRA Regulatory Compliance
      > Penetration testing satisfies CRA Annex I §1(2)(a) proactive vulnerability identification with penetration test reports and exploitability assessments.

    - CIA Triad (Availability, Integrity)
      > Penetration testing helps ensure system availability and integrity by identifying and mitigating potential vulnerabilities that could be exploited to compromise the system or its data.

    - CI/CD Compliance
      > Penetration testing conducted as a periodic pre-release gate, providing automated validation of residual risk in production binaries, ensuring continuous security assurance.

    - Evidence-based Retention
      > Penetration test reports and exploitability assessments are archived as versioned CI artifact uploads, providing auditable evidence of systematic security testing and vulnerability identification for CRA compliance.

## 4. Considered

### 4.1. Sanitizers

Sanitizers instrument the binary at compile time to detect active memory violations during runtime execution.

> [!TIP]
> [LLVM Sanitizers](https://clang.llvm.org/docs/index.html) (ASan, UBSan, LSan, MSan, TSan) provide compile-time runtime instrumentation for host-mode test execution, detecting defect classes (memory errors, undefined behavior, data races).

- Pros

  - Precise Diagnostics
    > Provides precise diagnostic feedback (with stack traces) for execution flaws like buffer overflows and data races with near-zero false-positive rates.

  - Native Integration
    > Built-in compiler support for Clang and GCC, enabling seamless integration into CMake/CTest pipelines without additional toolchain dependencies.

  - Test Suite Synergy
    > Works in conjunction with unit tests and fuzzing suites, providing high-fidelity memory error detection across exercised code paths.

- Cons

  - Significant Resource Overhead
    > Induces up to 2× to 4× execution slowdowns and increased memory consumption.

  - Multi-sanitizer Mutual Exclusivity
    > Some Sanitizers cannot be combined in a single binary (e.g., ASan/UBSan with MSan or TSan), requiring multiple builds to cover all defect classes.

### 4.2. Unit Testing

Unit Testing Frameworks isolate and execute individual functional blocks within deterministic execution contexts.

> [!TIP]
> [Google Test (GTest)](https://github.com/google/googletest) with [SEGGER J-Run](https://www.segger.com/products/debug-probes/j-link/tools/j-run/) provides on-host and on-target C++ unit testing for embedded systems, integrating with CMake/CTest for CI-native execution and bare-metal hardware-in-the-loop testing via J-Link SWD and RTT output.

- Pros

  - Deterministic Regression Baseline
    > Provides a deterministic regression baseline for functional correctness, enabling early detection of logic errors and regressions in C/C++ code paths.

  - On-target Validation
    > SEGGER J-Run executes CTest-registered binaries on bare-metal Cortex-M via J-Link SWD with SEGGER RTT output, exposing hardware-specific faults (MPU violations, peripheral misuse) that are invisible in host-mode execution.

  - Sanitizer Synergy
    > Unit tests executed under Sanitizer instrumentation detect memory corruption and undefined behavior in exercised code paths.

- Cons

  - Mock Divergence
    > Host-mode HAL mocks may diverge from real hardware behavior over time, masking target-specific vulnerabilities and generating false assurance from green host-mode test results.

  - Path Coverage Ceiling
    > Unit tests exercise only developer-specified paths, no automated discovery of unknown vulnerabilities occurs without complementary fuzz testing or property-based test generation.

### 4.3. Fuzz Testing (Fuzzing)

Coverage-guided fuzz testing performs mutation of structured and unstructured inputs, automatically discovering memory corruption, integer overflows, and parsing errors in C/C++ code paths.

> [!TIP]
> [Google FuzzTest](https://github.com/google/fuzztest) performs automated input generation guided by branch coverage feedback, discovering memory corruption, integer overflows, and protocol parsing errors in code paths not exercised by hand-crafted tests.

- Pros

  - Coverage-Guided
    > Discovers hidden edge-case crashes, boundary violations, and deeply nested logical flaws by combining code-coverage feedback with input mutation.

  - Sanitizer Synergy
    > Fuzz testing executed under Sanitizer instrumentation detects memory corruption and undefined behavior in exercised code paths.

- Cons

  - Heavy Compute Footprint
    > Demands dedicated continuous processing cycles to build and mutate test cases efficiently. Introduces specialized pipeline infrastructure requirements, e.g. extended scheduled campaigns to achieve sufficient coverage.

  - Limited Determinism
    > Fuzzing is inherently non-deterministic. Reproducing discovered crashes requires careful corpus management and may be sensitive to compiler optimizations, build flags, and runtime environment.

### 4.4. SAST (Static Application Security Testing)

SAST analyzes source code without executing the program to identify security weaknesses, unsafe patterns, tainted data flows, and rule violations.

> [!TIP]
> [SonarQube](https://www.sonarsource.com/) and [Semgrep](https://semgrep.dev/) perform source-level and interprocedural semantic static analysis, providing rapid vulnerability feedback without requiring code execution or hardware availability.

- Pros

  - Shift-Left Execution
    > Flags critical memory safety and semantic errors directly during development without requiring code execution or target hardware.

- Cons

  - False Positive Overhead
    > Static analysis reports high rates of false positives, which demands careful filtering configurations to preserve developer experience.

### 4.5. DAST (Dynamic Application Security Testing)

DAST evaluates the application surface against malicious payloads from a black-box perspective, identifying exploitable vulnerabilities in the compiled binary.

> [!TIP]
> [OWASP ZAP](https://www.zaproxy.org/) and [Burp Suite](https://portswigger.net/burp) perform black-box dynamic application security testing, simulating malicious input to identify exploitable vulnerabilities in compiled binaries.

- Pros

  - Behavioral Validation
    > Evaluates the application surface against malicious payloads from a black-box perspective.

- Cons

  - Limited Visibility & Applicability
    > Limited to externally visible interfaces and may not cover internal code paths or embedded systems without network-facing services. It is less applicable to C/C++ embedded products that lack a network interface or user-facing application layer.

  - False Positive Overhead
    > Generate a high number of false positives, requiring manual verification and triage to determine the validity of reported vulnerabilities.

### 4.6. SCA (Software Composition Analysis) & SBOM Management

SCA identifies third-party and open-source dependencies, matching components against Vulnerability Databases to identify known vulnerabilities, supports SBOM generation and license compliance governance.

> [!TIP]
> [Trivy](https://github.com/aquasecurity/trivy) generates and scans Software Bill of Materials (SBOM) artifacts in CycloneDX and SPDX formats. OWASP [Dependency-Track](https://dependencytrack.org/) provides continuous monitoring of SBOMs against NVD, OSV, and EUVD vulnerability databases, triggering policy violations when new CVEs affect released product SBOMs.

- Pros

  - Automated SBOM Validation
    > Generates, validates, and uploads SBOM artifacts in CycloneDX/SPDX format. Tracks software components, licenses compliance, and vulnerabilities across products.

  - Automated Vulnerability Scanning
    > Scans SBOMs against NVD, OSV, and EUVD vulnerability databases to identify known vulnerabilities in third-party libraries. Covering CVSS severity levels, EPSS risk scoring and CWE classifications, enabling proactive vulnerability management.

  - Vulnerability Lifecycle Monitoring
    > Provides vulnerability monitoring throughout the 5-year CRA support period, triggering policy violations when newly disclosed CVEs affect released product SBOMs without requiring manual re-scanning.

- Cons

  - Context Insensitivity
    > Identifies vulnerable dependencies based on version numbers regardless of whether the specific vulnerable function is compiled or reachable in our configuration.

  - SBOM Incompleteness
    > C/C++ lacks a standardized package manager. Dependencies may be statically linked, header-only, submodules or vendor-supplied binary blobs. SCA tools may miss vendored components, requiring manual SBOM exception documentation for regulatory submission completeness.

  - Vulnerability Database Latency
    > CVE enrichment in NVD/EUVD delays between public vulnerability disclosure and vulnerability database availability. May allow newly disclosed vulnerabilities to pass CI gates before the database reflects the advisory.

### 4.7. Penetration Testing (Binary Exploitation)

Penetration testing on security assessments and reverse-engineering validation mapped against common attacker Tactics, Techniques, and Procedures (TTPs).

> [!TIP]
> [Ghidra](https://github.com/NationalSecurityAgency/ghidra) and [GDB](https://www.gnu.org/software/gdb/) with [pwndbg](https://github.com/pwndbg/pwndbg) perform binary-level exploitation assessment as a periodic pre-release gate, validating that residual vulnerabilities are not practically exploitable and that compiler hardening mitigations resist bypass.

- Pros

  - Exploitability Assessment
    > Identifies exploitable vulnerabilities in the compiled binary, providing insight into potential attack vectors (e.g., secure boot, cryptography, authentication, and authorization).

  - Real-World Attacker Perspective
    > Simulates realistic attacker TTPs against the production binary, coordinating complex vulnerabilities into meaningful exploit chains.

  - Compiler Hardening
    > Validates that compiler hardening mitigations resist bypass, ensuring that security controls are effective against exploitation attempts.

- Cons

  - Remediation Lag
    > Penetration testing is a periodic pre-release gate. Vulnerabilities discovered may require significant remediation time, potentially delaying release schedules if critical or high-severity findings are identified.

## 5. Consequences

- Positive

  - Multi-layer Assurance
    > Provides a multi-layered security testing strategy that combines static analysis, dynamic analysis, component analysis, software testing, and binary exploitation assessment to ensure comprehensive vulnerability identification and mitigation.

  - Audit-Ready Export Packages
    > Generate audit-ready technical file bundles with all required documentation. Ready for regulators and market surveillance.

  - Continuous Vulnerability Tracking
    > SCA and SBOM management provide continuous monitoring of third-party dependencies against vulnerability databases, enabling proactive identification and mitigation of known vulnerabilities throughout the product lifecycle.

  - Proactive Hardening
    > Significant reduction in the vulnerability surface by forcing remediation of unsafe coding patterns, memory safety violations, and undefined behavior in the development lifecycle.

- Negative

  - CI/CD Complexity
    > Integrating multiple security testing layers into CI/CD pipelines increases complexity and may extend build and test durations, requiring careful pipeline design, strategy and resource allocation.

  - Maintenance & Operational Overhead
    > Maintaining and updating multiple security testing tools, frameworks, and dependencies requires dedicated effort to ensure compatibility, effectiveness, and alignment with evolving security standards.

  - Storage Footprint Extension
    > Retaining deterministic test results and historical compliance matrices for the mandated multi-year window creates storage overhead.

- Risks

  - False Sense of Security
    > Security testing is not a guarantee of vulnerability absence. A green CI pipeline does not imply the absence of exploitable vulnerabilities, especially in untested code paths or third-party dependencies.

  - Mock Divergence
    > Host-mode HAL mocks may diverge from real hardware behavior over time, masking target-specific vulnerabilities and generating false assurance from green host-mode test results. Schedule periodic on-target hardware-in-the-loop (HIL) integration tests to validate against real hardware behavior.

  - SBOM Incompleteness
    > C/C++ lacks a standardized package manager. Dependencies may be statically linked, header-only, submodules or vendor-supplied. SCA tools may miss vendored components, requiring manual SBOM exception documentation for regulatory submission completeness.

## 6. Implementation

1. Integrate SAST

    - Integrate SAST tools (e.g., SonarQube, Semgrep) into the CI pipeline to perform source-level vulnerability detection and enforce secure coding standards.
    - Configure SAST to generate SARIF reports and rule violation logs for archiving as versioned CI artifacts.

2. Integrate SCA & SBOM Management

    - Integrate SCA tools (e.g., Trivy, OWASP Dependency-Track) into the CI pipeline to generate and manage SBOMs, identify third-party dependencies, and match components against vulnerability databases for known CVE exposure.
    - Generate VEX (Vulnerability Exploitability eXchange) statements from triage assessment on SBOM components to document whether known vulnerabilities in third-party dependencies are exploitable in the specific product.
    - Configure SCA to generate CycloneDX/SPDX SBOMs and vulnerability matching reports for archiving as versioned CI artifacts.

3. Integrate Unit Testing with Sanitizers

    - Integrate unit testing frameworks (e.g., Google Test with SEGGER J-Run) into the CI pipeline to execute unit tests under Sanitizer instrumentation.
    - Configure unit tests to generate logs and results for archiving as versioned CI artifacts.

4. Integrate Fuzz Testing with Sanitizers

    - Integrate fuzz testing frameworks (e.g., Google FuzzTest) into the CI pipeline to perform coverage-guided fuzz testing under Sanitizer instrumentation.
    - Configure fuzz testing campaigns to generate crash reproducers, corpus snapshots, and logs for archiving as versioned CI artifacts.

5. Integrate Penetration Testing (Binary Exploitation)

    - Schedule periodic penetration testing on production binaries using tools (e.g., Ghidra, GDB with pwndbg) to validate that residual vulnerabilities are not practically exploitable and that compiler hardening mitigations resist bypass.
    - Configure penetration testing to generate reports and exploitability assessments for archiving as versioned CI artifacts.

6. Establish Evidence Retention Policy

    - Implement a policy for retaining all security testing artifacts (SAST reports, SCA SBOMs, unit test logs, fuzzing results, penetration test reports) for a minimum of 10 years to satisfy CRA Article 13(5) documentation requirements.

7. Validate Conformance

    - Verify that CI pipelines publish the required artifacts, retain them according to policy, and document the selected controls in the technical file for regulatory review.

## 7. References

- EU Cyber Resilience Act (CRA) [Regulation (EU) 2024/2847](https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=CELEX:32024R2847) legislative text, EUR-Lex.
- CRA Annex I Essential Cybersecurity Requirements [reference](https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=CELEX:32024R2847#anx_I) page.
- LLVM Sanitizer [documentation](https://clang.llvm.org/docs/AddressSanitizer.html) page.
- NIST SP 800-218 [Secure Software Development Framework (SSDF)](https://nvlpubs.nist.gov/nistpubs/SpecialPublications/NIST.SP.800-218.pdf) publication.
- MITRE [CWE (Common Weakness Enumeration)](https://cwe.mitre.org/) database.
