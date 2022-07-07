# DevOps

DevOps practices enable software developers (devs) and operations (ops) teams to accelerate delivery through automation, collaboration, fast feedback, and iterative improvement.



- [GitOps](#gitops)
- [DevOps](#devops)
- [DevSecOps](#devsecops)
- [See also](#see-also)

## GitOps

[GitOps](https://www.weave.works/blog/gitops-operations-by-pull-request) is a specific system operations process (ops) tied to a specific tool (Git). Git is an evolution of Infrastructure as Code (IaC) and a DevOps best practice that uses Git as the single source of truth and control mechanism for building, updating, and deleting the infrastructure architecture. Weaveworks is credited with creating the term GitOps.

Including principles and practices:

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

## DevOps

[DevOps](https://www.bunnyshell.com/blog/what-is-devops) is an approach to culture, operations, tools, and automation that consists of a set of principles, best practices, and conventions aimed at producing applications and services at a high rate of deployment.

Including principles and practices:

- Planning
  > Schedule planning and task tracking tools are needed to ensure the DevOps team knows what tasks are at hand, what is currently being done, and whether there are any risks of falling behind schedule.
  >
  > Tools like Confluence and Jira help DevOps teams achieve a seamless and efficient project management cycle and ensure timely product delivery.

- [CI/CD](../about/ci-cd.md)
  > Automate agile software development workflow. Using a continuous and iterative process to build, test, and deploy helps avoid bugs and code failures.

- [Logging and Monitoring](../about/logging-monitoring.md)
  > Software in production must be monitored to ensure stable performance and increased customer satisfaction. This stage also involves performance analysis and logging, raising smart alerts on various issues, gathering customer feedback
  >
  > Tools for performing these tasks include Prometheus, Grafana, Elastic (ELK) Stack, Splunk, and Sumo Logic.

## DevSecOps

[DevSecOps](https://www.redhat.com/en/topics/devops/what-is-devsecops) is a set of principles and practices for protecting software, infrastructure, applications and data. DevSecOps stands for development, security, and operations. It's an approach to culture, automation, and platform design that integrates security as a shared responsibility throughout the entire IT lifecycle.

Including principles and practices:

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
