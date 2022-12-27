# XOps

XOps, an umbrella term used for a combination of IT tech like DevOps, DevSecOps, AIOps, MLOps, GitOps, and BizDevOps. XOps supposedly helps to shorten a system development cycles and provides continuous delivery with high software quality.

XOps automates processes, manages pipelines and workflows through scripts. Developers are able to extend XOps with custom interfaces, connectors, and functions. XOps aids in making business processes more efficient and automating everything that can be automated to achieve business goals.

- [1. DevOps](#1-devops)
- [2. GitOps](#2-gitops)
- [3. DevSecOps](#3-devsecops)
- [4. SysOps](#4-sysops)
- [5. BizDevOps](#5-bizdevops)
- [6. DataOps](#6-dataops)
- [7. MLOps](#7-mlops)
- [8. AIOps](#8-aiops)
- [9. CloudOps](#9-cloudops)
- [10. References](#10-references)

## 1. DevOps

[DevOps](https://www.techtarget.com/searchitoperations/definition/DevOps) is a combination of the terms development and operations, meant to represent a collaborative or shared approach to the tasks performed by a company's application development and IT operations teams.

A DevOps approach is one of many techniques IT staff use to execute IT projects that meet business needs. DevOps can coexist with Agile software development, IT service management frameworks, such as ITIL, project management directives, such as Lean and Six Sigma and other strategies.

While DevOps is not a technology, DevOps environments generally apply common methodologies.

- Code Repositories
  > Version-controlled source code repositories enable multiple developers to work on code. Developers check code out and in, and they can revert to a previous version of code if needed. These tools keep a record of modifications made to the source code. Without tracking, developers may struggle to follow which changes are recent and which versions of the code are available to end users.
  >
  > In a Continuous pipeline, a code change committed in the version-control repository automatically triggers next steps, such as a static code analysis or build and unit tests. Tools for source code management include Git and GitHub.

- Artifact Repositories
  > Source code is compiled into an artifact for testing. Artifact repositories enable version-controlled, object-based outputs. Artifact management is a good practice for the same reasons as version-controlled source code management. Examples of artifact repositories include JFrog Artifactory and Nexus Repository.

- Continuous Pipelines
  > Continuous pipelines enables DevOps teams to frequently validate and deliver applications to the end user through automation during the development lifecycle. The continuous integration tool initializes processes so that developers can create, test and validate code in a shared repository as often as needed without manual work. Continuous delivery extends these automatic steps through production-level tests and configuration setups for release management. Continuous deployment goes a step further, invoking tests, configuration and provisioning, as well as monitoring and potential rollback capabilities. Common tools for CI, CD or both include Jenkins, GitLab and CircleCI.

- Containers
  > Containers are isolated runtimes for software on a shared OS. Containers provide abstraction that enables code to work the same on different underlying infrastructure from development to testing and staging, and then to production. Docker is the most well-known containerization software, while Microsoft offers specific Windows container options. Container orchestrators -- such as Kubernetes and commercial Kubernetes distributions Red Hat OpenShift and Amazon Elastic Kubernetes Service -- deploy, scale and maintain containers automatically.

- Configuration Management
  > Configuration management systems enable IT to provision and configure software, middleware and infrastructure based on a script or template. The DevOps team can set up deployment environments for software code releases and enforce policies on servers, containers and VMs through a configuration management tool. Changes to the deployment environment can be version controlled and tested, so DevOps teams can manage infrastructure as code. Configuration management tools include Puppet and Chef.

## 2. GitOps

[GitOps](https://www.weave.works/blog/gitops-operations-by-pull-request) is a specific system operations process (ops) tied to a specific tool (Git). Git is an evolution of Infrastructure as Code (IaC) and a DevOps best practice that uses Git as the single source of truth and control mechanism for building, updating, and deleting the infrastructure architecture. Weaveworks is credited with creating the term GitOps.

## 3. DevSecOps

[DevSecOps](https://www.redhat.com/en/topics/devops/what-is-devsecops) is a set of principles and practices for protecting software, infrastructure, applications and data. DevSecOps stands for development, security, and operations. It's an approach to culture, automation, and platform design that integrates security as a shared responsibility throughout the entire IT lifecycle.

## 4. SysOps

## 5. BizDevOps

BizDevOps, also known as DevOps 2.0, is an approach to software development that encourages developers, operations staff and business teams to work together so the organisation can develop software more quickly, be more responsive to user demand, and ultimately maximise revenue.

[BizDevOps](https://www.google.com/amp/s/www.techtarget.com/searchsoftwarequality/definition/BizDevOps-Business-Development-and-Operations%3famp=1)

## 6. DataOps

This is a popular process in analytics that is slowly picking up at a good pace. It tries to reduce the cycle time of data analytics projects while improving the quality; it starts right from the beginning of the pipeline (data preparation) and is deployed to various points in the analytics chain and IT operations. Technology is used to automate the design and management of data delivery while adhering to appropriate levels of governance.

## 7. MLOps

MLOps refers to creating, deploying and maintaining machine learning models. It is an umbrella term that involves combining a variety of methods such as DevOps, machine learning, and handling of data that can simplify and build more efficient ways of deploying machine learning algorithms. All of this has to be done while keeping the business goals in mind.

[MLOps](https://analyticsindiamag.com/mlops-vs-devops-a-comparative-analysis/)

## 8. AIOps

## 9. CloudOps

CloudOps refers to managing activities involving optimising IT workloads or services in the cloud. It comes with different aspects such as cloud architecture, software development, security as well as compliance. The goal here is to improve the accessibility and efficiency of cloud services in the business.

## 10. References

- Atlassian [devops](https://www.atlassian.com/devops/what-is-devops) article.
- GitHub [devops](https://github.com/learn/devops) article.
- Microsoft [devops](https://docs.microsoft.com/en-us/azure/devops/boards/best-practices-agile-project-management?view=azure-devops&tabs=basic-process) article.
- Microsoft [devsecops](https://docs.microsoft.com/en-us/azure/architecture/solution-ideas/articles/devsecops-in-github) article.
- Google [DORA metrics](https://cloud.google.com/blog/products/devops-sre/using-the-four-keys-to-measure-your-devops-performance?utm_source=thenewstack&utm_medium=website&utm_campaign=platform) article.
- Google managing infrastructure as code with [Terraform, Cloud Build, and GitOps](https://cloud.google.com/architecture/managing-infrastructure-as-code?hl=en&skip_cache=true) article.
- GitLab [GitOps](https://about.gitlab.com/topics/gitops/) article.
- RedHad [GitOps](https://www.redhat.com/en/topics/devops/what-is-gitops) article.
- RedHad [DevOps](https://www.redhat.com/en/topics/devops) article.
