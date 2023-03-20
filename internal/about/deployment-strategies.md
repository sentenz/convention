# Deployment Strategies

Deployment strategies are the various approaches or techniques used to deploy software applications or updates to production environments.

- [1. Category](#1-category)
  - [1.1. Blue/Green Deployment](#11-bluegreen-deployment)
  - [1.2. Red/Black Deployment](#12-redblack-deployment)
  - [1.3. Rolling Deployment](#13-rolling-deployment)
  - [1.4. Canary Deployment](#14-canary-deployment)
  - [1.5. A/B Testing](#15-ab-testing)
  - [1.6. Shadow Deployment](#16-shadow-deployment)
  - [1.7. Immutable Deployment](#17-immutable-deployment)
  - [1.8. Feature Toggle Deployment](#18-feature-toggle-deployment)
  - [1.9. Rollback Deployment](#19-rollback-deployment)
  - [1.10. Immutable Infrastructure Deployment](#110-immutable-infrastructure-deployment)
- [2. Principle](#2-principle)
- [3. Best Practice](#3-best-practice)
- [4. Terminology](#4-terminology)
- [5. References](#5-references)

## 1. Category

### 1.1. Blue/Green Deployment

In Blue/Green deployment strategy, two identical production environments (blue and green) are maintained. The new version of the application is deployed to the green environment, and the traffic is gradually shifted from the blue environment to the green environment. This approach ensures that the new version of the application is thoroughly tested before being made available to users. The theoretical basis for this deployment strategy is that it ensures high availability and reduces the risk of downtime.

### 1.2. Red/Black Deployment

In Red/Black deployment strategy, two identical production environments (red and black) are maintained, with the current production environment being the red environment. The new version of the application is deployed to the black environment, and once it is tested and deemed stable, the traffic is switched to the black environment, making it the new production environment. This approach ensures that the new version of the application is thoroughly tested before being made available to users. The theoretical basis for this deployment strategy is that it ensures high availability and reduces the risk of downtime by enabling a smooth transition from the old to the new version.

### 1.3. Rolling Deployment

In rolling deployment strategy, the new version of the application is gradually deployed to a subset of servers in the production environment, and the process continues until all servers have been updated. This approach ensures that the application is continuously available to users and that any issues that arise can be detected and resolved quickly. The theoretical basis for this deployment strategy is that it minimizes the risk of downtime and ensures that the application remains available even during the deployment process.

### 1.4. Canary Deployment

In Canary deployment strategy, the new version of the application is deployed to a small subset of users or servers to test its functionality and performance before gradually rolling it out to the entire production environment. This approach ensures that any issues with the new version are detected and resolved before it is made available to all users. The theoretical basis for this deployment strategy is that it ensures high availability and reduces the risk of downtime.

### 1.5. A/B Testing

In A/B Testing deployment strategy, two different versions of the application are deployed simultaneously to different subsets of users. This approach allows for the comparison of the two versions, making it possible to determine which version performs better. The theoretical basis for this deployment strategy is that it ensures high availability and enables continuous improvement of the application.

### 1.6. Shadow Deployment

In Shadow deployment strategy, the new version of the application is deployed to a separate production environment, and a portion of the production traffic is routed to it. The results of the new deployment are then compared to the current production environment to ensure that the new version is performing as expected. The theoretical basis for this deployment strategy is that it ensures high availability and reduces the risk of downtime.

### 1.7. Immutable Deployment

In Immutable deployment strategy, a new environment is created for each new version of the application instead of updating the existing environment. The new environment is created from a base image that includes the entire application stack. This approach helps to reduce the risk of issues arising from configuration changes or updates. The theoretical basis for this deployment strategy is that it ensures high availability and reduces the risk of downtime by isolating the new version of the application from the existing environment.

### 1.8. Feature Toggle Deployment

In Feature deployment strategy, new features are deployed to production but kept disabled until they are tested and deemed stable. This approach allows for the gradual rollout of new features while minimizing the risk of issues. The theoretical basis for this deployment strategy is that it ensures high availability and reduces the risk of downtime by enabling developers to deploy new features without disrupting the production environment.

### 1.9. Rollback Deployment

In Rollback deployment strategy, the new version of the application is deployed to the production environment, but in the event of any issues or failures, the deployment can be rolled back to the previous version. This approach ensures that the application remains available to users, even in the event of issues or failures. The theoretical basis for this deployment strategy is that it ensures high availability and reduces the risk of downtime by allowing for quick rollback to a previous version.

### 1.10. Immutable Infrastructure Deployment

In Immutable Infrastructure deployment strategy, a new infrastructure is created for each new version of the application using code, making it easy to manage and deploy. This approach ensures that the infrastructure is consistent across all environments and reduces the risk of issues arising from manual configuration changes. The theoretical basis for this deployment strategy is that it ensures high availability and reduces the risk of downtime by ensuring that the infrastructure is reliable and consistent.

## 2. Principle

By adhering to these principles, deployment strategies can be designed and implemented to ensure high availability, reliability, and stability of the application while minimizing disruption and downtime for users.

- Continuous Integration
  > Continuous integration is the practice of frequently integrating code changes into a central repository and ensuring that automated tests are run to detect issues as early as possible. This principle ensures that issues are caught early in the development process, reducing the risk of problems occurring during deployment.

- Continuous Delivery
  > Continuous delivery is the practice of automating the deployment process so that code changes can be quickly and safely released to production. This principle ensures that deployments are quick and efficient, minimizing downtime and disruption to users.

- Automation
  > Automation is the practice of using tools and processes to automate the deployment process. This principle ensures that deployments are consistent, repeatable, and reliable, reducing the risk of human error.

- Rollback Capability
  > Rollback capability is the ability to quickly and easily revert to a previous version of the application in the event of issues or failures. This principle ensures that the application remains available to users even in the event of issues or failures.

- Testing
  > Testing is the practice of running automated tests to ensure that the application is functioning correctly and that new code changes do not introduce issues. This principle ensures that the application is stable and reliable before being released to production.

- Monitoring
  > Monitoring is the practice of tracking the performance and health of the application in real-time. This principle ensures that issues can be quickly detected and addressed before they become serious problems.

- Incremental Changes
  > Incremental changes is the practice of making small, incremental changes to the application rather than large, sweeping changes. This principle ensures that deployments are less disruptive and that issues are easier to isolate and troubleshoot.

## 3. Best Practice

By following these best practices, deployment strategies can be designed and implemented to ensure that deployments are consistent, reliable, and efficient, while minimizing disruption and downtime for users.

- Use Version Control System
  > Use a version control system to manage code changes and ensure that all changes are properly tracked and documented.

- Use Continuous Pipelines
  > Use a continuous pipelines to manage the deployment process and ensure that all steps are properly coordinated and executed. Continuous integration (CI) and continuous deployment (CD) are two closely related practices that involve automating the testing, building, and deployment of code changes. By implementing CI/CD, you can ensure that code changes are tested and deployed quickly and reliably. Theoretical basis for this practice is that it ensures fast and efficient deployments with reduced risk of errors.

- Use Automated Deployment Tools
  > Automation is one of the key principles of effective deployment strategies. By using automated deployment tools, you can ensure that deployments are consistent, repeatable, and reliable. These tools can also help to reduce the risk of human error and speed up the deployment process. Theoretical basis for this practice is that it ensures efficient, accurate and reliable deployments.

- Implement Rollback Capability
  > Rollback capability is the ability to quickly and easily revert to a previous version of the application in the event of issues or failures. By implementing rollback capability, you can ensure that the application remains available to users even in the event of issues or failures. Theoretical basis for this practice is that it enables quick and easy recovery from failures.

- Use Feature Flags
  > Feature flags are a mechanism for controlling the visibility of new features in the application. By using feature flags, you can gradually roll out new features to users, monitor their performance, and quickly revert to the previous version if necessary. Theoretical basis for this practice is that it enables gradual release of new features while minimizing risk.

- Use Zero-Downtime Deployment
  > Use blue/green or canary deployments to ensure that changes are gradually rolled out to users, minimizing the risk of downtime or issues.

- Monitor Performance and Health
  > Monitoring the performance and health of the application in real-time is critical for detecting issues and addressing them before they become serious problems. By using monitoring tools, you can track key performance indicators (KPIs) and respond quickly to issues as they arise. Theoretical basis for this practice is that it enables proactive detection and resolution of issues.

- Test the deployment process
  > Test the deployment process itself to ensure that it is working as expected and that deployments are successful.

- Test Deployments in Staging Environment
  > Before deploying changes to the production environment, it is recommended to test them in a staging environment that closely mimics the production environment. This allows you to identify any issues before deploying to production, reducing the risk of downtime or other issues. Theoretical basis for this practice is that it enables thorough testing of changes before they go live.

- Use Configuration Management
  > Use configuration management to manage the configuration of the application and ensure that change

## 4. Terminology

Understanding and using this terminology, developers and operations teams can more effectively communicate and implement deployment strategies.

- Deployment Pipeline
  > A series of steps that code changes go through in order to be deployed to production. This pipeline typically includes steps such as building, testing, and deploying the code changes.

- Rollback
  > The ability to quickly and easily revert to a previous version of the application in the event of issues or failures.

- Canary Analysis
  > A technique for evaluating the performance and stability of a new version of the application by gradually increasing the percentage of users who are redirected to the new version while monitoring performance metrics and error rates.

- Configuration Management
  > The practice of using tools and processes to manage the configuration of the application and infrastructure. This includes settings such as environment variables, database connections, and server configurations.

- Environment
  > A set of servers, services, and infrastructure components that are used to host and run the application. Examples include development, testing, staging, and production environments.

- Zero-Downtime Deployment
  > A deployment strategy where updates are made to the application without any interruption to user traffic. This is typically achieved using strategies such as blue/green or canary deployments.

## 5. References

Google [deployment strategies](https://cloud.google.com/architecture/application-deployment-and-testing-strategies) article.
