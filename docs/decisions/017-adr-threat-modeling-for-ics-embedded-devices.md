# 017-ADR: Threat Modeling for ICS/Embedded Devices

Architectural Decision Records (ADR) on implementing Threat Modeling for Industrial Control Systems (ICS) and Embedded Devices.

- [1. State](#1-state)
- [2. Context](#2-context)
- [3. Decision](#3-decision)
  - [3.1. MITRE ATT\&CK for ICS](#31-mitre-attck-for-ics)
  - [3.2. MITRE EMB3D](#32-mitre-emb3d)
  - [3.3. STRIDE](#33-stride)
  - [3.4. IEC 62443](#34-iec-62443)
  - [3.5. MITRE CWE](#35-mitre-cwe)
- [4. Considered](#4-considered)
  - [4.1. MITRE ATT\&CK for ICS](#41-mitre-attck-for-ics)
  - [4.2. MITRE EMB3D](#42-mitre-emb3d)
  - [4.3. TARA](#43-tara)
  - [4.4. IEC 62443](#44-iec-62443)
  - [4.5. STRIDE](#45-stride)
  - [4.6. Attack Trees](#46-attack-trees)
  - [4.7. CVSS](#47-cvss)
  - [4.8. OCTAVE Allegro](#48-octave-allegro)
  - [4.9. PASTA](#49-pasta)
  - [4.10. DREAD](#410-dread)
  - [4.11. LINDDUN](#411-linddun)
  - [4.12. MITRE CWE](#412-mitre-cwe)
- [5. Consequences](#5-consequences)
- [6. Implementation](#6-implementation)
- [7. References](#7-references)

## 1. State

- Author(s): Sentenz
- Date: 2026-05-15
- Status: Proposed

## 2. Context

Industrial Control Systems (ICS) and embedded devices operate in environments where cybersecurity threats carry safety-critical consequences. Unlike general-purpose IT systems, ICS/OT environments prioritize availability and physical process integrity, and embedded devices introduce hardware-level attack surfaces — including firmware, bootloaders, and constrained communication interfaces — that standard IT threat models do not adequately address.

Selecting appropriate threat modeling frameworks is critical to identifying, assessing, and mitigating risks across ICS network architectures (zones and conduits), programmable logic controllers (PLCs), human-machine interfaces (HMIs), remote terminal units (RTUs), and the firmware and hardware of constrained embedded endpoints.

1. Decision Drivers

    - ICS/OT Threat Coverage
      > Ability to identify and categorize threats specific to industrial control system protocols, fieldbus networks, and operational technology environments where the CIA triad is inverted to prioritize availability.

    - Embedded Device Coverage
      > Ability to enumerate threats targeting hardware components, firmware, bootloaders, and constrained network interfaces of embedded devices across their full lifecycle.

    - Safety-Security Integration
      > Consideration of the intersection between cybersecurity threats and functional safety requirements, where a successful attack may trigger safety-critical physical consequences.

    - Operational Continuity
      > Frameworks must support threat analysis that accounts for high-availability constraints and the inability to patch or restart systems during production operations.

    - Compliance Alignment
      > Compatibility with IEC 62443, EU Cyber Resilience Act (CRA), and applicable sector-specific standards to support audit and certification requirements.

    - Tooling and Community Adoption
      > Availability of tooling, maintained knowledge bases, and community support within the OT and embedded security domain.

    - Risk-Based Prioritization
      > Frameworks should support quantitative or qualitative scoring of identified threats to enable prioritized mitigation planning aligned with the operational and safety risk profile of each ICS zone and embedded device.

    - Adversary-Centric Approach
      > Frameworks should incorporate threat actor profiling — including nation-state APTs, insiders, and supply chain adversaries — to ensure threat identification reflects the motivations and capabilities of realistic ICS attackers.

    - TTP-Based Approach (Tactics, Techniques, Procedures)
      > Frameworks should map identified threats to structured TTP taxonomies, enabling teams to reason about how adversaries operate within ICS and embedded environments and to detect or block specific attack steps.

## 3. Decision

### 3.1. MITRE ATT&CK for ICS

Selected for its structured, real-world-based taxonomy of adversary tactics and techniques targeting industrial control systems and operational technology environments. MITRE ATT&CK for ICS provides the most comprehensive and actively maintained reference for understanding how adversaries interact with ICS-specific assets such as PLCs, HMIs, engineering workstations, and field devices.

1. Rationale

    - ICS/OT Threat Coverage
      > Provides a dedicated ICS matrix with tactics and techniques drawn from real-world ICS incidents (e.g., TRITON, Industroyer, BlackEnergy), covering initial access through impact across ICS-specific targets.

    - Embedded Device Coverage
      > Includes techniques targeting control logic, firmware manipulation, and communication protocol exploitation relevant to embedded controllers and field devices.

    - Safety-Security Integration
      > Explicitly includes the Inhibit Response Function and Impair Process Control tactic categories that directly map to safety system manipulation and physical process disruption.

    - Operational Continuity
      > Covers techniques that adversaries use to remain persistent and stealthy in availability-sensitive OT environments, enabling analysts to model threats without disrupting production processes.

    - Compliance Alignment
      > Aligns with IEC 62443-3-3 security requirements and supports mapping of ATT&CK techniques to required countermeasures for compliance evidence.

    - Tooling and Community Adoption
      > Maintained by MITRE with a dedicated ICS matrix, ATT&CK Navigator support, and integration with leading ICS security platforms such as Claroty and Dragos.

    - Risk-Based Prioritization
      > Techniques include frequency and impact metadata, and ATT&CK Navigator supports heat-mapping and prioritization of techniques based on their observed prevalence in ICS incidents.

    - Adversary-Centric Approach
      > The Groups matrix maps techniques to named threat actor groups (e.g., Sandworm, XENOTIME) known to target ICS, enabling direct adversary-based threat scenario construction.

    - TTP-Based Approach (Tactics, Techniques, Procedures)
      > Structured as a TTP taxonomy with ICS-specific tactic categories and associated techniques, providing a native TTP language for ICS threat modeling and detection engineering.

### 3.2. MITRE EMB3D

Selected for its property-based approach to enumerating threats against embedded devices, enabling threat identification grounded in the specific hardware and software characteristics of a target device. MITRE EMB3D fills the gap between general ICS frameworks and hardware-level embedded device security by mapping device features directly to threats and tiered mitigations.

1. Rationale

    - ICS/OT Threat Coverage
      > Covers embedded devices deployed in critical infrastructure, industrial automation, automotive, healthcare, and manufacturing environments, providing ICS-relevant threat entries for field devices and controllers.

    - Embedded Device Coverage
      > Organizes threats into Hardware, System Software, Application Software, and Networking categories, enabling systematic enumeration of all attack surfaces present in a constrained embedded device.

    - Safety-Security Integration
      > Addresses threats to safety-critical device properties such as secure boot, memory protection, and hardware isolation mechanisms, which directly underpin functional safety guarantees.

    - Operational Continuity
      > Provides mitigation maturity tiers (Foundational, Intermediate, Leading) that allow organizations to select controls appropriate for devices that cannot tolerate downtime or significant design changes.

    - Compliance Alignment
      > Aligned with CWE and CVE, supporting evidence collection required under EU CRA for embedded devices and facilitating cross-referencing with IEC 62443-4-2 component security requirements.

    - Tooling and Community Adoption
      > Maintained by MITRE with an online knowledge base, structured threat and mitigation catalog, and alignment with the broader MITRE ATT&CK and CWE ecosystems.

    - Risk-Based Prioritization
      > Mitigation maturity tiers (Foundational, Intermediate, Leading) enable prioritization of controls based on device criticality and resource constraints, supporting incremental risk reduction.

    - Adversary-Centric Approach
      > Threat entries reference associated MITRE ATT&CK for ICS and ATT&CK Enterprise techniques, enabling correlation of device-level threats to the adversary groups and campaigns that exploit them.

    - TTP-Based Approach (Tactics, Techniques, Procedures)
      > Each threat entry describes the threat actor's required actions and associated CWE weaknesses, providing a TTP-grounded view of how specific device properties are exploited.

### 3.3. STRIDE

Selected for its systematic, category-driven threat classification that enables structured enumeration of threats across all ICS components, data flows, and trust boundaries using Data Flow Diagrams (DFDs). STRIDE provides a foundational threat identification methodology — covering Spoofing, Tampering, Repudiation, Information Disclosure, Denial of Service, and Elevation of Privilege — that integrates naturally with the IEC 62443 zones-and-conduits architecture model and serves as the primary threat classification layer for all subsequent risk-scoring and TTP-mapping activities.

1. Rationale

    - ICS/OT Threat Coverage
      > Systematically enumerates threats across six categories applicable to ICS data flows, trust boundaries, and components within zones-and-conduits architectures, providing complete structural threat coverage of the OT environment.

    - Embedded Device Coverage
      > DFD-based decomposition exposes threats at the communication boundaries and process interfaces of constrained embedded devices, including Tampering threats against device firmware and Spoofing threats against fieldbus identities.

    - Safety-Security Integration
      > The Tampering and Denial of Service categories map directly to process integrity threats and availability attacks with safety-critical consequences, enabling explicit safety-security co-analysis within the STRIDE enumeration process.

    - Operational Continuity
      > The Denial of Service category explicitly addresses availability threats at each ICS data flow and component, supporting systematic analysis of operational impact scenarios in high-availability OT environments.

    - Compliance Alignment
      > Aligns with IEC 62443 threat analysis requirements and supports structured threat identification evidence for compliance demonstrations under IEC 62443-3-2 and IEC 62443-4-1.

    - Tooling and Community Adoption
      > Broad tooling support including Microsoft Threat Modeling Tool and OWASP Threat Dragon, with extensive documentation and community adoption across both IT and ICS security domains.

    - Risk-Based Prioritization
      > STRIDE threat categories integrate with DREAD scoring and CVSS to support prioritized mitigation planning, enabling risk-ranked treatment of identified threats across ICS zones and embedded devices.

    - Adversary-Centric Approach
      > STRIDE categories can be mapped to attacker motivations and capabilities, enabling correlation of structural threats with threat actor profiles targeting ICS components across the identified trust boundaries.

    - TTP-Based Approach (Tactics, Techniques, Procedures)
      > STRIDE threat categories align with MITRE ATT&CK for ICS tactics, enabling cross-referencing between structural DFD-based threat analysis and TTP-based threat intelligence for detection and response engineering.

### 3.4. IEC 62443

Selected as the governing compliance and architectural framework for securing Industrial Automation and Control Systems (IACS). IEC 62443 provides the zones-and-conduits security architecture model, security levels, and product development lifecycle requirements that define the structural boundaries within which all other threat modeling activities are performed.

1. Rationale

    - ICS/OT Threat Coverage
      > Defines a security architecture model (zones, conduits, Purdue Reference Model alignment) that establishes the scope boundaries for threat modeling across the entire ICS network, from the enterprise zone to field devices.

    - Embedded Device Coverage
      > IEC 62443-4-2 specifies component-level security requirements for embedded devices, and IEC 62443-4-1 defines the secure product development lifecycle applicable to embedded firmware and hardware.

    - Safety-Security Integration
      > Addresses the co-engineering of security and functional safety requirements, referencing IEC 61508 and providing guidance on avoiding conflicts between safety instrumented systems and cybersecurity controls.

    - Operational Continuity
      > Security levels (SL 1–4) allow organizations to select and justify proportionate security controls that preserve operational continuity while meeting compliance targets.

    - Compliance Alignment
      > IEC 62443 is the primary international standard for IACS security, referenced by EU NIS2, EU CRA, and national critical infrastructure protection regulations globally.

    - Tooling and Community Adoption
      > Widely adopted by asset owners, system integrators, and product vendors with a broad ecosystem of certification bodies, assessment tools, and implementation guides maintained by ISA Global Cybersecurity Alliance (ISAGCA).

    - Risk-Based Prioritization
      > IEC 62443-3-2 provides a structured risk assessment process for assigning Target Security Levels (SL-T) to zones and conduits, ensuring mitigations are proportionate to the risk level of each ICS segment.

    - Adversary-Centric Approach
      > Security level assignment is informed by threat profiles of adversaries targeting the specific operational context, from opportunistic attackers (SL 1) to nation-state actors pursuing physical process disruption (SL 4).

    - TTP-Based Approach (Tactics, Techniques, Procedures)
      > IEC 62443-3-2 risk assessment integrates with MITRE ATT&CK for ICS TTPs to map security level requirements to the techniques adversaries use to achieve tactical objectives within ICS zones and conduits.

### 3.5. MITRE CWE

Selected as the foundational weakness taxonomy that underpins vulnerability identification, threat entry cross-referencing, and root cause analysis across all other selected frameworks. MITRE CWE provides the common language for classifying software and hardware weaknesses at the code and design level, and is directly referenced by MITRE EMB3D threat entries and CVE records, enabling a complete traceability chain from adversary tactic through technical weakness to mitigation.

1. Rationale

    - ICS/OT Threat Coverage
      > Maps software and hardware weaknesses to ICS-relevant vulnerability categories, enabling structured root cause classification for weaknesses identified across OT components, fieldbus interfaces, and field devices.

    - Embedded Device Coverage
      > Includes dedicated hardware weakness categories covering firmware, bootloader, memory protection, and hardware interface weaknesses relevant to constrained embedded devices, complementing the MITRE EMB3D threat enumeration.

    - Safety-Security Integration
      > CWE weakness entries document the technical root causes of vulnerabilities that can compromise safety-critical device properties, linking security weakness identification to functional safety impact analysis.

    - Operational Continuity
      > Identifies weaknesses that could lead to availability failures in OT environments, supporting weakness-level root cause analysis of denial-of-service risks and process disruption scenarios in ICS deployments.

    - Compliance Alignment
      > Referenced by EU CRA for vulnerability documentation and product security transparency, and used in IEC 62443-4-1 secure development lifecycle activities for weakness identification and remediation tracking.

    - Tooling and Community Adoption
      > Maintained by MITRE with broad integration across static analysis tools, vulnerability scanners, and the NVD/CVE ecosystem, with specific hardware and firmware CWE entries relevant to embedded security workflows.

    - Risk-Based Prioritization
      > CWE severity data and CVSS scores associated with CWE-mapped CVEs support risk-based prioritization of identified weaknesses, enabling prioritized treatment of the threats and vulnerabilities most relevant to ICS safety and availability.

    - Adversary-Centric Approach
      > CWE entries reference associated CVEs exploited in real-world attacks, enabling correlation of design weaknesses with adversary campaigns and techniques targeting ICS and embedded systems.

    - TTP-Based Approach (Tactics, Techniques, Procedures)
      > CWE weakness entries are cross-referenced with MITRE ATT&CK for ICS techniques and MITRE EMB3D threat entries, providing a complete TTP-to-weakness traceability chain from adversary tactic through technical root cause.

## 4. Considered

### 4.1. MITRE ATT&CK for ICS

[MITRE ATT&CK for ICS](https://attack.mitre.org/matrices/ics/) is a knowledge base of adversary tactics and techniques targeting industrial control systems and operational technology, derived from real-world ICS attack observations.

- Pros

  - ICS Specificity
    > Dedicated ICS matrix with tactics and techniques explicitly scoped to OT environments, including ICS-specific tactic categories such as Inhibit Response Function and Impair Process Control.

  - Real-World Basis
    > Techniques are derived from documented ICS incidents, ensuring the framework reflects the actual threat landscape for industrial environments.

- Cons

  - Integration Dependency
    > Does not provide a complete threat modeling methodology; requires integration with complementary frameworks for risk scoring and architectural threat enumeration.

  - Embedded Depth
    > Covers device-level techniques at a higher level of abstraction; does not enumerate hardware or firmware threats with the granularity provided by EMB3D.

### 4.2. MITRE EMB3D

[MITRE EMB3D](https://emb3d.mitre.org/) is a knowledge base of cyber threats and associated mitigations for embedded devices, organized by device properties and aligned with MITRE ATT&CK, CWE, and CVE.

- Pros

  - Property-Based Enumeration
    > Maps device hardware and software features directly to threats, enabling systematic threat enumeration based on the known properties of a specific device.

  - Tiered Mitigations
    > Provides mitigations categorized by maturity level (Foundational, Intermediate, Leading), supporting incremental security improvement in resource-constrained environments.

- Cons

  - Scope
    > Focused exclusively on embedded devices; does not address network-level ICS threats, zone architecture, or system-of-systems risks without complementary frameworks.

  - Maturity
    > Relatively new framework with a growing but still limited community and tooling ecosystem compared to established ICS security standards.

### 4.3. TARA

[TARA (Threat Agent Risk Assessment)](https://www.intel.com/content/www/us/en/developer/articles/technical/threat-agent-risk-assessment.html) is a methodology developed by Intel for identifying threat agents and assessing the risk each agent poses to specific assets based on motivation and capability.

- Pros

  - Adversary-Centric
    > Focuses risk analysis on realistic attacker profiles, ensuring threat models reflect credible adversaries rather than abstract threat categories.

  - Prioritization
    > Enables prioritized countermeasure selection by ranking threat agents according to their risk to each asset, reducing analysis paralysis from exhaustive threat enumeration.

- Cons

  - Identification Gap
    > Does not enumerate specific attack techniques or vulnerabilities; requires integration with technique-level frameworks such as MITRE ATT&CK for ICS and EMB3D.

  - Subjectivity
    > Threat agent risk scoring can be subjective and inconsistent without calibrated scoring criteria tailored to the organization's operational context.

### 4.4. IEC 62443

[IEC 62443](https://www.isa.org/standards-and-publications/isa-standards/isa-iec-62443-series-of-standards) is the international standard series for security of Industrial Automation and Control Systems, covering policies, system design, and component requirements across the IACS lifecycle.

- Pros

  - Architectural Scope
    > Provides a comprehensive security architecture model including zones, conduits, and security levels applicable to all layers of an ICS deployment.

  - Regulatory Recognition
    > Recognized by EU NIS2 and CRA, and mandated or referenced by national critical infrastructure regulations globally, providing a clear compliance pathway.

- Cons

  - Breadth and Complexity
    > The multi-part standard is extensive and requires significant investment to interpret and implement across all applicable series (IEC 62443-2-1, 3-2, 3-3, 4-1, 4-2).

  - Methodology Gap
    > Provides requirements and a risk assessment process but does not prescribe a detailed threat identification methodology, requiring supplemental threat modeling frameworks.

### 4.5. STRIDE

[STRIDE](https://learn.microsoft.com/en-us/azure/security/develop/threat-modeling-tool-threats) is a threat classification methodology developed by Microsoft that categorizes threats by the security property they violate: Spoofing, Tampering, Repudiation, Information Disclosure, Denial of Service, and Elevation of Privilege.

- Pros

  - Familiarity
    > Widely known methodology that enables teams with IT security backgrounds to begin ICS threat modeling without learning a new framework from scratch.

  - Systematic Coverage
    > Provides structured enumeration across all six threat categories applicable to ICS data flows, trust boundaries, and components.

- Cons

  - ICS Gap
    > Designed for IT software systems and does not natively address ICS-specific threat categories such as process manipulation, safety system inhibition, or physical equipment damage.

  - Availability Blind Spot
    > STRIDE's Denial of Service category inadequately represents the operational impact of availability-targeted attacks in ICS environments where process uptime is safety-critical.

### 4.6. Attack Trees

[Attack Trees](https://en.wikipedia.org/wiki/Attack_tree) are a conceptual threat modeling method that represents attacks as a hierarchical tree, with the attacker's goal as the root and alternative attack paths as branches.

- Pros

  - Visualization
    > Provides clear visual representation of complex multi-stage ICS attack paths, aiding communication among OT engineers, security teams, and management.

  - Flexibility
    > Applicable to any ICS component or subsystem without requiring adoption of a specific taxonomy or knowledge base.

- Cons

  - Scalability
    > Becomes difficult to maintain for large ICS deployments with many interdependent systems, zones, and attack paths.

  - Standardization
    > Lacks a standardized risk scoring or mitigation mapping mechanism, requiring integration with complementary frameworks for consistent risk communication.

### 4.7. CVSS

[CVSS (Common Vulnerability Scoring System)](https://www.first.org/cvss/) is an open framework for communicating the characteristics and severity of software vulnerabilities using a standardized numerical score.

- Pros

  - Standardization
    > Provides a universally recognized scoring method for communicating vulnerability severity across teams and to regulators.

  - Environmental Metrics
    > CVSS environmental scoring allows customization to reflect ICS-specific factors such as the criticality of affected control systems and the availability impact on operational processes.

- Cons

  - Identification Gap
    > Scores vulnerabilities after discovery; does not function as a threat identification or threat modeling methodology.

  - ICS Calibration
    > Base scores derived from IT vulnerability characteristics may not accurately reflect the disproportionate impact of moderate vulnerabilities in safety-critical ICS environments.

### 4.8. OCTAVE Allegro

[OCTAVE Allegro](https://www.sei.cmu.edu/our-work/projects/display.cfm?customel_datapageid_4050=53321) is a streamlined variant of the OCTAVE risk assessment framework focused on operational asset-centric risk evaluation, designed to be conducted with a small team without extensive organizational infrastructure.

- Pros

  - Asset-Centric
    > Centers analysis on operational assets, making it well-suited for ICS environments where the criticality of physical assets and control systems drives risk prioritization.

  - Accessibility
    > Simpler than the full OCTAVE methodology and executable by small teams, reducing resource barriers for OT organizations with limited security staffing.

- Cons

  - Technique Depth
    > Does not provide technique-level threat enumeration; requires supplemental frameworks to identify specific attack methods targeting ICS components or embedded devices.

  - ICS Community Adoption
    > Limited adoption within the OT and embedded security community compared to IEC 62443 and MITRE ATT&CK for ICS, resulting in fewer ICS-specific guidance resources.

### 4.9. PASTA

[PASTA (Process for Attack Simulation and Threat Analysis)](https://www.iriusrisk.com/resources-blog/pasta-threat-modeling-methodology) is a seven-stage, risk-centric threat modeling methodology that aligns threat analysis with business objectives and simulates real attacker behavior to quantify risk in business terms.

- Pros

  - Business Alignment
    > Connects technical threat analysis to business risk objectives and acceptable risk thresholds, supporting management communication and risk-based investment decisions.

  - Attack Simulation
    > Constructs attack trees and simulates viable attack paths to model how threats can be realized, providing concrete scenarios for ICS risk quantification.

- Cons

  - Complexity
    > Seven-stage methodology is resource-intensive and time-consuming, making it impractical for smaller OT teams or time-constrained embedded device security assessments.

  - ICS Specificity
    > Designed primarily for enterprise IT and application environments; does not natively address ICS-specific threat categories, OT network architecture, or embedded device hardware threats.

### 4.10. DREAD

[DREAD](https://owasp.org/www-community/Threat_Modeling_Process) is a qualitative risk-scoring framework that ranks threats by assigning scores across five dimensions — Damage, Reproducibility, Exploitability, Affected Users, and Discoverability — to prioritize identified threats.

- Pros

  - Prioritization
    > Provides a lightweight scoring mechanism to rank and compare identified threats, enabling teams to focus remediation effort on the highest-risk items.

  - Simplicity
    > Straightforward scoring model that can be applied alongside STRIDE or other threat identification frameworks without significant additional process overhead.

- Cons

  - Subjectivity
    > Scoring is qualitative and susceptible to inconsistency across analysts without calibrated criteria specific to ICS impact and availability consequences.

  - ICS Calibration
    > Default scoring dimensions do not account for ICS-specific impact factors such as physical process disruption, safety system inhibition, or cascading effects across interconnected control zones.

### 4.11. LINDDUN

[LINDDUN](https://linddun.org/) is a privacy threat modeling framework that systematically identifies and addresses privacy threats in software systems using a structured taxonomy of seven privacy threat categories.

- Pros

  - Privacy Focus
    > Addresses privacy threats systematically across seven categories, covering scenarios such as identifiability and non-compliance relevant to ICS systems processing operator data or connected to cloud platforms.

  - Structure
    > Structured methodology with supporting worksheets and data flow diagram-based analysis, enabling integration alongside security-focused ICS threat modeling frameworks.

- Cons

  - Scope
    > Focused exclusively on privacy threats; does not address the safety-critical, availability-focused, or hardware-level security threats characteristic of ICS and embedded device environments.

  - Relevance
    > Privacy threats are a secondary concern in most ICS deployments relative to process integrity, availability, and functional safety; applying LINDDUN without strong data-processing context yields limited actionable output.

### 4.12. MITRE CWE

[MITRE CWE (Common Weakness Enumeration)](https://cwe.mitre.org/) is a community-developed dictionary of software and hardware weaknesses that provides a common language for describing security weaknesses at the code and design level, used as a foundation for vulnerability identification, tool coverage assessment, and root cause analysis.

- Pros

  - Weakness Taxonomy
    > Provides a standardized catalog of software and hardware weaknesses enabling consistent root cause classification of vulnerabilities identified during threat modeling and security testing.

  - Cross-Framework Alignment
    > Directly referenced by MITRE EMB3D threat entries and CVE records, enabling seamless correlation between embedded device threat enumeration and underlying weakness categories.

- Cons

  - Scope
    > Catalogs weaknesses rather than threats or attack paths; functions as a complementary reference for root cause analysis rather than a standalone threat modeling methodology.

  - ICS Granularity
    > General-purpose weakness catalog requires filtering and contextualization to identify entries relevant to ICS-specific protocols, hardware constraints, and operational technology contexts.

## 5. Consequences

- Positive

  - Comprehensive ICS/Embedded Coverage
    > Combining MITRE ATT&CK for ICS, MITRE EMB3D, STRIDE, MITRE CWE, and IEC 62443 provides layered coverage from enterprise OT network architecture through field device firmware and root-cause weakness analysis, addressing all layers of the ICS attack surface.

  - Standards Alignment
    > Adoption of IEC 62443 as the governing architectural framework ensures that threat modeling outputs directly support compliance evidence for IEC 62443 certification and EU regulatory requirements.

  - Safety-Security Co-Engineering
    > Explicit consideration of safety-security integration through IEC 62443 guidance and ICS-specific threat categories enables concurrent safety and security analysis, reducing the risk of conflicting requirements.

  - Evidence-Based Threat Prioritization
    > STRIDE's systematic threat classification combined with ATT&CK for ICS techniques, EMB3D threat entries, and MITRE CWE weakness mappings enables risk-based prioritization grounded in structural threat analysis, observed ICS attack patterns, and technical root causes.

- Negative

  - Framework Complexity
    > Operating four complementary frameworks simultaneously requires clear scoping, defined handoff points, and trained personnel to avoid gaps or duplication between framework outputs.

  - Learning Curve
    > Teams transitioning from IT-centric security practices require dedicated training in ICS/OT threat modeling concepts, IEC 62443 architecture, and embedded hardware security fundamentals.

  - Documentation Overhead
    > Producing threat model artifacts across multiple frameworks increases documentation effort, particularly for organizations managing large ICS deployments with numerous zones and device types.

- Risks

  - Incomplete Device Property Mapping
    > MITRE EMB3D effectiveness depends on accurate enumeration of device properties; incomplete or inaccurate property descriptions may result in missed threat entries. Mitigation: establish a device property baseline process during initial product or system onboarding.

  - Framework Boundary Ambiguity
    > Overlapping coverage between MITRE ATT&CK for ICS and MITRE EMB3D at the field device layer may cause duplication or omission if boundaries are not explicitly defined in team guidelines. Mitigation: define a documented scope boundary assigning EMB3D to device-level analysis and ATT&CK for ICS to network and system-level analysis.

  - Standard Version Drift
    > IEC 62443 is published in multiple parts with independent revision cycles; applying mismatched versions across the series may introduce compliance gaps. Mitigation: maintain a version register for all applicable IEC 62443 parts and review alignment when new revisions are published.

## 6. Implementation

1. ICS Architecture Mapping

    Document the ICS network architecture using the IEC 62443 zones-and-conduits model, identifying all zones, conduits, trust boundaries, and the embedded devices and control systems operating within each zone. This architecture model serves as the primary input artifact for all subsequent threat modeling activities.

2. Device Property Baseline

    For each embedded device in scope, enumerate device properties using the MITRE EMB3D property taxonomy, covering physical hardware, network services and protocols, software, and firmware characteristics. Capture properties in a device register to enable consistent threat enumeration across the device fleet.

3. Threat Identification with STRIDE

    Apply STRIDE to each ICS component, data flow, and trust boundary identified in the architecture model, systematically enumerating threats across the six categories (Spoofing, Tampering, Repudiation, Information Disclosure, Denial of Service, Elevation of Privilege). Map identified threats to MITRE ATT&CK for ICS techniques and MITRE CWE weakness entries to establish traceability from structural threat analysis to adversary tactics and technical root causes.

4. Threat Enumeration

    Use MITRE ATT&CK for ICS to enumerate adversary tactics and techniques applicable to the system-level architecture, mapping techniques to zones, conduits, and ICS components. Apply MITRE EMB3D to enumerate device-level threats for each embedded device based on its registered properties, covering Hardware, System Software, Application Software, and Networking threat categories. Cross-reference identified threats and techniques with MITRE CWE entries to classify underlying weaknesses and support root cause analysis.

5. Risk Assessment and Security Level Assignment

    Apply IEC 62443-3-2 risk assessment procedures to assign Target Security Levels (SL-T) to each zone and conduit based on the identified STRIDE threats and ATT&CK for ICS techniques. Map EMB3D mitigations and ATT&CK for ICS countermeasures to the security requirements defined in IEC 62443-3-3 (system) and IEC 62443-4-2 (component).

6. Mitigation Planning

    Define a mitigation plan selecting EMB3D mitigations by maturity tier (Foundational, Intermediate, Leading) appropriate for each device's design constraints and operational context. Verify that selected mitigations do not conflict with functional safety requirements specified under applicable safety standards (e.g., IEC 61508, IEC 62061).

7. Integration into the Secure Development Lifecycle

    Integrate the threat modeling process into the product and system security development lifecycle as required by IEC 62443-4-1 practice SR-2 (Threat Modeling) and aligned with EU CRA security-by-design obligations. Establish a review cadence to update threat models when device properties, network architecture, or the relevant threat landscape changes.

## 7. References

- Sentenz [Threat Modeling](../articles/threat-modeling.md) article.
- Sentenz [003-ADR: Threat Modeling](003-adr-threat-modeling.md) decision.
- MITRE [ATT&CK for ICS](https://attack.mitre.org/matrices/ics/) page.
- MITRE [EMB3D](https://emb3d.mitre.org/) page.
- MITRE [CWE](https://cwe.mitre.org/) page.
- ISA/IEC [62443 Series of Standards](https://www.isa.org/standards-and-publications/isa-standards/isa-iec-62443-series-of-standards) page.
- NIST [SP 800-82 Rev. 3: Guide to OT Security](https://csrc.nist.gov/publications/detail/sp/800-82/rev-3/final) page.
- CISA [ICS Security](https://www.cisa.gov/topics/industrial-control-systems) page.
