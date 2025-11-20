# Requirements Engineering

Requirements Engineering is a systematic approach to eliciting, analyzing, documenting, and managing requirements throughout the software development lifecycle. In the context of the Cyber Resilience Act (CRA), requirements engineering plays a critical role in ensuring that products with digital elements meet cybersecurity and compliance standards.

- [1. Cyber Resilience Act (CRA)](#1-cyber-resilience-act-cra)
  - [1.1. Market Requirements Document (MRD)](#11-market-requirements-document-mrd)
    - [1.1.1. Risk Management](#111-risk-management)
      - [1.1.1.1. Risk Assessment](#1111-risk-assessment)
      - [1.1.1.2. Threat Modeling](#1112-threat-modeling)
      - [1.1.1.3. Risk Estimation](#1113-risk-estimation)
      - [1.1.1.4. Risk Evaluation](#1114-risk-evaluation)
      - [1.1.1.5. Risk Treatment](#1115-risk-treatment)
      - [1.1.1.6. Risk Communication](#1116-risk-communication)
      - [1.1.1.7. Risk Monitoring and Review](#1117-risk-monitoring-and-review)
    - [1.1.2. Vulnerability Management](#112-vulnerability-management)
      - [1.1.2.1. Vulnerability Identification and Discovery](#1121-vulnerability-identification-and-discovery)
      - [1.1.2.2. Vulnerability Triage and Prioritization](#1122-vulnerability-triage-and-prioritization)
      - [1.1.2.3. Vulnerability Mitigation and Remediation](#1123-vulnerability-mitigation-and-remediation)
      - [1.1.2.4. Vulnerability Reporting and Disclosure](#1124-vulnerability-reporting-and-disclosure)
      - [1.1.2.5. Vulnerability Monitoring](#1125-vulnerability-monitoring)
      - [1.1.2.6. Security Updates](#1126-security-updates)
    - [1.1.3. Software Supply Chain Security](#113-software-supply-chain-security)
      - [1.1.3.1. Supply Chain Risk Management](#1131-supply-chain-risk-management)
      - [1.1.3.2. Software Bill of Materials (SBOM)](#1132-software-bill-of-materials-sbom)
      - [1.1.3.3. Software Composition Analysis (SCA)](#1133-software-composition-analysis-sca)
      - [1.1.3.4. Integrity and Attestation](#1134-integrity-and-attestation)
    - [1.1.4. Incident Management](#114-incident-management)
      - [1.1.4.1. Incident Response](#1141-incident-response)
      - [1.1.4.2. Incident Detection](#1142-incident-detection)
      - [1.1.4.3. Incident Recovery](#1143-incident-recovery)
      - [1.1.4.4. Incident Reporting](#1144-incident-reporting)
    - [1.1.5. Documentation](#115-documentation)
      - [1.1.5.1. Technical Documentation](#1151-technical-documentation)
      - [1.1.5.2. User Documentation](#1152-user-documentation)
    - [1.1.6. Secure Software Development Lifecycle (SSDLC)](#116-secure-software-development-lifecycle-ssdlc)
      - [1.1.6.1. Cybersecurity Planning](#1161-cybersecurity-planning)
      - [1.1.6.2. Cybersecurity Requirements](#1162-cybersecurity-requirements)
      - [1.1.6.3. Cybersecurity Architecture and Design](#1163-cybersecurity-architecture-and-design)
      - [1.1.6.4. Secure Implementation](#1164-secure-implementation)
      - [1.1.6.5. Cybersecurity Verification and Validation](#1165-cybersecurity-verification-and-validation)
      - [1.1.6.6. Secure Production and Distribution](#1166-secure-production-and-distribution)
      - [1.1.6.7. Secure Decommissioning](#1167-secure-decommissioning)
      - [1.1.6.8. Third-party Components](#1168-third-party-components)
  - [1.2. References](#12-references)

## 1. Cyber Resilience Act (CRA)

The Cyber Resilience Act (CRA) is a European Union regulation aimed at establishing cybersecurity requirements for products with digital elements. It ensures that manufacturers implement security measures throughout the product lifecycle, from design to decommissioning, to protect against cyber threats and vulnerabilities.

### 1.1. Market Requirements Document (MRD)

A Market Requirements Document (MRD) defines the high-level requirements for a product based on market needs and regulatory compliance. In the context of CRA, the MRD outlines cybersecurity requirements that must be addressed throughout the product lifecycle.

#### 1.1.1. Risk Management

Risk management is a critical aspect of requirements engineering, particularly in the context of CRA compliance. It involves identifying, assessing, and mitigating risks associated with product development and deployment.

The management of risks applies to all phases of the product lifecycle, including design, development, production and maintenance to ensure an appropriate level of cybersecurity.

1. References

    - DIN 40000 (6)

##### 1.1.1.1. Risk Assessment

Risk assessment is the process of identifying potential risks and evaluating their impact on the project to ensure CRA compliance.

- Conduct a thorough risk assessment to identify potential risks and their impact on the project. - CRA Article 13(2)

- Secure by Design - CRA Recital (32), CRA Article 13(1)
  > Incorporate security measures from the initial design phase to ensure robust protection against threats.
  - Cybersecurity level must be proportional to identified risks based on the Risk-Based Design. - CRA Annex I Part I(1)
  - No known exploitable vulnerabilities at market entry, requiring pre-launch vulnerability scanning, penetration testing, and remediation. - CRA Annex I Part I(2)(a)
  - Minimise the negative impact by the products themselves or connected devices on the availability of services provided by other devices or networks - CRA Annex I Part I(2)(i)

- Secure by Default - CRA Recital (32), Recital (64)
  > Products must be configured securely out-of-the-box to minimize vulnerabilities.
  - Hardened configurations (e.g., no default passwords, disabled unnecessary services), reset capability mandatory. - CRA Annex I Part I(2)(b)

- Principle of Least Privilege (PoLP)
  > Limit access rights for users, applications, and systems to the minimum necessary to perform their functions.
  - Attack surface reduction, disable unused ports/protocols, minimize APIs. - CRA Annex I Part I(2)(j)

- Information Security (InfoSec) - CRA Article 3(44), CRA Article 14(5)(a)
  > Data Protection by applying the CIA Triad (Confidentiality, Integrity, Availability) throughout the product lifecycle.
  - State-of-the-Art encryption with AES-256, TLS 1.3+, secure key management, apply to data at rest, in transit, in use where relevant. - CRA Annex I Part I(2)(e)
  - Use hashing, digital signatures, tamper-evident logging, alert on detected corruption. - CRA Annex I Part I(2)(f)
  - Cyber attack resilience with rate limiting, traffic filtering, failover mechanisms for essential functions. - CRA Annex I Part I(2)(h)

- Identity & Access
  > Ensure robust identity verification and access controls to prevent unauthorized access.
  - Establish Access Control & Anomaly Reporting, implement MFA, RBAC, IAM, log and alert on unauthorized access attempts. - CRA Annex I Part I(2)(d)

- Privacy by Design
  > Incorporate privacy considerations into the design and architecture of products.
  - Collect and process only the data strictly necessary for the intended purpose, avoid processing beyond that purpose and enforce data minimisation. - CRA Annex I Part I(2)(g)
  - Giving users control over their data, including the ability to erase, secure delete or safe data export to other systems. - CRA Annex I Part I(2)(m)
  - Secure decommissioning of the product, including securely removing information of user data. - CRA Annex II (8)(d)

1. References

    - CRA Article 13
    - CRA Annex I Part I
    - CRA Annex II
    - CRA Recital
    - DIN 40000 (5)
    - DIN 40000 (6.4)

##### 1.1.1.2. Threat Modeling

Threat modeling is a proactive approach to identifying and addressing potential security threats during the design and development phases. It helps in understanding the attack surface and implementing appropriate security controls.

- Conduct threat modeling sessions during the design phase to identify potential threats and vulnerabilities.
- Utilize established frameworks (e.g., STRIDE, DREAD) to systematically analyze threats.
- Document identified threats and corresponding mitigation strategies.

1. References

    - DIN 40000 (6.4.3)
    - IEC 62443-4-1:2018
    - CRA Annex I Part I(2)(a)

##### 1.1.1.3. Risk Estimation

Risk estimation involves quantifying the likelihood and potential impact of identified risks to prioritize mitigation efforts.

1. References

    - DIN 40000 (6.4.4)

##### 1.1.1.4. Risk Evaluation

Risk evaluation is the process of comparing estimated risks against risk criteria to determine their significance and prioritize response actions.

1. References

    - DIN 40000 (6.4.5)

##### 1.1.1.5. Risk Treatment

Risk treatment involves selecting and implementing measures to modify risk levels through various strategies.

###### 1.1.1.5.1. Risk Avoidance

Risk avoidance involves eliminating activities or conditions that give rise to risk, thereby preventing the risk from occurring.

1. References

    - DIN 40000 (6.5.1.2)

###### 1.1.1.5.2. Risk Mitigation

Risk mitigation involves implementing strategies to reduce the likelihood or impact of identified risks.

- Develop exploit mitigation plans for high-priority risks, including technical and procedural controls. - CRA Annex I Part I(2)(k)
- Allocate resources for risk mitigation activities, such as training or tool implementation.
- Regularly review and update mitigation strategies based on new threats or changes in the environment.

1. References

    - CRA Annex I Part I
    - DIN 40000 (6.5.1.3)

###### 1.1.1.5.3. Risk Acceptance

Risk acceptance is the decision to accept a risk as is, typically when the cost of mitigation exceeds the potential impact or when operating in trusted environments.

> [!NOTE]
> Trusted Environments: Scope limitations may apply when products are explicitly restricted to controlled or trusted environments. - CRA Recital (55)

1. References

    - DIN 40000 (6.3)
    - DIN 40000 (6.5.1.4)
    - CRA Annex I Part I(2)(b)
    - CRA Annex I Part II(8)

###### 1.1.1.5.4. Risk Transfer

Risk transfer involves shifting the risk to another party, such as through insurance, contracts, or outsourcing.

1. References

    - DIN 40000 (6.5.1.5)

##### 1.1.1.6. Risk Communication

Risk communication ensures that information about risks is effectively shared with all relevant stakeholders throughout the organization.

1. References

    - DIN 40000 (6.6)

##### 1.1.1.7. Risk Monitoring and Review

Risk monitoring ensures ongoing oversight of risks to detect changes and ensure mitigation effectiveness.

- Establish key risk indicators (KRIs) to monitor risk levels continuously.
- Conduct periodic risk reviews and audits to assess the status of identified risks.
- Report on risk status to stakeholders and adjust strategies as needed for CRA compliance.
- Log access/modification events, provide user-accessible logs and opt-out. - CRA Annex I Part I(2)(l)

1. References

    - DIN 40000 (6.5.1.5)
    - DIN 40000 (6.7)
    - CRA Annex I Part II(3)

#### 1.1.2. Vulnerability Management

Vulnerability management is the activity ensuring that cybersecurity issues can be identified, handled and resolved for the product.

Vulnerability management as specified by the CRA, includes guidelines for identifying, reporting, and remediation vulnerabilities in products to ensure ongoing compliance and security.

1. References

    - DIN 40000 (7.8)
    - JT013090:2026
    - CRA Annex I Part I(2)(c)
    - CRA Annex I Part II(2)
    - CRA Annex I Part II(4)
    - CRA Annex I Part II(8)

##### 1.1.2.1. Vulnerability Identification and Discovery

Vulnerability identification is crucial for maintaining product security and CRA compliance. Involves systematic processes to discover potential security weaknesses in products based on databases (e.g., CVE), security advisories (e.g., NVD), and internal testing.

- Implement continuous monitoring tools to detect vulnerabilities. - CRA Annex I Part II(1)
- Conduct regular security assessments and penetration testing, fuzzing, SAST/DAST, and vulnerability scanning to uncover potential weaknesses. - CRA Annex I Part II(3), CRA Article 10(a)
- Maintain a vulnerability database for tracking identified issues, including severity levels and affected components.

1. References

    - CRA Annex I Part II
    - CRA Article 10

##### 1.1.2.2. Vulnerability Triage and Prioritization

Prioritizing vulnerabilities is essential to effectively manage and mitigate risks.

###### 1.1.2.2.1. Vulnerability Triage

Vulnerability triage is the process of evaluating and categorizing vulnerabilities to determine their validity and relevance.

###### 1.1.2.2.2. Vulnerability Prioritization

Prioritizing vulnerabilities involves evaluating the severity (e.g., CVSS score) and potential impact (e.g., data loss, reputational damage) of identified vulnerabilities to allocate resources efficiently.

- Assess vulnerabilities based on potential impact, exploitability. - CRA Annex I Part II(2)
- Utilize automated tools to assist in vulnerability scoring and prioritization (e.g., CVSS, EPSS scoring).
- Develop a risk-based approach (e.g., risk matrices, threat modeling) to address high-priority vulnerabilities first, ensuring resources are allocated efficiently. - CRA Annex I Part II(4)

##### 1.1.2.3. Vulnerability Mitigation and Remediation

Vulnerability mitigation and remediation are critical components of maintaining product security and CRA compliance. This involves addressing identified vulnerabilities through structured processes. - CRA Annex I Part II(2)

1. References

    - CRA Annex I Part II

###### 1.1.2.3.1. Vulnerability Mitigation

Mitigate identified vulnerabilities to reduce their impact and likelihood of exploitation.

- Develop and deploy security patches within defined SLAs, prioritizing critical systems.
- Maintain a documented process for vulnerability remediation, including testing and validation steps.
- Conduct post-mitigation reviews to ensure effectiveness and prevent recurrence.

###### 1.1.2.3.2. Vulnerability Remediation

Remediate identified vulnerabilities to eliminate their impact and likelihood of exploitation.

- Implement a structured process for vulnerability remediation, including root cause analysis and impact assessment.
- Prioritize vulnerabilities based on risk and impact.
- Allocate resources for timely remediation efforts, including cross-functional teams.
- Document remediation actions and track progress, with regular audits for CRA compliance.

###### 1.1.2.3.3. Patch Management

The specific process of applying software updates and patches to permanently fix known vulnerabilities.

- Establish a centralized patch management system to track and deploy patches across all systems and components.
- Conduct thorough testing of patches in staging environments before production deployment to avoid disruptions.
- Define patch deployment schedules and SLAs based on vulnerability severity and business impact.
- Monitor patch compliance and effectiveness through regular audits and reporting.
- Maintain rollback procedures for patches that cause issues, ensuring quick recovery.

##### 1.1.2.4. Vulnerability Reporting and Disclosure

Effective vulnerability reporting and disclosure are critical for maintaining transparency and trust with stakeholders, including customers, partners, and regulatory bodies.

###### 1.1.2.4.1. Vulnerability Reporting

Report identified vulnerabilities to relevant stakeholders, including internal teams, customers, and regulatory bodies (e.g. CSIRT or ENISA), in accordance with CRA guidelines.

- Establish a responsible disclosure program for external researchers, including clear guidelines and incentives.
- Define clear communication channels for reporting vulnerabilities, such as dedicated email or portals (e.g., security.txt). - CRA Annex I Part II(6)
- Ensure timely acknowledgment and response to reported vulnerabilities within CRA-specified timelines. - CRA Article 14(2) & (4)
- Comply with CRA reporting requirements for significant vulnerabilities, including mandatory notifications to authorities (CSIRT or ENISA). - CRA Article 14(1)
- A detailed description of the incident, including its severity and impact. - CRA Article 14(4)(c)(i)
- The type of threat or root cause that is likely to have triggered the incident. - CRA Article 14(4)(c)(ii)

1. References

    - CRA Article 14
    - CRA Annex I Part II
    - CRA Recital (65)

###### 1.1.2.4.2. Vulnerability Disclosure

Disclose details of vulnerabilities to affected stakeholders, including customers, partners, and regulatory bodies, in accordance with CRA guidelines.

- Establish a clear process for disclosing vulnerabilities to affected parties, minimizing exposure risks.
- Provide guidance on responsible disclosure practices, such as coordinated releases with vendors. - CRA Annex I Part II(8)
- Ensure timely communication of vulnerability details to stakeholders, including patches and workarounds.

###### 1.1.2.4.3. Coordinated Vulnerability Disclosure (CVD)

CVD is a process that brings together multiple stakeholders to coordinate the disclosure of vulnerabilities. This approach helps to ensure that all parties are prepared to address the issue simultaneously, minimizing the risk of exploitation.

- Implementation of a public and structured vulnerability disclosure, including mechanisms to facilitate sharing of potential vulnerabilities. - CRA Annex I Part II(4), CRA Article 13(8), CRA Article 15
- Identify key stakeholders, including affected customers, partners, and internal teams.
- Establish a timeline for disclosure, including embargo periods if necessary.
- Coordinate communication efforts to ensure consistent messaging across all channels.
- Develop vulnerability advisory templates covering all required elements. - CRA Annex I Part II(8)
- Establish public disclosure channels (security advisories page, CVE database entries)
- Implement severity rating systems (e.g., CVSS).
- Create remediation guidance for end-users.
- Design user notification mechanisms for patch availability

1. References

    - CRA Annex I Part II
    - CRA Article 13(8)
    - CRA Article 15

###### 1.1.2.4.4. Vulnerability Disclosure Policy (VDP)

A Vulnerability Disclosure Policy (VDP) outlines the process for reporting and disclosing vulnerabilities. It establishes clear guidelines for both internal and external stakeholders or security researchers, ensuring a consistent and effective approach to vulnerability management.

- A formal, published CVD policy defining intake, triage, communication, and collaboration practices with external researchers are handled. - CRA Annex I Part II(5)
- Definition of what constitutes a vulnerability and the scope of the policy.
- Clear reporting channels (e.g., email, web portal like security.txt) for internal and external stakeholders.
- Guidelines for responsible disclosure, including timelines and communication protocols.
- Procedures for acknowledging and responding to reported vulnerabilities.
- Commitment to protecting the identity and confidentiality of reporters.

1. References

    - CRA Annex I Part II

##### 1.1.2.5. Vulnerability Monitoring

Vulnerability monitoring involves continuously tracking and assessing vulnerabilities to ensure they are managed effectively over time.

1. References

    - DIN 40000 (7.9)
    - CRA Annex I Part I(2)(d)
    - CRA Annex I Part I(2)(e)
    - CRA Annex I Part I(2)(f)

##### 1.1.2.6. Security Updates

Security updates encompass the release and application of updates, including patches, hotfixes, and firmware updates, to address security vulnerabilities and enhance product resilience.

- Develop a process for creating and releasing security updates based on identified vulnerabilities and risk assessments.
- Ensure updates are tested for compatibility, performance, and security before distribution.
- Provide clear communication to users about available updates, including installation instructions and potential impacts.
- Automate update deployment where possible to ensure timely application across all affected systems.
- Track update adoption rates and provide support for users facing issues during update processes.
- Separate security updates where feasible, decouple security patches from feature updates to enable rapid deployment. - CRA Annex I Part II(2)
- Updates must be distributed securely, cryptographically signed updates, secure channels (HTTPS/TLS), integrity verification, and where applicable support for automatic security updates. - CRA Annex I Part II(7)
- Security updates must be provided free of charge and without delay. Business users with tailor-made products agreement. - CRA Annex I Part II(8)

1. References

    - CRA Annex I Part II
    - CRA Article 13

#### 1.1.3. Software Supply Chain Security

Ensuring the security of the software supply chain is vital for CRA compliance. Involves managing risks associated with third-party suppliers and components used in products, securing the development, build, and deployment of software artifacts (including source code, dependencies, and CI/CD pipelines) against compromises like malicious updates or dependency confusion.

##### 1.1.3.1. Supply Chain Risk Management

Establish processes to identify, assess, and mitigate risks associated with third-party suppliers and components.

- Due Diligence: When integrating third-party components, manufacturers must exercise due diligence to ensure security compliance. - CRA Recital (34), CRA Article 25

- Identify and assess risks associated with third-party suppliers and components.
- Implement security requirements for suppliers, including regular audits and assessments.
- Maintain a Software Bill of Materials (SBOM) to track all third-party components and their security status.
- Establish contractual obligations for suppliers to adhere to security standards and CRA compliance (e.g., Supply Chain Levels for Software Artifacts (SLSA)).
- Establish automatic security updates as the default setting, ensuring products remain secure without user intervention, while providing flexibility to opt out (e.g. Renovate). - CRA Annex I Part I(2)(c)
  - Security updates must be provided for the entire duration of the defined Support Period (minimum 5 years, or longer based on product type). - CRA Article 13(8)
  - Complements automated secure updates and disclosure requirements. - CRA Annex I Part II

1. References

    - CRA Recital (34)
    - CRA Article 25
    - CRA Article 13
    - CRA Annex I

##### 1.1.3.2. Software Bill of Materials (SBOM)

A comprehensive inventory of all software components, including open-source and proprietary libraries, used in an application.

- Must maintain an up-to-date SBOM (minimum top-level dependencies) in a standard format (e.g., CycloneDX, SPDX) - CRA Annex I Part II(1)
- Establish component tracking systems throughout the software supply chain.
- Deploy vulnerability scanning and identification capabilities.
- Ensure SBOM updates with each product release or significant component change.
- Manufacturers should not be obliged to make the SBOM public. - CRA Recital (77)

1. References

    - CRA Article 31
    - CRA Recital (77)
    - CRA Annex I
    - CRA Annex I Part II(4)
    - DIN 40000 (7.11)

##### 1.1.3.3. Software Composition Analysis (SCA)

The automated process of scanning and analyzing code to identify open-source components and their known vulnerabilities or license issues.

Ensure the security of open-source components used in products by implementing Software Composition Analysis (SCA) practices.

- Implement Software Composition Analysis (SCA) tools to identify and manage open-source components and their vulnerabilities.
- Maintain an inventory of all open-source components used in the product, including version information and licensing details.
- Monitor for vulnerabilities in open-source components and ensure timely updates and patches.
- Establish processes for evaluating and approving new open-source components before use.
- Ensure License Compliance of all third-party components comply with their respective licenses.

1. References

    - CRA Annex I Part II

##### 1.1.3.4. Integrity and Attestation

Ensure the integrity and authenticity of third-party components through integrity checks and attestation processes.

- Implement integrity checks for all third-party components, including checksums and hashes to ensure data has not been altered. - CRA Annex I Part I(2)(f)
- Establish attestation processes to verify the authenticity and compliance of third-party components, such as through digital certificates or proofs of origin (e.g., Sigstore, in-toto).
- Implement digital signatures for third-party components to ensure authenticity and integrity.
- Maintain a secure repository for storing and managing component integrity data and attestation records.

> [!NOTE]
> Manufacturers integrating FOSS components enables **Voluntary Security Attestation Programmes** to support due diligence obligations. - CRA Recital (21), CRA Article 13(5)

1. References

    - CRA Article 25
    - CRA Article 13(5)
    - CRA Annex I
    - CRA Recital (21)

#### 1.1.4. Incident Management

Incident management ensures timely detection, response, and recovery from cyber incidents to minimize impact and meet regulatory reporting obligations.

1. References

    - DIN 40000 (5)

##### 1.1.4.1. Incident Response

Incident response is essential for CRA compliance, ensuring timely detection, response, and recovery from cyber incidents to minimize impact and meet regulatory reporting obligations.

- Establish a coordinated response capability with strict reporting timelines in cooperation with CSIRT or ENISA. Manufacturers must notify actively exploited vulnerabilities or serious incidents affecting product security. - CRA Recital (65), CRA Article 14(1)
- Notification Timeline
  - Initial warning notification within 24 hours. - CRA Article 14(2)(a), CRA Article 14(4)(a)
  - Vulnerability notification within 72 hours. - CRA Article 14(2)(b), CRA Article 14(4)(b)
  - Final incident report within 14 days. - CRA Article 14(2)(c), CRA Article 14(4)(c)

1. References

    - CRA Article 14
    - CRA Recital (65)
    - DIN 40000 (7.8)

##### 1.1.4.2. Incident Detection

Implement mechanisms to detect security incidents promptly.

- Deploy intrusion detection systems (IDS) and security information and event management (SIEM) tools.
- Establish monitoring for unusual activities, such as unauthorized access or data exfiltration.
- Train personnel to recognize and report potential incidents.

##### 1.1.4.3. Incident Recovery

Focus on restoring systems and learning from incidents to prevent future occurrences.

- Conduct post-incident analysis to identify root causes and lessons learned.
- Implement recovery procedures to restore affected systems and data.
- Update security measures based on incident insights and comply with CRA follow-up reporting.

##### 1.1.4.4. Incident Reporting

Report incidents to relevant authorities and stakeholders in accordance with CRA requirements.

1. References

    - CRA Article 14
    - CRA Recital (65)

#### 1.1.5. Documentation

Documentation is essential for demonstrating CRA compliance and providing guidance to users on secure product usage.

##### 1.1.5.1. Technical Documentation

The technical documentation shall contain at least the following elements, as applicable to the product.

> [!NOTE]
> Trusted Environments: Scope limitations may apply when products are explicitly restricted to controlled or trusted environments. - CRA Recital (55)

1. General

    Technical files must clearly articulate product purpose, scope of use, and applicable cybersecurity-relevant configurations.

    - (a) Intended Purpose: Intended use case and application domain of the product.
    - (b) Version Control: Software versions of cybersecurity compliance.
    - (c) Hardware Documentation: Images or illustrations of external features, marking and internal layout.
    - (d) User Documentation: User information and instructions. - CRA Annex II

2. Process Phases

    Design, Development, and Production

    - (a) Design and development info (drawings, schemes, system architecture)

    - (b) Vulnerability Management

      Document vulnerability management processes including SBOM generation, Vulnerability Disclosure Policy (VDP), public reporting channel, and secure update infrastructure.

    - (c) Production and Monitoring

3. Cybersecurity Risk Assessment

    Conduct and document comprehensive risk assessments throughout the product lifecycle, explicitly mapping to Annex I essential cybersecurity requirements per Article 13. Risk analyses must be structured, traceable, and maintained across lifecycle phases.

4. Support Period

    Document the rationale and factors considered in determining product support periods, including security update commitments. Lifecycle support duration must be based on product risk and intended deployment context.

    - Must justify the defined support duration, minimum 5 years or product lifecycle based on risk/use. - CRA Article 13(8)
    - Indicative support periods via ADCO guidance. - CRA Article 52(16)
    - Security updates for latest versions. - CRA Recital (40)

5. Standards Compliance

    Document use of harmonised standards or justify alternatives.

    - Harmonised Standards: Full, partial, or alternative compliance paths allowed, but must be fully documented.
    - Common Specifications - CRA Article 27
    - European cybersecurity certification schemes (Regulation (EU) 2019/881)

6. Conformity Test Reports

    - Reports verifying conformity of the product and vulnerability handling processes. - CRA Annex I

7. EU Declaration of Conformity

    - Copy of the signed EU declaration of conformity.

8. Software Bill of Materials (SBOM)

    > [!IMPORTANT]
    > Conditional Disclosure: Provided only upon reasoned request from a market surveillance authority, if necessary to verify compliance. -  Annex I

    - Generate and maintain SBOMs that can be provided to market surveillance authorities upon request for compliance verification purposes.

9. References

    - CRA Article 31
    - CRA Annex I
    - CRA Annex VII
    - CRA Recital (40)
    - CRA Recital (55)
    - DIN 40000 (6.2)

##### 1.1.5.2. User Documentation

The Cyber Resilience Act (CRA) mandates minimum information and instructions that must accompany every product with digital elements at the point of sale and throughout its lifecycle. This ensures transparency, secure use, and user awareness of cybersecurity properties, support, and risks.

> [!NOTE]
> Accessibility & Clarity: User information and instructions in official EU language(s) of the target market, digital or printed; user-friendly (avoid jargon). - CRA Recital (18)

1. Manufacturer Contact

    - Contact information for reporting vulnerabilities and incidents
    - Single point of contact for security-related communications

2. Product Identification

    - Product name, model, version
    - Unique product identifier
    - CE marking and identification number (if applicable)

3. Security Properties

    - Description of security features and capabilities
    - Intended use and limitations
    - Known constraints and environmental requirements

4. Support Period

    - End-of-support date or duration of security updates
    - Policy for end-of-life and decommissioning

5. Secure Configuration and Usage

    - Instructions for secure installation and configuration
    - Guidance on secure use and maintenance
    - Information about available security controls

6. Vulnerability Reporting

    - How to report security vulnerabilities
    - Expected response times
    - Coordinated disclosure process

7. Update Management

    - How to receive and install security updates
    - Automatic update capabilities and configuration
    - Notification mechanisms for available updates

8. Data Protection

    - Information about data collection and processing
    - User rights regarding personal data
    - Data deletion and export capabilities

9. References

    - CRA Article 13
    - CRA Annex II
    - CRA Recital (18)

#### 1.1.6. Secure Software Development Lifecycle (SSDLC)

The Secure Software Development Lifecycle (SSDLC) integrates security practices throughout the entire software development process, from planning to decommissioning.

##### 1.1.6.1. Cybersecurity Planning

Establish a comprehensive cybersecurity plan that defines security objectives, requirements, and strategies for the product lifecycle.

- Define security objectives aligned with business goals and CRA requirements.
- Identify security stakeholders and their responsibilities.
- Establish security governance and oversight mechanisms.
- Allocate resources for security activities throughout the lifecycle.

##### 1.1.6.2. Cybersecurity Requirements

Define and document cybersecurity requirements based on risk assessment, regulatory compliance, and industry best practices.

- Elicit security requirements from stakeholders, regulations, and standards.
- Document functional and non-functional security requirements.
- Establish traceability between requirements and security controls.
- Review and validate requirements with stakeholders.

##### 1.1.6.3. Cybersecurity Architecture and Design

Design security architecture and controls that address identified security requirements and threats.

- Develop security architecture aligned with system architecture.
- Apply security design principles (defense in depth, least privilege, etc.).
- Design security controls for identified threats and vulnerabilities.
- Document security design decisions and rationale.

##### 1.1.6.4. Secure Implementation

Implement security controls and practices during software development to ensure code quality and security.

###### 1.1.6.4.1. Secure Development

Apply secure coding practices and standards to minimize vulnerabilities in code.

- Follow secure coding guidelines and standards.
- Conduct code reviews with security focus.
- Use static analysis tools to detect security issues.
- Implement input validation and output encoding.

###### 1.1.6.4.2. Secure Development Environment

Establish a secure development environment to protect source code and build processes.

- Implement access controls for development tools and repositories.
- Use secure configuration management practices.
- Protect credentials and secrets.
- Monitor and log development environment activities.

##### 1.1.6.5. Cybersecurity Verification and Validation

Verify and validate that security controls are correctly implemented and effective.

###### 1.1.6.5.1. Cybersecurity Analysis and Testing

Conduct security analysis and testing to identify and address vulnerabilities before release.

###### 1.1.6.5.2. Security Testing

Perform various types of security testing to validate security controls.

- Conduct penetration testing to identify exploitable vulnerabilities.
- Perform vulnerability scanning and assessment.
- Execute security-focused test cases.
- Conduct fuzzing and dynamic analysis.

###### 1.1.6.5.3. Security Analysis

Analyze security properties and behavior of the system.

- Conduct security code reviews.
- Perform threat modeling and attack surface analysis.
- Execute static application security testing (SAST).
- Analyze security architecture and design.

##### 1.1.6.6. Secure Production and Distribution

Ensure security during production and distribution of software products.

###### 1.1.6.6.1. Secure Production

Implement security controls during the production phase.

- Protect production environments and processes.
- Implement code signing and integrity verification.
- Secure build and release pipelines.
- Conduct final security verification before release.

###### 1.1.6.6.2. Secure Distribution

Ensure secure distribution of software products to end users.

- Use secure distribution channels (HTTPS/TLS).
- Implement cryptographic signatures for software packages.
- Provide integrity verification mechanisms.
- Establish secure update mechanisms.

##### 1.1.6.7. Secure Decommissioning

Plan and execute secure decommissioning of products at end-of-life.

- Develop decommissioning procedures and timelines.
- Ensure secure deletion of user data.
- Provide migration paths or data export capabilities.
- Communicate end-of-life plans to users.
- Archive relevant documentation and records.

##### 1.1.6.8. Third-party Components

Manage security risks associated with third-party components and dependencies.

- Maintain inventory of third-party components (SBOM).
- Assess security risks of third-party components.
- Monitor for vulnerabilities in dependencies.
- Establish processes for updating third-party components.

###### 1.1.6.8.1. European Vulnerability Database

The European Vulnerability Database provides a centralized source of vulnerability information relevant to CRA compliance.

- Utilize the European Vulnerability Database for vulnerability information.
- Monitor database for vulnerabilities affecting products.
- Integrate database into vulnerability management processes.
- Report discovered vulnerabilities to the database.

### 1.2. References

This article references various CRA provisions and supporting standards:

1. Cyber Resilience Act (CRA)

    - CRA Articles: 3, 10, 13, 14, 15, 25, 27, 31, 52
    - CRA Annexes: I, II, VII
    - CRA Recitals: 18, 21, 32, 34, 40, 55, 64, 65, 77

2. Standards

    - DIN 40000 (multiple sections)
    - IEC 62443-4-1:2018
    - JT013090:2026
    - ISO 31000 (Risk Management)
    - Regulation (EU) 2019/881 (Cybersecurity Act)

3. Frameworks and Tools

    - STRIDE, DREAD (Threat Modeling)
    - CVSS, EPSS (Vulnerability Scoring)
    - CycloneDX, SPDX (SBOM Formats)
    - SLSA (Supply Chain Security)
    - Sigstore, in-toto (Attestation)

4. Related Concepts

    - CIA Triad (Confidentiality, Integrity, Availability)
    - MFA (Multi-Factor Authentication)
    - RBAC (Role-Based Access Control)
    - IAM (Identity and Access Management)
    - SAST/DAST (Static/Dynamic Application Security Testing)
    - CSIRT (Computer Security Incident Response Team)
    - ENISA (European Union Agency for Cybersecurity)
    - CVE (Common Vulnerabilities and Exposures)
    - NVD (National Vulnerability Database)
