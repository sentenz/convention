# Continuous Pipelines

Continuous Integration/Continuous Delivery or Continuous Deployment (CI/CD) describes the continuous pipeline stages in an automated software development and deployment flow. This flow typically includes design, coding, validation, testing, integration, delivery and phased deployment activities orchestrated as a release workflow before operation in a [target/production environment](../../internal/about/software-development-environment.md#production-environment).

- [1. Continuous Integration](#1-continuous-integration)
- [2. Continuous Delivery](#2-continuous-delivery)
- [3. Continuous Deployment](#3-continuous-deployment)
- [4. Continuous Build](#4-continuous-build)
- [5. Continuous Testing](#5-continuous-testing)
- [6. Continuous Release](#6-continuous-release)
- [7. Continuous Security](#7-continuous-security)
- [8. Continuous Monitoring](#8-continuous-monitoring)
- [9. Continuous Operations](#9-continuous-operations)
- [10. Continuous Feedback](#10-continuous-feedback)
- [11. See also](#11-see-also)

CI/CD is an automated agile software development workflow with the continuous method to build, test, and deploy iterative code changes. This iterative process reduces the chance that newly developed code will be based on buggy or failed previous versions. The method aims to require less or no human intervention from the development of new code until its deployment.

## 1. Continuous Integration

Continuous integration (CI) is the practice of automating the integration of code changes from multiple contributors into the main branch of a shared source code repository. Merging changes frequently and triggering automatic testing and validation processes, minimize the possibility of code conflict, even with multiple developers working on the same application. Short-living feature branches, such as in [Trunk-Based Development](../../internal/about/branching-strategies.md#trunk-based-development), are a requirement for continuous integration. With continuous integration, errors and security issues can be identified and fixed more easily, and much earlier in the software development lifecycle.

The version control system is supplemented in the CI process by tools such as automated code quality tests, or syntax style review tools:  

- [Code Analysis](../../internal/about/code-analysis.md)
  > Code analysis, generally SAST and DAST, refers to performance profiling measures, safety-related correctness testing, code coverage reporting, code quality testing, syntax style review tools, or dead code elimination.

Popular tools for the CI process include Kubernetes, Terraform, Chef, Ansible, and Puppet. [Docker](https://www.docker.com/) containerization ensures consistency across multiple development and release cycles and provides repeatable development, build, test, and production environments.

## 2. Continuous Delivery

[Continuous Delivery (CD)](https://continuousdelivery.com/) automatically delivers code changes to production-ready environments for approval.

Continuous delivery is a software development practice that works in conjunction with continuous integration to automate the infrastructure provisioning and application release process.

## 3. Continuous Deployment

Continuous Deployment (CD) automatically deploys code changes to customers directly. With continuous deployment, DevOps teams set the criteria for code releases in advance. Once these criteria are met and validated, the code is deployed to the production environment. This is done through scripts or tools that automatically push the artifact to public servers or another distribution mechanism such as an app store.

Continuous deployment entails a level of continuous integration, testing, and operations that is robust enough to automatically deploy new software versions to a production environment.

This is rare and in most cases unnecessary. Usually, unicorn companies with hundreds or thousands of developers and many daily releases want or need this level of automation.

## 4. Continuous Build  

## 5. Continuous Testing  

Continuous Testing (CT) is a critical component of DevOps pipeline and one of the primary enablers of continuous feedback. In a DevOps process, changes move continuously from development to testing to deployment, leading not only in faster releases, but also in higher product quality. This means that automated [Software Testing](../../internal/about/software-testing.md) is performed throughout the DevOps pipeline, including unit tests that are run on build changes.  

Popular tools for the continuous testing are Selenium, Travis, and Appium.

Related items:

- Unit Test and Code Coverage
  > If a project is set up with a CI pipeline with automatic [unit testing](../../internal/about/software-testing.md#code-coverage) and [test coverage](../../internal/about/software-testing.md#code-coverage), it is a best practice to constantly evolve and improve the test coverage. Each new feature that passes through the CI pipeline should be accompanied by a series of tests to ensure that the new code behaves as expected.

- Test Driven Development
  > [Test Driven Development (TDD)](../../internal/about/software-testing.md#test-driven-development) is the practice of writing out the test code and test cases before doing any actual feature coding. Pure TDD can closely involve the product team to help craft an expected business behavior specification, which can then be transformed into the test cases. In a pure TDD scenario, developers and product team will meet and discuss a specification or list of requirements. This list of requirements will then be converted into a checklist of code assertions. The developers will then write code that matches these assertions.

## 6. Continuous Release

Continuous Release automates the package release workflow, including determining the next version number, creating the release notes and generating the changelog based on commits, and publishing the package.

Popular [tools](../../internal/guideline/versioning-guide.md#tooling) for the continuous release are semantic-release, standard-version, and Conventional Changelog.

Related items:

- [Conventional Commits](../../internal/convention/conventional-commits.md)
- [Semantic Versioning](../../internal/convention/semantic-versioning.md)
- [Changelog](../../internal/convention/changelog.md)

## 7. Continuous Security

Continuous Security is a process where security is a part of the CI/CD process. Continuous Security works beside the Continuous Everything process and ensures that software and infrastructure are continuously secured. Applying DevOps values to software security ensures that security verification becomes an active and integrated part of the existing development process.

## 8. Continuous Monitoring

Continuous monitoring is another important component of continuous feedback. A DevOps approach entails using continuous monitoring in the staging, testing, and even development environments. It is sometimes useful to monitor pre-production environments for anomalous behavior, but in general this is an approach used to continuously assess the health and performance of applications in production.

Numerous tools and services exist to provide this functionality, and this may involve anything from monitoring your on-premise or cloud infrastructure such as server resources, networking, etc. or the performance of your application or its API interfaces.

## 9. Continuous Operations

Continuous operations is a relatively new and less common term, and definitions vary. One way to interpret it is as “continuous uptime”. For example in the case of a blue/green deployment strategy in which you have two separate production environments, one that is “blue” (publicly accessible) and one that is “green” (not publicly accessible). In this situation, new code would be deployed to the green environment, and when it was confirmed to be functional then a switch would be flipped (usually on a load-balancer) and traffic would switch from the “blue” system to the “green” system. The result is no downtime for the end-users.

Another way to think of Continuous operations is as continuous alerting. This is the notion that engineering staff is on-call and notified if any performance anomalies in the application or infrastructure occur. In most cases, continuous alerting goes hand in hand with continuous monitoring.

## 10. Continuous Feedback

The main issue with the old waterfall method of software development, and thus the reason for developing agile methods, was the absence of timely feedback. If new features took months or years to move from idea to implementation, it was almost certain that the end result would be something different than what the customer expected or wanted. Agile ensured that developers received feedback from stakeholders faster. With DevOps, developers now not only get continuous feedback from stakeholders, but also by systematically testing and monitoring their code in the pipeline.  

## 11. See also

- GitLab [CI/CD](https://about.gitlab.com/topics/ci-cd/) article.
- Atlassian [CI](https://www.atlassian.com/continuous-delivery/continuous-integration) article.
- Atlassian [CD](https://www.atlassian.com/continuous-delivery) article.
- Microsoft [CD vs CD](https://azure.microsoft.com/en/overview/continuous-delivery-vs-continuous-deployment/) article.
- GitHub [CI/CD](https://resources.github.com/ci-cd/) article.
