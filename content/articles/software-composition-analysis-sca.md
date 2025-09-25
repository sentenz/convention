# Software Composition Analysis (SCA)

[Software Composition Analysis (SCA)](https://snyk.io/series/open-source-security/software-composition-analysis-sca/) is a security and compliance practices focused on identifying, analyzing, and managing the open-source, third-party, and proprietary components in software systems.

> [!NOTE]
> Software Composition Analysis (SCA) is an essential aspect of [Cyber Supply Chain Risk Management (C-SCRM)](https://csrc.nist.gov/projects/supply-chain-risk-management) and in [Component Analysis](https://owasp.org/www-community/Component_Analysis).

- [1. Category](#1-category)
  - [1.1. Component Identification](#11-component-identification)
  - [1.2. Bill of Materials (BOM)](#12-bill-of-materials-bom)
    - [1.2.1. Formats](#121-formats)
      - [1.2.1.1. SPDX](#1211-spdx)
      - [1.2.1.2. CycloneDX](#1212-cyclonedx)
      - [1.2.1.3. SWID](#1213-swid)
    - [1.2.2. Types](#122-types)
      - [1.2.2.1. SBOM](#1221-sbom)
      - [1.2.2.2. SaaSBOM](#1222-saasbom)
  - [1.3. Policy Compliance](#13-policy-compliance)
    - [1.3.1. License](#131-license)
  - [1.4. Vulnerability Management](#14-vulnerability-management)
    - [1.4.1. Identification](#141-identification)
      - [1.4.1.1. CVE](#1411-cve)
    - [1.4.2. Scoring Systems](#142-scoring-systems)
      - [1.4.2.1. CVSS](#1421-cvss)
      - [1.4.2.2. EPSS](#1422-epss)
      - [1.4.2.3. CWE](#1423-cwe)
    - [1.4.3. Context and Reporting](#143-context-and-reporting)
      - [1.4.3.1. VEX](#1431-vex)
      - [1.4.3.2. VDR](#1432-vdr)
- [2. Terminology](#2-terminology)
- [3. References](#3-references)

## 1. Category

### 1.1. Component Identification

Component identification involves identifying and cataloging the third-party and open-source components used in a software system. This process helps in gaining an understanding of the software's composition, tracking dependencies, and assessing the potential risks associated with the components.

Component identification captures relevant metadata about a component, such as version numbers, licenses, and any associated security vulnerabilities or patches. This information helps in subsequent steps of software composition analysis, such as vulnerability assessment and license compliance analysis.

1. Tools and Frameworks

    - [Build Systems](../articles/build-systems.md)
      > Build systems such as `Maven`, `Gradle` and `CMake` can be used to create a list of the components used in a software system such as SBOM. These tools typically maintain a manifest file containing information about the components and their dependencies. The manifest file can be used to identify the components used in the software system.

    - [Dependency Manager](../articles/dependency-manager.md)
      > Dependency managers such as `pip`, `npm` and `vcpkg` can be used to identify the components used in a software system such as SBOM. These tools maintain a manifest file containing information about the components and their dependencies. The manifest file can be used to identify the components used in the software system.

    - [Package Manager](../articles/package-manager.md)
      > Package managers such as `apt`, `yum` and `Homebrew` can be used to identify the components used in a software system such as SBOM. These tools maintain a manifest file containing information about the components and their dependencies. The manifest file can be used to identify the components used in the software system.

### 1.2. Bill of Materials (BOM)

A Bill of Materials (BOM) is a comprehensive list or inventory of all the materials, components, parts, and sub-assemblies required to manufacture or build a product. It provides detailed information about each item, including its name, quantity, description, and sometimes additional attributes such as part numbers or suppliers.

BOM enhance the ability of organizations to manage and reduce cyber risks throughout the software and hardware supply chain. It promotes transparency, collaboration, and effective risk mitigation in the context of software development, deployment, and operations.

#### 1.2.1. Formats

##### 1.2.1.1. SPDX

[SPDX (Software Package Data Exchange)](https://spdx.dev/) is a standard for exchanging software package metadata. It defines a common format for describing software components and their associated licenses, copyrights, and security vulnerabilities.

1. Conventions and Standards

    - [ISO/IEC 5962:2021](https://www.iso.org/standard/81870.html)
      > ISO/IEC 5962:2021, also known as the SPDX® Specification, is a standard that defines a data format for communicating the component and meta information about software packages.

2. Tools and Frameworks

    - [SPDX Open Source Tools](https://spdx.dev/use/tools/open-source-tools/)
      > Lists of Open Source tools that support SPDX.

    - [SPDX Online Tools](https://tools.spdx.org/app/)
      > An portal to upload and parse SPDX documents for validation, comparison and conversion and search SPDX license list.

##### 1.2.1.2. CycloneDX

[CycloneDX](https://cyclonedx.org/) is a standard for exchanging software component and dependency information. It defines a common format for describing software components and their associated dependencies, licenses, and security vulnerabilities. CycloneDX is often used in conjunction with SPDX to provide a comprehensive view of the software components used in a system.

1. Tools and Frameworks

    - [CycloneDX Tool Center](https://cyclonedx.org/tool-center/)
      > The CycloneDX Tool Center is a community effort to establish a marketplace of free, open source, and proprietary tools and solutions that support the CycloneDX specification.

##### 1.2.1.3. SWID

[SWID (Software Identification)](https://nvd.nist.gov/products/swid) tags are XML files that provide a standardized format for identifying software components. They include information such as the software name, version, and publisher. SWID tags are often used in conjunction with SPDX to provide a comprehensive view of the software components used in a system.

1. Conventions and Standards

    - [ISO/IEC 19770-2:2015](https://www.iso.org/standard/65666.html)
      > ISO/IEC 19770-2:2015 establishes specifications for tagging software to optimize its identification and management.

#### 1.2.2. Types

##### 1.2.2.1. SBOM

**SBOM (Software Bill of Materials)** is a structured, machine-readable inventory that lists all components, dependencies, and libraries contained within a software application. SBOM serves as a supply chain transparency mechanism, enabling organizations to understand precisely the present, originate, and what risks of software elements may introduce.

1. Tools and Frameworks

    - [Trivy SBOM](https://aquasecurity.github.io/trivy/v0.51/docs/supply-chain/sbom/)
      > Trivy is a comprehensive vulnerability scanner and can generate a Software Bill of Materials (SBOM) in CycloneDX or SPDX format.

    - [Syft](https://github.com/anchore/syft)
      > Syft is an open-source tool for analyzing software components and identifying their licenses, dependencies and generating a BOM (Bill of Materials), and security vulnerabilities.

    - [SBOMAudit](https://github.com/anthonyharrison/sbomaudit)
      > Reports the quality of the contents of an SBOM by performing checks including [SPDX](https://spdx.github.io/spdx-spec/) and `CycloneDX` standards.

    - [SBOMMerge](https://github.com/anthonyharrison/sbommerge)
      > Merges two SBOM documents together including `SPDX` and `CycloneDX` standards.

##### 1.2.2.2. SaaSBOM

**SaaSBOM (Software-as-a-Service Bill of Materials)** is designed for cloud-hosted and service-based applications. SaaSBOM provides visibility into the software components, service dependencies and operational elements that constitute a SaaS offering. It addresses the unique characteristics of dynamic, service-delivered environments.

### 1.3. Policy Compliance

Policy compliance involves ensuring that the use of third-party and open-source components in a software system adheres to organizational policies and regulatory requirements. This includes verifying that the components are used in accordance with their **licenses**, assessing the **security** risks associated with the **operational** components, and enforcing policies related to component usage.

#### 1.3.1. License

License compliance is an process in software analysis that focuses on ensuring compliance with the licenses of third-party and open-source components used in a software system. Detects declared and undeclared licenses, assesses compatibility, and enforces organizational policies to mitigate legal and operational risks.

> [!NOTE]
> Refer [Software License](../articles/software-license-guide.md) for details.

1. Benefits and Feature

    - [Licenses](../articles/licenses.md)
      > Licenses are legal agreements that define the terms and conditions for using a software component. They specify the permissions, obligations, and restrictions associated with the component. Licenses are often categorized as `permissive` or `copyleft`. Permissive licenses allow the software to be used in proprietary software, while copyleft licenses require that the software be distributed under the same license terms.

2. Conventions and Standards

    - [SPDX License](https://spdx.org/licenses/)
      > The SPDX License is a list of commonly found licenses, Identifiers and exceptions used in free and open-source software. Identifiers are unique identifiers for licenses listed in the SPDX License. It provides a standardized format for identifying and communicating the licenses associated with software components.

3. Tools and Frameworks

    - [Trivy License](https://aquasecurity.github.io/trivy/v0.51/docs/scanner/license/)
      > Trivy is a comprehensive vulnerability scanner and can provide license compliance information.

    - [License Classifier](https://github.com/google/licenseclassifier)
      > The license classifier from Google is a library and tool to analyze text to determine the type of license. It searches for license texts in a file and compares them to an archive of known licenses. E.g. LICENSE files with a single or multiple licenses, or source code files with the license text in a comment.

    - [FOSSology](https://www.fossology.org/)
      > FOSSology is an open-source tool for analyzing software components and identifying their licenses. It can scan source code files, archives, and binary files to identify the licenses associated with the components. It also provides a web-based interface for viewing and managing the license information.

### 1.4. Vulnerability Management

Processes, standards, and scoring mechanisms used to identify, assess, and prioritize security risks in components.

#### 1.4.1. Identification

##### 1.4.1.1. CVE

CVE (Common Vulnerabilities and Exposures) is the globally catalog of publicly disclosed cybersecurity vulnerabilities. A CVE entry provides a unique identifier (CVE ID) and a standardized description of a specific vulnerability in software, hardware, or firmware.

1. Components and Features

    - Vulnerability Databases
      > Access well-known vulnerability databases, such as the `NVD`, `CVE`, or vendor-specific databases. These databases contain information about known vulnerabilities, including their severity, impact, and affected versions.

    - [Risk Management](../articles/risk-management.md)
      > Evaluate the severity and potential impact of identified vulnerabilities. Prioritize the vulnerabilities based on factors such as the level of access required, the likelihood of exploitation, and the potential impact on the confidentiality, integrity, or availability of the software system.

    - [Security Analysis](../articles/software-analysis.md)
      > Security analysis techniques are used to identify vulnerabilities and weaknesses in software systems that could be exploited by attackers. This category includes techniques such as penetration testing, vulnerability scanning, code review for security flaws, and threat modeling.

2. Conventions and Standards

    - [CVE](https://cve.mitre.org/)
      > CVE (Common Vulnerabilities and Exposures) is a Vulnerability Databases with a standardized naming convention for identifying and tracking vulnerabilities in software and hardware systems. The CVE entry includes a unique identifier, a description of the vulnerability, and any relevant references. CVE entries are widely used in the cybersecurity community to communicate and share information about security vulnerabilities. CVE identifiers are integrated into security tools and databases for automated vulnerability scanning and management.

    - [NVD](https://nvd.nist.gov/)
      > NIST **NVD (National Vulnerability Database)** is a Vulnerability Databases that provides a centralized source for vulnerability information, enabling organizations to assess and address vulnerabilities in components.

3. Tools and Frameworks

    - [Trivy](https://trivy.dev/)
      > Trivy is a comprehensive vulnerability scanner. It's capable of scanning for vulnerabilities within OS distributions, libraries, and application dependencies.

    - [OWASP Dependency-Check](https://owasp.org/www-project-dependency-check/)
      > OWASP Dependency-Check is an open-source tool for identifying known vulnerabilities in software components. It can scan source code files, archives, and binary files to identify the components used and check them against the `NVD` and other vulnerability databases. It also provides a web-based interface for viewing and managing the vulnerability information.

    - [OSV](https://github.com/google/osv.dev)
      > OSV is a Google-based vulnerability database and triage infrastructure for open source projects.

      > [!NOTE]
      > Refer [OSV documentation](https://google.github.io/osv.dev/) for details.

#### 1.4.2. Scoring Systems

Vulnerability scoring systems such as CVSS, EPSS, and CWE are methods or frameworks used to assess and quantify the severity and potential impact of security vulnerabilities in software, hardware, or systems.

##### 1.4.2.1. CVSS

**CVSS (Common Vulnerability Scoring System)** is an open, standardized framework for assessing the severity of software and hardware vulnerabilities. It provides a numerical score (ranging from 0.0 to 10.0) and a qualitative severity rating (Low, Medium, High, Critical) to help organizations prioritize remediation efforts.

1. Conventions and Standards

    - [FIRST CVSS](https://www.first.org/cvss/)
      > FIRST CVSS is a community-driven effort to develop a standardized approach for scoring the severity of vulnerabilities. It provides a common language for discussing and sharing information about vulnerabilities, enabling organizations to prioritize their remediation efforts. CVSS is developed and maintained by the **Forum of Incident Response and Security Teams (FIRST)**

2. Tools and Frameworks

    - [FIRST CVSS Calculator](https://www.first.org/cvss/calculator/3.1)
      > The CVSSv3.1 calculator allows users to calculate the CVSS score for a given vulnerability based on the CVSSv3.1 specification. It provides a user-friendly interface for inputting the relevant metrics and generating the overall severity score.

    - [NIST CVSS Calculator](https://nvd.nist.gov/vuln-metrics/cvss)
      > The National Institute of Standards and Technology (NIST) provides a CVSS calculator that allows users to calculate the CVSS score for a given vulnerability. The calculator takes into account various factors such as the base, temporal, and environmental scores to provide an overall severity rating.

##### 1.4.2.2. EPSS

**EPSS (Exploit Prediction Scoring System)** is a data-driven framework designed to estimate the probability that a given software vulnerability will be exploited in the real world. EPSS focuses on likelihood of exploitation, enabling precise vulnerability prioritization. Provides a score between 0 and 1 (or 0–100%), representing the likelihood of exploitation within a specific time frame (commonly 30 days).

1. Conventions and Standards

    - [FIRST EPSS](https://www.first.org/epss/)
      > FIRST EPSS is a community-driven effort to develop a standardized approach for predicting the likelihood of a vulnerability being exploited. EPSS is developed and maintained by the **Forum of Incident Response and Security Teams (FIRST)**

2. Tools and Frameworks

    - [OWASP Dependency-Track](https://docs.dependencytrack.org/)
      > OWASP Dependency-Track is an **Component Analysis** intelligence platform that allows organizations to identify and reduce risk in the software supply chain.

    - [FIRST EPSS Tools](https://www.first.org/epss/epss_tools)
      > FIRST EPSS provides a list of tools and resources for estimating the exploitability of vulnerabilities.

##### 1.4.2.3. CWE

**CWE (Common Weakness Enumeration)** is a community-developed taxonomy of software and hardware weaknesses that can lead to security vulnerabilities. CWE provides a higher-level classification system describing the underlying flaw types that cause those vulnerabilities.

1. Conventions and Standards

    - [CWE](https://cwe.mitre.org/)
      > The CWE is a community developed list of software and hardware weakness types. CWE provides a standardized way to identify and categorize vulnerabilities, enabling security issues to be better understood, communicated and resolved.

2. Tools and Frameworks

    - [OWASP Dependency-Track](https://docs.dependencytrack.org/)
      > OWASP Dependency-Track is an **Component Analysis** intelligence platform that allows organizations to identify and reduce risk in the software supply chain.

    - [cwe-tool](https://github.com/OWASP/cwe-tool)
      > The `cwe-tool` is a command-line tool that provides access to the `CWE` database. It allows users to search for specific weaknesses, view detailed information about each weakness, and identify relationships between different weaknesses.

#### 1.4.3. Context and Reporting

##### 1.4.3.1. VEX

**VEX (Vulnerability Exploitability eXchange)** is a standardized format for communicating whether specific vulnerabilities—typically identified by CVE IDs, are exploitable in the context of a given product, service, or environment. VEX addresses a common challenge in vulnerability management, not every CVE listed against a component actually impacts a consuming system.

1. Conventions and Standards

    - [OpenVEX](https://github.com/openvex)
      > OpenVEX is an implementation of the `VEX` designed to be minimal, compliant, interoperable, and embeddable. OpenVEX is complementary to **Software Bill of Materials (SBOM)**, allowing suppliers to communicate precise metadata about the vulnerability status of products directly to consumers and end users.

    - [CycloneDX VEX](https://cyclonedx.org/capabilities/vex/)
      > CycloneDX VEX is a standard for exchanging vulnerability exploitability information. It defines a common format for describing the exploitability of known vulnerabilities affecting software components and their associated dependencies.

    - [NTIA VEX](https://www.ntia.gov/files/ntia/publications/vex_one-page_summary.pdf)
      > `VEX` is championed by the United States **National Telecommunications and Information Administration (NTIA)** and supported by the **Cybersecurity Infrastructure Security Agency (CISA)**.

2. Tools and Frameworks

    - [go-vex](https://github.com/openvex/go-vex)
      > Generating, consuming, and operating on VEX documents.

    - [vexctl](https://github.com/openvex/vexctl)
      > create, transform and attest VEX metadata.

    - [OWASP Dependency-Track](https://docs.dependencytrack.org/)
      > OWASP Dependency-Track is an **Component Analysis** intelligence platform that allows organizations to identify and reduce risk in the software supply chain.

    - [VulnDB](https://vulndb.flashpoint.io/)
      > VulnDB is a comprehensive and timely vulnerability intelligence source. It provides detailed information about known vulnerabilities, including their severity, impact, and affected versions. VulnDB is widely used by organizations to stay informed about security risks and take proactive measures to mitigate them.

##### 1.4.3.2. VDR

**VDR (Vulnerability Disclosure Report)** is a structured format for communicating the details of a discovered vulnerability between security researchers, vendors, and end users. Its purpose is to standardize disclosure practices, ensuring that all relevant technical and remediation information is conveyed in a consistent and actionable manner.

1. Conventions and Standards

    - [NIST SP 800-161](https://csrc.nist.gov/pubs/sp/800/161/r1/final)
      > The National Institute of Standards and Technology (NIST) recommends the use of `VDRs` in their Special Publication 800-161 on **Cybersecurity Supply Chain Risk Management (C-SCRM)** Practices.

    - [CycloneDX VDR](https://cyclonedx.org/capabilities/vdr/)
      > CycloneDX VDR is a standard for exchanging vulnerability disclosure information. It defines a common format for describing known vulnerabilities affecting software components and their associated dependencies.

2. Tools and Frameworks

    - [OWASP Dependency-Track](https://docs.dependencytrack.org/)
      > OWASP Dependency-Track is an **Component Analysis** intelligence platform that allows organizations to identify and reduce risk in the software supply chain.

## 2. Terminology

Software Composition Analysis (SCA) involves several key terminologies that are essential to understanding and implementing effective security practices in relation to third-party and open-source components.

- Component
  > A software entity, such as a library, framework, or module, that is used as part of a larger software application.

- Dependency
  > A relationship between components where one component relies on another to provide specific functionality.

- Vulnerability
  > A weakness in a component that could be exploited to compromise the security of a software application.

- License Compliance
  > Ensuring that the use of third-party components aligns with the legal and licensing requirements associated with those components.

- Risk Assessment
  > The process of evaluating the potential security risks associated with using specific components within a software application.

- Bill of Materials (BOM)
  > A list that details all the components and their versions used in a software application.

- NVD (National Vulnerability Database)
  > TODO

- CVE (Common Vulnerabilities and Exposures)
  > A publicly disclosed identifier for vulnerabilities, providing a standardized way to reference and share information about security vulnerabilities.

- CVSS (Common Vulnerability Scoring System)
  > A framework for rating vulnerability severity based on impact and exploitability.

- EPSS (Exploit Prediction Scoring System)
  > A probabilistic model estimating the likelihood that a vulnerability will be exploited in the wild.

- CWE (Common Weakness Enumeration)
  > A taxonomy of common software weaknesses and design flaws that lead to vulnerabilities.

- VEX (Vulnerability Exploitability eXchange)
  > A standardized mechanism to communicate whether specific vulnerabilities affect a given product in context.

- VDR (Vulnerability Disclosure Report)
  > A structured method for publishing and sharing vulnerability disclosures across stakeholders.

- Policy Enforcement
  > The process of defining and enforcing organizational policies regarding the use of specific components, versions, or licenses.

- Remediation
  > The process of addressing and fixing identified vulnerabilities or issues within a software application.

- Continuous Monitoring
  > The ongoing process of monitoring and assessing components for vulnerabilities, especially in the context of continuous integration/continuous deployment (CI/CD) pipelines.

- Open Source Software (OSS)
  > Software with source code that is made available to the public, allowing users to view, modify, and distribute the code.

- Software Supply Chain
  > The process of assembling and integrating third-party components into a software application, akin to a supply chain in traditional manufacturing.

- Versioning
  > Assigning unique identifiers to different releases or versions of a component to track changes and updates.

- Repository
  > A centralized location where software components, such as libraries or modules, are stored and managed for distribution.

## 3. References

- Sentenz [Software License Guide](../articles/software-license-guide.md) article.
