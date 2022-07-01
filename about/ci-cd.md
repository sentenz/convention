# CI/CD

Continuous Integration/Continuous Delivery or Continuous Deployment (CI/CD) describes the key stages in an automated software development and deployment flow. This flow typically includes design, coding, validation, testing, integration, delivery and phased deployment activities orchestrated as a release workflow before operation in a target/production environment.

- [Continuous Integration](#continuous-integration)
- [Continuous Delivery](#continuous-delivery)
- [Continuous Deployment](#continuous-deployment)
- [Continuous Testing](#continuous-testing)
  - [Test Driven Development](#test-driven-development)
- [Continuous Release](#continuous-release)
- [Continuous Security](#continuous-security)
- [Continuous Monitoring](#continuous-monitoring)
- [Continuous Feedback](#continuous-feedback)
- [Continuous Operations](#continuous-operations)
- [See also](#see-also)

CI/CD is an automated agile software development workflow with the continuous method to build, test, and deploy iterative code changes. This iterative process reduces the chance that newly developed code will be based on buggy or failed previous versions. The method aims to require less or no human intervention from the development of new code until its deployment.

## Continuous Integration

Continuous integration (CI) is the practice of automating the integration of code changes from multiple contributors into the main branch of a shared source code repository. 
Merging changes frequently and triggering automatic testing and validation processes, minimize the possibility of code conflict, even with multiple developers working on the same application.
Short-living feature branches, such as in [Trunk-Based Development](../about/branching-strategies.md#trunk-based-development), are a requirement for continuous integration. With continuous integration, errors and security issues can be identified and fixed more easily, and much earlier in the software development lifecycle.

The version control system is supplemented in the CI process by tools such as automated code quality tests, or syntax style review tools:  

- [Code Analysis](../about/code-analysis.md)
  > Code analysis, generally SAST and DAST, refers to performance profiling measures, safety-related correctness testing, code coverage reporting, code quality testing, syntax style review tools, or dead code elimination.

Popular tools for the CI process include Kubernetes, Terraform, Chef, Ansible, and Puppet. [Docker](https://www.docker.com/) containerization ensures consistency across multiple development and release cycles and provides repeatable development, build, test, and production environments.

## Continuous Delivery

[Continuous Delivery (CD)](https://continuousdelivery.com/) is the ability to get changes of all types, including new features, configuration changes, bug fixes, and experimentation, into production or to end-users in a secure, quick, and sustainable manner.

Continuous delivery is a software development practice that works in conjunction with continuous integration to automate the infrastructure provisioning and application release process.

## Continuous Deployment

Continuous Deployment (CD) enables to automatically deploy applications without the need for human intervention. With continuous deployment, DevOps teams set the criteria for code releases in advance. Once these criteria are met and validated, the code is deployed to the production environment. This is done through scripts or tools that automatically push the artifact to public servers or another distribution mechanism such as an app store.

Continuous deployment entails a level of continuous integration, testing, and operations that is robust enough to automatically deploy new software versions to a production environment.

This is rare and in most cases unnecessary. Usually, unicorn companies with hundreds or thousands of developers and many daily releases want or need this level of automation.

## Continuous Testing  

Continuous Testing (CT) is a critical component of DevOps pipeline and one of the primary enablers of continuous feedback. In a DevOps process, changes move continuously from development to testing to deployment, leading not only in faster releases, but also in higher product quality. This means that automated [Software Testing](../about/software-testing.md) is performed throughout the DevOps pipeline, including unit tests that are run on build changes.  

Popular tools for the continuous testing are Selenium, Travis, and Appium.

### Test Driven Development

However, if a project is set up with a CI pipeline with automatic test coverage, it is a best practice to constantly evolve and improve the test coverage. Each new feature that passes through the CI pipeline should be accompanied by a series of tests to ensure that the new code behaves as expected.

[Test Driven Development (TDD)](../about/software-testing.md#test-driven-development) is the practice of writing out the test code and test cases before doing any actual feature coding. Pure TDD can closely involve the product team to help craft an expected business behavior specification, which can then be transformed into the test cases. In a pure TDD scenario, developers and product team will meet and discuss a spec or list of requirements. This list of requirements will then be converted into a checklist of code assertions. The developers will then write code that matches these assertions.

## Continuous Release

Continuous Release automates the package release workflow, including determining the next version number, creating the release notes and generating the changelog based on commits, and publishing the package.

Popular [tools](../guideline/versioning-guide.md#tooling) for the continuous release are semantic-release, standard-version, and Conventional Changelog.

Related items:

- [Conventional Commits](../convention/conventional-commits.md)
- [Semantic Versioning](../convention/semantic-versioning.md)
- [Changelog](../convention/changelog.md)

## Continuous Security

Continuous Security is a process where security is a part of the CI/CD process. Continuous Security works beside the Continuous Everything process and ensures that software and infrastructure are continuously secured. Applying DevOps values to software security ensures that security verification becomes an active and integrated part of the existing development process.

## Continuous Monitoring

Continuous monitoring is another important component of continuous feedback. A DevOps approach entails using continuous monitoring in the staging, testing, and even development environments. It is sometimes useful to monitor pre-production environments for anomalous behavior, but in general this is an approach used to continuously assess the health and performance of applications in production. 

Numerous tools and services exist to provide this functionality, and this may involve anything from monitoring your on-premise or cloud infrastructure such as server resources, networking, etc. or the performance of your application or its API interfaces.

## Continuous Feedback

The main issue with the old waterfall method of software development, and thus the reason for developing agile methods, was the absence of timely feedback. If new features took months or years to move from idea to implementation, it was almost certain that the end result would be something different than what the customer expected or wanted. Agile ensured that developers received feedback from stakeholders faster. With DevOps, developers now not only get continuous feedback from stakeholders, but also by systematically testing and monitoring their code in the pipeline.  

## Continuous Operations

Continuous operations is a relatively new and less common term, and definitions vary. One way to interpret it is as “continuous uptime”. For example in the case of a blue/green deployment strategy in which you have two separate production environments, one that is “blue” (publicly accessible) and one that is “green” (not publicly accessible). In this situation, new code would be deployed to the green environment, and when it was confirmed to be functional then a switch would be flipped (usually on a load-balancer) and traffic would switch from the “blue” system to the “green” system. The result is no downtime for the end-users. 

Another way to think of Continuous operations is as continuous alerting. This is the notion that engineering staff is on-call and notified if any performance anomalies in the application or infrastructure occur. In most cases, continuous alerting goes hand in hand with continuous monitoring.

## See also

- GitLab [CI/CD](https://about.gitlab.com/topics/ci-cd/) article.
- Atlassian [CI](https://www.atlassian.com/continuous-delivery/continuous-integration) article.
- Atlassian [CD](https://www.atlassian.com/continuous-delivery) article.
- Microsoft [CD vs CD](https://azure.microsoft.com/en/overview/continuous-delivery-vs-continuous-deployment/) article.
