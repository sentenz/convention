# 017-ADR: AWS Compute Service Selection

Architectural Decision Records (ADR) on selecting AWS compute services and Amazon EC2 instance families according to workload characteristics, operational responsibility, scalability, reliability, security, and cost requirements.

- [1. State](#1-state)
- [2. Context](#2-context)
- [3. Decision](#3-decision)
  - [3.1. Workload-Driven Selection Hierarchy](#31-workload-driven-selection-hierarchy)
  - [3.2. Managed and Serverless Compute First](#32-managed-and-serverless-compute-first)
  - [3.3. Amazon EC2 by Exception](#33-amazon-ec2-by-exception)
  - [3.4. Amazon EKS by Explicit Kubernetes Requirement](#34-amazon-eks-by-explicit-kubernetes-requirement)
  - [3.5. Cost, Performance, and Reliability Controls](#35-cost-performance-and-reliability-controls)
- [4. Considered](#4-considered)
  - [4.1. Amazon EC2](#41-amazon-ec2)
  - [4.2. AWS Lambda](#42-aws-lambda)
  - [4.3. Amazon ECS with AWS Fargate](#43-amazon-ecs-with-aws-fargate)
  - [4.4. Amazon EKS](#44-amazon-eks)
  - [4.5. AWS Batch](#45-aws-batch)
  - [4.6. AWS Elastic Beanstalk](#46-aws-elastic-beanstalk)
  - [4.7. Amazon Lightsail](#47-amazon-lightsail)
- [5. Consequences](#5-consequences)
- [6. Implementation](#6-implementation)
  - [6.1. Steps](#61-steps)
  - [6.2. Affected Areas](#62-affected-areas)
  - [6.3. Validation](#63-validation)
- [7. References](#7-references)

## 1. State

- Author(s): Sentenz
- Date: 2026-07-10
- Status: Proposed

## 2. Context

AWS provides several compute abstractions, including virtual machines, event-driven functions, managed container orchestration, serverless containers, batch scheduling, and managed application platforms. These services expose different levels of infrastructure control, operational responsibility, scaling behaviour, runtime constraints, portability, and cost characteristics.

A single compute service cannot efficiently satisfy every workload. Event-driven functions, long-running APIs, background workers, scheduled jobs, data-processing pipelines, Kubernetes-based platforms, high-performance computing, accelerator-backed applications, and workloads requiring host-level access have materially different requirements. A consistent selection convention is therefore required to prevent arbitrary service choices, unnecessary infrastructure management, unsuitable platform constraints, and avoidable cost.

This ADR defines the default AWS compute selection hierarchy. It does not prescribe application-specific sizing, regional topology, or detailed service configuration; those decisions remain part of each workload architecture.

1. Decision Drivers

    - Workload Fit
      > Match the execution model, duration, statefulness, latency profile, resource requirements, and failure characteristics of each workload to an appropriate compute service.

    - Operational Simplicity
      > Minimize responsibility for host provisioning, operating-system maintenance, cluster capacity, and undifferentiated infrastructure operations when direct control is not required.

    - Scalability and Availability
      > Support automatic scaling, explicit capacity boundaries, health management, and resilient multi-Availability Zone deployment patterns for production workloads.

    - Performance and Specialized Capacity
      > Provide access to suitable CPU, memory, accelerator, storage, networking, and high-performance computing capabilities when managed abstractions are insufficient.

    - Cost Efficiency
      > Align pricing model and capacity with workload utilization, predictability, interruption tolerance, and processor architecture compatibility.

    - Security and Compliance
      > Make patching ownership, workload isolation, identity, observability, auditability, and locality constraints explicit for every compute selection.

    - Delivery and Portability
      > Prefer deployment units and runtime models that integrate with automated build, test, release, rollback, and observability practices.

## 3. Decision

Adopt a workload-driven AWS compute selection hierarchy. Prefer managed and serverless services when they satisfy workload constraints; use Amazon EC2 only when instance-level control or specialized capacity is required; and require explicit cost, performance, reliability, and security controls for every selected compute service.

### 3.1. Workload-Driven Selection Hierarchy

Select compute services in the following order, stopping at the first option that satisfies the workload requirements:

1. Use AWS Lambda for event-driven, short-lived, stateless execution when its runtime, packaging, concurrency, latency, networking, and quota characteristics are acceptable.
2. Use Amazon ECS with AWS Fargate for long-running containerized APIs, services, and workers that do not require host-level access or Kubernetes compatibility.
3. Use AWS Batch for queued, scheduled, parallel, or retryable batch workloads.
4. Use Amazon EKS only when the workload has an explicit Kubernetes API, ecosystem, portability, or organizational platform requirement.
5. Use Amazon EC2 when direct operating-system control, custom machine images, specialized hardware, local instance storage, host-level agents, privileged capabilities, high-performance networking, or unsupported runtime characteristics are required.

1. Rationale

    - Workload Fit
      > The hierarchy maps event-driven code, containerized services, queued jobs, Kubernetes platforms, and control-intensive workloads to services designed for those execution models.

    - Operational Simplicity
      > Managed services are evaluated before virtual machines, reducing unnecessary ownership of hosts and cluster capacity.

    - Delivery and Portability
      > Functions, containers, batch job definitions, and machine images remain explicit deployment artefacts with distinct lifecycle and rollback mechanisms.

### 3.2. Managed and Serverless Compute First

AWS Lambda, Amazon ECS with AWS Fargate, and AWS Batch are the preferred compute services when their service constraints satisfy the workload.

1. Rationale

    - Operational Simplicity
      > These services reduce or remove responsibility for provisioning servers, maintaining operating systems, and managing idle cluster capacity.

    - Scalability and Availability
      > Each service provides workload-aligned scaling primitives, including function concurrency, ECS service scaling, Fargate task placement, and managed batch scheduling.

    - Cost Efficiency
      > Demand-aligned execution can reduce persistent idle capacity for intermittent, bursty, or variable workloads.

    - Security and Compliance
      > Reduced host-management scope narrows patching responsibility, while application security, identity, network policy, data protection, and observability remain workload responsibilities.

### 3.3. Amazon EC2 by Exception

Use Amazon EC2 only when the workload requires capabilities unavailable or unsuitable in the preferred managed compute services. The architecture record for the workload must document the specific exception.

For EC2-backed workloads, select an instance category according to the dominant resource requirement:

- General purpose for balanced compute, memory, and networking requirements.
- Compute optimized for CPU-bound processing.
- Memory optimized for workloads processing large in-memory data sets.
- Accelerated computing for workloads requiring GPUs or other hardware accelerators.
- Storage optimized for high-throughput or low-latency access to large local data sets.
- HPC optimized for tightly coupled or high-performance computing workloads.

1. Rationale

    - Performance and Specialized Capacity
      > EC2 provides purpose-built instance families and granular combinations of processors, memory, accelerators, storage, and networking.

    - Operational Control
      > Direct operating-system access supports custom agents, drivers, security controls, machine images, kernel or runtime tuning, and host-level diagnostics.

    - Cost Efficiency
      > Explicit exception documentation prevents EC2 from becoming the default where a managed service would avoid persistent capacity and host-management overhead.

### 3.4. Amazon EKS by Explicit Kubernetes Requirement

Amazon EKS is not the default container platform. Select EKS only when Kubernetes compatibility is a documented requirement, such as use of Kubernetes-native APIs, operators, policies, tooling, multi-environment platform standards, or an established Kubernetes operating model.

Use AWS Fargate for compatible EKS workloads when host management is unnecessary. Use EC2-backed managed node groups only when workloads require capabilities or economics not supported by Fargate.

1. Rationale

    - Operational Simplicity
      > ECS with Fargate provides a lower-complexity default for AWS-native container orchestration when Kubernetes-specific capabilities are unnecessary.

    - Delivery and Portability
      > EKS remains available for workloads that depend on the Kubernetes API and ecosystem rather than treating Kubernetes as an implicit requirement for every container.

    - Security and Compliance
      > Requiring an explicit Kubernetes rationale makes control-plane, node, admission-policy, network-policy, identity, upgrade, and workload-isolation responsibilities visible during architecture review.

### 3.5. Cost, Performance, and Reliability Controls

Every compute selection must define and maintain the following controls:

- Resource sizing based on measured CPU, memory, storage, network, concurrency, and latency data.
- Graviton compatibility evaluation before selecting x86-based capacity, unless dependencies or workload characteristics prevent adoption.
- On-Demand capacity for uncertain or variable usage, Savings Plans for predictable sustained usage, and Spot capacity for interruption-tolerant workloads.
- Automatic scaling policies, capacity limits, health checks, deployment rollback, and failure-recovery behaviour.
- Multi-Availability Zone placement for production services unless a documented constraint justifies otherwise.
- Service-level telemetry, cost allocation tags, budgets, alarms, and periodic right-sizing review.
- Documented patching, image, runtime, dependency, identity, network, secret, logging, and vulnerability-management ownership.

1. Rationale

    - Cost Efficiency
      > Compute cost remains governed as demand changes through right-sizing, architecture compatibility review, purchasing-model selection, and periodic optimization.

    - Scalability and Availability
      > Explicit scaling and recovery controls prevent both chronic over-provisioning and failure caused by unbounded or insufficient capacity.

    - Security and Compliance
      > Ownership and evidence for patching, identity, telemetry, and vulnerability management remain reviewable regardless of the compute abstraction.

## 4. Considered

### 4.1. Amazon EC2

[Amazon EC2](https://aws.amazon.com/ec2/) provides resizable virtual servers with granular control over operating systems, machine images, processors, memory, accelerators, storage, and networking.

- Pros

  - Control
    > Supports host-level configuration, custom images, specialized agents, drivers, privileged capabilities, and runtime tuning.

  - Workload Coverage
    > Provides general purpose, compute optimized, memory optimized, accelerated computing, storage optimized, and HPC instance categories.

  - Capacity Options
    > Supports On-Demand, commitment-based, and interruptible capacity models with Auto Scaling and load-balancing integrations.

- Cons

  - Operational Burden
    > Requires ownership of image lifecycle, operating-system patching, host hardening, capacity planning, monitoring, replacement, and failure handling.

  - Cost Risk
    > Incorrect sizing and unmanaged idle capacity can create persistent cost inefficiency.

### 4.2. AWS Lambda

[AWS Lambda](https://aws.amazon.com/lambda/) runs code on managed compute infrastructure and automatically administers capacity provisioning, scaling, and server maintenance.

- Pros

  - Minimal Infrastructure Management
    > Removes server provisioning and operating-system maintenance from the workload team.

  - Event Integration
    > Fits event-driven and request-triggered workloads with automatic concurrency-based scaling.

  - Demand-Aligned Cost
    > Avoids continuously running capacity for intermittent execution patterns.

- Cons

  - Runtime Constraints
    > Execution duration, packaging, cold-start behaviour, concurrency, local environment, networking, and service quotas may not fit every workload.

  - Platform Coupling
    > Event sources, deployment packaging, and observability patterns can become specific to the Lambda execution model.

### 4.3. Amazon ECS with AWS Fargate

[Amazon ECS](https://aws.amazon.com/ecs/) is a managed container orchestration service. [AWS Fargate](https://aws.amazon.com/fargate/) runs supported ECS tasks without provisioning or managing EC2 cluster capacity.

- Pros

  - Container Delivery
    > Supports image-based deployment for APIs, services, and workers with a clear runtime contract.

  - Reduced Host Management
    > Fargate removes direct server and cluster-capacity administration for supported workloads.

  - AWS Integration
    > Integrates with AWS identity, networking, load balancing, service discovery, logging, and scaling services.

- Cons

  - Platform Constraints
    > Host access, privileged capabilities, specialized hardware, local storage, and unusual networking requirements may require EC2-backed tasks.

  - Orchestration Responsibility
    > Task definitions, deployment strategy, service discovery, network design, secrets, telemetry, and scaling still require disciplined configuration.

### 4.4. Amazon EKS

[Amazon EKS](https://aws.amazon.com/eks/) provides a managed Kubernetes control plane for running Kubernetes workloads on AWS infrastructure.

- Pros

  - Kubernetes Compatibility
    > Supports Kubernetes APIs, operators, controllers, policies, and ecosystem tooling.

  - Platform Standardization
    > Fits organizations with an established Kubernetes operating model or workloads requiring Kubernetes portability.

  - Compute Choice
    > Supports Fargate and EC2-backed node options according to workload requirements.

- Cons

  - Operational Complexity
    > Requires Kubernetes expertise for upgrades, add-ons, admission controls, workload identity, networking, policy, observability, and node lifecycle.

  - Default Overhead
    > Introduces unnecessary control-plane and platform complexity when AWS-native container orchestration satisfies the workload.

### 4.5. AWS Batch

[AWS Batch](https://aws.amazon.com/batch/) plans, schedules, and runs containerized batch workloads across supported AWS compute environments.

- Pros

  - Batch Scheduling
    > Fits queued, parallel, scheduled, retryable, simulation, analytics, and data-processing workloads.

  - Capacity Flexibility
    > Can use managed capacity and interruption-tolerant purchasing models for eligible jobs.

- Cons

  - Interactive Workload Fit
    > Is not intended as the primary platform for continuously available synchronous services.

  - Workflow Design
    > Requires explicit job definitions, queues, retry behaviour, data movement, observability, and idempotency controls.

### 4.6. AWS Elastic Beanstalk

[AWS Elastic Beanstalk](https://aws.amazon.com/elasticbeanstalk/) deploys supported web applications while managing common infrastructure provisioning and application operations.

- Pros

  - Simplified Deployment
    > Provides a managed path for conventional web applications using supported platforms.

  - Infrastructure Visibility
    > Retains access to underlying AWS resources while automating common provisioning activities.

- Cons

  - Strategic Fit
    > Adds another application platform and deployment model without the function-level simplicity of Lambda or the container standardization of ECS.

  - Abstraction Leakage
    > Troubleshooting, scaling, security, and cost optimization still require understanding the underlying resources.

### 4.7. Amazon Lightsail

[Amazon Lightsail](https://aws.amazon.com/lightsail/) provides simplified virtual servers and bundled resources for straightforward applications.

- Pros

  - Simplicity
    > Offers a low-friction deployment model for small websites, prototypes, and uncomplicated applications.

  - Predictability
    > Bundled plans can simplify initial cost estimation.

- Cons

  - Platform Scope
    > Provides less flexibility and integration depth than the preferred compute services for complex production systems.

  - Scaling and Governance
    > Is not the default foundation for multi-service, highly automated, or strongly governed production platforms.

## 5. Consequences

- Positive Consequences

  - Consistent Placement
    > Compute choices become traceable and aligned with workload characteristics rather than individual preference.

  - Reduced Operational Burden
    > Managed and serverless services are selected before virtual machines when they satisfy requirements.

  - Explicit Exceptions
    > EC2 and EKS adoption requires a documented capability or platform need.

  - Cost and Performance Governance
    > Sizing, architecture compatibility, purchasing model, scaling, and optimization reviews become part of the compute lifecycle.

  - Clear Responsibility
    > Security, patching, observability, availability, and recovery ownership is documented for each workload.

- Negative Consequences

  - Decision Overhead
    > Workload teams must classify execution characteristics and justify placement before implementation.

  - Mixed Operating Models
    > The compute portfolio can include functions, containers, batch jobs, Kubernetes, and virtual machines, requiring shared platform standards.

  - Service-Specific Expertise
    > Each selected service has distinct deployment, scaling, quota, observability, security, and failure semantics.

- Risks

  - Over-Abstraction
    > A managed service can be selected without validating runtime constraints; mitigate through proof-of-concept, load, failure, and integration testing.

  - Premature EC2 Adoption
    > Virtual machines can be selected for familiarity rather than necessity; mitigate by requiring a documented exception during architecture review.

  - Unnecessary Kubernetes Adoption
    > EKS can introduce platform complexity without a Kubernetes-specific requirement; mitigate by comparing the workload against ECS with Fargate first.

  - Cost Drift
    > Utilization and traffic patterns can invalidate initial sizing; mitigate through budgets, telemetry, Compute Optimizer review, and scheduled right-sizing actions.

  - Provider Coupling
    > Managed service APIs can increase AWS-specific implementation; mitigate by isolating infrastructure integrations and retaining portable application contracts where justified.

## 6. Implementation

### 6.1. Steps

1. Classify the workload by trigger model, execution duration, traffic pattern, statefulness, latency objective, resource profile, deployment artefact, failure tolerance, and compliance constraints.
2. Apply the selection hierarchy and record why earlier preferred options do not satisfy the workload when selecting EKS or EC2.
3. Define resource sizing, processor architecture, scaling limits, purchasing model, Availability Zone topology, health checks, rollback, and recovery behaviour.
4. Define IAM roles, network boundaries, secrets handling, encryption, patching ownership, image or runtime lifecycle, vulnerability management, logging, metrics, tracing, alarms, and audit evidence.
5. Implement the workload through infrastructure as code and automated delivery pipelines.
6. Validate performance, resilience, security, operability, and cost before production release.
7. Review utilization, service limits, reliability, and cost periodically and after material workload changes.

### 6.2. Affected Areas

- Infrastructure-as-code modules for Lambda, ECS, Fargate, EKS, Batch, EC2, networking, identity, observability, and cost controls.
- Application packaging for functions, containers, batch jobs, and machine images.
- CI/CD pipelines for build, security scanning, deployment, rollback, and environment promotion.
- Architecture review templates and workload documentation.
- Operational runbooks, service-level objectives, incident response, patching, and vulnerability-management processes.
- FinOps controls, allocation tags, budgets, dashboards, and optimization reviews.

### 6.3. Validation

- Architecture review confirms that the workload classification and selected service follow the hierarchy.
- EKS and EC2 selections include a documented requirement that cannot be satisfied by an earlier preferred option.
- Load and performance tests validate resource sizing, scaling thresholds, concurrency, latency, and quota assumptions.
- Failure tests validate health checks, replacement, retry, rollback, multi-Availability Zone behaviour, and recovery procedures.
- Security review validates identity, network isolation, secret management, encryption, patching ownership, image or runtime hygiene, logging, and vulnerability management.
- Cost review validates tags, budgets, purchasing model, Graviton compatibility, Spot eligibility, and right-sizing evidence.
- Periodic operational review verifies that the original service-selection assumptions remain valid.

## 7. References

- AWS [Amazon EC2 Instance Types](https://aws.amazon.com/ec2/instance-types/) page.
- AWS Documentation [Choosing an AWS compute service for your workload](https://docs.aws.amazon.com/compute-on-aws-how-to-choose/) guide.
- AWS [Amazon EC2](https://aws.amazon.com/ec2/) page.
- AWS [AWS Lambda](https://aws.amazon.com/lambda/) page.
- AWS [Amazon Elastic Container Service](https://aws.amazon.com/ecs/) page.
- AWS [Amazon Elastic Kubernetes Service](https://aws.amazon.com/eks/) page.
- AWS [AWS Fargate](https://aws.amazon.com/fargate/) page.
- AWS [AWS Batch](https://aws.amazon.com/batch/) page.
- AWS [AWS Elastic Beanstalk](https://aws.amazon.com/elasticbeanstalk/) page.
- AWS [Amazon Lightsail](https://aws.amazon.com/lightsail/) page.
- AWS [AWS Compute Optimizer](https://aws.amazon.com/compute-optimizer/) page.
