# Software Development Guide

Software development refers to the design, documentation, programming, testing, and ongoing maintenance of a software deliverable. The combination of these steps are used to create a workflow pipeline, a sequence of stages that when followed produce high-quality software deliverables. This pipeline is known as the Software Development Life Cycle (SDLC).

- [1. Lifecycle](#1-lifecycle)
  - [1.1. Concept](#11-concept)
  - [1.2. Plan](#12-plan)
  - [1.3. Code and Analysis](#13-code-and-analysis)
  - [1.4. Build and Test](#14-build-and-test)
  - [1.5. Review](#15-review)
  - [1.6. Release](#16-release)
  - [1.7. Deploy](#17-deploy)
  - [1.8. Operate](#18-operate)
  - [1.9. Incident Management](#19-incident-management)
  - [1.10. Continuous Feedback](#110-continuous-feedback)
  - [1.11. Security](#111-security)
- [2. Key Features](#2-key-features)
  - [2.1. Agile](#21-agile)
  - [2.2. XOps](#22-xops)
  - [2.3. CI/CD](#23-cicd)
  - [2.4. Software Architecture](#24-software-architecture)
    - [2.4.1. Microservices](#241-microservices)
    - [2.4.2. Clean Architecture](#242-clean-architecture)
- [3. References](#3-references)

## 1. Lifecycle

Steps in the Software Development Life Cycle (SDLC).

### 1.1. Concept

Projects are envisioned, designed, and prioritized.

- [Agile](../about/agile.md)
  > A methodology such as agile guides the work process for the project.

- [Architecture Modeling Concepts](../about/architecture-modeling-concepts.md)
  > Concept models are a fundamental part of the architectural design and development process using Architecture Modeling Concepts to provide a quick and effective method to create diagrams for testing ideas and investigating constraints.

- [Architecture Decision Records](../about/architecture-decision-records.md)
  > Architecture Decision Records (ADR) captures the key options available, the main requirements that drive a decision, and the design decisions themselves.

### 1.2. Plan

Stakeholders are identified, budgets set, and infrastructure requisitioned. Design documents from the [concept](#11-concept) phase are broken down into actionable tasks.

- Scrum
  > Scrum is a framework for agile, an iterative approach to project management and software development​.

### 1.3. Code and Analysis

Development teams work to build production-ready software that meets requirements and feedback. CI/CD pipelines ensure an efficient developer experience.

- [Coding](../about/coding-guide.md)
  > Coding with software development patterns that should be applied during the implementation of a project to avoid bugs.

- [Software Analysis](../about/software-analysis.md) and [Software Testing](../about/software-testing.md)
  > Robust software analysis and software testing are useful aids in mitigating failure risks, and should be a particular focus during the project implementation phase.

- [Continuous Integration](../about/continuous-pipelines.md#1-continuous-integration)
  > Continuous Integration (CI) pipeline is the automation of the integration of code changes through continuous code analysis.

### 1.4. Build and Test

A reliable system is resilient to failures and meets its documented service level objectives, which may also include security guarantees.

- [Software Testing](../about/software-testing.md)
  > Robust software testing are useful aids in mitigating failure risks, and should be a particular focus during the project implementation phase.

- [Continuous Testing](../about/continuous-pipelines.md#5-continuous-testing)
  > Continuous testing (CT) pipeline is the automation of testing the code base through continuous testing, which includes unit testing.

### 1.5. Review

Code review is used to ensure the overall health of the codebase over time. Code Review is a measure to ensure software quality through the exchange of knowledge, experience and opinions.

- [Code Review](../guideline/code-review-guide.md)
  > Collaborative code review and pull requests that plug into the code review process.

### 1.6. Release

Release the next version number, create the release notes and generate the changelog.

- [Continuous Release](../about/continuous-pipelines.md#6-continuous-release)
  > Continuous Release (CR) pipeline is the automation of package release workflow.

### 1.7. Deploy

After the code is approved and merged, it's time to deliver it.

- [Deployment Strategies](../about/deployment-strategies.md) and [Continuous Deployment](../about/continuous-pipelines.md#3-continuous-deployment)
  > Deployment strategies define for continuous deployment (CD) how a running instance of an application should be deployed, modified, or updated.

- [Production Environment](../about/software-environments.md)
  > The live production code will need a place to live. Consider using cloud hosting provided by Amazon AWS, Google Cloud Platform, or Microsoft Azure.

### 1.8. Operate

Support and maintenance are required of active software projects to reduce down times.

- [Continuous Operations](../about/continuous-pipelines.md#9-continuous-operations)
  > Continuous Operations (CO) pipeline is the automation of observe the live production code.

### 1.9. Incident Management

Incident management is the process used by DevOps and IT Operations teams to respond to an unplanned event or service interruption and restore the service to its operational state. Teams need a reliable method to prioritize incidents, get to resolution faster, and offer better service for users.

### 1.10. Continuous Feedback

Teams should evaluate each release and generate reports to improve future releases, ask for customers to give input about the value and impact of product features, and share business-related outcomes with stakeholders. By gathering continuous feedback, teams can improve their processes, and increase value to customers.

- [Continuous Feedback](../about/continuous-pipelines.md#10-continuous-feedback)
  > Continuous Feedback (CF) pipeline is the automation of gathering feedback from ticket systems.

### 1.11. Security

Security should be included throughout the Software Development Life Cycle (SDLC) in order to minimize vulnerabilities in software code.

- [Identity Management](../about/identity-management.md) or Identity & Access Management (IAM) is primarily concerned with the authentication and authorization of the user in the network, i.e. with establishing the identity of the user and the associated access rights that the user has in the network, applications and systems.

- [Continuous Security](../about/continuous-pipelines.md#7-continuous-security)
  > Continuous Security (CS) pipeline is the automation of security verification as an active and integrated part of the existing development process.

## 2. Key Features

Key features of effective software development.

### 2.1. Agile

[Agile](../about/agile.md) is an iterative approach to project management and software development that helps teams deliver value to their customers faster and with fewer headaches. Agile methodologies empower teams to be inherently flexible, well-organized, and capable of responding to change.

### 2.2. XOps

[XOps](../about/xops.md) is a set of principles and practices, tools, and a cultural philosophy that automate and integrate the processes of software development (Dev), security (Sec), and IT operation (Ops). It focuses team empowerment, cross-team communication and collaboration, and technology automation.

### 2.3. CI/CD

[CI/CD](../about/continuous-pipelines.md) describes the key stages in an automated software development and deployment flow. This flow typically includes design, coding, validation, testing, integration, delivery and phased deployment activities orchestrated as a release workflow before operation in a target/production environment.

### 2.4. Software Architecture

[Software architecture](../about/software-architecture.md) refers to the fundamental structures of a software system and the discipline of creating software structure and design.

#### 2.4.1. Microservices

A microservices architecture, also known as [microservices](../about/microservices.md), is an approach to building an application as a series of independently deployable services that are decentralized and autonomously developed. These services are loosely coupled, independently deployable, and easily maintainable.

With a microservices architecture, developers can organize in smaller teams specializing in different services, with different stacks and decoupled deployments.

#### 2.4.2. Clean Architecture

[Clean architecture](../about/software-architecture.md#clean-architecture) is a software design philosophy that separates the elements of a design into ring levels. An important goal of clean architecture is to provide developers with a way to organize code in such a way that it encapsulates the business logic but keeps it separate from the delivery mechanism.

## 3. References

- Atlassian [software development](https://www.atlassian.com/software-development) article.
