# 017-ADR: Threat Modeling for ICS/Embedded Devices

Architectural Decision Records (ADR) on implementing Threat Modeling for Industrial Control Systems (ICS) and Embedded Devices.

- [1. State](#1-state)
- [2. Context](#2-context)
- [3. Decision](#3-decision)
  - [3.1. MITRE ATT\&CK for ICS](#31-mitre-attck-for-ics)
  - [3.2. MITRE EMB3D](#32-mitre-emb3d)
  - [3.3. TARA](#33-tara)
  - [3.4. IEC 62443](#34-iec-62443)
- [4. Considered](#4-considered)
  - [4.1. MITRE ATT\&CK for ICS](#41-mitre-attck-for-ics)
  - [4.2. MITRE EMB3D](#42-mitre-emb3d)
  - [4.3. TARA](#43-tara)
  - [4.4. IEC 62443](#44-iec-62443)
  - [4.5. STRIDE (adapted for ICS)](#45-stride-adapted-for-ics)
  - [4.6. Attack Trees](#46-attack-trees)
  - [4.7. CVSS](#47-cvss)
  - [4.8. OCTAVE Allegro](#48-octave-allegro)
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

### 3.3. TARA

Selected for its threat-agent-centric approach, which is particularly valuable in ICS/OT environments where adversary motivation and capability determine the credibility of threat scenarios. TARA provides a structured methodology for profiling realistic threat actors — including nation-states, insider threats, and cybercriminals targeting critical infrastructure — and translating those profiles into prioritized risk assessments.

1. Rationale

    - ICS/OT Threat Coverage
      > Enables profiling of ICS-relevant threat agents such as nation-state APT groups targeting operational technology, insider operators with privileged physical access, and supply chain adversaries.

    - Embedded Device Coverage
      > Supports assessment of threat agents motivated to target embedded device firmware, hardware supply chains, and proprietary industrial communication protocols.

    - Safety-Security Integration
      > Focuses threat analysis on adversaries with the capability and motivation to cause physical harm or safety system compromise, ensuring safety-critical scenarios receive appropriate priority.

    - Operational Continuity
      > Risk prioritization based on threat agent profiles allows security teams to focus mitigation effort on credible, high-impact agents while avoiding unnecessary disruption to operational processes.

    - Compliance Alignment
      > Provides documented threat agent assessments that support risk management evidence requirements under IEC 62443-3-2 security risk assessment and IEC 62443-4-1 product security development lifecycle.

    - Tooling and Community Adoption
      > Methodology is openly documented and applicable without specialized tooling, facilitating adoption by small OT security teams and embedded systems engineers.

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

### 4.5. STRIDE (adapted for ICS)

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

## 5. Consequences

- Positive

  - Comprehensive ICS/Embedded Coverage
    > Combining MITRE ATT&CK for ICS, MITRE EMB3D, TARA, and IEC 62443 provides layered coverage from enterprise OT network architecture through field device firmware, addressing all layers of the ICS attack surface.

  - Standards Alignment
    > Adoption of IEC 62443 as the governing architectural framework ensures that threat modeling outputs directly support compliance evidence for IEC 62443 certification and EU regulatory requirements.

  - Safety-Security Co-Engineering
    > Explicit consideration of safety-security integration through IEC 62443 guidance and ICS-specific threat categories enables concurrent safety and security analysis, reducing the risk of conflicting requirements.

  - Evidence-Based Threat Prioritization
    > TARA's adversary profiles combined with ATT&CK for ICS and EMB3D threat entries enable risk-based prioritization grounded in realistic attacker capabilities and observed ICS attack patterns.

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

3. Threat Agent Profiling with TARA

    Apply TARA to identify and profile threat agents relevant to the ICS environment, including nation-state APT groups, cybercriminal organizations, malicious insiders, and supply chain adversaries. For each agent, assess motivation and capability against the identified ICS assets to produce a prioritized threat agent risk register.

4. Threat Enumeration

    Use MITRE ATT&CK for ICS to enumerate adversary tactics and techniques applicable to the system-level architecture, mapping techniques to zones, conduits, and ICS components. Apply MITRE EMB3D to enumerate device-level threats for each embedded device based on its registered properties, covering Hardware, System Software, Application Software, and Networking threat categories.

5. Risk Assessment and Security Level Assignment

    Apply IEC 62443-3-2 risk assessment procedures to assign Target Security Levels (SL-T) to each zone and conduit based on the identified threats and threat agent risk profiles. Map EMB3D mitigations and ATT&CK for ICS countermeasures to the security requirements defined in IEC 62443-3-3 (system) and IEC 62443-4-2 (component).

6. Mitigation Planning

    Define a mitigation plan selecting EMB3D mitigations by maturity tier (Foundational, Intermediate, Leading) appropriate for each device's design constraints and operational context. Verify that selected mitigations do not conflict with functional safety requirements specified under applicable safety standards (e.g., IEC 61508, IEC 62061).

7. Integration into the Secure Development Lifecycle

    Integrate the threat modeling process into the product and system security development lifecycle as required by IEC 62443-4-1 practice SR-2 (Threat Modeling) and aligned with EU CRA security-by-design obligations. Establish a review cadence to update threat models when device properties, network architecture, or the relevant threat landscape changes.

## 7. References

- Sentenz [Threat Modeling](../articles/threat-modeling.md) article.
- Sentenz [003-ADR: Threat Modeling](003-adr-threat-modeling.md) decision.
- MITRE [ATT&CK for ICS](https://attack.mitre.org/matrices/ics/) page.
- MITRE [EMB3D](https://emb3d.mitre.org/) page.
- ISA/IEC [62443 Series of Standards](https://www.isa.org/standards-and-publications/isa-standards/isa-iec-62443-series-of-standards) page.
- NIST [SP 800-82 Rev. 3: Guide to OT Security](https://csrc.nist.gov/publications/detail/sp/800-82/rev-3/final) page.
- CISA [ICS Security](https://www.cisa.gov/topics/industrial-control-systems) page.
