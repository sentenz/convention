# XXX-ADR: Threat Modeling

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
- [5. Implementation](#5-implementation)
- [6. References](#6-references)

## 1. State

- Author(s): ALKL
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

1. Rationale

    - Comprehensiveness
      > TODO

    - Ease of Use
      > TODO

    - Alignment with Organizational Needs
      > TODO

    - Scalability
      > TODO

    - Community and Tooling Support
      > TODO

### 3.1. STRIDE

Selected for its structured approach and comprehensive coverage of common threats. It is well-suited for identifying a broad range of security issues at different levels of the system. STRIDE provides a systematic way to categorize and address potential threats during the design phase.

### 3.2. MITRE ATT&CK

Chosen for its detailed taxonomy of adversary tactics and techniques based on real-world observations. This helps in understanding and anticipating advanced threats. MITRE ATT&CK offers a comprehensive and evolving knowledge base that reflects the latest threat landscape.

### 3.3. CVSS

Adopted for its standardized approach to evaluating the severity of vulnerabilities. It aids in prioritizing security efforts based on the impact. CVSS allows for consistent vulnerability assessment and prioritization, making it easier to manage and communicate risk levels.

### 3.4. LINDDUN

Included to specifically address privacy threats and ensure comprehensive privacy risk assessment. This complements our overall security threat modeling by focusing on privacy aspects. LINDDUN adds a crucial privacy dimension to our threat modeling efforts, ensuring that privacy concerns are thoroughly addressed.

## 4. Considered

### 4.1. STRIDE

- Pros
  > Simple and easy to understand. Provides a comprehensive approach to identifying a wide range of threat types.

- Cons
  > Limited in assessing the impact and likelihood of threats. May require additional tools for risk assessment.

### 4.2. DREAD

- Pros
  > Offers a scoring system to evaluate threats. Helps prioritize threats based on their potential impact.

- Cons
  > Subjective and less structured compared to other methods.

### 4.3. PASTA

- Pros
  > Focuses on business objectives and the potential impact on them. Provides a comprehensive seven-step methodology.

- Cons
  > More complex and time-consuming to implement. Requires a significant amount of expertise and resources.

### 4.4. LINDDUN

- Pros
  > Specializes in privacy threat modeling. Systematic approach to identifying privacy issues.

- Cons
  > Limited to privacy threats and does not cover all types of security threats. May need to be used in conjunction with other frameworks.

### 4.5. Attack Tree

- Pros
  > Visual representation of threats and attack paths. Helps identify and prioritize vulnerabilities.

- Cons
  > Can become complex for large systems. Does not provide specific risk assessment metrics.

### 4.6. MITRE ATT&CK

- Pros
  > Comprehensive and detailed knowledge base of adversary tactics and techniques. Widely adopted and continuously updated.

- Cons
  > Requires integration with other frameworks for complete threat modeling. May be overwhelming due to its extensive detail.

### 4.7. CVSS

- Pros
  > Provides a standardized method for assessing the severity of vulnerabilities. Widely used and recognized.

- Cons
  > Focuses primarily on vulnerabilities rather than comprehensive threat modeling. Does not address the identification process of threats.

### 4.8. TRIKE

- Pros
  > Integrates threat modeling and risk management. Provides a framework for risk-based security decisions.

- Cons
  > Less widely adopted and supported. Can be complex to implement effectively.

### 4.9. VAST

- Pros
  > Designed to integrate with agile development processes. Scalable and provides visual models for threat analysis.

- Cons
  > Relatively new and less proven in large-scale deployments. Limited resources and community support.

### 4.10. OCTAVE

- Pros
  > Focuses on organizational risk management. Comprehensive methodology for evaluating security risks.

- Cons
  > Time-consuming and resource-intensive. More suitable for larger organizations with mature security processes.

## 5. Implementation

1. Process Changes

    - Training
      > Team members will need training on the integrated approach, including understanding and applying CVSS, LINDDUN, and STRIDE.

    - Tooling
      > Evaluate and potentially adopt tools that support these methodologies. This might include threat modeling tools, privacy assessment tools, and CVSS calculators.

2. Implementation Steps

    - Kickoff and Training
      > Initiate the integration process with a kickoff meeting and conduct comprehensive training sessions.

    - Tool Assessment and Integration
      > Evaluate available tools and integrate them into our development pipeline.

    - Pilot Project
      > Implement the integrated threat modeling approach on a pilot project to refine the process and address any issues.

    - Full Deployment
      > Roll out the refined process across all projects.

3. Evaluation and Monitoring

    - Continous Improvement
      > Regular reviews and updates to the threat modeling process will be conducted to ensure it remains effective and incorporates new security and privacy trends.

## 6. References

- Sentenz [Threat Modeling](../articles/threat-modeling.md) article.
