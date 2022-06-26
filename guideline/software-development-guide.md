# Software Development Guide

Software development involves the design, documentation, programming, testing, and ongoing maintenance of a software deliverable. The combination of these steps are used to create a workflow pipeline, a sequence of steps that when followed produce high-quality software deliverables. This pipeline is known as the software development lifecycle.

- [Lifecycle](#lifecycle)
  - [Concept](#concept)
  - [Plan + Roadmap](#plan--roadmap)
  - [Code, Analysis/Test, Review](#code-analysistest-review)
  - [Deploy, Release, Host](#deploy-release-host)
  - [Support, Operate, Maintain](#support-operate-maintain)
  - [Incident Management](#incident-management)
  - [Continuous Feedback](#continuous-feedback)
  - [Security](#security)
- [Key Features](#key-features)
  - [Agile](#agile)
  - [DevOps/DevSecOps](#devopsdevsecops)
  - [CI/CD](#cicd)
  - [Software Architecture](#software-architecture)
    - [Microservices](#microservices)
    - [Clean Architecture](#clean-architecture)
- [Tools](#tools)
- [See also](#see-also)

## Lifecycle

Steps in the software development lifecycle.

### Concept

Projects are envisioned, designed, and prioritized.

- [Agile](../about/agile.md)
  > A methodology such as agile guides the work process for the project. Practices like DevOps guide practices during development and operations.

- [Architecture Modeling Concepts](../about/architecture-modeling-concepts.md)
  > Concept models are a fundamental part of the architectural design and development process using Architecture Modeling Concepts to provide a quick and effective method to create diagrams for testing ideas and investigating constraints.

### Plan + Roadmap

Stakeholders are identified, budgets set, and infrastructure requisitioned. Design documents from the concept phase are broken down into actionable tasks.

- [Architecture Decision Records](../about/architecture-decision-records.md)
  > Architecture Decision Records (ADR) captures the key options available, the main requirements that drive a decision, and the design decisions themselves.

### Code, Analysis/Test, Review

Development teams work to build production-ready software that meets requirements and feedback. CI/CD pipelines ensure an efficient developer experience. A reliable system is resilient to failures and meets its documented service level objectives, which may also include security guarantees.

- [Coding](../about/coding-guide.md)
  > Coding with software development patterns that should be applied during the implementation of a project to avoid bugs.

- [Code Analysis](../about/code-analysis.md) and [Software Testing](../about/software-testing.md)
  > Robust code analysis and software testing are useful aids in mitigating failure risks, and should be a particular focus during the project implementation phase.

- [Continuous Integration / Continuous Delivery](../about/ci-cd.md) pipelines
  > Continuous Integration / Continuous Delivery CI/CD provides continuous automation and monitoring across all phases of the release process.

- [Pull Request](../about/pull-request-reviews.md) and [Code Review](../about/code-review-guide.md)
  > Collaborative code review and pull requests that plug into the code review process.

### Deploy, Release, Host

After the code is approved and merged, it's time to deliver it.

- [Deployment Strategies](../about/deployment-strategies.md) and [Continuous Deployment](../about/ci-cd.md)
  > Deployment strategies define for continuous deployment (CD) how a running instance of an application should be deployed, modified, or updated.

- [Production Environment](../about/software-environments.md)
  > The live production code will need a place to live. Consider using cloud hosting provided by Amazon AWS, Google Cloud Platform, or Microsoft Azure.

### Support, Operate, Maintain

Support and maintenance are required of active software projects. Jira Service Management provides powerful tools to capture, triage, and resolve customer support requests.

### Incident Management

Incident management is the process used by DevOps and IT Operations teams to respond to an unplanned event or service interruption and restore the service to its operational state. Teams need a reliable method to prioritize incidents, get to resolution faster, and offer better service for users.

### Continuous Feedback

Teams should evaluate each release and generate reports to improve future releases, ask for customers to give input about the value and impact of product features, and share business-related outcomes with stakeholders. By gathering continuous feedback, teams can improve their processes, and increase value to customers.

### Security

As software applications grow in complexity and scale, traditional security that is `bolted on` at the end of a release cycle is no longer enough to keep software safe. Instead, security should be included throughout the software development lifecycle in order to minimize vulnerabilities in software code.

- [Identity Management](../about/identity-management.md) or Identity & Access Management (IAM) is primarily concerned with the authentication and authorization of the user in the network, i.e. with establishing the identity of the user and the associated access rights that the user has in the network, applications and systems.

## Key Features

Key features of effective software development.

### Agile

[Agile](../about/agile.md) is an iterative approach to project management and software development that helps teams deliver value to their customers faster and with fewer headaches. Agile methodologies are immensely popular in the software industry since they empower teams to be inherently flexible, well-organized, and capable of responding to change.

### DevOps/DevSecOps

[DevOps/DevSecOps](../about/devops.md) is a set of principles and practices, tools, and a cultural philosophy that automate and integrate the processes of software development (Dev), security (Sec), and IT operation (Ops). It focuses team empowerment, cross-team communication and collaboration, and technology automation.

### CI/CD

Continuous Integration/Continuous Deployment [CI/CD](../about/ci-cd.md) describes the key stages in an automated software development and deployment flow. This flow typically includes design, coding, validation, testing, integration, delivery and phased deployment activities orchestrated as a release workflow before operation in a target/production environment.

### Software Architecture

[Software architecture](../about/software-architecture.md) refers to the fundamental structures of a software system and the discipline of creating software structure and design.

#### Microservices

A microservices architecture, also known as [microservices](../about/microservices.md), is an approach to building an application as a series of independently deployable services that are decentralized and autonomously developed. These services are loosely coupled, independently deployable, and easily maintainable.

With a microservices architecture, developers can organize in smaller teams specializing in different services, with different stacks and decoupled deployments.

#### Clean Architecture

[Clean architecture](../about/software-architecture.md#clean-architecture) is a software design philosophy that separates the elements of a design into ring levels. An important goal of clean architecture is to provide developers with a way to organize code in such a way that it encapsulates the business logic but keeps it separate from the delivery mechanism.

## Tools

Software development tools can help with every step of the software development lifecycle including guiding agile and DevOps practices, code management, enabling automation through CI/CD, incident response, testing, and more.

## See also

- Atlassian [software development](https://www.atlassian.com/de/software-development) article.
