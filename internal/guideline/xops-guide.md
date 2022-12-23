# XOps Guide

[XOps](../about/xops.md) is designed to run on-premises or in a private cloud that meets specific requirements. It is built to run enterprise-wide, globally distributed, and interconnected, especially in analytic environments. It is a combination of traditional business applications, such as data and analytics management, with modern technologies such as:

- Continuous Pipelines
  > Continuous integration and continuous delivery or continuous deployment (CI/CD), real-time monitoring or incident management tools, with an emphasis on task automation.

- DevOps Platforms and Decentralized Architectures
  > Systems and tools that support DevOps adoption, configuration management and collaboration platforms.

- Cloud Computing, Microservices and Containers
  > Implemented concurrently with XOps methodologies.

- [1. DevOps](#1-devops)
- [2. GitOps](#2-gitops)
- [4. DevSecOps](#4-devsecops)

## 1. DevOps

[DevOps](../about/xops.md#1-devops) technology, including principles and practices:

- Plan
  > Schedule planning and task tracking tools are needed to ensure the DevOps team knows what tasks are at hand, what is currently being done, and whether there are any risks of falling behind schedule.
  >
  > Tools like Confluence and Jira help DevOps teams achieve a seamless and efficient project management cycle and ensure timely product delivery.

- Code
  > Schedule planning and task tracking tools are needed to ensure the DevOps team knows what tasks are at hand, what is currently being done, and whether there are any risks of falling behind schedule.
  >
  > Tools like Confluence and Jira help DevOps teams achieve a seamless and efficient project management cycle and ensure timely product delivery.

- Build
  > Schedule planning and task tracking tools are needed to ensure the DevOps team knows what tasks are at hand, what is currently being done, and whether there are any risks of falling behind schedule.
  >
  > Tools like Confluence and Jira help DevOps teams achieve a seamless and efficient project management cycle and ensure timely product delivery.

- Test
  > Schedule planning and task tracking tools are needed to ensure the DevOps team knows what tasks are at hand, what is currently being done, and whether there are any risks of falling behind schedule.
  >
  > Tools like Confluence and Jira help DevOps teams achieve a seamless and efficient project management cycle and ensure timely product delivery.

- Release
  > Schedule planning and task tracking tools are needed to ensure the DevOps team knows what tasks are at hand, what is currently being done, and whether there are any risks of falling behind schedule.
  >
  > Tools like Confluence and Jira help DevOps teams achieve a seamless and efficient project management cycle and ensure timely product delivery.

- Deploy
  > Schedule planning and task tracking tools are needed to ensure the DevOps team knows what tasks are at hand, what is currently being done, and whether there are any risks of falling behind schedule.
  >
  > Tools like Confluence and Jira help DevOps teams achieve a seamless and efficient project management cycle and ensure timely product delivery.

- Operate
  > Schedule planning and task tracking tools are needed to ensure the DevOps team knows what tasks are at hand, what is currently being done, and whether there are any risks of falling behind schedule.
  >
  > Tools like Confluence and Jira help DevOps teams achieve a seamless and efficient project management cycle and ensure timely product delivery.

- Monitor
  > Software in production must be monitored to ensure stable performance and increased customer satisfaction. This stage also involves performance analysis and logging, raising smart alerts on various issues. See [Logging and Monitoring](../about/logging-monitoring.md).
  >
  > Tools for performing these tasks include Prometheus, Grafana, Elastic (ELK) Stack, Splunk, and Sumo Logic.

## 2. GitOps

[GitOps](../about/xops.md#2-gitops) technology, including principles and practices:

- Pull Requests
  > Code review and automatically deploy changes to system infrastructure.

- [Branching Strategies](../about/branching-strategies.md)
  > A branching strategy refers to the strategy that a software development team uses when writing, merging, and shipping code in the context of a version control system (VCS) such as Git.

- [Merging Strategies](../about/merging-strategies.md)

- [Conventional Commits](../convention/conventional-commits.md)
  > A specification for adding human and machine readable meaning to commit messages.

- [Semantic Versioning](../convention/semantic-versioning.md)
  > Semantic versioning specification that contains a set of rules and requirements that dictate how version numbers are assigned and incremented.

- [Changelog](../convention/changelog.md)
  > A changelog is a file which contains a curated, chronologically ordered list of notable changes for each version of a project.

- Auditing Complaince
  > Software vendors conduct software compliance audits to verify adherence to the contracts and license terms they have concluded.

## 4. DevSecOps

[DevSecOps](../about/xops.md#3-devsecops) technology, including principles and practices:

- [Signing Contributions](../about/identity-management.md#signing-contributions)
  > Signing commits and tags, or code signing specifically, is the [Identity Management](../about/identity-management.md) process of using cryptography to digitally add a signature to data. The receiver of the data can verify that the signature is authentic, and therefore must've come from the signatory.
  >
  > Tool for authenticated encryption is GPG.

- [Signing Container](../about/identity-management.md#signing-container)
  > Docker Content Trust (DCT) allows docker image tags to be cryptographically signed. This [Identity Management](../about/identity-management.md) process allows users to verify the integrity and the publisher of docker.

- Secrets Management
  > Secrets management refers to the tools and methods for managing digital authentication credentials (secrets), including passwords, keys, APIs, and tokens for use in applications, services, privileged accounts and other sensitive parts of the IT ecosystem.
  >
  > Tools for secrets management, encryption as a service, and privileged access management are Vault, and Darp.
