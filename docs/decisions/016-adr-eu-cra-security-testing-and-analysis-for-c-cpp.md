# 016-ADR: EU CRA Security Testing and Security Analysis for C/C++

Architectural Decision Records (ADR) on adopting an integrated security testing and security analysis strategy for C/C++ software in compliance with the EU Cyber Resilience Act (CRA), Regulation (EU) 2024/2847.

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

The EU Cyber Resilience Act (CRA), Regulation (EU) 2024/2847, entered into force on December 10, 2024 and imposes mandatory cybersecurity obligations on manufacturers of products with digital elements (PDEs) sold in the EU market. Vulnerability and incident reporting obligations apply from September 11, 2026, and full conformity requirements are enforceable from December 11, 2027. Article 13 and Annex I of the CRA require manufacturers to design, develop, and maintain PDEs in accordance with essential cybersecurity requirements, including documented security risk assessments, vulnerability management, and evidence of security testing throughout the product lifecycle. Non-compliance can result in market withdrawal, fines of up to €15 million or 2.5 % of global annual turnover, and exclusion from the EU market. C/C++ software presents particular cybersecurity challenges: memory-safety vulnerabilities (buffer overflows, use-after-free, integer overflows, format-string bugs), undefined behaviour, and the absence of a managed runtime make it a frequent source of critical CVEs. Many CRA-covered products are implemented in C/C++, including embedded firmware, industrial control systems, automotive components, and connected devices. To satisfy CRA obligations the project must adopt an integrated, evidence-producing security testing and analysis strategy that addresses the specific vulnerability classes and tooling constraints of the C/C++ ecosystem.

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

Selected for its ability to detect insecure code patterns and potential vulnerabilities directly in C/C++ source code, before any code is executed or deployed. For C/C++, SAST encompasses compile-time analysis tools (SonarQube with C/C++ analysis plugins, Semgrep with C/C++ rulesets) and standalone checkers (cppcheck, clang-tidy) that identify memory-safety vulnerabilities, undefined behaviour, insecure API usage, and CWE-enumerated vulnerability classes. Integrating SAST as a mandatory quality gate on every pull request ensures that security issues are identified at the earliest possible stage of the development lifecycle.

1. Rationale

    - CRA Compliance
      > SAST produces documented evidence of source-code security evaluation required by CRA Annex I Part I (security by design, elimination of known vulnerability classes) and supports conformity-assessment documentation under CRA Article 13.

    - Vulnerability Management
      > Automated static analysis on every commit detects memory-corruption patterns, buffer overflows, use-after-free, integer overflows, format-string vulnerabilities, and unsafe API calls at the point of introduction, enabling immediate remediation before code reaches production.

    - SSDLC Integration
      > SonarQube and Semgrep integrate natively into CI/CD pipelines; cppcheck and clang-tidy integrate with CMake and build systems as additional compilation steps, enforcing security checks at the earliest development stage without disrupting developer productivity.

    - Auditability
      > Structured SAST reports stored as versioned pipeline artefacts constitute technical documentation demonstrating security evaluation of each code change, as required by CRA Article 13(3).

    - Attack Surface Reduction
      > Detection of memory-safety vulnerabilities, unsafe pointer arithmetic, unchecked buffer sizes, and insecure system API usage reduces the number of exploitable weaknesses in the codebase before deployment.

### 3.2. SCA and SBOM

Selected for its role in identifying vulnerabilities in third-party dependencies and vendored libraries and producing a machine-readable Software Bill of Materials (SBOM) per release. For C/C++ projects using Conan, vcpkg, or vendored source trees, SCA must analyse dependency manifests and lock files to detect components with known CVEs and licence violations. SBOM generation fulfils CRA transparency obligations and enables downstream consumers to assess component risk.

1. Rationale

    - CRA Compliance
      > SCA identifies third-party and vendored C/C++ components with known CVEs, satisfying CRA Annex I Part II obligations for monitoring and addressing vulnerabilities in dependencies. SBOM generation fulfils CRA transparency and supply-chain due-diligence requirements.

    - Vulnerability Management
      > Continuous dependency scanning against NVD, OSV, and vendor advisory databases detects newly disclosed vulnerabilities in third-party C/C++ libraries and vendored components and triggers remediation before release.

    - SBOM Transparency
      > SCA tooling generates a machine-readable SBOM in CycloneDX or SPDX format for every release, providing a complete inventory of C/C++ components, their versions, licence status, and known vulnerabilities.

    - SSDLC Integration
      > SCA runs automatically within the CI/CD pipeline on every build, scanning Conan and vcpkg lock files and vendored directories, providing continuous visibility into dependency health without requiring manual inventory management.

    - Auditability
      > SBOM files and SCA scan reports stored per release serve as evidence of supply-chain due diligence and support conformity-assessment body requests for technical documentation.

