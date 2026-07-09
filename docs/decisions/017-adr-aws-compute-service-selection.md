# 017-ADR: AWS Compute Service Selection

Architectural Decision Records (ADR) on selecting AWS compute services and instance families according to workload characteristics, operational control, scalability, reliability, and cost-optimization requirements.

- [1. State](#1-state)
- [2. Context](#2-context)
- [3. Decision](#3-decision)
  - [3.1. Workload-Driven Compute Selection Model](#31-workload-driven-compute-selection-model)
  - [3.2. Managed and Serverless Compute First](#32-managed-and-serverless-compute-first)
  - [3.3. Amazon EC2 for Control-Intensive Workloads](#33-amazon-ec2-for-control-intensive-workloads)
  - [3.4. Cost and Performance Optimization Controls](#34-cost-and-performance-optimization-controls)
- [4. Considered](#4-considered)
  - [4.1. Amazon EC2](#41-amazon-ec2)
  - [4.2. AWS Lambda](#42-aws-lambda)
  - [4.3. Container Services with AWS Fargate](#43-container-services-with-aws-fargate)
  - [4.4. AWS Batch](#44-aws-batch)
  - [4.5. AWS Elastic Beanstalk](#45-aws-elastic-beanstalk)
  - [4.6. Amazon Lightsail](#46-amazon-lightsail)
  - [4.7. AWS Hybrid and Edge Compute](#47-aws-hybrid-and-edge-compute)
- [5. Consequences](#5-consequences)
- [6. Implementation](#6-implementation)
- [7. References](#7-references)

## 1. State

- Author(s): Sentenz
- Date: 2026-07-09
- Status: Proposed

## 2. Context

AWS provides multiple compute services for virtual machines, containers, serverless functions, batch processing, managed application platforms, and hybrid or edge deployment models. The project requires a repeatable compute-selection convention so that workloads are placed on services that match their execution model, scaling behaviour, operational requirements, performance profile, security posture, and cost envelope.

A single default compute service is insufficient because the project may need to run latency-sensitive APIs, scheduled jobs, event-driven functions, containerized services, long-running processes, CPU-intensive workloads, memory-intensive workloads, accelerator-backed workloads, and workloads with local storage, network, compliance, or data-residency constraints. The decision must therefore define a service-selection model rather than mandate one compute service for every workload.

1. Decision Drivers

    - Workload Fit
      > Match the compute service and instance family to the workload execution model, resource profile, latency requirements, and lifecycle characteristics.

    - Operational Control
      > Preserve direct operating-system, runtime, networking, and instance-level control only where the workload explicitly requires it.

    - Scalability and Availability
      > Support horizontal scaling, multi-Availability Zone deployment patterns, and automated capacity adjustment for production services.

    - Cost Efficiency
      > Use right-sized capacity, compatible processor architectures, managed scaling, commitment-based pricing, and interruptible capacity where appropriate.

    - Portability and Delivery
      > Prefer deployment models that align with container, function, image, and CI/CD practices used by the project.

    - Security and Compliance
      > Select compute services that support least-privilege access, patching responsibilities, workload isolation, observability, auditability, and applicable locality constraints.

## 3. Decision

Adopt a workload-driven AWS compute selection model. Prefer managed or serverless compute where it satisfies workload constraints, use Amazon EC2 when direct control or specialized capacity is required, and apply explicit cost and performance controls across all selected compute services.

### 3.1. Workload-Driven Compute Selection Model

Compute services must be selected by workload category rather than by a project-wide default.

1. Rationale

    - Workload Fit
      > Event-driven code maps naturally to AWS Lambda, containerized services map to Amazon ECS or Amazon EKS with AWS Fargate where server management is unnecessary, queued batch workloads map to AWS Batch, and low-level or specialized workloads map to Amazon EC2.

    - Scalability and Availability
      > The model allows each workload to use the scaling primitive most appropriate to its execution pattern, including function concurrency, container service scaling, Auto Scaling groups, and managed batch scheduling.

    - Security and Compliance
      > Workload-level placement makes it possible to apply isolation, patching, locality, and audit requirements according to the risk profile of each component rather than imposing uniform controls on dissimilar workloads.

### 3.2. Managed and Serverless Compute First

For new workloads, prefer AWS Lambda, Amazon ECS or Amazon EKS with AWS Fargate, and AWS Batch when their constraints satisfy the workload requirements.

1. Rationale

    - Operational Control
      > Managed and serverless services reduce responsibility for host provisioning, cluster capacity, and operating-system maintenance when such control is not required by the workload.

    - Portability and Delivery
      > Functions and containers integrate well with CI/CD pipelines and enable discrete deployment artefacts with clear runtime contracts.

    - Cost Efficiency
      > Serverless and managed compute can reduce idle capacity by scaling execution according to demand and by narrowing operational overhead.

### 3.3. Amazon EC2 for Control-Intensive Workloads

Use Amazon EC2 when workloads require direct operating-system access, custom agents, long-running processes, specialized networking, local instance storage, custom AMIs, accelerator-backed instances, high-performance computing, or specific CPU, memory, storage, and network combinations.

1. Rationale

    - Workload Fit
      > EC2 instance families provide purpose-built combinations for general purpose, compute optimized, memory optimized, accelerated computing, storage optimized, and HPC workloads.

    - Operational Control
      > EC2 provides the instance-level control required for custom operating-system configuration, host-level instrumentation, specialized drivers, and workload-specific runtime tuning.

    - Scalability and Availability
      > EC2 Auto Scaling and multi-Availability Zone architectures can provide resilient capacity for workloads that cannot be placed on more managed abstractions.

### 3.4. Cost and Performance Optimization Controls

All AWS compute selections must include a cost and performance optimization plan covering right-sizing, processor architecture, scaling policy, purchasing model, and observability.

1. Rationale

    - Cost Efficiency
      > Workloads should use Graviton-based instances where compatible, Savings Plans for predictable sustained usage, Spot capacity for fault-tolerant workloads, and on-demand capacity for variable or uncertain workloads.

    - Scalability and Availability
      > Auto Scaling, managed service scaling policies, and workload-specific capacity limits prevent both under-provisioning and persistent idle capacity.

    - Security and Compliance
      > Observability, patching ownership, image hygiene, and documented service boundaries make compute placement reviewable during architecture and security reviews.

## 4. Considered

### 4.1. Amazon EC2

[Amazon EC2](https://aws.amazon.com/ec2/) provides resizable virtual-machine capacity with many instance families and granular control over compute, memory, storage, networking, operating system, and machine-image configuration.

- Pros

  - Workload Coverage
    > Supports general purpose, compute optimized, memory optimized, accelerated computing, storage optimized, and HPC workloads through purpose-built instance families.

  - Control
    > Provides direct operating-system and instance-level access for specialized agents, drivers, security controls, and runtime configuration.

  - Scaling
    > Integrates with Auto Scaling and load balancing patterns for resilient horizontally scaled services.

- Cons

  - Operational Burden
    > Requires stronger ownership of patching, image lifecycle, capacity planning, runtime hardening, monitoring, and failure handling than serverless alternatives.

  - Cost Risk
    > Incorrect instance selection or unmanaged idle capacity can create persistent cost inefficiency.

### 4.2. AWS Lambda

[AWS Lambda](https://aws.amazon.com/lambda/) runs code without provisioning or managing servers and is optimized for event-driven execution with automatic scaling.

- Pros

  - Minimal Infrastructure Management
    > Reduces operational responsibility for servers, operating-system maintenance, and capacity provisioning.

  - Demand-Based Scaling
    > Scales execution according to events and request volume, which is effective for intermittent, bursty, and event-driven workloads.

  - Cost Efficiency
    > Avoids long-running idle compute for workloads that execute only when triggered.

- Cons

  - Runtime Constraints
    > Function duration, cold-start behaviour, runtime packaging, networking configuration, and execution-environment constraints may not fit long-running or latency-sensitive workloads.

  - Platform Coupling
    > Event integration, deployment packaging, and observability patterns can become tightly coupled to the Lambda execution model.

### 4.3. Container Services with AWS Fargate

[Amazon ECS](https://aws.amazon.com/ecs/), [Amazon EKS](https://aws.amazon.com/eks/), and [AWS Fargate](https://aws.amazon.com/fargate/) run containerized workloads while reducing or eliminating direct server and cluster-capacity management.

- Pros

  - Container Portability
    > Supports image-based delivery and consistent local, test, and production packaging for services that already use containers.

  - Reduced Host Management
    > Fargate removes the need to provision and manage EC2 instances for supported container workloads.

  - Service Scaling
    > Container services support scalable service deployment patterns for APIs, workers, and microservices.

- Cons

  - Orchestration Complexity
    > ECS, EKS, service discovery, ingress, networking, identity, and observability still require platform engineering discipline.

  - Workload Limits
    > Some workloads requiring host-level control, privileged access, specialized hardware, or unusual networking patterns may still require EC2-backed compute.

### 4.4. AWS Batch

[AWS Batch](https://aws.amazon.com/batch/) plans, schedules, and runs batch computing workloads across AWS compute options.

- Pros

  - Batch Scheduling
    > Fits queued jobs, simulations, analytics, rendering, machine-learning processing, and bursty background workloads.

  - Capacity Flexibility
    > Can use multiple compute environments and purchasing models, including Spot capacity where interruption is acceptable.

- Cons

  - Interactive Service Fit
    > Not intended for always-on synchronous APIs or user-facing request/response workloads.

  - Queue Design
    > Requires explicit job definitions, queue structure, retry policy, observability, and data-management design.

### 4.5. AWS Elastic Beanstalk

[AWS Elastic Beanstalk](https://aws.amazon.com/elasticbeanstalk/) deploys and manages web applications with less direct infrastructure management while still using underlying AWS resources.

- Pros

  - Simplified Application Deployment
    > Provides a faster path for conventional web applications where the platform can manage provisioning and common operational tasks.

  - Controlled Abstraction
    > Offers more infrastructure visibility than fully serverless models while reducing manual setup effort.

- Cons

  - Platform Fit
    > Less suitable for highly customized platform requirements, complex service meshes, specialized compute, or strongly opinionated container orchestration strategies.

  - Abstraction Leakage
    > Underlying resources still require understanding for troubleshooting, scaling, security hardening, and cost control.

### 4.6. Amazon Lightsail

[Amazon Lightsail](https://aws.amazon.com/lightsail/) provides simplified virtual private servers and related resources for small applications and straightforward deployments.

- Pros

  - Simplicity
    > Provides a low-friction entry point for simple websites, prototypes, and small applications.

  - Predictability
    > Bundled resource models can simplify early-stage cost estimation.

- Cons

  - Enterprise Fit
    > Limited flexibility compared with EC2, ECS, EKS, Lambda, and Batch for production platform engineering and advanced networking requirements.

  - Scaling Ceiling
    > Not the preferred foundation for complex, multi-service, or highly automated production workloads.

### 4.7. AWS Hybrid and Edge Compute

[AWS Local Zones](https://aws.amazon.com/about-aws/global-infrastructure/localzones/), [AWS Outposts](https://aws.amazon.com/outposts/), and [AWS Wavelength](https://aws.amazon.com/wavelength/) extend selected AWS infrastructure patterns closer to users, premises, or telecommunications edge networks.

- Pros

  - Locality
    > Supports workloads with low-latency, local data-processing, data-residency, or on-premises integration requirements.

  - Consistent Interfaces
    > Preserves familiar AWS APIs and operational models for workloads that cannot run solely in a standard AWS Region.

- Cons

  - Specialized Use Case
    > Adds deployment, availability, networking, procurement, and operational complexity that is unnecessary for most standard cloud workloads.

  - Service Availability
    > Supported services and capacity characteristics vary by location and offering, requiring explicit design review.

## 5. Consequences

- Positive

  - Consistent Placement
    > Compute choices become traceable, reviewable, and aligned with workload characteristics rather than individual preference.

  - Reduced Operational Burden
    > Managed and serverless services become the default where they satisfy requirements, reducing unnecessary host management.

  - Performance Alignment
    > EC2 instance family selection, container sizing, Lambda configuration, and batch compute environments can be tuned to concrete workload profiles.

  - Cost Governance
    > Right-sizing, Graviton compatibility review, Spot eligibility, Savings Plans evaluation, and scaling-policy validation become part of compute design.

- Negative

  - Decision Overhead
    > Teams must document workload characteristics and justify compute placement during architecture review.

  - Mixed Operating Models
    > The portfolio spans functions, containers, virtual machines, and batch systems, requiring clear platform ownership and observability standards.

  - Service-Specific Expertise
    > Effective operation requires familiarity with the selected service's limits, deployment model, scaling controls, and failure modes.

- Risks

  - Over-Abstraction
    > Selecting managed compute without understanding runtime limits can create latency, debugging, packaging, or networking constraints; mitigate through workload-specific validation before production adoption.

  - Over-Provisioning
    > Selecting EC2 too early can create avoidable operational and cost overhead; mitigate by requiring a documented reason for instance-level control.

  - Cost Drift
    > Compute costs can drift as traffic and usage patterns change; mitigate through periodic Compute Optimizer review, budgets, telemetry, and rightsizing actions.

## 6. Implementation

1. Classify Workloads

    Document the workload type, execution duration, traffic pattern, statefulness, latency objective, resource profile, compliance constraints, deployment artefact, and failure-tolerance model before selecting compute.

2. Select Compute Service

    - Use AWS Lambda for event-driven functions and short-lived tasks when runtime limits and latency behaviour are acceptable.
    - Use Amazon ECS or Amazon EKS with AWS Fargate for containerized services that do not require direct host management.
    - Use AWS Batch for queued, scheduled, parallel, or fault-tolerant batch workloads.
    - Use Amazon EC2 for workloads requiring operating-system control, specialized instance families, custom AMIs, local storage, accelerators, HPC, or host-level tuning.
    - Use AWS Local Zones, AWS Outposts, or AWS Wavelength only when latency, locality, data-residency, or on-premises constraints cannot be satisfied in a standard AWS Region.

3. Select Capacity and Instance Profile

    For EC2-backed workloads, choose instance families according to CPU, memory, accelerator, storage, network, and HPC requirements. Evaluate Graviton compatibility before selecting x86 instances unless a workload dependency prevents it.

4. Define Scaling and Resilience

    Define service scaling policies, capacity limits, health checks, deployment topology, and multi-Availability Zone behaviour. Production services must have explicit availability and failure-recovery assumptions.

5. Define Cost Model

    Select on-demand, Savings Plans, or Spot capacity according to predictability, interruption tolerance, and utilization. Apply budgets, tags, dashboards, and periodic rightsizing reviews.

6. Validate Architecture

    Validate compute selection through architecture review, load testing, failure testing, security review, observability checks, and cost review before production release.

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
- AWS [AWS Local Zones](https://aws.amazon.com/about-aws/global-infrastructure/localzones/) page.
- AWS [AWS Outposts](https://aws.amazon.com/outposts/) page.
- AWS [AWS Wavelength](https://aws.amazon.com/wavelength/) page.
- AWS [AWS Compute Optimizer](https://aws.amazon.com/compute-optimizer/) page.
