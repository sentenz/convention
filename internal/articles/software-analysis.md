# Software Analysis

Software Analysis is the process of evaluating software systems structure, behavior, and quality. The purpose of software analysis is to identify potential issues, risks, applications to identify potential risks, improve quality and reliability, and ensure compliance with organizational policies and industry regulations.

- [1. Category](#1-category)
  - [1.1. Code Analysis](#11-code-analysis)
    - [1.1.1. Requirements Analysis](#111-requirements-analysis)
    - [1.1.2. Static Analysis](#112-static-analysis)
    - [1.1.3. Dynamic Analysis](#113-dynamic-analysis)
    - [1.1.4. Security Analysis](#114-security-analysis)
    - [1.1.5. Code Quality Analysis](#115-code-quality-analysis)
  - [1.2. Software Composition Analysis](#12-software-composition-analysis)
    - [1.2.1. Component Identification](#121-component-identification)
    - [1.2.2. Vulnerability Analysis](#122-vulnerability-analysis)
    - [1.2.3. License Compliance Analysis](#123-license-compliance-analysis)
    - [1.2.4. Bill of Materials (BOM)](#124-bill-of-materials-bom)
  - [1.3. Tools](#13-tools)
    - [1.3.1. Linter](#131-linter)
    - [1.3.2. Sanitizer](#132-sanitizer)
- [2. References](#2-references)

## 1. Category

### 1.1. Code Analysis

Code Analysis is a process of evaluating the quality and security of software source code. It involves examining the code for potential issues, including coding errors, performance problems, and security vulnerabilities.

Software analysis can be performed at various stages of the software development life cycle (SDLC), including during requirements analysis, design, coding, testing, and maintenance. In modern DevSecOps environment, code analysis has galvanized the [shift left](../about/software-testing.md#40-shift-left-testing) paradigm.

#### 1.1.1. Requirements Analysis

Requirements analysis is a crucial phase in the software development life cycle (SDLC) that involves understanding, documenting, and validating the requirements of a software system. The goal is to elicit and analyze user needs and expectations to ensure that the resulting software meets those requirements effectively.

Requirements analysis sets the foundation for the development process, guiding subsequent phases such as design, implementation, and testing. Conducting requirements analysis reduces the risk of scope creep, improves software quality, and delivers a product that meets stakeholder expectations.

Features of Requirements Analysis:

1. Elicitation

    This involves gathering requirements from stakeholders, including end-users, customers, and other relevant parties.

    Techniques for Requirements Elicitation:

    > NOTE Combination of techniques is often used to ensure comprehensive requirements elicitation. The choice of techniques should be tailored to the specific project and stakeholders involved, considering factors such as time constraints, project complexity, and availability of resources.

    - Interviews
      > One-on-one or group interviews with stakeholders are conducted to gather their perspectives, insights, and requirements. It allows for in-depth discussions, clarifications, and follow-up questions to understand their needs and expectations.

    - Questionnaires and Surveys
      > Questionnaires and surveys are useful for collecting a large amount of information from a wide range of stakeholders. They can be distributed electronically or in print format and enable stakeholders to provide their requirements in a structured manner.

    - Workshops and Focus Groups
      > These interactive sessions involve bringing together multiple stakeholders to collaborate, brainstorm, and discuss requirements. Workshops foster open communication, knowledge sharing, and consensus building among participants.

    - Observation
      > Observing users in their natural work environment can provide valuable insights into their tasks, workflows, and pain points. This technique helps in understanding the context of use and identifying requirements that might not be explicitly expressed by stakeholders.

    - Document Analysis
      > Analyzing existing documentation such as user manuals, business process documents, and system specifications can provide insights into current requirements or serve as a starting point for requirements gathering.

    - Use Cases and User Stories
      > Use cases and user stories are narrative descriptions of system behavior from an end-user perspective. They help capture functional requirements by describing specific interactions and scenarios in which the software will be used.

    - Ethnographic Studies
      > Ethnographic studies involve immersing analysts in the environment where the software will be used, enabling them to understand the users' needs, behaviors, and cultural context. This technique is particularly useful for gathering requirements in complex or specialized domains.

    - Brainstorming
      > Brainstorming sessions encourage creative thinking and idea generation. Participants freely share their requirements, ideas, and suggestions, fostering a collaborative environment that can lead to innovative solutions.

    - Protocols and JAD (Joint Application Development) Sessions
      > These structured sessions involve intensive collaboration between stakeholders, end-users, and development teams to elicit requirements, resolve conflicts, and reach consensus in a facilitated environment.

2. Requirements Documentation

    Once the requirements are elicited, they need to be documented in a clear and structured manner. This typically involves creating artifacts such as requirement documents, use cases, user stories, and process models. The documentation should capture functional requirements (what the software should do) as well as non-functional requirements (performance, security, usability, etc.).

3. Analysis and Prioritization

    The elicited requirements are then analyzed to identify any conflicts, inconsistencies, or missing information. It is important to ensure that the requirements are complete, consistent, and feasible.

    Techniques for Requirements Prioritization:

    - MoSCoW Method
      - Must-have
        > Requirements that are essential for the software system to be considered successful. They represent the core functionality or features that are crucial and must be implemented in the current version.
      - Should-have
        > Requirements that important but not critical for the current release. They are desirable features that would enhance the system usability or value.
      - Could-have
        > Requirements that are nice-to-have features that are desirable but not necessary for the current release. They provide additional functionality or benefits that can be considered if time and resources permit.
      - Won't-have (or Would-like-to-have)
        > Requirements that are explicitly agreed upon not to be included in the current release. They are typically deferred to future versions or not pursued at all due to resource constraints, time limitations, or other project constraints. Won't-have requirements are generally revisited and considered in subsequent releases or iterations.

    - Kano Model
      > The Kano model helps categorize requirements based on their impact on customer satisfaction. It classifies requirements into five categories: Must-be, One-dimensional, Attractive, Indifferent, and Reverse. Must-be requirements are basic expectations that must be met. One-dimensional requirements directly influence customer satisfaction. Attractive requirements are unexpected features that delight customers. Indifferent requirements have no significant impact, and Reverse requirements may have a negative impact if included.

4. Validation and Verification

    Requirements validation ensures that the documented requirements accurately reflect the stakeholders needs. Verification involves reviewing the requirements for clarity, correctness, and feasibility.

    Techniques for Requirements Validation and Verification:

    > NOTE Combination of techniques to validate and verify software systems, ensuring that they meet the specified requirements, function correctly, and adhere to quality standards. The selection of techniques depends on the nature of the software, project constraints, and the specific objectives of the validation and verification activities.

    - Reviews and Inspections
      > These techniques involve systematic examination of software artifacts, such as requirements documents, design specifications, source code, and test cases, to identify errors, inconsistencies, and quality issues. Reviews and inspections can be conducted by a team of stakeholders, developers, or independent reviewers.

    - Walkthroughs
      > In a walkthrough, the software artifacts are presented to stakeholders or subject matter experts who provide feedback and identify potential issues. It is a collaborative process where the presenter explains the software and receives input and suggestions for improvement.

    - Prototyping
      > Prototyping involves building a simplified or partial version of the software system to validate and refine the requirements. Users and stakeholders can interact with the prototype to provide feedback on its functionality, usability, and design, helping to refine and validate the requirements.

5. Requirements Traceability

    Establishing traceability links between requirements and other SDLC artifacts is important to track and manage changes. Traceability helps ensure that all requirements are addressed and provides a basis for impact analysis when changes occur.

6. Communication and Collaboration

    Effective communication and collaboration with stakeholders, developers, and other team members are crucial throughout the requirements analysis process. Clear channels of communication should be established, and feedback loops should be implemented to gather continuous input and address concerns.

#### 1.1.2. Static Analysis

Static analysis is a software analysis technique that examines software artifacts, such as source code, design documents, or models, without executing the program. It analyzes the structure, syntax, and semantics of the code to identify potential issues, vulnerabilities, and quality concerns. Static analysis helps detect defects, improve code quality, and ensure adherence to coding standards.

Static analysis can be performed manually by developers or using specialized software tools. The tools apply a set of predefined rules and algorithms to analyze the code and generate reports highlighting potential issues.

> NOTE Static analysis has limitations and may generate false positives or miss certain types of issues. Static analysis should be used in conjunction with other testing and analysis techniques to achieve a comprehensive assessment of software quality.

Features of Static Analysis:

1. Code Quality Analysis

    Static analysis tools can perform code quality checks to identify coding issues that might lead to bugs or make the code difficult to understand and maintain. This includes detecting coding violations, such as unused variables, dead code, inconsistent naming conventions, and potential memory leaks.

2. Bug Detection

    Static analysis tools can identify common coding errors, such as null pointer dereferences, array out-of-bounds access, and resource leaks. By analyzing the code paths and performing data flow analysis, they can detect potential defects and help improve code reliability.

3. Security Vulnerability Detection

    Static analysis is effective in identifying security vulnerabilities and weaknesses in the code that could be exploited by attackers. It can detect issues like SQL injection, cross-site scripting (XSS), buffer overflows, and insecure cryptographic practices. By analyzing the code for security flaws, static analysis helps developers address potential risks early in the development process.

4. Performance Analysis

    Static analysis tools can analyze the code and provide insights into potential performance bottlenecks and inefficiencies. This includes identifying expensive function calls, unnecessary memory allocations, or loops that could be optimized. By optimizing the code based on static analysis findings, developers can improve the software's overall performance.

5. Compliance and Standards Enforcement

    Static analysis can enforce coding standards and industry best practices by flagging violations during the analysis process. It helps ensure that the code adheres to specific coding guidelines, naming conventions, and other standards defined by the organization or industry.

6. Documentation and Visualization

    Static analysis tools often provide documentation and visual representations of the code structure, dependencies, and relationships. This can assist developers in understanding complex codebases, identifying architectural issues, and facilitating code reviews.

#### 1.1.3. Dynamic Analysis

Dynamic analysis is a software analysis technique that involves observing and analyzing the behavior of a software system during its execution. It helps uncover defects, validate functionality, memory leaks, assess performance, and understand system behavior under different conditions.

Executing the software and analyzing its runtime characteristics complement software analysis techniques and assists in delivering robust, reliable, and high-performing software applications.

Elemants of Dynamic Analysis:

1. Testing

    Dynamic analysis plays a crucial role in software testing. It involves designing and executing test cases to exercise the software system and observe its behavior. By comparing the actual results with expected outcomes, dynamic analysis helps identify bugs, logic errors, and functional issues. Various testing techniques, such as unit testing, integration testing, system testing, and acceptance testing, utilize dynamic analysis to validate the software against specified requirements.

2. Debugging

    Dynamic analysis is instrumental in the debugging process, which involves identifying, analyzing, and fixing software defects. By observing the program's execution flow, variable values, and error conditions, dynamic analysis helps pinpoint the root causes of issues and provides insights for troubleshooting and resolving them.

3. Performance Analysis

    Dynamic analysis techniques, such as profiling, are used to evaluate the performance characteristics of a software system. Profiling tools collect runtime data, such as method execution times, memory usage, and resource utilization, to identify performance bottlenecks, memory leaks, and inefficient algorithms. This information helps optimize the software for better efficiency and resource management.

4. Code Coverage Analysis

    Dynamic analysis can determine the extent to which the code is exercised during testing. Code coverage analysis measures the percentage of code statements, branches, or paths that are executed during testing. It helps assess the thoroughness of testing and identifies areas of the code that have not been adequately tested, potentially indicating gaps in test coverage.

5. Security Testing

    Dynamic analysis techniques are used to assess the security of software systems. This includes techniques like penetration testing, where the system is subjected to controlled attacks to identify vulnerabilities and potential security flaws. Dynamic analysis helps identify security weaknesses, such as input validation issues, privilege escalation, or access control vulnerabilities.

6. Performance Profiling

    Dynamic analysis can profile the runtime behavior of a software system to identify performance bottlenecks, memory leaks, and inefficiencies. Profiling tools collect data on function execution times, method calls, memory usage, and I/O operations. This information helps developers optimize the software for improved performance.

#### 1.1.4. Security Analysis

Security analysis is a software analysis technique focused on assessing the security posture of a software system. It involves identifying vulnerabilities, weaknesses, and potential risks in the software design, implementation, configuration, and deployment. The objective of security analysis is to uncover security flaws and recommend mitigations to protect the system against unauthorized access, data breaches, and malicious attacks.

The findings from security analysis are used to prioritize and address identified vulnerabilities through security patches, code fixes, configuration changes, and the implementation of additional security controls. It is an ongoing process that should be performed regularly to ensure that the software system remains secure and resilient to evolving threats.

Features of Security Analysis:

1. Threat Modeling

    Security analysis often starts with threat modeling, which involves identifying potential threats, attack vectors, and security risks to the software system. This helps in understanding the system's security requirements and designing appropriate security controls.

2. Penetration Testing

    Penetration testing, also known as ethical hacking, involves simulating real-world attacks to assess the security vulnerabilities of the software system. Skilled security professionals attempt to exploit weaknesses and gain unauthorized access to the system. The findings are then used to improve security measures and address identified vulnerabilities.

3. Vulnerability Assessment

    Vulnerability assessment involves scanning the software system for known security vulnerabilities and weaknesses. This includes using automated tools to identify common vulnerabilities, such as outdated software versions, misconfigurations, weak authentication mechanisms, or inadequate access controls.

4. Code Review

    Security analysis often includes reviewing the source code of the software system to identify coding errors and security vulnerabilities. Manual or automated code review techniques can be employed to check for common coding mistakes, such as input validation issues, SQL injection, cross-site scripting (XSS), buffer overflows, or insecure cryptographic practices.

5. Security Standards and Compliance

    Security analysis may involve evaluating the software system's compliance with security standards and regulations, such as the Payment Card Industry Data Security Standard (PCI DSS) or the General Data Protection Regulation (GDPR). This includes assessing the system's adherence to security best practices, privacy requirements, and industry-specific security guidelines.

6. Secure Design and Architecture Review

    Security analysis may involve evaluating the design and architecture of the software system to identify potential security weaknesses. This includes analyzing the security controls, access control mechanisms, data protection measures, and overall resilience of the system against various attack vectors.

7. Secure Configuration Assessment

    Security analysis may assess the security configuration of the software system and associated components. This includes reviewing configurations of databases, servers, firewalls, network devices, and other infrastructure components to ensure that they are appropriately configured and hardened against security threats.

#### 1.1.5. Code Quality Analysis

Code quality analysis is a software analysis technique that focuses on evaluating the quality of the source code of a software system. It involves assessing various aspects of the code, such as its structure, readability, maintainability, adherence to coding standards, and potential for defects. The objective of code quality analysis is to identify coding issues, improve the quality of the codebase, and facilitate long-term maintainability and extensibility.

Code quality analysis can be done manually through code reviews or using automated code analysis tools and linters. The tools scan the codebase, apply predefined rules and metrics, and generate reports highlighting areas of concern and improvement opportunities.

Conducting code quality analysis identifies and addresses coding issues early in the development process, leading to better code quality, maintainability, and long-term software sustainability.

1. Coding Standards and Best Practices

    Code quality analysis often involves enforcing and assessing adherence to coding standards and best practices. Coding standards define guidelines for code formatting, naming conventions, indentation, comments, and other coding style aspects. Tools and analysis techniques are used to check if the code follows the prescribed coding standards, which helps improve code consistency and readability.

2. Code Complexity

    Code quality analysis assesses the complexity of the code to identify areas that might be difficult to understand, test, or maintain. Code complexity metrics, such as cyclomatic complexity or nesting depth, provide quantitative measures of code complexity. High complexity can indicate a higher likelihood of bugs and decreased maintainability. By identifying complex code sections, developers can refactor or simplify them for better code quality.

3. Code Smells and Anti-patterns

    Code quality analysis helps identify code smells, which are indicators of potential design or implementation issues. Code smells include duplicated code, long methods, excessive dependencies, and improper use of language features. Detecting code smells helps in refactoring the code to improve its readability, maintainability, and extensibility. It also helps avoid anti-patterns, which are common but ineffective or harmful coding practices.

4. Unused Code and Dead Code

    Code quality analysis identifies unused code or dead code, which refers to code segments that are not executed or have no impact on the program's behavior. Removing unused or dead code helps reduce code clutter, improve performance, and enhance maintainability.

5. Dependencies and Coupling

    Code quality analysis examines the dependencies and coupling between code modules. High coupling and excessive dependencies can lead to code fragility and difficulties in making changes or enhancements. By analyzing the code for tight coupling and excessive dependencies, developers can identify areas where code modularization or decoupling is required.

6. Testability

    Code quality analysis considers the testability of the code, ensuring that it can be effectively and efficiently tested. It involves evaluating factors such as code modularity, separation of concerns, and the presence of clear interfaces and unit testability. Improving testability helps in achieving better test coverage and ease of test maintenance.

7. Documentation and Comments

    Code quality analysis assesses the presence and quality of code documentation and comments. Well-documented code improves understandability and maintainability, especially for future developers or maintainers. It ensures that the code's purpose, functionality, and usage are clearly explained.

### 1.2. Software Composition Analysis

[Software Composition Analysis (SCA)](https://snyk.io/series/open-source-security/software-composition-analysis-sca/) is a software analysis technique that focuses on identifying, analyzing and managing the composition of third-party and open-source software components used in a software system.

#### 1.2.1. Component Identification

Component identification involves identifying and cataloging the third-party and open-source components used in a software system. This process helps in gaining an understanding of the software's composition, tracking dependencies, and assessing the potential risks associated with the components.

Component identification captures relevant metadata about a component, such as version numbers, licenses, and any associated security vulnerabilities or patches. This information helps in subsequent steps of software composition analysis, such as vulnerability assessment and license compliance analysis.

Features of Component Identification:

1. Build and Dependency Management Tools

    Use tools like Maven, Gradle, or npm (for JavaScript projects) to examine the dependency configuration files and retrieve a list of dependencies explicitly declared in the project.

2. Package Managers

    If the software system uses a package manager, such as pip for Python, npm for JavaScript, or NuGet for .NET, inspect the package manifest files (e.g., requirements.txt, package.json, or .csproj) to obtain a list of installed dependencies.

3. Software Bill of Materials (SBOM)

    In some cases, software vendors or providers may provide a Software Bill of Materials, which is a formal list of components used in the software system. This document can be obtained from the vendor or generated using specialized tools.

4. Reverse Engineering

    If the source code or documentation is not readily available, reverse engineering techniques can be employed to identify components used in a software system. This involves decompiling binaries or inspecting runtime behavior to determine the components utilized.

#### 1.2.2. Vulnerability Analysis

Vulnerability analysis is a crucial step in software composition analysis that involves assessing the security vulnerabilities present in the third-party and open-source components used in a software system. The goal is to identify and understand potential weaknesses or flaws in the components that may be exploited by attackers.

Regular vulnerability analysis should be performed throughout the software development lifecycle to ensure that any new vulnerabilities or security issues are promptly addressed. Conducting vulnerability analysis mitigate the risks associated with the components used in their software systems and enhance the security posture.

Features of Vulnerability Analysis:

1. Vulnerability Databases

    Access well-known vulnerability databases, such as the National Vulnerability Database (NVD), Common Vulnerabilities and Exposures (CVE), or vendor-specific databases. These databases contain information about known vulnerabilities, including their severity, impact, and affected versions.

2. Component Mapping

    Match the identified components from the component identification step with the entries in the vulnerability databases. Determine if the components have any known vulnerabilities listed in the databases. Pay attention to the specific component versions and any associated patches or fixes provided by the component vendors.

3. Vulnerability Scanning Tools

    Utilize vulnerability scanning tools or automated analysis tools specifically designed for identifying vulnerabilities in software components. These tools can examine the software system and its components, comparing them against known vulnerability databases to identify any matches.

4. Security Bulletins and Advisories

    Monitor security bulletins and advisories released by component vendors or security organizations. These sources provide information about newly discovered vulnerabilities, patches, and recommended security practices. Stay updated on any security announcements related to the components used in the software system.

5. Risk Prioritization

    Evaluate the severity and potential impact of identified vulnerabilities. Prioritize the vulnerabilities based on factors such as the level of access required, the likelihood of exploitation, and the potential impact on the confidentiality, integrity, or availability of the software system.

6. Remediation and Mitigation

    Develop a plan to address the identified vulnerabilities. This may involve updating the components to the latest patched versions, applying recommended security configurations, or implementing additional security controls to mitigate the risks associated with the vulnerabilities.

7. [Security Analysis](#114-security-analysis)

    Security analysis techniques are used to identify vulnerabilities and weaknesses in software systems that could be exploited by attackers. This category includes techniques such as penetration testing, vulnerability scanning, code review for security flaws, and threat modeling.

#### 1.2.3. License Compliance Analysis

License compliance analysis is an process in software analysis that focuses on ensuring compliance with the licenses of third-party and open-source components used in a software system. It involves evaluating the licenses associated with the components to ensure that their usage aligns with the terms and conditions specified by the license agreements.

Conducting license compliance analysis ensures  legal obligations, maintain good relationships with the open-source community, and minimize the risks associated with license non-compliance.

> NOTE License compliance analysis is important to ensure legal and ethical usage of third-party and open-source components. Non-compliance with software licenses can result in legal issues, reputational damage, and complications in software distribution.

Features of License Compliance Analysis:

1. License Identification

    Identify the licenses associated with each component used in the software system. This information can be obtained from the component's documentation, source code files, or the component's project website. Look for license files (e.g., LICENSE.txt) or license statements within the source code headers.

2. License Classification

    Classify the licenses into different categories based on their terms and conditions. Common license categories include permissive licenses (e.g., MIT, BSD), copyleft licenses (e.g., GNU GPL), and reciprocal licenses (e.g., Apache License 2.0). Understand the obligations and restrictions imposed by each license category.

3. License Compatibility Analysis

    Analyze the compatibility of different licenses used in the software system. Identify potential conflicts or incompatibilities that may arise due to the combination of different licenses. Some licenses have specific requirements when combined with other licenses, and it's important to ensure that the software system's licenses can be harmonized.

4. License Obligations

    Review the specific obligations and requirements imposed by each license. This can include obligations to provide attribution, distribute source code modifications, or make certain disclosures. Ensure that the software system complies with these obligations and that the necessary actions are taken to fulfill them.

5. License Restrictions

    Identify any restrictions or limitations imposed by the licenses. For example, some licenses may restrict the use of the software for commercial purposes, require the release of modifications under the same license, or impose restrictions on the distribution of the software. Ensure that the software system's usage aligns with these restrictions.

6. License Compliance Tools

    Utilize automated tools or services designed to assist in license compliance analysis. These tools can scan the software codebase, identify the licenses used, and provide reports on license compliance status. They can help in identifying any potential non-compliance issues and simplifying the process of managing license obligations.

7. Remediation and Mitigation

    Develop a plan to address any license compliance issues that are identified. This may involve obtaining necessary permissions or licenses, ensuring proper attribution and notices, or considering alternative components with more suitable licenses. Take appropriate actions to rectify any non-compliance and bring the software system into full license compliance.

8. Ongoing Compliance Management

    Establish processes and practices to ensure ongoing license compliance. This includes maintaining an up-to-date inventory of component licenses, monitoring for changes or updates in license terms, and incorporating license compliance into software development and release workflows.

#### 1.2.4. Bill of Materials (BOM)

A Bill of Materials (BOM) is a comprehensive list or inventory of all the materials, components, parts, and sub-assemblies required to manufacture or build a product. It provides detailed information about each item, including its name, quantity, description, and sometimes additional attributes such as part numbers or suppliers. BOMs are commonly used in various industries, including manufacturing, engineering, construction, and software development.

BOMs enhances the ability of organizations to manage and reduce cyber risks throughout the software and hardware supply chain. It promotes transparency, collaboration, and effective risk mitigation in the context of software development, deployment, and operations.

Types of BOM:

1. Software Bill of Materials (SBOM)

    An SBOM is a comprehensive inventory of the components and dependencies used in a software system. It includes information about the software components, their versions, licenses, and dependencies. SBOMs are crucial for managing security, licensing, and overall risk associated with software supply chain management.

2. Software-as-a-Service Bill of Materials (SaaSBOM)

    An SaaSBOM is similar to an SBOM but specifically tailored for software-as-a-service (SaaS) offerings. It provides a detailed inventory of the components, services, and dependencies used in a SaaS solution. SaaSBOMs help customers understand the underlying components and potential risks associated with the SaaS service they are using.

3. Hardware Bill of Materials (HBOM)

    An HBOM is a list of all the components, parts, and materials required to manufacture a hardware product. It includes information about the electronic components, mechanical parts, packaging materials, and other hardware elements needed for production. HBOMs are commonly used in the manufacturing and electronics industries.

4. Operations Bill of Materials (OBOM)

    An OBOM is used in the context of operations management and supply chain management. It includes a list of materials, tools, equipment, and resources required to perform specific operational tasks or processes. OBOMs help in planning and managing the resources needed for efficient operations.

Standards of BOM:

1. OWASP CycloneDX

    [OWASP CycloneDX](https://cyclonedx.org/) emphasizes supply chain security and risk reduction. It provides advanced capabilities for creating BOMs that cover various aspects of the software stack, including software, SaaS, hardware, and operations.

    CycloneDX is designed to be extensible, allowing for the inclusion of additional metadata and information beyond the core BOM data. This flexibility enables organizations to customize and enhance the BOMs to meet their specific requirements.

    CycloneDX supports the generation of Vulnerability Disclosure Reports (VDR) and the exchange of Vulnerability Exploitability eXchange (VEX) information. These features enhance vulnerability management and facilitate timely remediation of security issues.

2. SPDX

    [SPDX](https://spdx.dev/) focuses on providing a standardized format for describing software components and their licenses. It aims to facilitate license compliance and software asset management by providing a common language for sharing and exchanging software package data.

    SPDX places a strong emphasis on capturing license information for each software component. It includes standardized license identifiers, license text, and other related licensing details. SPDX also supports the declaration of license conflicts and exceptions.

    SPDX is widely adopted and supported by various tools and systems in the software development ecosystem. It enables easy integration with build systems, package managers, and software repositories, facilitating the automation of BOM generation and license compliance checks.

Benefits of BOM:

1. License Compliance

    The BOM helps in identifying the licenses associated with each component and ensuring compliance with their terms and conditions. It allows organizations to understand the licensing requirements, obligations, and restrictions of the software components they use.

2. Vulnerability Management

    By maintaining an up-to-date BOM, organizations can track the versions of components and be aware of any known security vulnerabilities associated with them. This enables proactive vulnerability management and helps in mitigating risks.

3. Change Management

    The BOM provides visibility into the dependencies between components, allowing organizations to assess the impact of changes and plan accordingly. It helps in managing version upgrades, patches, or replacements of components.

4. Supply Chain Management

    BOMs are useful for managing relationships with component suppliers or vendors. They provide a centralized view of the components used and their associated suppliers, facilitating communication, support, and maintenance activities.

### 1.3. Tools

#### 1.3.1. Linter

A linter is a software tool that analyzes source code to identify and flag potential programming errors, coding standards violations, and other types of quality issues.

Commonly used linter tools are:

- ESLint
  > A popular JavaScript linter that supports various coding styles and helps enforce consistent coding practices.

- Pylint
  > A linter for Python code, designed to identify common programming errors and improve code quality.

- RuboCop
  > A linter for Ruby code that checks for coding style violations, security issues, and performance bottlenecks.

- Clang-Tidy
  > A linter for C++ code that uses Clang and LLVM libraries to identify potential coding issues and improve code quality.

- JSHint
  > A JavaScript linter that can be used in a variety of development environments, including web browsers and Node.js.

- golangci-lint
  > A linter tool for Go code, used to detect and fix coding errors, enforce coding conventions, and improve code quality in Go projects.

- Flake8
  > A Python linter that combines three existing linters into a single tool (PyFlakes, McCabe, and PEP 8).

- CSSLint
  > A linter for CSS code that checks for coding style violations, security issues, and performance bottlenecks.

#### 1.3.2. Sanitizer

A sanitizer is a software tool that is used to identify and remove or correct malicious or potentially dangerous content from data inputs, such as user-generated input in a web application.

Commonly used sanitizer tools are:

- HTMLPurifier
  > A PHP library that removes malicious code from HTML input, including XSS attacks and other types of malicious content.

- OWASP Java Encoder
  > A Java library that provides a comprehensive set of functions for encoding and escaping user input to prevent XSS attacks.

- Input Sanitizer
  > A JavaScript library that provides a simple and flexible API for sanitizing user input to prevent XSS attacks.

- Anti-Samy
  > An XML and XHTML sanitizer that removes malicious code from user input and ensures that the output is secure and well-formed.

- XSS-Sanitizer
  > A Python library that provides a simple API for sanitizing user input to prevent XSS attacks.

- Ruby Sanitizer
  > A Ruby library that provides a simple API for sanitizing user input, including functions for removing malicious code, encoding special characters, and removing dangerous attributes.

- sqlmap
  > An open-source tool that automates the process of identifying and exploiting SQL injection vulnerabilities in web applications.

Sanitizers are tools that help identify  detect bugs such as buffer overflows or accesses, dangling pointer or different types of undefined behavior at runtime and prevent security vulnerabilities in C/C++ code.

Commonly used sanitizer tools for C/C++ are:

- Address Sanitizer (ASan)
  > A tool that detects memory access errors, such as out-of-bounds memory accesses and use-after-free bugs, in C/C++ code.

- Undefined Behavior Sanitizer (UBSan)
  > A tool that detects undefined behavior, such as signed integer overflow and division by zero, in C/C++ code.

- Thread Sanitizer (TSan)
  > A tool that detects data races and other synchronization bugs in multithreaded C/C++ code.

- Memory Sanitizer (MSan)
  > A tool that detects uninitialized memory reads in C/C++ code.

- Control Flow Integrity (CFI)
  > A security mechanism that helps prevent code injection attacks by enforcing constraints on the flow of control in C/C++ code.

- Valgrind
  > A dynamic analysis tool that can be used to detect memory leaks, buffer overflows, and other types of programming errors in C/C++ code.

## 2. References

- Sentenz [Application Security Testing (AST)](../about/software-testing.md#41-application-security-testing) article.
