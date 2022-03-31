# Twelve-Factor App // TODO

The [twelve-factor app](https://12factor.net/) methodology describes a set of principles and best practices, to develop scalable and resilient apps that can be continuously deployed with high agility.

- [See also](#see-also)

The twelve factors:

1. Codebase
   > Prescribes that code to be stored in a version control system.
   >
   > - Storing  a source code in a repository that is accessible to development, testing, and system administration such as Git, Mercurial or Subversion.

2. Dependencies
   > Prescribes that dependencies must be explicitly declared and isolated by version.
   >
   > - Specify dependencies in [build systems](build-sytems.md) and [package managers](package-managers.md).
   > - Container applications declare and isolate dependencies while abstracting the underlying environment and isolating them from each other.

3. Configuration
   > Prescribes that configuration and secrets be externalized outside of the codebase.
   >
   > - Load variables from a [.env](https://github.com/motdotla/dotenv) file or from environment variables.
   > - Isolate secrets in a secrets management tool like Hashicorp [Vault](https://github.com/hashicorp/vault).
   > - [Dapr](https://github.com/dapr/dapr) offers a [secrets management building block](https://docs.dapr.io/developing-applications/building-blocks/secrets/secrets-overview/) abstracts away the complexity of working with secrets and secret management tools.
   >
   > `Warning`
   >
   > - Never load sensitive variables such as secrets from environment variables, but use secret manager instead. Environment variables, especially global ones, may be dumped. Try to avoid environment variables in general, use the `.env` file instead.

4. Backing Services
   > Prescribes that external dependencies accessing data storage (such as MySQL or PostgreSQL), messaging/queuing systems (such as RabbitMQ), SMTP services for outgoing email (such as Postfix), and caching systems (such as Memcached) should be specified in the application configuration.
   >
   > - Load backing services variables from a [.env](https://github.com/motdotla/dotenv) file.

5. Build, Release, Run
   > Prescribes a strict separation of the build (binary), release (binary and + env config) and run (exec runtime) stages.
   >
   > - A clear separation of concern and automation using continuous integration and continuous delivery (CI/CD) pipelines.

6. Processes
   > Prescribes that apps and services should be stateless and share-nothing. Any data that needs to persist must be stored in a stateful backing service.
   >
   > - Container applications are designed to run with a single and ephemeral scope.

7. Port Binding
   > Prescribes that applications are standalone and independent processes that do not run under the control of a parent process and export services using port binding.
   >
   > - Load port variables from a [.env](https://github.com/motdotla/dotenv) file.
   > - Define ports for services in Dockerfile.

8. Concurrency
   > // TODO

9. Disposability
   > Prescribes that application processes can be started and stopped at any time. Therefore, minimize the startup time and shut down gracefully.
   >
   > - For instance, application shouldn’t stop when it’s writing to a backing service. To do so, our app must be able to capture signals, ensure that we finish calls, and then stop the app.

10. Dev/Prod Parity
    > Prescribes to keep development, staging and production as similar as possible.
    >
    > - Using CI/CD, a merge with a major branch is automatically deployed in the development, staging and production environment.
    > - Docker containers ensure that the environments stay the same for local, development, staging and production environments.

11. Logs
    > // TODO

12. Admin Processes
    > // TODO

## See also

- Github [12factor]((https://github.com/heroku/12factor)) repository.
- IBM [12+ Factors](https://www.ibm.com/cloud/blog/12-plus-factors-for-containerized-ui-microservices) for containerized UI microservices article.
- IBM [7 Missing Factors](https://www.ibm.com/cloud/blog/7-missing-factors-from-12-factor-applications) from twelve-factor app article.
- Google [twelve-factor app](https://cloud.google.com/architecture/twelve-factor-app-development-on-gcp?hl=en) development on Cloud article.
