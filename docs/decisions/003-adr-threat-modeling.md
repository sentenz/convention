# 003-ADR: Threat Modeling

Architectural Decision Records (ADR) on implementing Threat Modeling for Software Systems.

- [1. State](#1-state)
- [2. Context](#2-context)
- [3. Decision](#3-decision)
  - [3.1. STRIDE](#31-stride)
  - [3.2. MITRE ATT\&CK](#32-mitre-attck)
  - [3.3. CVSS](#33-cvss)
  - [3.4. LINDDUN](#34-linddun)
- [4. Considered](#4-considered)
  - [4.1. STRIDE](#41-stride)
  - [4.2. DREAD](#42-dread)
  - [4.3. PASTA](#43-pasta)
  - [4.4. LINDDUN](#44-linddun)
  - [4.5. Attack Tree](#45-attack-tree)
  - [4.6. MITRE ATT\&CK](#46-mitre-attck)
  - [4.7. CVSS](#47-cvss)
  - [4.8. TRIKE](#48-trike)
  - [4.9. VAST](#49-vast)
  - [4.10. OCTAVE](#410-octave)
- [5. Consequences](#5-consequences)
- [6. Implementation](#6-implementation)
- [7. References](#7-references)

## 1. State

- Author(s): Sentenz
- Date: 2024-07-01
- Status: Proposed

## 2. Context

The organization and the Secure Software Development Lifecycle (SSDLC) requires a comprehensive threat modeling approach to ensure the software security standards. Given the complexity and variety of potential threats, we aim to select and integrate multiple threat modeling frameworks.

Developing secure software systems, it's critical to identify and assess potential security threats. This helps in mitigating risks early in the design phase. Various threat modeling frameworks exist, each with its methodologies, strengths, and focuses. The challenge is to select the most appropriate framework(s) that align with our security goals, project requirements, and team expertise.

1. Decision Drivers

    - Comprehensiveness
      > Ability to cover a wide range of threats and vulnerabilities.

    - Ease of Use
      > Accessibility and ease of adoption by the development and security teams.

    - Alignment with Organizational Needs
      > Compatibility with our existing processes and risk management strategies.

    - Scalability
      > Effectiveness in handling both small-scale and large-scale projects.

    - Community and Tooling Support
      > Availability of community support and tooling to facilitate implementation.

## 3. Decision

### 3.1. STRIDE

Selected for its structured approach and comprehensive coverage of common threats. STRIDE provides a systematic way to categorize and address potential threats during the design phase, making it well-suited for identifying a broad range of security issues at different levels of the system.

1. Rationale

    - Comprehensiveness
      > Covers six threat categories (Spoofing, Tampering, Repudiation, Information Disclosure, Denial of Service, Elevation of Privilege), providing a broad and systematic approach to threat identification across all system components.

    - Ease of Use
      > Well-documented methodology with dedicated tooling (e.g., Microsoft Threat Modeling Tool) that makes it accessible to both development and security teams with minimal onboarding effort.

    - Alignment with Organizational Needs
      > Integrates naturally into the SSDLC design phase, enabling structured threat identification early in the development process before implementation begins.

    - Scalability
      > Applicable to systems of any size, from individual microservices to enterprise-wide architectures, without requiring significant process adaptation.

    - Community and Tooling Support
      > Broadly adopted in the industry with strong documentation and tooling support from Microsoft and the wider security community.

### 3.2. MITRE ATT&CK

Chosen for its detailed taxonomy of adversary tactics and techniques based on real-world observations. MITRE ATT&CK offers a comprehensive and continuously updated knowledge base that enables teams to understand and anticipate advanced threats reflecting the current threat landscape.

1. Rationale

    - Comprehensiveness
      > Provides a detailed taxonomy of adversary tactics and techniques drawn from real-world incidents, covering a wide spectrum of attack scenarios applicable to both infrastructure and application layers.

    - Ease of Use
      > Offers a navigable online knowledge base and integrations with widely used security tools, enabling teams to quickly reference and apply adversary behavior patterns in threat analysis.

    - Alignment with Organizational Needs
      > Aligns with threat intelligence workflows and augments existing security processes by mapping known attack patterns to the organization's threat profile.

    - Scalability
      > Continuously updated framework adaptable to evolving threat landscapes for both targeted attacks and large-scale adversarial campaigns.

    - Community and Tooling Support
      > Widely adopted with strong community backing, extensive integrations with SIEM and SOAR platforms, and regular updates maintained by MITRE.

### 3.3. CVSS

Adopted for its standardized approach to evaluating the severity of vulnerabilities. CVSS allows for consistent vulnerability assessment and prioritization, making it easier to manage and communicate risk levels across teams and stakeholders.

1. Rationale

    - Comprehensiveness
      > Provides a standardized scoring system for vulnerability severity across base, temporal, and environmental metrics, enabling consistent risk assessment for all identified threats.

    - Ease of Use
      > Publicly available scoring calculators and detailed specification make adoption straightforward for any team, regardless of prior vulnerability management experience.

    - Alignment with Organizational Needs
      > Compatible with risk management processes and enables clear, quantified communication of vulnerability severity to technical and non-technical stakeholders.

    - Scalability
      > Industry-standard scoring system applicable at any scale, from individual vulnerability assessments to large security portfolios managed across multiple projects.

    - Community and Tooling Support
      > Widely adopted by NVD, CVE databases, and security tools worldwide, with active maintenance and versioning by FIRST.

### 3.4. LINDDUN

Included to specifically address privacy threats and ensure comprehensive privacy risk assessment. LINDDUN adds a dedicated privacy dimension to the threat modeling effort, complementing security-focused frameworks and ensuring that privacy concerns are thoroughly addressed.

1. Rationale

    - Comprehensiveness
      > Systematically addresses privacy threats across seven dimensions (Linkability, Identifiability, Non-repudiation, Detectability, Disclosure of information, Unawareness, Non-compliance), complementing security-focused frameworks.

    - Ease of Use
      > Structured methodology with supporting worksheets and data flow diagram templates that guide systematic privacy threat analysis without requiring deep privacy expertise upfront.

    - Alignment with Organizational Needs
      > Adds a dedicated privacy dimension to threat modeling, supporting GDPR and other regulatory compliance requirements alongside existing security processes.

    - Scalability
      > Framework is adaptable for use on individual features as well as full system privacy assessments, scaling to the scope of the analysis required.

    - Community and Tooling Support
      > Backed by active academic research and growing adoption in privacy engineering, with available tooling and guidance published by the LINDDUN research team.

## 4. Considered

### 4.1. STRIDE

[STRIDE](https://learn.microsoft.com/en-us/azure/security/develop/threat-modeling-tool-threats) is a threat modeling methodology developed by Microsoft that categorizes threats into six types: Spoofing, Tampering, Repudiation, Information Disclosure, Denial of Service, and Elevation of Privilege.

- Pros:

  - Comprehensiveness
    > Provides a comprehensive approach to identifying a wide range of threat types across all system components.

  - Accessibility
    > Simple and easy to understand, with well-established documentation and tooling support.

- Cons:

  - Risk Assessment
    > Limited in assessing the impact and likelihood of identified threats. Requires additional tools for quantitative risk evaluation.

  - Scope
    > Focuses primarily on security threats and does not address privacy concerns without supplemental frameworks.

### 4.2. DREAD

[DREAD](https://owasp.org/www-community/Threat_Modeling_Process) is a risk assessment model used to rate, compare, and prioritize threats using five scoring categories: Damage, Reproducibility, Exploitability, Affected Users, and Discoverability.

- Pros:

  - Prioritization
    > Provides a scoring system to evaluate and prioritize threats based on their potential impact.

  - Simplicity
    > Straightforward model that helps teams rank threats without deep security expertise.

- Cons:

  - Subjectivity
    > Scoring is subjective and susceptible to inconsistency across teams and reviewers.

  - Structure
    > Less structured and rigorous compared to other threat modeling methods, reducing reproducibility.

### 4.3. PASTA

[PASTA (Process for Attack Simulation and Threat Analysis)](https://www.iriusrisk.com/resources-blog/pasta-threat-modeling-methodology) is a risk-centric threat modeling framework that provides a seven-stage methodology aligned with business objectives and technical risks.

- Pros:

  - Business Alignment
    > Focuses on business objectives and potential impact, connecting technical threats to organizational risk.

  - Methodology
    > Provides a comprehensive seven-step methodology covering the full lifecycle from objectives to attack simulation.

- Cons:

  - Complexity
    > More complex and time-consuming to implement than simpler frameworks.

  - Resource Requirements
    > Requires significant expertise and resources, making it less accessible for smaller teams.

### 4.4. LINDDUN

[LINDDUN](https://linddun.org/) is a privacy threat modeling framework that systematically identifies and addresses privacy threats in software systems using a structured taxonomy of seven privacy threat categories.

- Pros:

  - Privacy Focus
    > Specializes in privacy threat modeling, providing systematic coverage of privacy issues that security-only frameworks overlook.

  - Structure
    > Offers a structured methodology with supporting worksheets and data flow diagram-based analysis.

- Cons:

  - Scope
    > Limited to privacy threats and does not cover general security threats, requiring use alongside security-focused frameworks.

  - Adoption
    > Less widely adopted than security frameworks, with a smaller community and fewer integrated tooling options.

### 4.5. Attack Tree

[Attack Tree](https://en.wikipedia.org/wiki/Attack_tree) is a conceptual threat modeling method that represents attacks on a system using a tree structure, where the root represents the goal of the attack and branches represent alternative means of achieving it.

- Pros:

  - Visualization
    > Provides a visual representation of threats and attack paths that aids communication among stakeholders.

  - Prioritization
    > Helps identify and prioritize vulnerabilities by tracing attack paths back to root causes.

- Cons:

  - Complexity
    > Can become difficult to manage for large systems with many interdependencies.

  - Metrics
    > Does not provide standardized risk assessment metrics, limiting quantitative comparison across threats.

### 4.6. MITRE ATT&CK

[MITRE ATT&CK](https://attack.mitre.org/) is a globally accessible knowledge base of adversary tactics and techniques based on real-world observations, used as a foundation for threat modeling, detection, and response.

- Pros:

  - Knowledge Base
    > Comprehensive and detailed database of adversary tactics and techniques continuously updated based on real-world threat intelligence.

  - Adoption
    > Widely adopted across the industry with strong tooling integrations in SIEM and SOAR platforms.

- Cons:

  - Integration Dependency
    > Requires integration with complementary frameworks to support the full threat modeling lifecycle.

  - Scope
    > Extensive detail can be overwhelming and may require significant effort to apply selectively and effectively.

### 4.7. CVSS

[CVSS (Common Vulnerability Scoring System)](https://www.first.org/cvss/) is an open framework for communicating the characteristics and severity of software vulnerabilities, providing a standardized numerical score to represent risk.

- Pros:

  - Standardization
    > Provides a widely recognized and standardized method for assessing and communicating vulnerability severity.

  - Tooling
    > Supported by NVD, CVE databases, and a broad range of security tools with built-in CVSS calculators.

- Cons:

  - Scope
    > Focuses on vulnerability severity scoring rather than the broader threat identification and modeling process.

  - Identification Gap
    > Does not address how threats are discovered; serves as a rating tool rather than a discovery methodology.

### 4.8. TRIKE

[TRIKE](http://octotrike.org/) is a threat modeling framework that combines threat modeling with risk management, using a requirements model and implementation model to evaluate whether risks are acceptable to stakeholders.

- Pros:

  - Risk Integration
    > Integrates threat modeling and risk management into a unified framework for risk-based security decisions.

  - Stakeholder Focus
    > Explicitly incorporates stakeholder risk tolerance into the threat assessment process.

- Cons:

  - Adoption
    > Less widely adopted and supported compared to established frameworks, with limited community resources.

  - Complexity
    > Can be complex to implement effectively, requiring significant time investment to learn and apply.

### 4.9. VAST

[VAST (Visual, Agile, and Simple Threat modeling)](https://www.threatmodeler.com/) is a scalable threat modeling methodology designed to integrate with agile development processes and DevOps pipelines.

- Pros:

  - Agile Integration
    > Designed to integrate with agile development processes and scale across large engineering organizations.

  - Visualization
    > Provides visual process and application threat models to support both development and operations teams.

- Cons:

  - Maturity
    > Relatively new and less proven in large-scale deployments compared to established frameworks.

  - Resources
    > Limited publicly available resources and community support outside of commercial tooling.

### 4.10. OCTAVE

[OCTAVE (Operationally Critical Threat, Asset, and Vulnerability Evaluation)](https://www.sei.cmu.edu/our-work/projects/display.cfm?customel_datapageid_4050=53321) is a risk-based strategic assessment and planning framework focused on organizational security risk management.

- Pros:

  - Organizational Focus
    > Centers on organizational risk management, aligning threat analysis with business assets and operational priorities.

  - Comprehensiveness
    > Comprehensive methodology covering asset identification, threat profiling, and risk evaluation across the organization.

- Cons:

  - Resource Intensity
    > Time-consuming and resource-intensive to execute, requiring significant organizational commitment.

  - Scale Suitability
    > Better suited to larger organizations with mature security processes and dedicated risk management teams.

## 5. Consequences

- Positive

  - Security Coverage
    > Combining STRIDE, MITRE ATT&CK, CVSS, and LINDDUN provides holistic coverage of security, privacy, and risk dimensions across the software development lifecycle.

  - Standardization
    > Use of industry-recognized frameworks enables consistent threat identification, scoring, and communication across teams and projects.

  - Early Risk Mitigation
    > Integration into the SSDLC design phase enables identification and mitigation of threats before implementation, reducing the cost of remediation.

- Negative

  - Complexity
    > Managing multiple threat modeling frameworks simultaneously increases process complexity and requires clear coordination to avoid gaps or duplication.

  - Learning Curve
    > Teams unfamiliar with all four frameworks require dedicated training and time to achieve consistent and effective application.

  - Tooling Overhead
    > Supporting multiple frameworks may require maintaining several specialized tools, increasing setup and maintenance effort.

- Risks

  - Framework Overlap
    > Overlapping coverage between frameworks (e.g., STRIDE and MITRE ATT&CK) may result in duplicated effort if boundaries are not clearly defined.

  - Inconsistent Application
    > Without documented guidelines and templates, teams may apply the frameworks inconsistently across projects, reducing the reliability of threat models.

## 6. Implementation

1. Conduct training sessions on STRIDE, MITRE ATT&CK, CVSS, and LINDDUN for development and security teams to establish a shared understanding of each framework's scope and application.

2. Evaluate and integrate tools that support the selected methodologies, such as Microsoft Threat Modeling Tool, MITRE ATT&CK Navigator, CVSS calculators, and LINDDUN worksheets.

3. Define guidelines and templates for applying each framework consistently across all projects, including clear boundaries between frameworks to avoid duplication.

4. Execute a pilot project applying the integrated threat modeling approach to validate the process, identify gaps, and refine tooling and guidelines.

5. Roll out the process organization-wide and establish a schedule for regular reviews to incorporate new security and privacy trends.

## 7. References

- Sentenz [Threat Modeling](../articles/threat-modeling.md) article.