### 3.3. DAST

Selected for its capacity to identify runtime vulnerabilities that are not detectable through static analysis alone. For C/C++ components that expose network interfaces, DAST tools simulate real-world attack patterns against the running service. For binary components without HTTP endpoints, compiler-instrumented runtime sanitizers — AddressSanitizer (ASan), UndefinedBehaviorSanitizer (UBSan), MemorySanitizer (MSan), and ThreadSanitizer (TSan) — serve as the dynamic analysis layer, detecting memory-safety violations, undefined behaviour, data races, and use-after-free errors during test execution.

1. Rationale

    - CRA Compliance
      > DAST and runtime sanitizers provide evidence of dynamic security evaluation required by CRA Annex I Part I, complementing SAST and SCA to achieve the multi-layer testing coverage expected under CRA Article 13.

    - Vulnerability Management
      > Runtime sanitizers detect memory-corruption bugs, undefined behaviour, and race conditions in C/C++ code that are not reliably identified by static analysis. For network-facing components, black-box scanning detects authentication flaws and injection vulnerabilities that only appear during execution.

    - SSDLC Integration
      > Sanitizers are enabled by compiler flags (`-fsanitize=address,undefined,thread`) and integrate into the existing test suite with zero instrumentation overhead on development builds. DAST tools execute against a running service instance in the integration-test stage of the CI/CD pipeline.

    - Auditability
      > Sanitizer crash reports and DAST scan reports generated per build are stored as pipeline artefacts, providing documented evidence of dynamic security testing for conformity assessments.

    - Attack Surface Reduction
      > Runtime sanitizers surface exploitable memory-safety vulnerabilities under test conditions before they reach production; DAST scanning exposes runtime-exploitable weaknesses in network-facing interfaces.

### 3.4. Fuzz Testing

Selected for its ability to discover unexpected input-handling vulnerabilities and memory-safety issues that evade both static and dynamic analysis. Fuzz testing is particularly effective for C/C++ components: Google FuzzTest integrates directly with the C/C++ build system and generates high volumes of malformed and edge-case inputs to exercise parsers, protocol handlers, and deserialization routines, uncovering crashes, memory-corruption bugs, and assertion failures that represent potential security vulnerabilities.

1. Rationale

    - CRA Compliance
      > Fuzz testing demonstrates adversarial input-handling robustness required by CRA Annex I Part I for attack surface minimisation and contributes to the documented security testing evidence required under CRA Article 13.

    - Vulnerability Management
      > Automated fuzz campaigns detect memory-corruption bugs, heap/stack buffer overflows, integer overflows, and input-validation failures in C/C++ code that static analysis and sanitizers do not reliably identify, reducing the residual vulnerability surface.

    - SSDLC Integration
      > Fuzz testing runs in a dedicated scheduled pipeline stage targeting C/C++ components that process untrusted input, compiled with sanitizer instrumentation (`-fsanitize=address,fuzzer`) to maximise crash-detection sensitivity.

    - Attack Surface Reduction
      > Exercising C/C++ parsers, protocol handlers, and deserialization routines with high volumes of malformed input identifies and enables remediation of memory-safety edge cases before they can be exploited in production.

### 3.5. Penetration Testing

Selected for its ability to validate the overall security posture through independent adversarial assessment. For C/C++ products — particularly embedded firmware, connected devices, and industrial components — penetration testing includes both application-level and binary-level assessment: binary analysis (Ghidra, binwalk) to inspect firmware structure and extract embedded secrets, and protocol-level adversarial testing to validate that runtime defences hold under real-world attack conditions.

1. Rationale

    - CRA Compliance
      > An independent penetration test provides evidence of adversarial security validation required by CRA Annex I Part I and supports the technical documentation package for conformity assessments under CRA Article 13(3).

    - Vulnerability Management
      > Penetration testing identifies systemic weaknesses, firmware-level attack paths, and attack-chain scenarios that automated tools cannot replicate, validating that the cumulative effect of SAST, DAST, SCA, and fuzz testing mitigations is sufficient.

    - Auditability
      > Penetration-test reports documenting findings, remediation actions, and retesting outcomes constitute formal security evaluation evidence for conformity-assessment bodies and market-surveillance authorities.

    - Attack Surface Reduction
      > Independent expert assessment of the full system — including binary interfaces, firmware update mechanisms, and hardware-facing APIs — identifies residual systemic weaknesses that automated pipeline tooling does not cover.

