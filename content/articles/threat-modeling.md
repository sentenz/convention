# Threat Modeling

Threat modeling is a structured process for identifying, analyzing, and mitigating security threats to a system during design and development. It provides a systematic way to reason about adversarial conditions, expose potential vulnerabilities before they can be exploited, and drive security-aware architecture decisions throughout the software development lifecycle.

- [1. Benefits](#1-benefits)
- [2. Principles](#2-principles)
- [3. Category](#3-category)
  - [4.1. Threat Actors](#41-threat-actors)
    - [4.1.1. Nation-State Actors / Advanced Persistent Threats (APTs)](#411-nation-state-actors--advanced-persistent-threats-apts)
    - [4.1.2. Cybercriminals](#412-cybercriminals)
    - [4.1.3. Insider Threats](#413-insider-threats)
    - [4.1.4. Hacktivists](#414-hacktivists)
    - [4.1.5. Script Kiddies](#415-script-kiddies)
  - [4.2. Threat Frameworks](#42-threat-frameworks)
    - [4.2.1. STRIDE](#421-stride)
    - [4.2.2. PASTA](#422-pasta)
    - [4.2.3. DREAD](#423-dread)
    - [4.2.4. LINDDUN](#424-linddun)
    - [4.2.5. OCTAVE](#425-octave)
    - [4.2.6. Attack Trees](#426-attack-trees)
    - [4.2.7. TARA](#427-tara)
    - [4.2.8. MITRE ATT\&CK](#428-mitre-attck)
  - [4.3. Terminology](#43-terminology)
- [5. References](#5-references)

## 1. Benefits

- Proactive Defense
  > Threat modeling surfaces threats and attack paths during design, producing concrete findings, threat descriptions, affected assets, root causes, and recommended mitigations before they can be built into the system.

- Residual Risk Reduction
  > Applying mitigations systematically reduces residual risk to an acceptable level. Risks that persist after mitigation must be explicitly accepted by a named stakeholder, ensuring no unowned risk remains undocumented.

- Attack Surface Reduction
  > Mapping data flows and trust boundaries highlights unnecessary interfaces, open services, and over-privileged components that can be removed or hardened, directly lowering the set of exploitable targets.

- Reduced Remediation Costs
  > Identifying design-level issues early avoids the compounding costs of rework, regression testing, and incident response that arise when the same issues are discovered post-release.

- Compliance Support
  > Threat modeling produces documented risk assessments and mitigation decisions that support compliance with frameworks such as ISO/IEC 27005, NIST SP 800-30, IEC 62443-4-1, and GDPR Article 25.

- Improved Communication and Traceability
  > Threat modeling creates a shared record that links threats to mitigations, owners, and acceptance decisions, improving cross-team communication and providing an audit trail for future architecture reviews and security assessments.

## 2. Principles

- Security by Design
  > Threat modeling embeds security thinking into architecture decisions rather than treating it as an afterthought. The result is systems where security controls are integral to the design rather than retrofitted after the fact.

- Least Privilege
  > Threat modeling identifies where excessive permissions or access rights exist across users, services, and components, enabling the design of systems that operate with the minimum necessary privileges to limit the impact of a compromise.

- Defense in Depth
  > By identifying multiple attack paths and their corresponding mitigations, threat modeling promotes layered defenses so that no single point of failure exposes the system to an attacker.

- CIA Triad
  > Threat modeling classifies each identified threat by the security property it violates Confidentiality, Integrity, or Availability ensuring that mitigations directly address the specific risk to each property.

- Risk-Based Prioritization
  > Threat modeling ranks identified threats by likelihood and impact so that security effort is directed at the highest-priority risks first, rather than applied uniformly across all findings.

- Adversary-Centric Modeling
  > Threats are identified and analyzed from the attacker's perspective, grounded in realistic Tactics, Techniques, and Procedures (TTPs) drawn from knowledge bases such as MITRE ATT&CK, ensuring mitigations address actual attack paths rather than hypothetical ones.

## 3. Category

### 4.1. Threat Actors

Threat actors are individuals, groups, or organizations with the motivation and capability to carry out attacks against systems, data, or infrastructure.

| #   | Threat Actor       | Skill Level | Resources | Persistence | Detection Difficulty | Primary Motivation                                      | Common Targets                                                            | Typical TTPs                                                                               |
| --- | ------------------ | ----------- | --------- | ----------- | -------------------- | ------------------------------------------------------- | ------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------ |
| 1   | Nation-State / APT | Very High   | Very High | Very High   | Very High            | Espionage, Geopolitical Dominance, Strategic Objectives | Government, Defense, Critical Infrastructure, Research, Financial Systems | Zero-days, Supply Chain Attacks, Living-off-the-Land (LOTL), Lateral Movement, SIGINT      |
| 2   | Cybercriminal      | Low–High    | Low–High  | Low–High    | Low–High             | Financial Gain                                          | Individuals, SMBs, Enterprises, Banks, Healthcare                         | Ransomware-as-a-Service, Phishing, BEC, Carding, Credential Theft, Identity Fraud          |
| 3   | Insider Threat     | Low–High    | Low–High  | Low–High    | Very High            | Greed, Grievance, Coercion, or Negligence / Human Error | Employer's Sensitive Systems & Data                                       | Data Exfiltration, Sabotage, Privilege Abuse, Misconfiguration, Unauthorized Data Transfer |
| 4   | Hacktivist         | Low–Medium  | Low       | Low–Medium  | Low–Medium           | Political, Social, or Ideological Cause                 | Governments, Corporations, Media Outlets                                  | DDoS, Website Defacement, Doxing, Data Leaks                                               |
| 5   | Script Kiddie      | Low–Medium  | Low       | Low         | Low                  | Curiosity, Notoriety, Thrill, or Mischief               | Random / Opportunistic Systems                                            | Pre-built Exploit Kits, DDoS-for-Hire, Unauthorized Vulnerability Discovery, Defacement    |

#### 4.1.1. Nation-State Actors / Advanced Persistent Threats (APTs)

Nation-states are highly sophisticated threat actors with significant resources, often motivated by geopolitical objectives, espionage, or disruption. APTs are a subset of nation-state actors that conduct prolonged, targeted campaigns against specific organizations or sectors, often using custom malware and zero-day exploits to achieve their objectives.

#### 4.1.2. Cybercriminals

Cybercriminals are financially motivated threat actors who pursue illicit profit through ransomware, data theft, fraud, and account compromise. They range from individual opportunistic actors to structured groups that operate affiliate programs, sell access to compromised systems, and offer exploitation capabilities as commercial services.

#### 4.1.3. Insider Threats

Insiders are individuals with legitimate access to organizational systems who may cause harm through malicious intent, negligence, or compromise by an external party.

- Malicious Insiders
  > Deliberately exfiltrate data or sabotage systems for personal gain, grievance, or coercion.
  
- Negligent Insiders
  > Unintentionally expose sensitive data through misconfiguration, policy violations, or susceptibility to social engineering.
  
- Compromised Insiders
  > Manipulated or coerced by external threat actors to act on their behalf.

#### 4.1.4. Hacktivists

Hacktivists are ideologically motivated threat actors who target organizations to promote a cause or agenda, often through defacement, DDoS attacks, or data leaks.

#### 4.1.5. Script Kiddies

Script kiddies are low-skill threat actors who rely on pre-built exploit kits, publicly available scripts, and automated tools to conduct opportunistic attacks, typically motivated by curiosity, notoriety, or the thrill of unauthorized access rather than targeted objectives.

### 4.2. Threat Frameworks

Threat modeling provides structured methodologies for systematically identifying, categorizing, and analyzing threats. The choice of framework depends on the system type, team expertise, and desired level of rigor.

#### 4.2.1. STRIDE

STRIDE is a threat categorization model developed by Microsoft that classifies threats into six categories mapped to violated security properties. It is widely used during design reviews and is well-suited for analyzing individual components and trust boundaries in a Data Flow Diagram.

1. Concepts and Components

    | Threat Category        | Violated Property | Description                                                                                              |
    | ---------------------- | ----------------- | -------------------------------------------------------------------------------------------------------- |
    | Spoofing               | Authentication    | Impersonating another user, process, or system to gain unauthorized access.                              |
    | Tampering              | Integrity         | Unauthorized modification of data in transit, at rest, or in process.                                    |
    | Repudiation            | Non-repudiation   | Denying that an action was performed when the system lacks sufficient audit evidence to prove otherwise. |
    | Information Disclosure | Confidentiality   | Exposure of data to unauthorized parties.                                                                |
    | Denial of Service      | Availability      | Disrupting system availability by exhausting resources or crashing services.                             |
    | Elevation of Privilege | Authorization     | Gaining capabilities beyond those which were intended or authorized.                                     |

#### 4.2.2. PASTA

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

#### 4.2.3. DREAD

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

#### 4.2.4. LINDDUN

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

#### 4.2.5. OCTAVE

OCTAVE (Operationally Critical Threat, Asset, and Vulnerability Evaluation) is an organizational risk assessment framework developed by Carnegie Mellon University's CERT. It focuses on operational risk from a business perspective rather than purely technical threats, making it suitable for enterprise-wide security assessments.

1. Variants and Types

    - OCTAVE Original
      > The full methodology intended for large organizations. Involves self-directed security assessments by cross-functional teams using a structured set of workshops, processes, and catalogs.

    - OCTAVE-S
      > A streamlined variant designed for smaller organizations with limited resources. Uses a consolidated process with fewer phases and a smaller team.

    - OCTAVE Allegro
      > A simplified, asset-centric variant that focuses on information assets in their operational context without requiring extensive infrastructure analysis.

#### 4.2.6. Attack Trees

Attack trees are a formal, hierarchical model for representing how an attacker can achieve a specific goal. The root node represents the attacker's objective, and child nodes represent sub-goals or conditions that must be met. Nodes are decomposed until they reach atomic attack steps.

1. Concepts and Components

    - AND Node
      > All child conditions must be satisfied for the parent goal to be achieved.

    - OR Node
      > Any one of the child conditions is sufficient for the parent goal to be achieved.

    - Leaf Node
      > Represents an atomic attack step that cannot be further decomposed.

#### 4.2.7. TARA

TARA (Threat Agent Risk Assessment) is a methodology developed by Intel that identifies threat agents — individuals or groups with the motivation and capability to attack a system — and assesses the risk posed by each agent against specific assets. It focuses on the human dimension of threats and aligns risk analysis with realistic attacker profiles.

1. Workflow and Stages

    - Identify Assets
      > Enumerate the critical assets that require protection.

    - Identify Threat Agents
      > Define known threat agent archetypes such as nation-states, cybercriminals, insiders, hacktivists, and script kiddies.

    - Assess Threat Agent Risk
      > Evaluate each agent's motivation and capability against each asset to determine relative risk.

    - Select Countermeasures
      > Prioritize controls based on which threat agents pose the greatest risk to each asset.

#### 4.2.8. MITRE ATT&CK

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

### 4.3. Terminology

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
- Microsoft [Threat Modeling Fundamentals](https://learn.microsoft.com/en-us/training/paths/tm-threat-modeling-fundamentals/) page.
- MITRE [ATT&CK](https://attack.mitre.org/) page.
- NIST [SP 800-30 Rev. 1](https://csrc.nist.gov/publications/detail/sp/800-30/rev-1/final) page.
- Carnegie Mellon SEI [OCTAVE](https://www.sei.cmu.edu/our-work/projects/display.cfm?customel_datapageid_4050=21274) page.
- ISO/IEC [27005](https://www.iso.org/standard/80585.html) page.
