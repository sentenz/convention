# Software Development Environment

A Software Development Environment (SDE) is the collection of hardware and software tools a system developer uses to build software systems.

- [Development Environment](#development-environment)
- [Testing Environment](#testing-environment)
- [Staging Environment](#staging-environment)
- [CI/CD Environment](#cicd-environment)
- [Production Environment](#production-environment)
- [See also](#see-also)

## Development Environment

A development environment is configured to enable developers to write code quickly, verify it by creating basic tests, and be productive. This environment resources are much smaller than what it takes to run an entire application in real-life implementation. It also features developer-specific tools that may at times hinder rigorous QA validation. And most importantly, the development environment is constantly changing – with new functionality being added all the time – which makes it difficult for QA team to run time-consuming tests, e.g., regression or integration tests, without disrupting the development process.

## Testing Environment

A testing environment is where the QA team can use a variety of testing tools to run all their different tests over the application code taken from the development environment. While developers check their code for simple bugs before passing it for quality assurance, QA engineers execute more complex and time-consuming types of tests to check the compatibility of the new and old code, the correct integration of different modules, the system’s performance, etc. Running such tests on the development environment would lead to a huge waste of the developers’ time.

## Staging Environment

Even though testing is typically performed alongside development, the need for user-acceptance testing on a staging environment is of paramount importance. A staging environment is an identical replica of the customer’s production environment, which also typically contains real production data that’s been sanitized for safety purposes. It is hosted in the same way as the production servers and involves an identical setup and update operations. Therefore, testing on a staging environment offers the most reliable way to check code quality and ensure the production servers are successful.

A testing environment – even though critical for ongoing code quality assurance – can hardly achieve the same real-life degree of the customer’s system emulation. That’s why it is a common best practice to have the application code thoroughly tested on the staging environment before moving it to production. It is considered a must for enterprise applications.

## CI/CD Environment

[CI/CD](../about/ci-cd.md) environments are created on demand exclusively for the continuous execution of automated [DevOps](../about/devops.md) pipelines and then automatically destroyed.

The three primary approaches for the continuous method are:

- Continuous integration (CI) is the practice of merging all developer code into a shared repository several times a day. This practice allows developers to collaborate and identify problems early in the development phase.

- Continuous delivery (CD) is an extension of continuous integration since it automatically deploys all code changes to a testing and/or production environment after the build stage.

- Continuous deployment (CD) automates continuous delivery. With this practice, every change that passes all stages of the DevOps pipeline is released to production environment. There's no human intervention, and only a failed test will prevent a new change to be deployed to production.

## Production Environment

A production environment is where your application lives and operates after the launch. It is where you deploy all the final work for your customer or roll out your new version of the application to be accessed by your clients.

Now, before you can deploy your code from your development environment into the production environment, there are a few more things for you to do. The first one is testing. To ensure the testing is properly set up, there’s a need for a separate testing environment. It is specifically configured to allow the team to effectively execute their tests and check the system components in different use case scenarios.

The second activity you usually need to do before placing your code to production is the user-acceptance testing. This is when you check the entire system in the exact way it is going to be used in production, including live data volumes and types of data as well as user behavior. This type of testing requires a staging environment, which is identical to your production environment except that it’s not publicly accessible to end-users.

## See also

- Codebots [SDE](https://codebots.com/app-development/what-are-environments-in-software-development-a-guide-to-the-development-beta-and-production-environments) article.
- Oroinc [environments types](https://doc.oroinc.com/cloud/environments/) article.
