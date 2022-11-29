# Software Development Environment

A Software Development Environment (SDE) is the collection of hardware and software tools a system developer uses to build software systems.

- [1. Development Environment](#1-development-environment)
- [2. Test Environment](#2-test-environment)
- [3. Staging Environment](#3-staging-environment)
- [4. Continuous Environment](#4-continuous-environment)
- [5. Production Environment](#5-production-environment)
- [6. References](#6-see-also)

## 1. Development Environment

A [development environment](https://www.suse.com/suse-defines/definition/development-environment/) is the collection of processes and tools that are used to develop the source code for a program or software product. This involves the entire environment that supports the process end to end, including development, staging and production servers. The development environment automates or facilitates the routines involved in creating, testing, debugging, patching, updating, and maintaining software, including long-term maintenance.

Within the overarching development environment, the integrated development environment (IDE) is a development tool that developers use to write, build, test, and debug software programs. The IDE provides a clear and consistent interface that supports the processes of writing and testing code, and packaging it for release. Having a single tool to author, modify, compile, deploy and debug the software reduces the setup time needed when the team has to piece together different development utilities. It also improves overall developer productivity and leads to a more efficient overall development environment.

<!-- A development environment is configured to enable developers to write code quickly, verify it by creating basic tests, and be productive. This environment resources are much smaller than what it takes to run an entire application in real-life implementation. It also features developer-specific tools that may at times hinder rigorous QA validation. And most importantly, the development environment is constantly changing – with new functionality being added all the time – which makes it difficult for QA team to run time-consuming tests, e.g., regression or integration tests, without disrupting the development process. -->

## 2. Test Environment

A [test environment](https://www.suse.com/suse-defines/definition/test-environment/) is part of the software development lifecycle, and consists of all of the elements needed to test software builds and report findings. The test environment needs to mimic the production environment precisely, including hardware configuration, software configuration, operating systems, databases, etc., so it can expose any issues that are related to the environment or configuration the software will encounter when it is in production.

Test environment management (TEM) is a part of the software delivery process that supports the testing activities by providing a stable, validated test environment where test scenarios can be executed, bugs can be replicated, and more.

TEM is responsible for maintaining a repository of test environments that are suitable for the development projects in the pipeline, creating new ones when needed, monitoring and analyzing test environment data for issues and trends, and allocating these test environments to the development teams as needed.

<!-- A testing environment is where the QA team can use a variety of testing tools to run all their different tests over the application code taken from the development environment. While developers check their code for simple bugs before passing it for quality assurance, QA engineers execute more complex and time-consuming types of tests to check the compatibility of the new and old code, the correct integration of different modules, the system’s performance, etc. Running such tests on the development environment would lead to a huge waste of the developers’ time. -->

## 3. Staging Environment

Even though testing is typically performed alongside development, the need for user-acceptance testing on a staging environment is of paramount importance. A staging environment is an identical replica of the customer’s production environment, which also typically contains real production data that’s been sanitized for safety purposes. It is hosted in the same way as the production servers and involves an identical setup and update operations. Therefore, testing on a staging environment offers the most reliable way to check code quality and ensure the production servers are successful.

A testing environment – even though critical for ongoing code quality assurance – can hardly achieve the same real-life degree of the customer’s system emulation. That’s why it is a common best practice to have the application code thoroughly tested on the staging environment before moving it to production. It is considered a must for enterprise applications.

## 4. Continuous Environment

Continuous environment based on [Continuous Pipelines](../../internal/about/continuous-pipelines.md) are created on demand exclusively for the continuous execution of automated [XOps](../../internal/about/xops.md) pipelines and then automatically destroyed.

The three primary approaches for the continuous method are:

- Continuous integration (CI) is the practice of merging all developer code into a shared repository several times a day. This practice allows developers to collaborate and identify problems early in the development phase.

- Continuous delivery (CD) is an extension of continuous integration since it automatically deploys all code changes to a testing and/or production environment after the build stage.

- Continuous deployment (CD) automates continuous delivery. With this practice, every change that passes all stages of the DevOps pipeline is released to production environment. There's no human intervention, and only a failed test will prevent a new change to be deployed to production.

## 5. Production Environment

A [production environment](https://www.suse.com/suse-defines/definition/production-environment/), sometimes called deployment environment, is the set of computers where finished, user-ready software is deployed and executed. When software code is moved to the production environment, it is the final step in a 4-tier architecture that includes development, [testing](#2-test-environment), [staging](#3-staging-environment) and production. Before it reaches the production environment, the software is still under [development](#1-development-environment), and bugs and flaws are actively found and fixed. When it is deemed ready for production, it is expected to work without error.

The production environment is often referred to as live, especially for servers. It is the environment that users interact with. Deploying to the production environment is handled very carefully, and may require [deployment strategies](../../internal/about/deployment-strategies.md) to enable users to transition smoothly to a new version, such as deploying one server with the old code and one with the new, and redirecting traffic to the new server. Deploying a new release can mean an interruption in service, so some user notification may be needed.

In [DevOps](../../internal/about/xops.md#1-devops), the [testing environment](#2-test-environment) and [staging environment](#3-staging-environment) are usually replaced by the [continuous environment](#4-continuous-environment).

<!-- A production environment, sometimes called deployment environment, is where the application lives and operates after the launch. It is where you deploy all the final work for your customer or roll out your new version of the application to be accessed by your clients.

Before you can deploy your code from your development environment into the production environment, there are a few more things for you to do. The first one is testing. To ensure the testing is properly set up, there’s a need for a separate [testing environment](#2-test-environment). It is specifically configured to allow the team to effectively execute their tests and check the system components in different use case scenarios.

The second activity you usually need to do before placing your code to production is the user-acceptance testing. This is when you check the entire system in the exact way it is going to be used in production, including live data volumes and types of data as well as user behavior. This type of testing requires a [staging environment](#3-staging-environment), which is identical to your production environment except that it’s not publicly accessible to end-users. -->

## 6. References

- Codebots [SDE](https://codebots.com/app-development/what-are-environments-in-software-development-a-guide-to-the-development-beta-and-production-environments) article.
- Oroinc [environments types](https://doc.oroinc.com/cloud/environments/) article.
