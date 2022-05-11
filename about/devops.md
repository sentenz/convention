# DevOps

- [GitOps](#gitops)
- [DevOps](#devops)
- [DevSecOps](#devsecops)
- [See also](#see-also)

## GitOps

[GitOps](https://www.weave.works/blog/gitops-operations-by-pull-request) is a specific system operations process (ops) tied to a specific tool (Git). It is an evolution of Infrastructure as Code (IaC) and a DevOps best practice that uses Git as the single source of truth and control mechanism for building, updating, and deleting the system architecture. Weaveworks is credited with creating the term GitOps.

GitOps is the practice of using Git pull requests to validate and automatically deploy changes to system infrastructure.

Including principles and practices:

- [Branching Strategies](../about/branching-strategies.md)
- [Merging Strategies](../about/merging-strategies.md)
- [Conventional Commits](../convention/conventional-commits.md)
- [Semantic Versioning](../convention/semantic-versioning.md)
- [Changelog](../convention/changelog.md)

## DevOps

[DevOps](https://www.bunnyshell.com/blog/what-is-devops) is an approach to culture, automation, operations, and tools that aims to produce applications and services at a high rate of deployment. Software development through faster, iterative IT service delivery and infrastructure management processes.

Including principles and practices:

- Planning
  > Schedule planning and task tracking tools are needed to ensure the DevOps team knows what tasks are at hand, what is currently being done, and whether there are any risks of falling behind schedule.
  >
  > Tools like Confluence and Jira help DevOps teams achieve a seamless and efficient project management cycle and ensure timely product delivery.

- [Continuous Integration](../about/ci-ct-cd.md)
  > Continuous Integration (CI) is a DevOps practice in which developers frequently merge their code changes to the central repository. Then, the code is built automatically and automated tests are run against the built code. [Docker](https://www.docker.com/) containerization ensures consistency across multiple development and release cycles and provides repeatable development, build, test, and production environments.
  >
  > Popular tools for this phase include Kubernetes, Terraform, Chef, Ansible, and Puppet.

- [Continuous Delivery](../about/ci-ct-cd.md)
  > In Continuous Delivery (CD), merged code changes are automatically built and deployed to a testing environment. Then, automated tests are executed against the deployed code to identify any bugs and allow the developers to fix them in advance. Typically, the code is deployed to different testing environments progressively, where the code achieves a higher level of quality through a standard automated testing procedure before deploying to the production. Continuous Delivery ensures that the team always has a development-ready code.
  >
  > Selenium, Travis, and Appium are some popular continuous testing tools in the IT industry.

- [Continuous Testing](../about/ci-ct-cd.md)
  > The Continuous Testing (CT) practice helps to identify potential risks as early as possible in all stages of the development lifecycle to minimize the impact on end-users. For instance, when the code is deployed to build servers, automated unit tests will run to identify any bugs in the code. If the unit tests are failed, the build will be rejected and the feedback is sent to the developer to revise the code. Thus, the code will be deployed to the QA environment for functional testing only if the build passes the unit tests.
  >
  > Tools such as [Jenkins](https://jenkins.io/), CircleCI, GitHub Action, and GitLab CI.

- [Monitoring and Logging](../about/logging-monitoring.md)
  > Software in production must be monitored to ensure stable performance and increased customer satisfaction. This stage also involves performance analysis and logging, raising smart alerts on various issues, gathering customer feedback
  >
  > Tools for performing these tasks include Prometheus, Grafana, Elastic (ELK) Stack, Splunk, and Sumo Logic.

## DevSecOps

[DevSecOps](https://www.redhat.com/en/topics/devops/what-is-devsecops) is a set of principles and practices for protecting software, infrastructure, applications and data. DevSecOps stands for development, security, and operations. It's an approach to culture, automation, and platform design that integrates security as a shared responsibility throughout the entire IT lifecycle.

Including principles and practices:

- Signing Git Commits and Tags
  > Signing, or code signing specifically, is the process of using cryptography to digitally add a signature to data. The receiver of the data can verify that the signature is authentic, and therefore must've come from the signatory.
  >
  > Tool for authenticated encryption is GPG.

- Secrets Management
  > Secrets management refers to the tools and methods for managing digital authentication credentials (secrets), including passwords, keys, APIs, and tokens for use in applications, services, privileged accounts and other sensitive parts of the IT ecosystem.
  >
  > Tools for secrets management, encryption as a service, and privileged access management are Vault, and Darp.

## See also

- Atlassian [devops](https://www.atlassian.com/devops/what-is-devops) article.
- GitHub [devops](https://github.com/learn/devops) article.
- Microsoft [devops](https://docs.microsoft.com/en-us/azure/devops/boards/best-practices-agile-project-management?view=azure-devops&tabs=basic-process) article.
- Microsoft [devsecops](https://docs.microsoft.com/en-us/azure/architecture/solution-ideas/articles/devsecops-in-github) article.
- Google [DORA metrics](https://cloud.google.com/blog/products/devops-sre/using-the-four-keys-to-measure-your-devops-performance?utm_source=thenewstack&utm_medium=website&utm_campaign=platform) article.
- Google managing infrastructure as code with [Terraform, Cloud Build, and GitOps](https://cloud.google.com/architecture/managing-infrastructure-as-code?hl=en&skip_cache=true) article.
- GitLab [GitOps](https://about.gitlab.com/topics/gitops/) article.
- RedHad [GitOps](https://www.redhat.com/en/topics/devops/what-is-gitops) article.
- RedHad [DevOps](https://www.redhat.com/en/topics/devops) article.
