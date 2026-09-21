# Cyber Resilience Act Requirements Engineering

Requirements engineering for the Cyber Resilience Act (CRA) translates applicable product cybersecurity and vulnerability-handling obligations into traceable requirements, design constraints, verification evidence, and lifecycle records. This article focuses on manufacturers of products with digital elements, including manufacturers integrating third-party software and hardware.

[Regulation (EU) 2024/2847](https://eur-lex.europa.eu/eli/reg/2024/2847/oj/eng) is the authoritative legal source. The European Commission's [Commission guidance on the application of Regulation (EU) 2024/2847 (Cyber Resilience Act)](https://digital-strategy.ec.europa.eu/en/library/commission-publishes-new-guidance-support-timely-cyber-resilience-act-implementation), C(2026) 5252 final, Annex, 27 July 2026, is the principal interpretive reference, cited below as Commission guidance. The guidance is non-binding; authoritative interpretation rests with the Court of Justice of the European Union (Commission guidance, Section 1.2, paragraph 8).

- [1. Scope and Source Interpretation](#1-scope-and-source-interpretation)
  - [1.1. Legal Requirements and Engineering Practices](#11-legal-requirements-and-engineering-practices)
  - [1.2. Product Boundary and Application Dates](#12-product-boundary-and-application-dates)
  - [1.3. Free and Open-Source Software Roles](#13-free-and-open-source-software-roles)
- [2. Cybersecurity Risk Assessment and Treatment](#2-cybersecurity-risk-assessment-and-treatment)
  - [2.1. Assessment and Traceability](#21-assessment-and-traceability)
  - [2.2. Appropriate Cybersecurity and Residual Risk](#22-appropriate-cybersecurity-and-residual-risk)
  - [2.3. Responsibility and Operating Assumptions](#23-responsibility-and-operating-assumptions)
- [3. Product Cybersecurity Requirements](#3-product-cybersecurity-requirements)
- [4. Integrated Components and Software Supply Chains](#4-integrated-components-and-software-supply-chains)
  - [4.1. Component Due Diligence](#41-component-due-diligence)
  - [4.2. Software Bill of Materials and Vulnerability Analysis](#42-software-bill-of-materials-and-vulnerability-analysis)
  - [4.3. Integrity Evidence and Security Attestation](#43-integrity-evidence-and-security-attestation)
- [5. Vulnerability Handling and Security Review](#5-vulnerability-handling-and-security-review)
  - [5.1. Known Exploitable Vulnerabilities](#51-known-exploitable-vulnerabilities)
  - [5.2. Triage, Remediation, and Coordinated Disclosure](#52-triage-remediation-and-coordinated-disclosure)
  - [5.3. Upstream Reporting and Security Fixes](#53-upstream-reporting-and-security-fixes)
  - [5.4. Effective and Regular Testing](#54-effective-and-regular-testing)
- [6. Security Updates and Support Period](#6-security-updates-and-support-period)
  - [6.1. Support-Period Determination](#61-support-period-determination)
  - [6.2. Update Delivery and Availability](#62-update-delivery-and-availability)
  - [6.3. Software Versions and Substantial Modifications](#63-software-versions-and-substantial-modifications)
- [7. Actively Exploited Vulnerabilities and Severe Incidents](#7-actively-exploited-vulnerabilities-and-severe-incidents)
  - [7.1. Reporting Triggers and Awareness](#71-reporting-triggers-and-awareness)
  - [7.2. Separate Notification Timelines](#72-separate-notification-timelines)
  - [7.3. User Communication and Recovery](#73-user-communication-and-recovery)
- [8. Technical Documentation and User Information](#8-technical-documentation-and-user-information)
  - [8.1. Technical and Conformity Documentation](#81-technical-and-conformity-documentation)
  - [8.2. User Information and Instructions](#82-user-information-and-instructions)
- [9. Lifecycle Evidence and Requirement Examples](#9-lifecycle-evidence-and-requirement-examples)
- [10. References](#10-references)

## 1. Scope and Source Interpretation

Applicability determines the product boundary, responsible actors, and lifecycle obligations from which engineering requirements are derived. A requirements baseline should record these decisions before selecting security controls.

### 1.1. Legal Requirements and Engineering Practices

The article distinguishes four categories:

- CRA Requirement
  > A mandatory obligation under the Regulation, subject to its scope, applicability conditions, and application dates. Article and Annex references identify the legal basis.

- Commission Interpretation
  > The Commission's non-binding explanation of how a CRA provision applies. Guidance references identify the relevant section or paragraphs.

- Engineering Practice
  > A recommended method of implementing or demonstrating an obligation. The CRA does not prescribe the particular workflow, artifact name, framework, or tool unless expressly stated.

- Implementation Example
  > An illustrative technical choice or requirement that needs adaptation to the product and its risks. It is not a universal CRA requirement.

A Market Requirements Document (MRD) can record market and regulatory constraints, but the CRA does not mandate an MRD or a particular secure software development lifecycle. Such engineering artifacts support, rather than replace, the cybersecurity risk assessment and technical documentation required by CRA Articles 13 and 31.

### 1.2. Product Boundary and Application Dates

**CRA requirement.** CRA Article 2(1) covers products with digital elements made available on the market whose intended purpose or reasonably foreseeable use includes a direct or indirect logical or physical data connection to a device or network. Making available includes commercial supply for payment or free of charge; placing on the market is the first such supply in the Union (CRA Article 3(21) and (22)). Assess applicable exclusions and sector-specific rules under CRA Article 2 rather than assuming that all software is covered.

A product includes its remote data processing solutions and components placed on the market separately. Remote data processing falls within the product boundary where the software is designed and developed by the manufacturer or under its responsibility, and its absence would prevent the product from performing one of its functions (CRA Article 3(1) and (2); Commission guidance, Sections 2 and 8). A dependency on an external service does not, by itself, make that service part of the product; associated risks still belong in the product risk assessment (Commission guidance, Section 7.3, paragraphs 167-173).

The CRA generally applies from 11 December 2027. Article 14 reporting applies from 11 September 2026, including to in-scope products placed on the market before 11 December 2027. Products placed before that date are otherwise subject to the Regulation if substantially modified from that date (CRA Articles 69(2) and (3), and 71(2)). The guidance distinguishes an existing design from individual products newly placed on the market: an old design does not exempt newly placed products (Commission guidance, Section 2.7).

**Engineering practice.** Record the product's intended purpose, reasonably foreseeable use, operating conditions, interfaces, integrated components, remote functions, commercial supply model, responsible manufacturer, and relevant dates. Identify important or critical product categories and the applicable conformity assessment route early, using CRA Articles 7, 8, and 32 and Annexes III and IV, with Commission guidance, Section 6.

### 1.3. Free and Open-Source Software Roles

Free and open-source software (FOSS) has openly shared source code and a license granting rights to access, use, modify, and redistribute it freely (CRA Article 3(48)). Open source does not mean that every participant has the same CRA obligations.

| Actor or activity | CRA basis and Commission interpretation | Requirements-engineering consequence |
| --- | --- | --- |
| Manufacturer integrating FOSS | CRA Article 13(5) covers integrated components, including FOSS supplied outside commercial activity. Commission guidance, Section 3.4, paragraphs 86-88, distinguishes conformity of the integrated product from the component's individual status. | Assess the component and its integration; retain responsibility for conformity of the resulting product. |
| Person supplying FOSS commercially under its name or trademark | Manufacturer and market definitions in CRA Article 3(13), (21), and (22), interpreted in Commission guidance, Sections 3.1 and 3.2. A zero price alone does not determine commercial status. | Assess responsibility for publication and supply, monetization, and the actual circumstances before assigning manufacturer obligations. |
| Developer or contributor to FOSS outside its responsibility | CRA Recital (18); Commission guidance, Sections 3.1 and 3.4. Contributing code or having commit access does not alone establish responsibility for publication and release decisions. | Do not assign manufacturer duties merely because code is contributed or later used commercially downstream. |
| Publisher of FOSS outside commercial activity | CRA Recital (18); Commission guidance, Sections 3.2-3.4. Development funding alone does not determine commercial supply. | Assess separately whether the publisher meets the definition of an open-source software steward. |
| Open-source software steward | CRA Article 3(14) defines a legal person, other than a manufacturer, systematically supporting specific FOSS intended for commercial activities and ensuring its viability. CRA Article 24 sets a distinct regime. | Record the role for each FOSS project; an entity can be a manufacturer for one product and a steward for another. |

**CRA requirement.** Stewards document a verifiable cybersecurity policy and cooperate with market surveillance authorities under CRA Article 24(1) and (2). Article 24(3) applies Article 14(1) reporting to the extent that a steward is involved in development, and Article 14(3) and (8) to the extent that relevant severe incidents affect the network and information systems it provides for development. Commission guidance, Section 3.3.1, paragraphs 79-82, explains how non-technical support, infrastructure provision, and engineering involvement affect those duties. These conditions should not be generalized to every FOSS developer or foundation.

## 2. Cybersecurity Risk Assessment and Treatment

The CRA assessment concerns risks associated with the product, rather than only project delivery risk or organizational exposure. It establishes the basis for selecting and justifying cybersecurity requirements.

### 2.1. Assessment and Traceability

**CRA requirement.** Manufacturers assess product cybersecurity risks and use the results during planning, design, development, production, delivery, and maintenance (CRA Article 13(2)). The documented assessment is updated as appropriate during the support period and addresses intended purpose, reasonably foreseeable use, conditions of use, the operating environment, protected assets, and expected use time (CRA Article 13(3)).

The assessment explains which CRA Annex I, Part I, point (2) requirements apply and how they are implemented, how point (1) is met, and how Part II vulnerability-handling requirements are applied. It forms part of the technical documentation; non-applicability of an essential requirement needs a clear justification (CRA Article 13(3) and (4)).

**Engineering practice.** Maintain traceability from each identified risk to its relevant CRA provision, derived requirement, design decision, verification result, and lifecycle owner. Threat modeling, attack-surface analysis, likelihood and impact estimates, and structured risk registers can support this assessment. No particular scoring method or threat-modeling framework is prescribed by these provisions. The repository's [Threat Modeling](../articles/threat-modeling.md) article supplies general methods; its organizational risk-acceptance concepts remain subject to the CRA constraints below.

### 2.2. Appropriate Cybersecurity and Residual Risk

**CRA requirement.** CRA Annex I, Part I, point (1) requires design, development, and production to ensure an appropriate level of cybersecurity based on the risks. Performing a risk assessment is a distinct obligation; the assessment alone does not establish that the product meets this requirement.

**Commission interpretation.** Section 7.2, paragraphs 164-166, explains that point (1) also addresses risks not adequately covered by implementing the other Part I requirements. Where such risks remain, appropriate product measures are needed. Conformity is therefore not simply a checklist of the other requirements.

Residual risk is evaluated against the essential requirements, intended purpose, reasonably foreseeable use, operating conditions, protected assets, and expected use time. Internal risk appetite, commercial strategy, or cost alone cannot justify insufficiently addressed risks. Residual risk is possible, but an internal decision to accept it is not a substitute for sufficiently addressing it through the essential requirements (Commission guidance, Section 7.1, paragraphs 156-163; CRA Article 13(2) and (3)).

**Engineering practice.** Record the risk before and after treatment, implemented safeguards, supporting evidence, operating assumptions, and the rationale for concluding that the essential requirements are met. If evidence is insufficient, revise the design, functionality, or intended purpose and reassess reasonably foreseeable use. A named risk owner or approval record supports accountability but does not waive a CRA obligation.

### 2.3. Responsibility and Operating Assumptions

**Commission interpretation.** Responsibility cannot be transferred to users or third parties to compensate for deficient product design or untreated risks (Section 7.1, paragraph 161). Supplier contracts, outsourcing, or insurance do not discharge the manufacturer's product-security obligations.

User instructions can support secure deployment and communicate residual risks, including justified restrictions to trusted environments. Such restrictions need to be consistent with the risk assessment, intended users, and reasonably foreseeable use; they are not a general exemption from the CRA (Commission guidance, Section 7.1, paragraphs 160-163).

External infrastructure risks also need assessment and, where relevant, product-level mitigation. The CRA does not thereby require the manufacturer to control or govern that external environment (Commission guidance, Section 7.3, paragraphs 168-173).

**Implementation example.** A product relying on a remote service can define requirements for rejecting unauthorized commands and maintaining a secure state during service failure. Verify those behaviors under the relevant failure and attack conditions; document deployment assumptions and integration instructions. These are illustrative treatments, not prescribed architectures.

## 3. Product Cybersecurity Requirements

**CRA requirement.** CRA Annex I, Part I, point (2) applies on the basis of the cybersecurity risk assessment and where applicable. The following mapping summarizes its outcomes; the engineering column gives examples rather than additional legal mandates. Applicability decisions remain documented under CRA Article 13(3) and (4).

| CRA provision | Required outcome, subject to applicability | Illustrative requirement or verification evidence |
| --- | --- | --- |
| Annex I, Part I, point (2)(a) | Make the product available without known exploitable vulnerabilities. | Product-specific applicability and exploitability analysis; release decision evidence. See Section 5.1. |
| Annex I, Part I, point (2)(b) | Secure default configuration, including reset to the original state; the stated exception concerns an agreement with a business user for a tailor-made product. | Review initial configuration and reset behavior; verify exposure of interfaces and credentials. |
| Annex I, Part I, point (2)(c) | Address vulnerabilities through security updates; where applicable, automatic updates enabled by default within an appropriate timeframe, easy opt-out, update notification, and temporary postponement. | Update, notification, opt-out, and postponement tests. |
| Annex I, Part I, point (2)(d) | Protect against unauthorized access through appropriate controls and report possible unauthorized access. | Authorization tests and evidence that relevant access attempts are reported. |
| Annex I, Part I, point (2)(e) | Protect confidentiality of stored, transmitted, or otherwise processed data, for example through state-of-the-art encryption of relevant data at rest or in transit or other technical means. | Identify sensitive flows and storage; verify the chosen confidentiality controls and key management. |
| Annex I, Part I, point (2)(f) | Protect data, commands, programs, and configuration against manipulation or modification not authorized by the user; report corruption. | Tampering tests and corruption-reporting evidence. |
| Annex I, Part I, point (2)(g) | Limit processing to data adequate, relevant, and necessary for the intended purpose. | Data inventory and tests of collection, processing, and retention behavior. |
| Annex I, Part I, point (2)(h) | Protect availability of essential and basic functions, including after an incident, with resilience and denial-of-service mitigation. | Resource-exhaustion and recovery tests against product-specific criteria. |
| Annex I, Part I, point (2)(i) | Minimize negative effects on the availability of other devices' or networks' services. | Verify behavior under overload, failure, and compromised-input conditions. |
| Annex I, Part I, point (2)(j) | Limit attack surfaces, including external interfaces. | Interface inventory and justification for exposed functionality. |
| Annex I, Part I, point (2)(k) | Reduce incident impact through appropriate exploitation-mitigation mechanisms and techniques. | Verify isolation and mitigation measures selected for identified attack paths. |
| Annex I, Part I, point (2)(l) | Record and monitor relevant internal activity to provide security information, with user opt-out. | Tests of relevant event recording, monitoring, and opt-out behavior. |
| Annex I, Part I, point (2)(m) | Enable secure, easy, permanent removal of all data and settings; secure transfer where transfer to other products or systems is possible. | Deletion and reset evidence; transfer-security tests where applicable. This does not establish a universal data-export feature requirement. |

**Engineering practice.** Specify measurable product behavior and acceptance criteria derived from the risk assessment. Least privilege, defense in depth, secure coding, protected build environments, and integrity checks can support these outcomes. The CRA provisions above do not prescribe a particular encryption algorithm, protocol version, authentication product, testing tool, or build platform.

## 4. Integrated Components and Software Supply Chains

Component assurance establishes whether externally supplied software or hardware can safely perform its role in the product. It complements the product-level analysis of component interactions and external dependencies.

### 4.1. Component Due Diligence

**CRA requirement.** CRA Article 13(5) requires due diligence when integrating third-party components so that they do not compromise product cybersecurity, including FOSS components supplied outside commercial activity.

**Commission interpretation.** Product cybersecurity risk assessment under Article 13(2) and component due diligence under Article 13(5) are distinct, complementary obligations. Identify the security properties needed from each component and verify them in a risk-based manner. Evidence may include technical specifications, security documentation, relevant assurance or conformity documentation, and appropriate testing (Section 7.3, paragraphs 167-173; CRA Recital (34)).

**Engineering practice.** A component due-diligence record can include:

- Component identity, version, origin, integration context, and required security properties.
- Evidence reviewed, its scope and limitations, and relevant vulnerability history.
- Verification of the properties relied upon, including integration behavior and configuration.
- Upstream maintenance and support arrangements, update capability, and a plan for unsupported dependencies.
- Identified gaps, mitigation decisions, and links to product requirements and test results.

A supplier's conformity evidence or security claim can support the assessment but does not demonstrate conformity of the integrated product by itself. Supplier agreements and audit activities are possible engineering measures, selected according to risk; Article 13(5) does not mandate a named supplier framework or identical audits for every dependency.

### 4.2. Software Bill of Materials and Vulnerability Analysis

**CRA requirement.** CRA Annex I, Part II, point (1) requires identification and documentation of vulnerabilities and components, including a Software Bill of Materials (SBOM) in a commonly used, machine-readable format covering at least top-level dependencies. The CRA does not impose general public publication of the SBOM (CRA Recital (77)). CRA Annex VII, point (8), addresses provision following a reasoned market-surveillance request where necessary to check compliance; CRA Article 13(25) also permits requests for specified product categories in a Union-wide dependency assessment. Disclosure is therefore not limited to a single request scenario.

**Engineering practice.** Link each SBOM to the corresponding released artifact and maintain component/version records through changes. Capture transitive dependencies where needed to understand product risk. Software Composition Analysis (SCA) can support inventory generation and vulnerability matching; a database match alone does not establish that a vulnerability is exploitable in the product.

**Implementation examples.** [CycloneDX](https://cyclonedx.org/specification/overview/) and [SPDX](https://spdx.dev/use/specifications/) are candidate SBOM formats. Neither is mandated by the cited Annex I requirement. Select a format and level of detail appropriate to the product and any applicable implementing measures under CRA Article 13(24).

### 4.3. Integrity Evidence and Security Attestation

**CRA requirement.** Product integrity protection is addressed by CRA Annex I, Part I, point (2)(f); secure update distribution by Part II, point (7). These outcomes are distinct from the component due-diligence obligation and from voluntary attestation programs.

**Engineering practice.** Integrity and provenance evidence can support component selection, build protection, release verification, and update validation. Bind evidence to the exact artifact; verify the issuer and trust basis; protect signing keys and verification policies; retain results and investigate failures. Authentic provenance alone does not establish absence of vulnerabilities or suitability for the intended integration.

**Implementation examples.** Digital signatures, authenticated distribution channels, reproducible builds, [Supply-chain Levels for Software Artifacts (SLSA)](https://slsa.dev/spec/), [Sigstore](https://docs.sigstore.dev/), and [in-toto](https://in-toto.io/) may support integrity or provenance checks. These mechanisms and frameworks are not CRA mandates, and a signed build statement is not automatically an Article 25 security attestation.

**CRA provision.** CRA Article 25 empowers the Commission to establish voluntary FOSS security-attestation programs to support Article 13(5) due diligence. CRA Recital (21) describes possible initiators and funders. Such attestation is supporting evidence within its assessed scope; voluntary participation does not replace the manufacturer's due diligence, product risk assessment, vulnerability handling, or conformity obligations.

## 5. Vulnerability Handling and Security Review

**CRA requirement.** Manufacturers handle product and component vulnerabilities effectively at market placement and throughout the support period, using appropriate procedures for reports from internal and external sources (CRA Article 13(8); Annex I, Part II). Relevant cybersecurity information, including vulnerabilities and third-party information, is documented proportionately under CRA Article 13(7).

### 5.1. Known Exploitable Vulnerabilities

**CRA requirement.** CRA Annex I, Part I, point (2)(a) requires products to be made available without known exploitable vulnerabilities, on the basis of the risk assessment and where applicable. An exploitable vulnerability can effectively be used by an adversary under practical operational conditions (CRA Article 3(41)). This differs from an actively exploited vulnerability, for which reliable evidence of unauthorized exploitation by a malicious actor exists (CRA Article 3(42)).

**Commission interpretation.** Knowledge can arise from public vulnerability databases, private disclosures, internal testing, or prominent reliable reporting. Discovery or publication alone does not establish veracity, practical exploitability, or applicability to the particular product. Prompt investigation may require a limited confirmation period (Section 9.2.2, paragraphs 230-235).

For vulnerabilities discovered close to release, the Commission describes a risk-based decision about whether secure market placement in conformity with the CRA is possible or a fix is needed first. Relevant considerations include severity, exploitability, potential impact, in-use risks, and risks of delaying a release that fixes other exploitable vulnerabilities or supports critical systems. This is not a blanket permission to accept known exploitable vulnerabilities for commercial convenience. Vulnerability-handling duties continue after placement (Commission guidance, Section 9.2.2, paragraphs 236-237; Section 7.1).

**Engineering practice.** Preserve the report, affected versions, reachability and configuration analysis, exploitability evidence, investigation dates, mitigations, and release rationale. A clean scanner result or an unreviewed vulnerability-score threshold is insufficient evidence by itself.

### 5.2. Triage, Remediation, and Coordinated Disclosure

**CRA requirement.** Vulnerabilities are addressed and remediated without delay in relation to the risks posed, including through security updates (CRA Annex I, Part II, point (2)). Manufacturers put in place and enforce a Coordinated Vulnerability Disclosure (CVD) policy and facilitate sharing of potential vulnerability information, including through a reporting contact address (points (5) and (6)). CRA Article 13(17) requires an identifiable single point of contact that does not restrict communication to automated tools.

Once a security update is available, information about fixed vulnerabilities is shared and publicly disclosed, covering the vulnerability, affected product identification, impact, severity, and accessible remediation information. In duly justified cases, publication can be delayed until users have had an opportunity to apply the patch where publication risks outweigh its security benefits (CRA Annex I, Part II, point (4)). This is separate from Article 14 notification deadlines.

**Engineering practice.** Define intake, prompt assessment, assignment, remediation, verification, disclosure coordination, and escalation responsibilities. Internal response targets should support the statutory duties; Article 14's 24-hour and 72-hour deadlines are not general deadlines for acknowledging every researcher report.

**Implementation examples.** The [Common Vulnerability Scoring System (CVSS)](https://www.first.org/cvss/) and [Exploit Prediction Scoring System (EPSS)](https://www.first.org/epss/) can inform triage alongside product exposure and impact. Neither is mandated by the CRA or substitutes for assessing exploitability, remediation duties, or reporting triggers. A dedicated email address or reporting portal can support vulnerability intake; a bug-bounty program is an optional practice.

### 5.3. Upstream Reporting and Security Fixes

**CRA requirement.** On identifying a vulnerability in an integrated component, the manufacturer reports it to the person or entity manufacturing or maintaining that component and addresses it under Annex I, Part II. If a software or hardware modification is developed to address the component vulnerability, the relevant code or documentation is shared upstream, where appropriate in machine-readable form (CRA Article 13(6)).

**Commission interpretation.** Section 9.2.1, paragraphs 222-229, explains the boundaries:

- Upstream reporting concerns the integrated version and vulnerabilities in the component itself. An integration-only flaw is distinguished from a component flaw; sharing relevant integration findings is encouraged.
- Duplicate reporting is unnecessary where the manufacturer confirms that the upstream party already knows of the vulnerability. Established security-reporting channels and coordinated disclosure practices should be respected.
- Reporting upstream is not required where no maintainer remains or the manufacturer no longer relies on the original maintainer for versions or fixes. Alternative communication to component users is encouraged; this does not remove responsibility for the manufacturer's own product.
- Security fixes should be verifiable and, where appropriate, machine-readable, with FOSS license compatibility and maintainer guidelines considered. The CRA does not require upstream acceptance or merging of a contributed fix.
- A change to another part of the system, used as an alternative mitigation, is distinguished from a fix to the affected component itself.

**Engineering practice.** Retain upstream reports, evidence of prior upstream knowledge where relied upon, shared fixes, coordination records, and the product's own remediation and verification results. Monitoring vulnerability databases is useful, but there is no general CRA obligation to report every discovered vulnerability to the European Vulnerability Database. CRA Article 15 provides voluntary notification routes; mandatory Article 14 reporting and Article 13(6) upstream reporting have their own conditions.

### 5.4. Effective and Regular Testing

**CRA requirement.** CRA Annex I, Part II, point (3) requires effective and regular tests and reviews of product security.

**Commission interpretation.** Section 9.2.3, paragraphs 238-240, explains that regular testing does not mean mechanically repeating an unchanged campaign at fixed intervals. Review frequency, depth, and content reflect product risk, product evolution, and the threat landscape. Review new threats, vulnerabilities, product changes, and other relevant input; update and execute tests accordingly. Existing tests may need repetition after changes. Where no relevant new input is identified, additional tests need not be devised; other vulnerability-handling duties continue.

**Engineering practice.** Record review inputs, scope decisions, test selection, results, defects, and verification of corrective measures. Link results to affected product versions, risks, and requirements. Penetration testing, fuzzing, Static Application Security Testing (SAST), Dynamic Application Security Testing (DAST), code review, and regression testing are possible techniques, not universally prescribed campaigns. See the [Software Testing](../articles/software-testing.md) article for technique descriptions.

## 6. Security Updates and Support Period

Support planning connects expected product use with vulnerability-handling capacity, component maintenance, secure delivery, and user information. Distinguish the support period from update availability, documentation retention, and reporting obligations.

### 6.1. Support-Period Determination

**CRA requirement.** CRA Article 13(8) requires a support period reflecting expected use time, taking account particularly of reasonable user expectations, the product's nature and intended purpose, and relevant Union law determining its lifetime. It is at least five years unless expected use is shorter, in which case it corresponds to that shorter expected use time.

**Commission interpretation.** Five years is a safeguard, not a default for every product. Products reasonably expected to be used longer should have correspondingly longer support (Section 5, paragraphs 125-126; CRA Recital (60)).

Article 13(8) also permits consideration of support periods for comparable products, availability of the operating environment, support of third-party components providing core functions, and relevant guidance from the administrative cooperation group (ADCO) and the Commission. The factors are considered proportionately. Record the information used in the technical documentation (CRA Article 13(8); Annex VII, point (4); Commission guidance, Section 5, paragraph 125 and footnote 17).

The support end date, including at least month and year, is clearly specified at purchase. Where technically feasible for the product, users receive a notification when support ends (CRA Article 13(19); Commission guidance, Section 5, paragraph 127).

**Engineering practice.** Maintain a support rationale connecting expected deployment life, user expectations, component maintenance, and operating-environment availability to a funded vulnerability-handling plan. Identify replacement, maintenance, or migration measures where dependencies end support earlier; a supplier's shorter commitment does not by itself determine the product's lawful support period.

### 6.2. Update Delivery and Availability

**CRA requirement.** Security updates are separated from functionality updates where technically feasible; distribution mechanisms ensure secure, timely fixing or mitigation and, where applicable, automatic delivery. Available security updates are disseminated without delay and free of charge, except where otherwise agreed with a business user for a tailor-made product, and accompanied by relevant advisory information (CRA Annex I, Part II, points (2), (7), and (8)). Applicable product update controls are set out in Part I, point (2)(c).

Each security update made available during support remains available for at least ten years after issuance or for the remainder of the support period, whichever is longer (CRA Article 13(9)). This availability obligation does not mean that the support period is universally ten years.

**Engineering practice.** Verify update authenticity and integrity, compatibility, installation behavior, and safe recovery from interrupted or failed updates. Retain release identifiers, verification results, distribution records, advisories, and evidence of continued availability. Cryptographic signatures and authenticated transport are possible implementation choices; the cited provisions do not mandate a named protocol or tool.

### 6.3. Software Versions and Substantial Modifications

**CRA provision.** Where subsequent substantially modified software versions are placed on the market, CRA Article 13(10) permits remediation under Annex I, Part II, point (2), to focus on the latest version only if earlier-version users have access to it free of charge without additional costs to adjust their hardware or software environment.

**Commission interpretation.** Section 5, paragraphs 129-131, distinguishes reasonable operational effort, such as routine testing or configuration adjustments, from additional costs such as compulsory hardware purchases or fundamental infrastructure changes. This flexibility concerns remediation under point (2); it does not remove other applicable vulnerability-handling or Article 14 reporting obligations.

A substantial modification is a post-placement change that affects conformity with Part I essential requirements or modifies the assessed intended purpose (CRA Article 3(30)). The guidance calls for case-by-case assessment of changed risks and their coverage in the existing risk assessment. An update is not automatically substantial merely because it changes software or adds a feature (Commission guidance, Section 4.3).

Where a substantially modified product is made available on the market, the guidance treats it as a new placing on the market with corresponding conformity obligations. CRA Articles 21 and 22 address modifications by other actors; Article 22(2) distinguishes the affected part from the whole product where its overall cybersecurity is affected (Commission guidance, Section 4.4).

The support period is reassessed against Article 13(8), rather than automatically reset or extended. Where a modification leaves the factors determining expected use unchanged, the remaining original support period can remain appropriate; changed expected use calls for recalculation (Commission guidance, Section 5.1, paragraphs 132-135).

**Engineering practice.** Include change-impact analysis, updated risks and requirements, regression evidence, version eligibility for updates, support rationale, and the conformity-assessment decision in each relevant release record.

## 7. Actively Exploited Vulnerabilities and Severe Incidents

Article 14 notification is separate from routine vulnerability intake, upstream reporting, public disclosure of fixed vulnerabilities, and internal incident-management priorities.

### 7.1. Reporting Triggers and Awareness

**CRA requirement.** A manufacturer notifies any actively exploited vulnerability contained in its product that it becomes aware of, and any severe incident affecting product security that it becomes aware of. Notifications go simultaneously to the designated coordinating Computer Security Incident Response Team (CSIRT) and the European Union Agency for Cybersecurity (ENISA), via the single reporting platform. Select the CSIRT endpoint under CRA Article 14(7), rather than choosing either CSIRT or ENISA (CRA Article 14(1) and (3); Article 16).

Vulnerability reporting has no additional internal severity threshold such as "significant" or a particular CVSS score. For severe incidents, CRA Article 14(5)(a) addresses actual or potential negative effects on the product's ability to protect the availability, authenticity, integrity, or confidentiality of sensitive or important data or functions. Article 14(5)(b) separately covers actual or potential introduction or execution of malicious code in the product or a user's network and information systems. Either condition suffices.

**Commission interpretation.** Awareness arises when an immediate initial assessment provides a reasonable degree of certainty that the statutory condition is met. Assessment should be prompt, and progressive reporting permits incomplete early information to be supplemented; completion of a full investigation is not a prerequisite (Section 9.1, paragraphs 211-215).

For third-party components, paragraph 218 distinguishes a vulnerability actively exploited in the manufacturer's product from a component vulnerability that cannot be exploited there or has not been exploited there. The latter does not trigger mandatory reporting for that manufacturer merely because exploitation exists elsewhere; applicable vulnerability handling and upstream reporting continue. Record the product-specific evidence underlying this conclusion.

The guidance explains that Article 14 reporting continues after support ends and applies to in-scope products placed before 11 December 2027 (Section 9.1, paragraph 210; CRA Articles 69(3) and 71(2)). Paragraph 217 distinguishes pre-11 September 2026 awareness of active exploitation from later awareness; mere prior knowledge of a vulnerability does not exempt later awareness of its active exploitation.

### 7.2. Separate Notification Timelines

**CRA requirement.** The two reporting schedules have different final-report triggers. The 24-hour and 72-hour periods both start at awareness, not at the preceding notification (CRA Article 14(2) and (4); Commission guidance, Section 9.1, paragraph 215).

| Report | Actively exploited vulnerability | Severe incident affecting product security |
| --- | --- | --- |
| Early warning | Without undue delay and within 24 hours of awareness; CRA Article 14(2)(a). | Without undue delay and within 24 hours of awareness; CRA Article 14(4)(a). |
| Subsequent notification | Without undue delay and within 72 hours of awareness; CRA Article 14(2)(b). | Without undue delay and within 72 hours of awareness; CRA Article 14(4)(b). |
| Complete or final report | Within 14 days after a corrective or mitigating measure becomes available; CRA Article 14(2)(c). | Within one month after submission of the 72-hour incident notification; CRA Article 14(4)(c). |

Article 14(2)(b) and (c) and (4)(b) and (c) qualify subsequent submissions where the relevant information has already been provided. The vulnerability final report covers severity, impact, available malicious-actor information, and corrective measures. The severe-incident final report covers severity, impact, likely threat or root cause, and applied and ongoing mitigation. An intermediate status report may be requested under CRA Article 14(6).

**Engineering practice.** Preserve detection and awareness timestamps, initial-assessment reasoning, affected product/version evidence, reporting-clock triggers, notification receipts, and the availability date of corrective or mitigating measures. Define escalation and backup responsibilities so that internal approvals do not delay statutory reporting.

### 7.3. User Communication and Recovery

**CRA requirement.** After awareness, inform impacted users and, where appropriate, all users, including necessary mitigation and corrective measures (CRA Article 14(8)).

**Commission interpretation.** User communication is proportionate and risk-based; it does not entail indiscriminate public disclosure of sensitive technical details. Information may be targeted to relevant users, particularly in sensitive environments. This coexists with public disclosure of fixed vulnerabilities under Annex I, Part II, point (4) (Section 9.1, paragraphs 219-221).

**Engineering practice.** Prepare audience-specific advisories, recovery instructions, incident records, and post-incident reviews. Feed lessons into the risk assessment, requirements, and testing. Monitoring and incident-response tools are implementation choices rather than universal CRA product requirements.

## 8. Technical Documentation and User Information

Documentation connects the product's cybersecurity argument with reproducible evidence and information needed for secure use. An organized evidence set supports conformity assessment and subsequent maintenance.

### 8.1. Technical and Conformity Documentation

**CRA requirement.** Technical documentation is prepared before market placement and updated as appropriate at least throughout support (CRA Articles 13(12) and 31(1) and (2)). CRA Annex VII specifies its contents, as applicable:

| CRA Annex VII provision | Documentation content |
| --- | --- |
| Point (1) | Product description, intended purpose, software versions affecting conformity, hardware illustrations where relevant, and Annex II user information. |
| Point (2) | Design, development, architecture, production and monitoring processes; vulnerability-handling specifications, including SBOM, CVD policy, reporting contact evidence, and secure update distribution. |
| Point (3) | Cybersecurity risk assessment and applicability of Part I essential requirements. |
| Point (4) | Information used to determine the support period. |
| Point (5) | Applied harmonized standards, common specifications or relevant certification schemes; applied parts; alternative solutions and technical specifications where these are not applied. |
| Point (6) | Test reports verifying the product and vulnerability-handling processes against applicable essential requirements. |
| Point (7) | Copy of the EU declaration of conformity. |
| Point (8) | SBOM following a reasoned market-surveillance request where necessary to check compliance. See also Section 4.2. |

Conformity assessment, the EU declaration of conformity, and CE marking are governed by CRA Article 13(12) and Articles 28, 30, and 32. A security-tool result or industry certification alone does not replace the applicable procedure.

Harmonized standards whose references are published in the Official Journal can confer a presumption of conformity only for the essential requirements they cover (CRA Article 27(1); Commission guidance, Section 6.3). Standards and frameworks are implementation guidance, not an independent source of CRA duties. The route and evidence still depend on the product category and applicable Article 32 procedure; this article makes no claim that a named industry standard has been harmonized under the CRA.

Technical documentation and the EU declaration of conformity are retained for at least ten years after placement on the market or for the support period, whichever is longer (CRA Article 13(13)).

**Engineering practice.** Index requirements, component due diligence, threat/risk analyses, test and review results, vulnerability records, upstream coordination, security updates, and support decisions by product version. Keep conclusions traceable to the evidence and its limitations. The CRA does not prescribe this particular indexing scheme.

### 8.2. User Information and Instructions

**CRA requirement.** CRA Article 13(18) requires clear, understandable, intelligible, and legible information and instructions in paper or electronic form, in a language easily understood by users and market surveillance authorities. The information enables secure installation, operation, and use.

CRA Annex II requires manufacturer and product identification; a single reporting contact and the location of the CVD policy; intended purpose, essential functions and security properties; known or foreseeable circumstances creating significant cybersecurity risks; the declaration-of-conformity address where applicable; and the support offered and its end date (points (1)-(7)).

Instructions cover secure commissioning and lifetime use, effects of changes on data security, installation of security updates, secure decommissioning and data removal, disabling applicable automatic updates, and integration information where the product is intended for integration into another product (CRA Annex II, point (8)(a)-(f)). If the manufacturer makes an SBOM available to users, its location is included (point (9)); publication itself is not generally required.

User information and instructions remain available for at least ten years after market placement or for the support period, whichever is longer; online instructions have corresponding accessibility and availability obligations (CRA Article 13(18)). Product identification, manufacturer contacts, the single contact point, support-end information, and the accompanying full or simplified declaration are further addressed by CRA Article 13(15)-(20).

**Engineering practice.** Validate instructions against the shipped configuration, tested operating assumptions, update workflow, and decommissioning behavior. Do not use warnings to compensate for inadequate design. Broader privacy notices and license-compliance records may be necessary under other rules but should not be attributed to CRA Annex II without a supporting provision.

## 9. Lifecycle Evidence and Requirement Examples

A traceable engineering workflow connects legal obligations and their interpretation to product-specific decisions. The following is a recommended organization of evidence, not a prescribed CRA document taxonomy.

| Engineering activity | Requirement or decision | Evidence and lifecycle connection |
| --- | --- | --- |
| Scope and planning | Product boundary, actor roles, applicability, conformity route, and support commitment. | Scope rationale, product/version identification, support-period determination, assigned responsibilities. |
| Risk analysis and requirements | Applicable essential requirements, external risks, component needs, and residual-risk conclusions. | Cybersecurity risk assessment, threat analysis, traceable requirements, applicability justifications. |
| Architecture and implementation | Product safeguards, secure defaults, dependency controls, and secure build/release measures. | Design rationale, implementation review, due-diligence records, SBOM, integrity evidence. |
| Verification and release | Demonstrate applicable outcomes and assess known vulnerabilities before market placement. | Test reports, review decisions, vulnerability dispositions, technical documentation, conformity records. |
| Support and incident response | Handle vulnerabilities, review changing risks, distribute updates, coordinate upstream, and report qualifying events. | Updated assessments, CVD and handling records, test updates, security advisories, notification receipts. |
| Modification and end of support | Assess substantial changes, version transitions, support rationale, secure decommissioning, and continuing duties. | Change-impact analysis, revised conformity evidence, support notices, retained updates and documentation, reporting capability. |

**Implementation example.** A connected industrial controller identifies unauthorized configuration changes as a product risk:

1. Obligation and Interpretation

    CRA Annex I, Part I, point (2)(f) addresses integrity and corruption reporting; Commission guidance, Section 7.3, explains treatment of external-service risks and verification of integrated components.

2. Derived Requirement

    The controller rejects configuration changes that fail the selected authorization and integrity checks and reports detected corruption through its defined security-event interface. The requirement identifies the protected configuration, interfaces, failure behavior, and verifiable acceptance criteria.

3. Design and Implementation

    An authenticated management channel and artifact-integrity verification are possible controls. If supplied by a third-party component, record the needed properties and risk-based due diligence. No named algorithm or protocol is mandated by this example.

4. Verification Evidence

    Test unauthorized, altered, and replayed inputs under relevant operating conditions. Record expected and observed behavior, product/component versions, test limitations, and remaining risks.

5. Lifecycle Evidence

    Link new vulnerabilities, upstream reports and fixes, regression results, update releases, support commitments, and any Article 14 notifications to the requirement. Reassess the control when product changes or new threat information affect the original assumptions.

## 10. References

- European Union [Regulation (EU) 2024/2847 (Cyber Resilience Act)](https://eur-lex.europa.eu/eli/reg/2024/2847/oj/eng) regulation. Authoritative legal source; precise provisions are cited inline.
- European Commission [Commission guidance on the application of Regulation (EU) 2024/2847 (Cyber Resilience Act)](https://digital-strategy.ec.europa.eu/en/library/commission-publishes-new-guidance-support-timely-cyber-resilience-act-implementation) guidance, C(2026) 5252 final, Annex, 27 July 2026. Principal non-binding interpretive reference, particularly Sections 2-5, 6.3, 7, 8, 9.1, and 9.2.
- Sentenz [Threat Modeling](../articles/threat-modeling.md) article. General engineering methods, subject to the CRA-specific treatment of residual risk explained here.
- Sentenz [Software Testing](../articles/software-testing.md) article. Engineering techniques rather than CRA-mandated tools or campaigns.
- OWASP [CycloneDX](https://cyclonedx.org/specification/overview/) specification. Illustrative SBOM format.
- Linux Foundation [SPDX](https://spdx.dev/use/specifications/) specification. Illustrative SBOM format.
- OpenSSF [SLSA](https://slsa.dev/spec/) specification. Supporting software supply-chain practices.
- Sigstore [Documentation](https://docs.sigstore.dev/) documentation. Illustrative signing and verification mechanisms.
- in-toto [in-toto](https://in-toto.io/) project page. Illustrative supply-chain integrity mechanisms.
- FIRST [Common Vulnerability Scoring System](https://www.first.org/cvss/) specification and [Exploit Prediction Scoring System](https://www.first.org/epss/) documentation. Optional triage inputs.
