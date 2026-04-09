# Threat Modeling

Threat modeling is a structured process for identifying, analyzing, and mitigating security threats to a system during design and development. It provides a systematic way to reason about adversarial conditions, expose potential vulnerabilities before they can be exploited, and drive security-aware architecture decisions throughout the software development lifecycle.

- [1. Benefits](#1-benefits)
- [2. Principles](#2-principles)
- [3. Framework](#3-framework)
  - [3.1. STRIDE](#31-stride)
  - [3.2. PASTA](#32-pasta)
  - [3.3. DREAD](#33-dread)
  - [3.4. LINDDUN](#34-linddun)
  - [3.5. OCTAVE](#35-octave)
  - [3.6. Attack Trees](#36-attack-trees)
  - [3.7. TARA](#37-tara)
  - [3.8. MITRE ATT\&CK](#38-mitre-attck)
- [4. Terminology](#4-terminology)
- [5. References](#5-references)

## 1. Benefits

- Proactive Defense
  > Threat modeling enables teams to identify and mitigate security risks early in the design phase, reducing the likelihood of vulnerabilities being introduced during development.

- Risidual Risk
  > TODO 

- Attack Surface Reduction
  > By identifying all entry points and data flows, threat modeling helps minimize the attack surface, reducing the number of potential vulnerabilities that can be exploited.

- Reduced Remediation Costs
  > Shifting security left reduces the expense of patching post-release vulnerabilities. Addressing a design flaw at the architecture stage avoids the compounding costs of rework, regression testing, and incident response.

- Compliance Alignment
  > Threat modeling satisfies the risk assessment requirements of frameworks such as ISO/IEC 27005, NIST SP 800-30, IEC 62443-3-2, and GDPR Article 25, providing documented evidence of security due diligence.

## 2. Principles

- Security by Design
  > Threat modeling embeds security thinking into architecture decisions rather than treating it as an afterthought. The result is systems where security controls are coherent with the design rather than bolted on.

- Least Privilege
  > Threat modeling identifies where excessive permissions or access rights exist, enabling the design of systems that operate with the minimum necessary privileges to reduce attack surface.

- Defense in Depth
  > By identifying multiple attack paths and potential mitigations, threat modeling promotes layered defenses that can prevent or mitigate attacks even if one control fails.

- CIA Triad
  > Threat modeling focuses on protecting the core security properties of Confidentiality, Integrity, and Availability, ensuring that mitigations are aligned with the specific risks to these properties.

- Parkerian Hexad
  > In addition to the CIA triad, threat modeling also considers the additional properties of Possession/Control, Authenticity, and Utility to provide a more comprehensive analysis of threats.

- Threat Actor Modeling
  > Understanding the motivations, capabilities, and typical behaviors of potential attackers informs which threats are most relevant and how they are likely to be realized.

- Risk-Based Prioritization
  > Threat modeling focuses on identifying and prioritizing the most significant risks to the system, enabling efficient allocation of security resources.

- Tactics, Techniques, and Procedures (TTPs)
  > Modeling realistic attack scenarios based on known adversary TTPs utilizing frameworks such as MITRE ATT&CK ensures that mitigations are effective against actual threats rather than hypothetical ones.

## 3. Framework

Threat modeling frameworks provide structured methodologies for systematically identifying, categorizing, and analyzing threats. The choice of framework depends on the system type, team expertise, and desired level of rigor.

### 3.1. STRIDE

STRIDE is a threat categorization model developed by Microsoft that classifies threats into six categories mapped to violated security properties. It is widely used during design reviews and is well-suited for analyzing individual components and trust boundaries in a Data Flow Diagram.

1. Concepts and Components

    | Threat Category        | Violated Property | Description                                                                  |
    | ---------------------- | ----------------- | ---------------------------------------------------------------------------- |
    | Spoofing               | Authentication    | Impersonating another user, process, or system to gain unauthorized access.  |
    | Tampering              | Integrity         | Unauthorized modification of data in transit, at rest, or in process.        |
    | Repudiation            | Non-repudiation   | Denying the performance of an action without the ability to prove otherwise. |
    | Information Disclosure | Confidentiality   | Exposure of data to unauthorized parties.                                    |
    | Denial of Service      | Availability      | Disrupting system availability by exhausting resources or crashing services. |
    | Elevation of Privilege | Authorization     | Gaining capabilities beyond those which were intended or authorized.         |

### 3.2. PASTA

PASTA (Process for Attack Simulation and Threat Analysis) is a seven-stage, risk-centric threat modeling methodology that aligns threat analysis with business objectives. It focuses on simulating real attacker behavior and quantifying risk in business terms, making it well-suited for enterprise environments where threat modeling must feed into risk management decisions.

1. Workflow and Stages

    - Define Objectives
      > Establish business and security objectives, compliance requirements, and acceptable risk thresholds.

    - Define Technical Scope
      > Enumerate technical components, infrastructure, and dependencies in scope for the analysis.

    - Application Decomposition
      > Decompose the application into components, data flows, trust boundaries, and entry/exit points using DFDs and architectural diagrams.

    - Threat Analysis
      > Identify relevant threat agents, threat communities, and attack scenarios using threat intelligence sources.

    - Vulnerability and Weakness Analysis
      > Map known vulnerabilities (CVEs, CWEs) to the decomposed system components to assess exploitability.

    - Attack Enumeration and Modeling
      > Construct attack trees and simulate viable attack paths to model how threats can be realized.

    - Risk and Impact Analysis
      > Quantify residual risk, prioritize threats by business impact, and recommend countermeasures.

### 3.3. DREAD

DREAD is a qualitative risk-scoring framework used to rank threats by assigning scores across five dimensions. It is commonly used alongside STRIDE to prioritize the threats identified in a model.

1. Workflow and Scoring

    > [!NOTE]
    > Each dimension is scored on a scale of 1–10. The overall DREAD score is the average of all five dimensions, with higher scores indicating higher priority threats.

    | Dimension       | Description                                                                  |
    | --------------- | ---------------------------------------------------------------------------- |
    | Damage          | How severe is the impact if the threat is exploited?                         |
    | Reproducibility | How easily can an attacker reproduce the exploit?                            |
    | Exploitability  | How much effort, skill, or tooling is required to exploit the vulnerability? |
    | Affected Users  | What proportion of users or systems are affected if the threat is realized?  |
    | Discoverability | How easily can an attacker detect and locate the vulnerability?              |

### 3.4. LINDDUN

LINDDUN is a privacy-focused threat modeling framework that categorizes threats against privacy requirements. It mirrors the structure of STRIDE but applies to privacy properties, making it applicable to systems processing personal data under regulations such as GDPR or CCPA.

1. Concepts and Components

    | Threat Category           | Violated Privacy Property | Description                                                                              |
    | ------------------------- | ------------------------- | ---------------------------------------------------------------------------------------- |
    | Linkability               | Unlinkability             | Connecting data or actions that should remain separate to identify or profile a subject. |
    | Identifiability           | Anonymity                 | Determining the identity of a data subject from available information.                   |
    | Non-repudiation           | Plausible Deniability     | Preventing a subject from denying involvement in a transaction or action.                |
    | Detectability             | Undetectability           | Inferring whether information about a subject exists within a system.                    |
    | Disclosure of Information | Confidentiality           | Revealing personal data to unauthorized parties.                                         |
    | Unawareness               | Transparency              | Limiting a subject's knowledge of how their data is collected and used.                  |
    | Non-compliance            | Compliance                | Failing to adhere to privacy policies, regulations, or user consent agreements.          |

### 3.5. OCTAVE

OCTAVE (Operationally Critical Threat, Asset, and Vulnerability Evaluation) is an organizational risk assessment framework developed by Carnegie Mellon University's CERT. It focuses on operational risk from a business perspective rather than purely technical threats, making it suitable for enterprise-wide security assessments.

1. Variants and Types

    - OCTAVE Original
      > The full methodology intended for large organizations. Involves self-directed security assessments by cross-functional teams using a structured set of workshops, processes, and catalogs.

    - OCTAVE-S
      > A streamlined variant designed for smaller organizations with limited resources. Uses a consolidated process with fewer phases and a smaller team.

    - OCTAVE Allegro
      > A simplified, asset-centric variant that focuses on information assets in their operational context without requiring extensive infrastructure analysis.

### 3.6. Attack Trees

Attack trees are a formal, hierarchical model for representing how an attacker can achieve a specific goal. The root node represents the attacker's objective, and child nodes represent sub-goals or conditions that must be met. Nodes are decomposed until they reach atomic attack steps.

1. Concepts and Components

    - AND Node
      > All child conditions must be satisfied for the parent goal to be achieved.

    - OR Node
      > Any one of the child conditions is sufficient for the parent goal to be achieved.

    - Leaf Node
      > Represents an atomic attack step that cannot be further decomposed.

### 3.7. TARA

TARA (Threat Agent Risk Assessment) is a methodology developed by Intel that identifies threat agents — individuals or groups with the motivation and capability to attack a system — and assesses the risk posed by each agent against specific assets. It focuses on the human dimension of threats and aligns risk analysis with realistic attacker profiles.

1. Workflow and Stages

    - Identify Assets
      > Enumerate the critical assets that require protection.

    - Identify Threat Agents
      > Define known threat agent archetypes such as nation-states, cybercriminals, insiders, hacktivists, and script kiddies.

    - Assess Threat Agent Risk
      > Evaluate each agent's intent, motivation, and capability against each asset to determine relative risk.

    - Select Countermeasures
      > Prioritize controls based on which threat agents pose the greatest risk to each asset.

### 3.8. MITRE ATT&CK

MITRE ATT&CK (Adversarial Tactics, Techniques, and Common Knowledge) is a globally accessible knowledge base of real-world adversary tactics and techniques based on observed cyberattacks. It provides a structured taxonomy that can be used in threat modeling to map realistic attack paths against system components.

1. Domains and Categories

    - Enterprise
      > Covers tactics and techniques targeting enterprise IT environments, including Windows, macOS, Linux, cloud platforms, and network infrastructure.

    - Mobile
      > Covers tactics and techniques targeting Android and iOS mobile platforms.

    - ICS
      > Covers tactics and techniques targeting industrial control systems (ICS) and operational technology (OT) environments.

2. Concepts and Components

    - Tactic
      > The adversary's tactical goal or objective, such as initial access, persistence, or exfiltration.

    - Technique
      > A specific method used by adversaries to achieve a tactic, such as spearphishing, credential dumping, or data staging.

    - Sub-technique
      > A more granular method that falls under a broader technique, providing additional detail on how an attack is executed.

## 4. Terminology

- Threat Modeling
  > A structured process for identifying, analyzing, and prioritizing security threats to a system with the goal of defining appropriate mitigations.

- Asset
  > Any resource of value that an attacker may target, including data, services, functionality, or system availability.

- Threat
  > A potential adverse event that could exploit a vulnerability and cause harm to an asset. A threat is defined by a threat agent, an attack vector, and a target.

- Threat Agent
  > An entity — human or automated — that has the intent, motivation, and capability to carry out an attack. Examples include cybercriminals, insiders, nation-states, and automated malware.

- Threat Actor
  > A specific individual, group, or organization that is responsible for a particular attack or set of attacks. Threat actors are often categorized by their motivations, capabilities, and typical targets.

- Threat Actor Model
  > A profile of a threat actor that includes their motivations, capabilities, typical attack methods, and known targets. Threat actor models inform the identification and prioritization of threats in a model.

- Vulnerability
  > A weakness or flaw in a system that can be exploited by a threat agent to violate security properties.

- Attack Vector
  > The path or mechanism by which a threat agent gains access to a target system to deliver an exploit.

- Attack Surface
  > The sum of all accessible entry points, interfaces, and data paths in a system that could be targeted by an attacker.

- Trust Boundary
  > A conceptual boundary in a system where data or control passes between entities operating at different trust levels. Trust boundaries are critical points of analysis in threat modeling.

- Data Flow Diagram (DFD)
  > A graphical representation of how data moves through a system, including processes, data stores, external entities, and the flows between them. DFDs are the primary input artifact for many threat modeling methodologies.

- Mitigation
  > A security control, design change, or operational measure that reduces the likelihood or impact of a specific threat.

- Risk
  > The potential for loss or harm defined as a combination of the likelihood that a threat is realized and the impact if it is. Risk = Likelihood × Impact.

- Residual Risk
  > The remaining risk after mitigations have been applied. Residual risk must be explicitly accepted or further mitigated.

- Accepted Risk
  > A risk that has been evaluated and consciously accepted by stakeholders because the cost of mitigation exceeds the expected impact or because the likelihood is deemed sufficiently low.

- Spoofing
  > An attack in which a threat agent impersonates a legitimate user, process, or system to gain unauthorized access or perform unauthorized actions.

- Tampering
  > Unauthorized modification of data in transit, at rest, or during processing, violating the integrity of the system.

- Repudiation
  > The ability of an actor to deny having performed an action, typically exploited when audit logs are absent or insufficient.

- Information Disclosure
  > Unauthorized exposure of sensitive or confidential data to parties who should not have access to it.

- Denial of Service (DoS)
  > An attack aimed at disrupting the availability of a system by overwhelming it with requests or exploiting resource exhaustion vulnerabilities.

- Elevation of Privilege (EoP)
  > An attack in which a threat agent gains capabilities or permissions beyond those explicitly granted, allowing unauthorized actions within the system.

- Threat Intelligence
  > Structured information about current or emerging threats, threat agents, and tactics used to inform threat identification and prioritization within a threat model.

- Attack Tree
  > A hierarchical diagram representing the steps required to achieve an attacker's goal, used to analyze and communicate complex attack scenarios.

- Countermeasure
  > A safeguard or control implemented to reduce the probability or impact of a specific threat being realized.

- STRIDE
  > A threat classification framework categorizing threats by the security property they violate: Spoofing, Tampering, Repudiation, Information Disclosure, Denial of Service, and Elevation of Privilege.

- PASTA
  > A risk-centric, seven-stage threat modeling methodology that aligns technical threat analysis with business risk objectives.

- DREAD
  > A risk scoring model that rates threats across five dimensions — Damage, Reproducibility, Exploitability, Affected Users, and Discoverability — to produce a quantitative priority score.

- LINDDUN
  > A privacy threat modeling framework that categorizes threats against privacy properties, analogous in structure to STRIDE.

- MITRE ATT&CK
  > A knowledge base of real-world adversary tactics, techniques, and procedures (TTPs) used to model and communicate realistic attack scenarios.

## 5. References

- OWASP [Threat Modeling](https://owasp.org/www-community/Application_Threat_Modeling) page.
- OWASP [Threat Modeling Cheat Sheet](https://cheatsheetseries.owasp.org/cheatsheets/Threat_Modeling_Cheat_Sheet.html) page.
- Microsoft [Threat Modeling](https://www.microsoft.com/en-us/securityengineering/sdl/threatmodeling) page.
- MITRE [ATT&CK](https://attack.mitre.org/) page.
- NIST [SP 800-30 Rev. 1](https://csrc.nist.gov/publications/detail/sp/800-30/rev-1/final) page.
- Carnegie Mellon SEI [OCTAVE](https://www.sei.cmu.edu/our-work/projects/display.cfm?customel_datapageid_4050=21274) page.
- ISO/IEC [27005](https://www.iso.org/standard/80585.html) page.