### 3.6. Performance Testing

Selected for its ability to uncover security-relevant failure modes that only emerge under load, such as resource exhaustion, denial-of-service susceptibility, and latency-amplifying vulnerabilities. For C/C++ software, performance testing encompasses two complementary disciplines: load and stress testing for components with network interfaces, and benchmark testing using C/C++ native tooling (Google Benchmark, perf, Valgrind) to measure the execution time, CPU cycles, and memory footprint of individual components to detect performance regressions and resource-exhaustion conditions within the codebase itself.

1. Rationale

    - CRA Compliance
      > Performance testing provides evidence that the product maintains operational availability and resilience under load, supporting CRA Annex I Part I requirements for protection against availability attacks and contributing to conformity-assessment documentation under CRA Article 13.

    - Vulnerability Management
      > Load, stress, and benchmark tests expose resource-exhaustion vulnerabilities, memory leaks, heap fragmentation, and regression-inducing code changes in C/C++ components that SAST, DAST, and fuzz testing do not cover, enabling remediation before they can be exploited as denial-of-service vectors.

    - SSDLC Integration
      > C/C++ native tooling integrates into the CI/CD pipeline: Google Benchmark for microbenchmarking, perf for Linux CPU and cache profiling, Valgrind (Callgrind for CPU profiling, Massif for heap profiling), and Heaptrack for heap memory analysis. Benchmark tests run on every pull request to catch regressions at the point of introduction; load tests run in a dedicated scheduled or pre-release stage.

    - Auditability
      > Benchmark result sets, Valgrind reports, and load test reports recording baseline thresholds, memory profiles, and regression deltas are stored as versioned pipeline artefacts, providing documented evidence of availability and resilience validation.

    - Attack Surface Reduction
      > Identifying and remediating memory-allocation hotspots, resource-exhaustion paths, heap fragmentation, and unthrottled interfaces reduces the attack surface available to denial-of-service and memory-exhaustion attacks.

## 4. Considered

### 4.1. SAST

