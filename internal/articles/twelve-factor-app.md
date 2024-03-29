# Twelve-Factor App

The [Twelve-Factor App](https://12factor.net/) methodology is a software design and development methodology that outlines best practices for building scalable, maintainable, and cloud-native software applications. It provides a theoretical framework for designing and building software systems that can run and scale Software-as-a-Service (SaaS) applications in modern cloud environments.

- [1. Category](#1-category)
  - [1.1. Codebase](#11-codebase)
  - [1.2. Dependencies](#12-dependencies)
  - [1.3. Config](#13-config)
  - [1.4. Backing Services](#14-backing-services)
  - [1.5. Building, Release, Run](#15-building-release-run)
  - [1.6. Processes](#16-processes)
  - [1.7. Port Binding](#17-port-binding)
  - [1.8. Concurrency](#18-concurrency)
  - [1.9. Disposability](#19-disposability)
  - [1.10. Dev/Prod Parity](#110-devprod-parity)
  - [1.11. Logs](#111-logs)
  - [1.12. Admin Processes](#112-admin-processes)
- [2. References](#2-references)

## 1. Category

The Twelve-Factor App principles are technology-agnostic, meaning that they can be applied with any programming language, framework, or infrastructure.

### 1.1. Codebase

The `Codebase` principle states that each application should have a single, version-controlled codebase that is used to deploy the application across all environments.

In practice, this means that developers should use a version control system, such as Git or SVN, to manage the source code for their application. The codebase should include all of the application's code, dependencies, and configuration files, and should be used to deploy the application across all environments, from development to production.

By using a single, version-controlled codebase, developers can more easily manage and maintain their applications, and can ensure that all changes to the application are tracked and versioned. This can also help to ensure that all environments are consistent, and can reduce the risk of issues that may arise from differences between environments.

Benefits to using a single, version-controlled codebase:

- Improved collaboration
  > By using a version control system, developers can more easily collaborate on the application's codebase, and can track changes and revisions over time.

- Better versioning
  > By versioning the application's codebase, developers can more easily manage and maintain different versions of the application, and can ensure that all changes are tracked and versioned.

- Easier deployment
  > By using a single, version-controlled codebase, developers can more easily deploy the application across different environments, and can ensure that all environments are consistent and up-to-date.

### 1.2. Dependencies

The `Dependencies` principle states that applications should explicitly declare and isolate their dependencies. In a modern software application, dependencies can include libraries, frameworks, and other third-party software components that your application relies on to function properly.

In practice, this means that developers should define their application's dependencies in a manifest or configuration file, such as a `package.json` file in Node.js or a `requirements.txt` file in Python. Dependencies should be declared explicitly, including the version numbers of each dependency, and should be isolated from the application's runtime environment. This can be achieved using tools such as virtual environments, Docker containers, or other containerization technologies.

By explicitly declaring and isolating dependencies, developers can ensure that their applications are consistent across all environments, and can avoid potential issues that may arise from differences in dependencies or dependency versions. This can also help to ensure that the application can be easily deployed and scaled across different environments, and can be easily updated or modified over time.

Benefits to explicitly declaring and isolating dependencies:

- Improved consistency
  > By explicitly declaring and isolating dependencies, developers can ensure that their applications are consistent across all environments, and can avoid potential issues that may arise from differences in dependencies or dependency versions.

- Better scalability
  > By isolating dependencies from the application's runtime environment, developers can more easily deploy and scale their applications across different environments, and can ensure that the application remains consistent and reliable.

- Easier maintenance
  > By explicitly declaring dependencies, developers can more easily update or modify their applications over time, and can ensure that changes to dependencies do not impact the application's runtime environment.

> NOTE See [package managers](../about/package-managers.md) for details.

### 1.3. Config

The `Config` principle states that an application's configuration should be stored in environment variables, and should be separate from the application code.

In practice, this means that developers should store any configuration information that may change between environments, such as database credentials or API keys, in environment variables rather than hard-coding them into the application code. This can be achieved using a configuration management tool, such as Puppet or Chef, or by using a platform-as-a-service (PaaS) provider, such as Heroku, that provides built-in support for environment variables.

By storing configuration information in environment variables, developers can more easily manage and maintain their applications, and can ensure that the same application code can be used across different environments, without needing to modify the code for each environment. This can also help to ensure that sensitive information, such as passwords or API keys, are not hard-coded into the application code, and are instead stored securely in environment variables.

Benefits to storing configuration information as environment variables:

- Better portability
  > By storing configuration information in environment variables, developers can more easily deploy their applications across different environments, without needing to modify the application code for each environment.

- Improved security
  > By storing sensitive configuration information in environment variables, rather than hard-coding them into the application code, developers can improve the security of their applications and reduce the risk of security breaches. Further,  it is possible to restrict access to this information and ensure that it is not accidentally committed to source control or otherwise exposed.

- Higher scalability
  > By separating configuration information from the application code, it is possible to scale the application horizontally by running multiple instances of the same codebase with different configuration settings.

- Easier maintenance
  > By storing configuration information in environment variables, developers can more easily update or modify the application configuration over time, without needing to modify the application code.

> NOTE Avoid storing sensitive information such as secrets and credentials in environment variables, as any process running on the same machine can access them and they can be accidentally exposed through logs or debugging messages. Instead use a secure secret manager such as Hashicorp [Vault](https://github.com/hashicorp/vault) or [Dapr](https://github.com/dapr/dapr) to store sensitive information. However, in cases where environment variables are used, it is recommended to avoid global variables and instead use an [.env](https://github.com/motdotla/dotenv) file to store configuration information. The .env file should be kept secure and not accessible to unauthorized users.

### 1.4. Backing Services

The `Backing Services` principle states that any external resources that the application depends on, such as databases, message queues, or caching systems, should be treated as attached resources, and accessed via a well-defined API.

In practice, this means that applications should not depend on specific instances of backing services, but rather should be designed to work with a variety of different providers, and to use service discovery and configuration management tools to locate and connect to the appropriate services.

By treating backing services as attached resources, and accessing them via a well-defined API, applications can be more easily scaled, deployed, and updated, since the dependencies on the underlying services are managed separately from the application code.

Benefits to treating backing services as attached resources:

- Portability
  > By treating backing services as attached resources, applications can be easily moved between different environments or cloud providers, since the services can be easily swapped out or reconfigured.

- Scalability
  > By abstracting away the underlying implementation details of the backing services, applications can be more easily scaled horizontally by running multiple instances of the same codebase with different backing services.

- Maintainability
  > By decoupling the application code from the underlying services, it becomes easier to update or replace the services without impacting the application code.

### 1.5. Building, Release, Run

The `Building, Release, Run` principle states that an application should be built, released, and run as discrete stages, with each stage having a distinct responsibility. It is a process-oriented approach that emphasizes the separation of concerns between the development, deployment, and operation of the application.

In practice, this means that the development process should be broken down into three stages:

- Build
  > This stage involves compiling the application code and any required dependencies, and creating a build artifact that can be deployed to different environments. The output of this stage is a deployable artifact, such as a executable, library, Docker container or ZIP file.

- Release
  > This stage involves taking the build artifact and combining it with the configuration information needed for the specific environment. This creates a release artifact which is specific version to the environment in which the application will run. The release should be immutable, meaning that it should not be changed once it has been created.

- Run
  > This stage involves running the application in the environment for which it was released, using the specific release artifact created in the previous stage. The release artifact is deployed to a production environment and started as a process. This process should be stateless and should not rely on any shared resources.

By breaking down the development process into these discrete stages, developers can more easily manage and maintain their applications, and can ensure that each stage has a distinct responsibility. This can also help to ensure that the application is easily deployable and scalable across different environments, and that changes can be made to the application without affecting the runtime environment.

Benefits of stages:

- Consistency
  > By breaking down the development process into discrete stages, developers can ensure that each stage has a distinct responsibility, which can improve the consistency and reliability of the application across different environments.

- Portability
  > By separating the application code from the configuration and runtime environment, the application can be deployed to multiple environments without modification.

- Scalability
  > By separating the application runtime from the application code, the application can be scaled horizontally by running multiple instances of the application in parallel.

- Maintainability
  > By separating the application code from the configuration and runtime environment, the application can be updated or modified and maintained without affecting the production environment.

> NOTE See [continuous pipelines](../about/continuous-pipelines.md) for details.

### 1.6. Processes

The `Processes` principle states that applications should be designed as stateless processes, which do not maintain any application state in memory.

In practice, this means that applications should avoid storing session state, caches, or any other kind of stateful data in memory. Instead, applications should store all stateful data in external services, such as databases or caching systems, and use stateless processes to access this data via well-defined APIs.

By designing applications as stateless processes, developers can make them more easily scalable, deployable, and fault-tolerant. Stateless processes can be scaled horizontally by running multiple instances of the same codebase, and can be deployed and updated independently of each other. Since each process does not maintain any application state in memory, it can be easily replaced or restarted without affecting the overall application state.

Benefits to designing applications as stateless processes:

- Scalability
  > By designing applications as stateless processes, it becomes easier to scale the application horizontally by running multiple instances of the same codebase.

- Resilience
  > Since stateless processes do not maintain any application state in memory, they can be easily replaced or restarted without affecting the overall application state, making the application more resilient to failures.

- Maintainability
  > By separating application state from the application logic, it becomes easier to maintain and update the application over time, without risking data corruption or inconsistencies.

### 1.7. Port Binding

The `Port Binding` principle states that applications should be self-contained and should not rely on the availability of any external dependencies to run.

In practice, this means that applications should listen on a designated port and bind to it when started. The application should not assume anything about the host environment, such as the availability of a specific port or network interface, but should instead use environment variables or configuration files to specify the port number and other network settings.

By adhering to the Port Binding principle, applications can be more easily deployed and scaled across different environments, since the application code does not rely on any external dependencies or assumptions about the host environment.

Benefits of Port Binding:

- Portability
  > By using environment variables or configuration files to specify network settings, applications can be easily deployed to different environments without modification.

- Scalability
  > By binding to a designated port and listening for incoming requests, applications can be more easily scaled horizontally by running multiple instances of the same codebase on different ports or hosts.

- Robustness
  > By using a designated port and adhering to a well-defined protocol, applications can be more easily monitored, debugged, and tested, since the network interface is clearly specified and documented.

### 1.8. Concurrency

The `Concurrency` principle states that applications should be designed to take advantage of concurrency and parallelism in order to maximize resource utilization and responsiveness.

In practice, this means that applications should be designed to handle multiple requests and processes concurrently, rather than relying on a single thread or process to handle all incoming requests. This can be achieved through the use of asynchronous programming models, such as event-driven architectures or reactive programming, or by using techniques such as thread pooling and load balancing to distribute requests across multiple threads or processes.

By designing applications to take advantage of concurrency, developers can improve the performance, scalability, and responsiveness of their applications, especially in high-traffic or high-load scenarios. Concurrency allows multiple requests to be processed simultaneously, reducing latency and increasing throughput.

Benefits to designing applications to take advantage of concurrency:

- Scalability
  > By handling multiple requests concurrently, applications can more easily scale horizontally by running multiple instances of the same codebase on different hosts or clusters.

- Responsiveness
  > By processing requests asynchronously, applications can provide more responsive user experiences, since users do not have to wait for long-running operations to complete before receiving a response.

- Resource utilization
  > By maximizing resource utilization through concurrency, applications can more efficiently use available resources, reducing costs and increasing efficiency.

### 1.9. Disposability

The `Disposability` principle states that applications should be designed to be easily disposable and replaceable, and should be able to start up and shut down quickly without causing any data loss or corruption.

In practice, this means that applications should be designed to handle graceful shutdowns and restarts, and should be able to recover quickly from crashes or other failures. Applications should not rely on long-lived processes or in-memory state, but should instead use external storage systems, such as databases or file systems, to store application data.

By designing applications to be disposable, developers can ensure that their applications can be easily updated, scaled, and replaced without causing any disruptions to the user experience or data integrity. Disposable applications are also more fault-tolerant, since they can recover quickly from crashes or other failures without losing data or requiring manual intervention.

Benefits to designing applications to be disposable:

- Scalability
  > Disposable applications can be easily scaled horizontally by running multiple instances of the same codebase, allowing for more efficient resource utilization and improved performance.

- Resilience
  > Disposable applications are more resilient to failures, since they can quickly recover from crashes or other failures without losing data or requiring manual intervention.

- Maintainability
  > By separating application logic from application state, disposable applications are easier to maintain and update over time, without risking data corruption or inconsistencies.

### 1.10. Dev/Prod Parity

The `Dev/Prod Parity` principle states that the development, testing, and production environments should be as similar as possible in order to minimize differences and avoid issues that may arise from environment-specific configuration or dependencies.

In practice, this means that developers should strive to use the same tools, libraries, and configurations in all environments, and should avoid making changes to the production environment that are not tested and approved in the development and testing environments. This can be achieved through the use of automated build and deployment processes, version control, and configuration management tools.

By ensuring that the development, testing, and production environments are as similar as possible, developers can reduce the risk of issues arising from environment-specific differences, such as incompatible dependencies, configuration mismatches, or differences in hardware or software. This can help to minimize the time and effort required to deploy and maintain applications, and can improve the overall quality and reliability of the application.

Benefits to ensuring dev/prod parity:

- Reduced risk
  > By minimizing environment-specific differences, developers can reduce the risk of issues arising from incompatibilities or mismatches.

- Improved quality
  > By ensuring that changes are tested and approved in the development and testing environments before being deployed to production, developers can improve the quality and reliability of the application.

- Faster deployments
  > By using automated build and deployment processes, developers can reduce the time and effort required to deploy and maintain applications, allowing for faster and more frequent deployments.

### 1.11. Logs

The `Logs` principle states that applications should treat logs as event streams, and should generate logs in a standardized format that can be easily aggregated and analyzed.

In practice, this means that developers should design their applications to generate logs in a standardized format, such as JSON or syslog, and should use logging frameworks and libraries that support structured logging. Logs should be generated for all significant events, such as requests, errors, and warnings, and should be sent to a centralized logging service, such as Splunk, Logstash or Elasticsearch, where they can be aggregated, analyzed, and searched.

By treating logs as event streams, developers can gain valuable insights into the behavior and performance of their applications, and can quickly identify and diagnose issues that may arise. Centralized logging also makes it easier to manage and maintain logs, and can provide a centralized source of truth for debugging and troubleshooting.

> NOTE For more information see the article about [Logging and Monitoring](../about/logging-and-monitoring.md).

Benefits to treating logs as event streams:

- Improved troubleshooting
  > By generating logs for all significant events, developers can quickly identify and diagnose issues that may arise, reducing the time and effort required for troubleshooting.

- Better performance monitoring
  > By analyzing log data, developers can gain insights into the behavior and performance of their applications, and can identify bottlenecks or other issues that may be impacting performance.

- Easier maintenance
  > By centralizing logs in a single location, developers can more easily manage and maintain logs, and can ensure that all logs are retained for the appropriate length of time.

Example of conform Logs principle:

```go
package main

import (
    "os"
    "github.com/rs/zerolog"
    "github.com/rs/zerolog/log"
)

func main() {
    // Set up the logger to output JSON format
    log.Logger = log.Output(zerolog.ConsoleWriter{Out: os.Stderr})

    // Set the logging level to debug
    zerolog.SetGlobalLevel(zerolog.DebugLevel)

    // Log some events
    log.Debug().Msg("This is a debug message")
    log.Info().Msg("This is an info message")
    log.Warn().Msg("This is a warning message")
    log.Error().Msg("This is an error message")
}
```

### 1.12. Admin Processes

The `Admin Processes` principle states that applications should provide administrative processes as one-off processes that can be run independently of the application's main processes.

In practice, this means that developers should design their applications to provide a set of administrative processes that can be used to perform tasks such as database migrations, backups, and other maintenance tasks. These administrative processes should be run independently of the application's main processes, and should be designed to run in a single execution environment, rather than being part of the application's ongoing runtime.

By providing administrative processes as one-off processes, developers can more easily manage and maintain their applications, and can avoid potential issues that may arise from running administrative tasks as part of the application's ongoing runtime. This can also help to ensure that administrative tasks are performed in a consistent and repeatable manner, regardless of the underlying environment.

Benefits to providing administrative processes as one-off processes:

- Improved reliability
  > By running administrative tasks as one-off processes, developers can reduce the risk of issues that may arise from running administrative tasks as part of the application's ongoing runtime.

- Better manageability
  > By providing administrative processes as one-off processes, developers can more easily manage and maintain their applications, and can ensure that administrative tasks are performed in a consistent and repeatable manner.

- Easier scaling
  > By separating administrative tasks from the application's main processes, developers can more easily scale their applications and ensure that administrative tasks do not impact the performance or reliability of the application's main processes.

## 2. References

- Sentenz [package managers](../about/package-managers.md) article.
- Sentenz [continuous pipelines](../about/continuous-pipelines.md) article.
- Sentenz [logging and monitoring](../about/logging-and-monitoring.md) article.
- Google [twelve-factor app](https://cloud.google.com/architecture/twelve-factor-app-development-on-gcp?hl=en) article.
- IBM [twelve plus factors](https://www.ibm.com/cloud/blog/12-plus-factors-for-containerized-ui-microservices) article.
- IBM [seven missing factors](https://www.ibm.com/cloud/blog/7-missing-factors-from-12-factor-applications) article.
- Github [twelve-factor app](https://github.com/heroku/12factor) repository.
