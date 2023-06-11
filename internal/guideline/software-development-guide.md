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

Elements of Discover:

1. [Process Principles](../about/software-design-principles.md#13-process-principles)

    Process principles refer to a set of guidelines that govern how software is developed, tested, and deployed.

    - [Waterfall Model](../about/software-design-principles.md#131-waterfall-model)
      > The Waterfall Model is a sequential software development process model that follows a linear and phased approach. It consists of distinct, well-defined phases, each of which must be completed before progressing to the next phase.

    - [Agile](../about/software-design-principles.md#133-agile-software-development)
      > Agile Software Development is an iterative and collaborative approach to software development that prioritizes flexibility, adaptability, and customer satisfaction. It emphasizes delivering working software in frequent iterations and incorporating feedback to continuously improve the product.

2. [Architecture Decision Records](../about/architecture-decision-records.md)

    Architecture Decision Records (ADR) captures the key options available, the main requirements that drive a decision, and the design decisions themselves.

#### 1.1.2. Plan

Stakeholders are identified, budgets set, and infrastructure requisitioned. Design documents from the concept phase are broken down into actionable tasks.

Elements of Plan:

1. Software Architecture Description

    A software architecture description provides an overview and detailed documentation of the architecture of a software system. It describes the structure, components, relationships, and behavior of the software system, enabling developers, architects, and stakeholders to understand and communicate the design decisions and principles underlying the system.

2. [Project Layout](../about/project-layout.md)

    Project layout refers to the arrangement of files, folders, and other resources within a project. A well-designed project layout can improve the organization, readability, and maintainability of the project's codebase.

#### 1.1.3. Code

Development teams work to build production-ready software that meets requirements and feedback.

Elements of Code:

1. Coding

    Coding with software development patterns that should be applied during the implementation of a project to avoid bugs.

    - [Software Design Principals](../about/software-design-principles.md)
      > Software design patterns are general reusable solutions to common software design problems that have been proven effective over time. Design patterns provide a way to organize and structure software code in a way that is easily maintainable, scalable, and extensible.

    - Software Design Patterns
      > Software design patterns are general reusable solutions to common software design problems that have been proven effective over time. Design patterns provide a way to organize and structure software code in a way that is easily maintainable, scalable, and extensible.

    - Software Architectural Patterns
      > Software architectural patterns are high-level design templates or solutions that provide a structured approach for organizing and designing software systems. Architectural patterns offer proven solutions to recurring design problems and help architects and developers build scalable, maintainable, and robust software applications.

2. [Software Analysis](../about/software-analysis.md)

    Software Analysis is the process of evaluating software systems and applications to identify potential risks, improve quality and reliability, and ensure compliance with organizational policies and industry regulations.

3. [Code Review](../guideline/code-review-guide.md)

    Code review is used to ensure the overall health of the codebase over time. Code Review is a measure to ensure software quality through the exchange of knowledge, experience and opinions. Collaborative code review and pull requests that plug into the code review process.

4. [Docs as Code](../about/docs-as-code.md)

    Docs as Code is a set of principles and practices that aims to treat documentation as code, and apply software development practices to documentation.

5. [Conventional Commits](../convention/conventional-commits.md)

    Conventional Commits is a commit message convention that provides a standardized and structured format for commit messages in software development projects. It aims to make commit messages more readable, informative, and useful for both humans and automated tools.

6. [Semantic Versioning](../convention/semantic-versioning.md)

    Semantic Versioning (SemVer) is a versioning scheme for software that aims to convey meaning about the underlying code changes and their impact on compatibility.

7. [Changlog](../convention/changelog.md)

    A changelog is a document or file that tracks and records the changes, updates, and additions made to a software project over time. It serves as a historical record of the project's evolution and provides a summary of the modifications introduced in each version or release.

#### 1.1.4. Build, Test and Release

A reliable system is resilient to failures and meets its documented service level objectives, which may also include security guarantees. CI/CD pipelines ensure an efficient developer experience.

Elements of Build, Test and Release:

1. [Continuous Pipelines](../about/continuous-pipelines.md)

    Continuous Pipelines refer to the process of automating the software development workflow from code creation to deployment. This process involves multiple stages such as code integration, build, testing, and deployment to production.

2. [Software Testing](../about/software-testing.md)

    Software testing is a process of evaluating the functionality of a software application or system to identify any defects, bugs, vulnerabilities or issues that may impact the functionality or performance of the software. Software testing ensure that the software meets the specified requirements and specifications, and that it performs as expected in a variety of different conditions.

#### 1.1.5. Deploy

After the code is approved and merged, it's time to deliver it.

Elements of Deploy:

1. [Deployment Strategies](../about/deployment-strategies.md)

    Deployment strategies define  how a running instance of an application should be deployed, modified, or updated.

2. [Production Environment](../about/software-environments.md)

    The live production code will need a place to live. Consider using cloud hosting provided by Amazon AWS, Google Cloud Platform, or Microsoft Azure.

#### 1.1.6. Operate

Support and maintenance are required of active software projects to reduce down times.

Elements of Operate:

1. [Continuous Operations](../about/continuous-pipelines.md#9-continuous-operations)

    Continuous Operations (CO) pipeline is the automation of observe the live production code.

#### 1.1.7. Observe

Incident management is when Development and Operations respond to unplanned events and restore services using reliable methods for prioritizing incidents and getting to resolution fast.

Elements of Operate:

1. [Logging and Monitoring](../about/logging-and-monitoring.md)

    Logging and monitoring are essential components of modern software systems and infrastructure. They play a crucial role in ensuring the reliability, performance, and security of applications and services.

#### 1.1.8. Security

Security should be included throughout the Software Development Life Cycle (SDLC) in order to minimize vulnerabilities in software code.

1. [IEC 62443](../convention/iec-62443.md)

    IEC 62443 is a series of international standards developed by the International Electrotechnical Commission (IEC) that provides a framework for implementing cybersecurity in industrial automation and control systems (IACS). The series comprises of several parts, each of which addresses a specific aspect of IACS cybersecurity.

2. [Identity and Access Management (IAM)](../about/identity-and-access-management.md)

    Identity and Access Management (IAM) is primarily concerned with the authentication and authorization of the user in the network, i.e. with establishing the identity of the user and the associated access rights that the user has in the network, applications and systems.

3. [Continuous Security](../about/continuous-pipelines.md#7-continuous-security)

    Continuous Security pipeline is the automation of security verification as an active and integrated part of the existing development process.

### 1.2. Key Features

Key features of effective software development.

#### 1.2.1. Agile

[Agile](../about/agile.md) is an iterative approach to project management and software development that helps teams deliver value to their customers faster and with fewer headaches. Agile methodologies empower teams to be inherently flexible, well-organized, and capable of responding to change.

#### 1.2.2. XOps

[XOps](../about/xops.md) is a set of principles and practices, tools, and a cultural philosophy that automate and integrate the processes of software development (Dev), security (Sec), and IT operation (Ops). It focuses team empowerment, cross-team communication and collaboration, and technology automation.

#### 1.2.3. Continuous Pipelines

[Continuous Pipelines](../about/continuous-pipelines.md) describes the key stages in an automated software development and deployment flow. This flow typically includes design, coding, validation, testing, integration, delivery and phased deployment activities orchestrated as a release workflow before operation in a target/production environment.

#### 1.2.4. Software Architecture

Software Architectural Patterns are high-level design templates or solutions that provide a structured approach for organizing and designing software systems. Architectural patterns offer proven solutions to recurring design problems and help architects and developers build scalable, maintainable, and robust software applications.

## 2. References

- Atlassian [software development](https://www.atlassian.com/software-development) article.