[SAST (Static Application Security Testing)](https://owasp.org/www-community/Source_Code_Analysis_Tools) for C/C++ analyses source code using tools such as SonarQube (with C/C++ analysis plugins), Semgrep (with C/C++ rulesets), cppcheck, and clang-tidy to identify memory-safety vulnerabilities, undefined behaviour, insecure API usage, CWE-enumerated vulnerability classes, and compliance violations without executing the program.

- Pros

  - CRA Compliance
    > Produces documented evidence of source-code security evaluation that supports CRA conformity-assessment requirements.

  - Vulnerability Management
    > Detects a broad range of C/C++ vulnerability classes (buffer overflows, use-after-free, integer overflows, format-string bugs, unsafe API calls) at commit time, before deployment.

  - SSDLC Integration
    > SonarQube and Semgrep integrate natively into CI/CD pipelines; cppcheck and clang-tidy integrate with CMake and build systems, enabling security checks at the earliest development stage.

- Cons

  - Coverage
    > Cannot detect vulnerabilities that only manifest at runtime, such as race conditions, memory-corruption bugs triggered by specific execution paths, or vulnerabilities introduced by linking against vulnerable shared libraries.

  - False Positives
    > High false-positive rates for certain C/C++ rule sets require ongoing triage effort and careful tuning to avoid alert fatigue.

### 4.2. SCA and SBOM

[SCA (Software Composition Analysis)](https://owasp.org/www-community/Component_Analysis) for C/C++ identifies open-source and third-party components managed via Conan, vcpkg, or vendored source trees, checks them against vulnerability databases, and generates a machine-readable SBOM documenting the software supply chain.

- Pros

  - SBOM Transparency
    > Generates a machine-readable SBOM in CycloneDX or SPDX format that fulfils CRA supply-chain transparency and due-diligence requirements.

  - Vulnerability Management
    > Continuously monitors third-party C/C++ libraries and vendored components for newly disclosed CVEs and licence violations, enabling timely remediation.

  - Auditability
    > SBOM files and scan reports stored per release provide auditable supply-chain evidence for conformity-assessment bodies.

- Cons

  - Coverage
    > Limited to vulnerabilities with public CVE or OSV database entries; zero-day vulnerabilities and supply-chain tampering in vendored source are not reliably detected. Statically linked libraries may not be identified if no package-manager metadata is present.

  - Noise
    > Transitive dependency graphs in C/C++ projects can generate a high volume of findings, requiring prioritisation to manage remediation effort.

### 4.3. DAST

[DAST (Dynamic Application Security Testing)](https://owasp.org/www-community/Vulnerability_Scanning_Tools) tests running C/C++ software by simulating external attacks. For components with network interfaces, DAST tools (OWASP ZAP, Nuclei) probe the running service for runtime-exploitable vulnerabilities. For binary components without HTTP endpoints, compiler-instrumented runtime sanitizers — AddressSanitizer (ASan), UndefinedBehaviorSanitizer (UBSan), MemorySanitizer (MSan), ThreadSanitizer (TSan) — detect memory-safety violations and undefined behaviour during test execution.

- Pros

  - CRA Compliance
    > Provides runtime vulnerability evidence that complements SAST, satisfying the multi-layer testing coverage expected by CRA Annex I.

  - Attack Surface Reduction
    > Runtime sanitizers surface memory-corruption, undefined behaviour, and race conditions under test conditions; DAST scanning identifies runtime-exploitable weaknesses in network-facing C/C++ interfaces.

- Cons

  - Pipeline Complexity
    > Sanitizer-instrumented builds require separate compilation profiles; DAST scanning requires a running service instance, adding test-environment provisioning overhead.

  - Coverage
    > Sanitizers only detect bugs exercised by the test suite; DAST black-box scanning cannot reach all application code paths in deeply embedded or non-HTTP components.

### 4.4. Fuzz Testing

[Fuzz testing (fuzzing)](https://owasp.org/www-community/Fuzzing) for C/C++ uses Google FuzzTest — compiled with sanitizer instrumentation — to generate large volumes of malformed and boundary-condition inputs targeting C/C++ components, uncovering crashes, memory-safety violations, heap/stack corruptions, and assertion failures that indicate potential security vulnerabilities.

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

[Penetration testing](https://owasp.org/www-project-web-security-testing-guide/) for C/C++ products is a structured, adversarial security assessment conducted by independent experts who perform application-level and binary-level testing — including binary analysis with Ghidra or binwalk for firmware and embedded components — to identify exploitable vulnerabilities, attack chains, and systemic security weaknesses.

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

[Performance testing](https://github.com/google/benchmark) for C/C++ evaluates how a system behaves under normal and peak conditions, measuring throughput, latency, CPU cycles, and memory footprint to identify bottlenecks, denial-of-service susceptibility, heap fragmentation, and availability risks. It covers two complementary disciplines: load and stress testing (external, black-box) for C/C++ components with network interfaces, and benchmark testing (internal, white-box) using C/C++ native tooling. Tooling includes: [Google Benchmark](https://github.com/google/benchmark) for microbenchmarking C/C++ functions; [perf](https://perf.wiki.kernel.org/) for Linux CPU and cache profiling; [Valgrind](https://valgrind.org/) with Callgrind (CPU profiling) and Massif (heap profiling) for memory and execution analysis; and [Heaptrack](https://github.com/KDE/heaptrack) for heap memory profiling. For C/C++ services with network interfaces, k6 provides load and stress testing.

- Pros

  - CRA Compliance
    > Demonstrates that the product maintains availability and resilience under load, complementing security-layer testing to satisfy CRA Annex I Part I availability and attack-resistance requirements.

  - Vulnerability Management
    > Detects resource-exhaustion vulnerabilities, memory leaks, heap fragmentation, and performance regressions in C/C++ components that only appear under load or targeted benchmarking, which SAST, DAST, and fuzz testing do not cover.

  - C/C++ Native Coverage
    > C/C++ native tooling (Google Benchmark, perf, Valgrind, Heaptrack) provides accurate, low-overhead profiling that directly measures binary behaviour at the component level, yielding more precise results than generic testing tools on low-level code.

  - Auditability
    > Benchmark result sets and Valgrind/Heaptrack reports with defined baseline thresholds and pass/fail criteria provide documented evidence of availability and memory-safety validation for conformity-assessment bodies.

- Cons

  - Environment Dependency
    > Meaningful load and stress testing requires a production-representative environment with realistic data volumes and network conditions, increasing infrastructure cost and setup complexity.

  - Maintenance Overhead
    > Benchmark baselines and load profiles must be updated as the C/C++ codebase evolves; stale benchmarks produce misleading results and erode confidence in the test suite.

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

    Add SAST tooling for C/C++ to the CI/CD pipeline as a mandatory quality gate on every pull request and main-branch push: configure SonarQube with C/C++ analysis plugins and Semgrep with C/C++ security rulesets for CI scanning; integrate cppcheck and clang-tidy into the CMake build system or as pre-commit checks to surface issues during development. Enforce a policy that blocks merging on high-severity findings. Store scan reports as versioned pipeline artefacts.

2. Integrate SCA and SBOM Generation

    Add Trivy or the OSS Review Toolkit to the CI/CD pipeline to scan Conan and vcpkg lock files and vendored source directories, producing a machine-readable SBOM in CycloneDX or SPDX format on every release build. Configure the tool to flag C/C++ components with known CVEs against the NVD and OSV databases and block releases on critical or high-severity dependency findings. Publish the SBOM alongside each release artefact.

3. Integrate DAST

    For C/C++ components with network interfaces, deploy OWASP ZAP or Nuclei in the integration-test stage to scan a running service instance against the OWASP Top 10 and CWE Top 25 attack patterns. For all C/C++ components, enable compiler-instrumented runtime sanitizers in the test build profile (`-fsanitize=address,undefined` for ASan and UBSan; `-fsanitize=memory` for MSan; `-fsanitize=thread` for TSan) and run the full test suite with each sanitizer to detect memory-safety violations and undefined behaviour. Store sanitizer crash reports and DAST scan results as pipeline artefacts for auditability.

4. Integrate Fuzz Testing

    Introduce fuzz testing with Google FuzzTest for C/C++ components that process untrusted input, such as parsers, protocol handlers, and deserialization routines. Compile fuzz targets with sanitizer and coverage instrumentation (`-fsanitize=address,fuzzer`). Run fuzz campaigns in a dedicated nightly or scheduled pipeline stage, triage identified crashes promptly, and document confirmed findings in the project vulnerability register.

5. Conduct Periodic Penetration Testing

    Schedule at least one independent penetration test annually and after significant architectural changes. For C/C++ firmware and embedded products, require binary-level analysis (Ghidra, binwalk) and protocol-level adversarial testing in addition to application-layer assessment. Document findings, remediation actions, and retesting outcomes as part of the technical documentation required by CRA Article 13(3).

6. Integrate Performance Testing

    Integrate C/C++ native performance and benchmark tooling into the CI/CD pipeline: use Google Benchmark for microbenchmarking individual C/C++ functions and run benchmarks on every pull request to detect regressions at the point of introduction; use perf for CPU and cache profiling on Linux; use Valgrind (Callgrind for CPU profiling, Massif for heap profiling) and Heaptrack for memory footprint analysis in scheduled pipeline stages. For C/C++ components with network interfaces, add k6 for load and stress testing against a production-representative environment. Define baseline thresholds for execution time, memory consumption, and error rate and configure the pipeline to fail on threshold regressions. Store benchmark result sets, Valgrind reports, and load test reports as versioned pipeline artefacts.

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
- SonarQube [C/C++ static analysis](https://www.sonarsource.com/c/) tool.
- Semgrep [static analysis](https://semgrep.dev/) tool.
- cppcheck [C/C++ static analysis](https://cppcheck.sourceforge.io/) tool.
- LLVM [clang-tidy linter](https://clang.llvm.org/extra/clang-tidy/) tool.
- Trivy [vulnerability and SBOM scanner](https://aquasecurity.github.io/trivy/) tool.
- LLVM [AddressSanitizer](https://clang.llvm.org/docs/AddressSanitizer.html) runtime memory-safety checker.
- LLVM [UndefinedBehaviorSanitizer](https://clang.llvm.org/docs/UndefinedBehaviorSanitizer.html) runtime checker.
- LLVM [MemorySanitizer](https://clang.llvm.org/docs/MemorySanitizer.html) runtime checker.
- LLVM [ThreadSanitizer](https://clang.llvm.org/docs/ThreadSanitizer.html) runtime race-condition checker.
- Google [FuzzTest C/C++ fuzzing framework](https://github.com/google/fuzztest) tool.
- NSA [Ghidra binary analysis](https://ghidra-sre.org/) tool.
- Google [Benchmark C++ microbenchmarking](https://github.com/google/benchmark) library.
- Linux [perf CPU profiling](https://perf.wiki.kernel.org/) tool.
- Valgrind [Callgrind CPU profiler and Massif heap profiler](https://valgrind.org/) suite.
- KDE [Heaptrack heap memory profiler](https://github.com/KDE/heaptrack) tool.
- k6 [performance testing](https://k6.io/docs/) tool.
- Sentenz convention [002-ADR: Software Security](002-adr-software-security.md) record.
