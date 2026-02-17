# Software Development Guide

Software development refers to the design, documentation, programming, testing, and maintenance of a software deliverable. The combination of these steps are used to create a workflow pipeline, a sequence of stages that when followed produce high-quality software deliverables. This pipeline is known as the Software Development Life Cycle (SDLC).

- [1. Category](#1-category)
  - [1.1. Software Development Life Cycle](#11-software-development-life-cycle)
    - [1.1.1. Discover](#111-discover)
    - [1.1.2. Plan](#112-plan)
    - [1.1.3. Code](#113-code)
    - [1.1.4. Build, Test and Release](#114-build-test-and-release)
    - [1.1.5. Deploy](#115-deploy)
    - [1.1.6. Operate](#116-operate)
    - [1.1.7. Observe](#117-observe)
    - [1.1.8. Security](#118-security)
  - [1.2. Key Features](#12-key-features)
    - [1.2.1. Agile](#121-agile)
    - [1.2.2. XOps](#122-xops)
    - [1.2.3. Continuous Pipelines](#123-continuous-pipelines)
    - [1.2.4. Software Architecture](#124-software-architecture)
- [2. References](#2-references)

## 1. Category

### 1.1. Software Development Life Cycle

The Software Development Life Cycle (SDLC) is a systematic approach to software development that consists of various phases and activities. Each phase has specific goals and deliverables, and it provides a structured framework for managing and controlling the software development process.

#### 1.1.1. Discover

Projects are envisioned, designed, and prioritized.

Features of Discover:

1. [Process Principles](../articles/software-design-principles.md#13-process-principles)

    - [Agile](../articles/software-design-principles.md#133-agile)

      - [Scrum](../articles/software-design-principles.md#136-scrum)
        > Scrum is an Agile framework for managing and delivering complex projects. It provides a flexible and iterative approach to software development that focuses on delivering value to customers through regular product increments. Scrum promotes collaboration, transparency, and adaptability, allowing teams to respond quickly to changing requirements and market dynamics.

      - [Extreme Programming](../articles/software-design-principles.md#137-extreme-programming)
        > Extreme Programming (XP) is an agile methodology that focuses on producing high-quality software through iterative and incremental development. It emphasizes collaboration, customer involvement, and continuous feedback.

2. [Software Analysis](../articles/software-analysis.md)

    - [Requirements Analysis](../articles/software-analysis.md#111-requirements-analysis)
      > Requirements analysis sets the foundation for the development process, guiding subsequent phases such as design, implementation, and testing. Conducting requirements analysis reduces the risk of scope creep, improves software quality, and delivers a product that meets stakeholder expectations.

3. [Architecture Decision Records](../articles/architecture-decision-records.md)

    Architecture Decision Records (ADR) captures the key options available, the main requirements that drive a decision, and the design decisions themselves.

#### 1.1.2. Plan

Stakeholders are identified, budgets set, and infrastructure requisitioned. Design documents from the concept phase are broken down into actionable tasks.

Features of Plan:

1. Software Architecture Description

    A software architecture description provides an overview and detailed documentation of the architecture of a software system. It describes the structure, components, relationships, and behavior of the software system, enabling developers, architects, and stakeholders to understand and communicate the design decisions and principles underlying the system.

2. [Software Development Environment](../articles/software-development-environment.md)

    - [Development Environment](../articles/software-development-environment.md#11-development-environment)
      > This environment is used for developing, testing and debugging software applications. It provides the necessary resources for developers to write code and create new features.

3. Dependency Manager

    Dependency managers automate the process of acquiring, installing and managing the dependencies of a software project. They ensure that the necessary dependencies are available and compatible with each other, eliminating the need to manually download, configure and track external libraries, frameworks, modules or packages.

4. Build System

    A build system is a software tool or framework that automates the process of compiling source code into executable software or other target artifacts. It helps manage the dependencies, configurations, and tasks required to build a software project.

5. [Project Layout](../articles/project-layout.md)

    Project layout refers to the arrangement of files, folders, and other resources within a project. A well-designed project layout can improve the organization, readability, and maintainability of the project's codebase.

6. Software Architectural Patterns

    - Component-Driven Development (CDD)
      > Component-Driven Development (CDD) is an approach to software development that emphasizes the construction of applications by composing modular, reusable components. It focuses on building and integrating self-contained, loosely coupled components as the primary building blocks of an application.

7. [Branching Strategies](../articles/branching-strategies.md)

    Branching strategies are used in software development team to manage concurrent work and organize code changes within a version control system. They define how developers collaborate on different features, bug fixes, and releases while maintaining stability and minimizing conflicts.

8. Merging Strategies

    Merging strategies are used in a version control system to combine changes into a single cohesive version.

#### 1.1.3. Code

Development teams work to build production-ready software that meets requirements and feedback.

Features of Code:

1. Coding

    - [Comment](../articles/comment.md)
      > Comment styles and tags are used to providing code context and documentation, and annotate code with additional information for improving code quality and maintainability.

    - [App Resources](../articles/app-resources.md)
      > App resources refer to the various assets and components utilized by an application, such as images, icons, sounds, videos, and other media files, as well as configuration files, database connections, external API endpoints, and managing static strings and magic numbers.

    - [Feature Toggles](../articles/feature-toggles.md)
      > Feature toggles are a software development technique that enables developers to turn on and off certain features or functionality of an application or service.

    - [Software Design Principals](../articles/software-design-principles.md)
      > Software design patterns are general reusable solutions to common software design problems that have been proven effective over time. Design patterns provide a way to organize and structure software code in a way that is easily maintainable, scalable, and extensible.

    - Software Design Patterns
      > Software design patterns are general reusable solutions to common software design problems that have been proven effective over time. Design patterns provide a way to organize and structure software code in a way that is easily maintainable, scalable, and extensible.

    - Software Architectural Patterns
      > Software architectural patterns are high-level design templates or solutions that provide a structured approach for organizing and designing software systems. Architectural patterns offer proven solutions to recurring design problems and help architects and developers build scalable, maintainable, and robust software applications.

2. [Software Testing](../articles/software-testing.md)

    - [Test-Driven Development](../articles/software-testing.md#121-test-driven-development)
      > Test-Driven Development (TDD) is a software development approach that emphasizes writing automated tests before writing the actual code. TDD is based on the idea that writing tests first can lead to better code quality, better design, and improved overall software development processes.

    - [Testing Patterns](../articles/software-testing.md#11-testing-patterns)
      > Testing patterns are reusable techniques to common testing problems that can be used to improve the effectiveness of software testing. They allow to organize and structure test code in a way that is maintainable, scalable, and extensible.

    - [Unit Testing](../articles/software-testing.md#1314-unit-testing)
      > Unit testing focuses on testing individual components of the software, such as classes or functions, to ensure that they work as expected. This type of testing is performed during the development phase and is an important part of the software development process.

    - [Fuzz Testing](../articles/software-testing.md#1315-fuzz-testing)
      > Fuzz testing is a type of testing that involves sending random or malformed inputs to the software in an attempt to find defects. It helps identify any security or reliability issues that may occur in the software, and helps ensure that the software is robust and resilient.

    - [Test Double](../articles/software-testing.md#124-test-double)
      > Test Double is a concept from software testing and is used in the context of writing unit tests. It refers to a type of test-specific object that is used to replace a real component or collaborator within a test scenario. The purpose of using Test Doubles is to isolate the unit being tested from its dependencies or collaborators, ensuring that the test evaluates only the behavior of the unit itself.

3. [Everything as Code (XaC)](../articles/everything-as-code.md)

    Everything as Code (XaC) is a software development philosophy that treats infrastructure as code.
  
    - [Infrastructure-as-Code (IaC)](../articles/everything-as-code.md#11-infrastructure-as-code)

      Infrastructure-as-Code (IaC) involves managing and provisioning infrastructure resources (e.g. virtual machines, networks, storage) through code, rather than using manual processes to configure devices or systems.

    - [Configuration-as-Code (CaC)](../articles/everything-as-code.md#12-configuration-as-code)
      > In Configuration-as-Code (CaC) application and system configurations are represented as code, treating application config resources as versioned artifacts to manage and deploy consistent configurations across different environments.

    - [Documentation-as-Code (DaC)](../articles/everything-as-code.md#13-documentation-as-code)
      > Documentation-as-Code (DaC) involves writing documentation as code, allowing teams to manage documentation in version-controlled repositories and automate documentation generation.

4. [Software Analysis](../articles/software-analysis.md)

    - [Static Analysis](../articles/software-analysis.md#112-static-analysis)
      > Static analysis is a software analysis technique that examines software artifacts, such as source code, design documents, or models, without executing the program. It analyzes the structure, syntax, and semantics of the code to identify potential issues, vulnerabilities, and quality concerns. Static analysis helps detect defects, improve code quality, and ensure adherence to coding standards.

    - [Dynamic Analysis](../articles/software-analysis.md#113-dynamic-analysis)
      > Dynamic analysis is a software analysis technique that involves observing and analyzing the behavior of a software system during its execution. It helps uncover defects, validate functionality, memory leaks, assess performance, and understand system behavior under different conditions.

5. [Commit](../articles/commit.md)

    Conventional Commits is a commit message convention that provides a standardized and structured format for commit messages in software development projects. It aims to make commit messages more readable, informative, and useful for both humans and automated tools.

6. [Technical Dept](../articles/technical-dept.md)

    Technical debt refers to the accumulated consequences of shortcuts, suboptimal solutions, and compromises made during the development process of software. Technical debt can lead to increased complexity, reduced maintainability, decreased productivity, and higher costs in the future.

#### 1.1.4. Build, Test and Release

A reliable system is resilient to failures and meets its documented service level objectives, which may also include security guarantees. CI/CD pipelines ensure an efficient developer experience.

Features of Build:

1. [Continuous Pipelines](../articles/continuous-pipelines.md)

    - [Continuous Integration](../articles/continuous-pipelines.md#12-continuous-integration)
      > Continuous Integration (CI) refers to the practice of automating the process of integrating code changes from multiple developers into a single version control repository. This process typically involves building and testing the code changes as soon as they are committed to the repository, and providing feedback to developers on the quality and stability of their changes. The goal of CI is to catch issues early in the development process and promote collaboration among team members.

    - [Continuous Build](../articles/continuous-pipelines.md#15-continuous-build)
      > Continuous Build refers to the practice of automatically building and compiling software applications and systems, whenever changes are committed to the source code repository. This can involve automating the process of building, compiling, and packaging software, and can help organizations to ensure that software is always up-to-date and ready for deployment. Continuous Build helps to speed up the software development process, reduce errors and inconsistencies, and improve the overall efficiency of software development and deployment.

Features of Test:

1. [Continuous Pipelines](../articles/continuous-pipelines.md)

    - [Continuous Testing](../articles/continuous-pipelines.md#16-continuous-testing)
      > Continuous Testing refers to the practice of automating the process of testing code changes throughout the software development lifecycle. This process typically involves the use of test automation tools and scripts that run automatically as code changes are committed, built, and deployed. Continuous Testing helps to ensure that code changes are thoroughly tested and validated before they are released to production, reducing the risk of defects and improving the overall quality of the software.

Features of Release:

1. [Code Review](../guides/code-review-guide.md)

    Code review is used to ensure the overall health of the codebase over time. Code Review is a measure to ensure software quality through the exchange of knowledge, experience and opinions. Collaborative code review and pull requests that plug into the code review process.

2. [Semantic Versioning](../convention/semantic-versioning.md)

    Semantic Versioning (SemVer) is a versioning scheme for software that aims to convey meaning about the underlying code changes and their impact on compatibility.

3. [Changlog](../convention/changelog.md)

    A changelog is a document or file that tracks and records the changes, updates, and additions made to a software project over time. It serves as a historical record of the project's evolution and provides a summary of the modifications introduced in each version or release.

4. [Continuous Pipelines](../articles/continuous-pipelines.md)

    - Continuous Release
      > Continuous Release refers to the practice of automating the process of releasing software applications and systems. This can involve automating the process of packaging, deploying, and configuring software, and can help organizations to ensure that software is always up-to-date and ready for deployment. Continuous Release helps to speed up the software development process, reduce errors and inconsistencies, and improve the overall efficiency of software development and deployment.

#### 1.1.5. Deploy

After the code is approved and merged, it's time to deliver it.

Features of Deploy:

1. [Deployment Strategies](../articles/deployment-strategies.md)

    Deployment strategies define  how a running instance of an application should be deployed, modified, or updated.

2. [Software Development Environment](../articles/software-development-environment.md)

    - [Production Environment](../articles/software-development-environment.md#16-production-environment)
      > The production environment is the live environment where software applications are deployed and made available to the end-users. This environment is monitored closely to ensure the software is functioning correctly and meeting the performance and availability requirements of the business.

3. [Software Analysis](../articles/software-analysis.md)

    - [Software Composition Analysis](../articles/software-analysis.md#12-software-composition-analysis)

      - [Bill of Materials (BOM)](../articles/software-analysis.md#124-bill-of-materials-bom)
        > A Bill of Materials (BOM) is a comprehensive list or inventory of all the materials, components, parts, and sub-assemblies required to manufacture or build a product. It provides detailed information about each item, including its name, quantity, description, and sometimes additional attributes such as part numbers or suppliers. BOMs are commonly used in various industries, including manufacturing, engineering, construction, and software development.

4. Patch Management

    Patch management refers to the process of planning, testing, deploying, and monitoring updates (or patches) to software applications, operating systems, and other IT systems. Effective patch management helps keep systems secure by addressing vulnerabilities and fixing bugs. It's crucial to regularly update software to protect against cyberattacks and ensure optimal performance.

5. [Continuous Pipelines](../articles/continuous-pipelines.md)

    - [Continuous Deployment](../articles/continuous-pipelines.md#14-continuous-deployment)
      > Continuous Release refers to the practice of automating the process of releasing software applications and systems. This can involve automating the process of packaging, deploying, and configuring software, and can help organizations to ensure that software is always up-to-date and ready for deployment. Continuous Release helps to speed up the software development process, reduce errors and inconsistencies, and improve the overall efficiency of software development and deployment.

#### 1.1.6. Operate

Support and maintenance are required of active software projects to reduce down times.

Features of Operate:

1. Issue Management

    Issue management refers to the process of identifying, addressing, and resolving problems or concerns that arise within an organization or project. It involves a systematic approach to effectively handle issues and minimize their impact on operations and outcomes. Issue management is crucial in maintaining the functioning of businesses, projects, and teams.

#### 1.1.7. Observe

Incident management is when Development and Operations respond to unplanned events and restore services using reliable methods for prioritizing incidents and getting to resolution fast.

Features of Observe:

1. [Incident Management](../articles/incident-management.md)

    Incident management is the process of identifying, analyzing, and resolving incidents that occur in a software system. An incident is any event that disrupts or degrades the normal operation of the system, such as a system outage, a performance degradation, or a security breach.

2. [Logging and Monitoring](../articles/logging-and-monitoring.md)

    Logging and monitoring are essential components of modern software systems and infrastructure. They play a crucial role in ensuring the reliability, performance, and security of applications and services.

3. [Software Metric](../articles/software-metric.md)

    Software metric are measurements used to assess various aspects of the software development process, project, or product. They help teams track progress, identify bottlenecks, make informed decisions, and improve overall efficiency and quality.

    - [DORA](../articles/dora.md)
      > The DORA (DevOps Research and Assessment) metrics are a set of key performance indicators (KPIs) developed by the DevOps Research and Assessment organization. These metrics are designed to assess the performance of software delivery teams and provide insights into the effectiveness of DevOps practices.

#### 1.1.8. Security

Security should be included throughout the Software Development Life Cycle (SDLC) in order to minimize vulnerabilities in software code.

1. [Cryptography](../articles/cryptography.md)

    Cryptography is the practice of securing communication from third-party interference, where third-party is anyone who is not authorized to access the communication. Cryptography uses mathematical algorithms to convert the original message, known as plaintext, into an unreadable format called ciphertext.

    - [Password Hashing Algorithms](../articles/cryptography.md#131-password-hashing-algorithms)
      > Password hashing algorithms are a specific type of hash function that are designed to store and verify passwords securely. Passwords are often the first line of defense in protecting user accounts and sensitive information, so it is important to store them securely.

2. [Risk Management](../articles/risk-management.md)

    Risk management involves identifying, assessing, and mitigating potential risks that could impact the success of a software project. It includes steps like risk identification, analysis, prioritization, and implementing strategies to minimize or address those risks. Effective risk management helps ensure the project stays on track and delivers the desired outcomes.

    - ISO 31000
      > Provides principles and guidelines for effective risk management practices that can be applied to any type of organization and industry.

    - [IEC 62443](../convention/iec-62443.md)
      > IEC 62443 is a series of international standards developed by the International Electrotechnical Commission (IEC) that provides a framework for implementing cybersecurity in industrial automation and control systems (IACS). The series comprises of several parts, each of which addresses a specific aspect of IACS cybersecurity.

3. [Identity and Access Management (IAM)](../articles/identity-and-access-management.md)

    Identity and Access Management (IAM) is primarily concerned with the authentication and authorization of the user in the network, i.e. with establishing the identity of the user and the associated access rights that the user has in the network, applications and systems.

4. [Software Analysis](../articles/software-analysis.md)

    - [Security Analysis](../articles/software-analysis.md#114-security-analysis)
      > Security analysis is a software analysis technique focused on assessing the security posture of a software system. It involves identifying vulnerabilities, weaknesses, and potential risks in the software design, implementation, configuration, and deployment. The objective of security analysis is to uncover security flaws and recommend mitigations to protect the system against unauthorized access, data breaches, and malicious attacks.

    - [Software Composition Analysis](../articles/software-analysis.md#12-software-composition-analysis)
      > Software Composition Analysis (SCA) is a software analysis technique that focuses on identifying, analyzing and managing the composition of third-party and open-source software components used in a software system.

5. [Continuous Pipelines](../articles/continuous-pipelines.md)

    - [Continuous Security](../articles/continuous-pipelines.md#111-continuous-security)
      > Continuous Security refers to the practice of integrating security into the software development lifecycle, and continuously monitoring and verifying the security of applications and systems. This can involve automated security testing, security scans, and regular security audits, and helps organizations to identify and remediate security vulnerabilities before they can be exploited.

### 1.2. Key Features

Key features of effective software development.

#### 1.2.1. Agile

[Agile](../articles/agile.md) is an iterative approach to project management and software development that helps teams deliver value to their customers faster and with fewer headaches. Agile methodologies empower teams to be inherently flexible, well-organized, and capable of responding to change.

#### 1.2.2. XOps

[XOps](../articles/xops.md) is a set of principles and practices, tools, and a cultural philosophy that automate and integrate the processes of software development. XOps, an umbrella term used for a combination of IT tech like DevOps, DevSecOps, AIOps, MLOps, GitOps, and BizDevOps. XOps supposedly helps to shorten a system development cycles and provides continuous delivery with high software quality. It focuses team empowerment, cross-team communication and collaboration, and technology automation.

#### 1.2.3. Continuous Pipelines

[Continuous Pipelines](../articles/continuous-pipelines.md) describes the key stages in an automated software development and deployment flow. This flow typically includes design, coding, validation, testing, integration, delivery and phased deployment activities orchestrated as a release workflow before operation in a target/production environment.

#### 1.2.4. Software Architecture

Software Architectural Patterns are high-level design templates or solutions that provide a structured approach for organizing and designing software systems. Architectural patterns offer proven solutions to recurring design problems and help architects and developers build scalable, maintainable, and robust software applications.

## 2. References

- Atlassian [software development](https://www.atlassian.com/software-development) article.
