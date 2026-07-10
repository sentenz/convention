# 017-ADR: AWS Storage

Architectural Decision Records (ADR) on adopting a workload-driven AWS storage service selection strategy across object, block, file, data protection, migration, and hybrid access requirements.

- [1. State](#1-state)
- [2. Context](#2-context)
- [3. Decision](#3-decision)
  - [3.1. Amazon S3](#31-amazon-s3)
  - [3.2. Amazon EBS](#32-amazon-ebs)
  - [3.3. Amazon EFS](#33-amazon-efs)
  - [3.4. Amazon FSx](#34-amazon-fsx)
  - [3.5. AWS Backup](#35-aws-backup)
  - [3.6. AWS Data Transfer and Hybrid Access Services](#36-aws-data-transfer-and-hybrid-access-services)
- [4. Considered](#4-considered)
  - [4.1. Single Storage Service Standard](#41-single-storage-service-standard)
  - [4.2. Amazon S3](#42-amazon-s3)
  - [4.3. Amazon EBS](#43-amazon-ebs)
  - [4.4. Amazon EFS](#44-amazon-efs)
  - [4.5. Amazon FSx](#45-amazon-fsx)
  - [4.6. AWS Backup](#46-aws-backup)
  - [4.7. AWS DataSync](#47-aws-datasync)
  - [4.8. AWS Storage Gateway](#48-aws-storage-gateway)
  - [4.9. AWS Transfer Family](#49-aws-transfer-family)
  - [4.10. AWS Snowball](#410-aws-snowball)
- [5. Consequences](#5-consequences)
- [6. Implementation](#6-implementation)
- [7. References](#7-references)

## 1. State

- Author(s): Sentenz
- Date: 2026-07-09
- Status: Proposed

## 2. Context

AWS provides multiple storage services optimized for distinct access semantics, protocols, performance profiles, durability models, migration paths, and operational responsibilities. A single default storage service does not satisfy all application and platform requirements: cloud-native applications frequently require durable object storage, databases and stateful compute frequently require low-latency block devices, distributed services frequently require shared file systems, and legacy or high-performance workloads may require compatibility with established file systems.

The project needs a consistent convention for selecting AWS storage services so architecture reviews, infrastructure-as-code modules, security controls, backup policies, and cost governance can be applied predictably across workloads. The convention must prevent accidental misuse of storage primitives while allowing specialized services when workload requirements justify them.

1. Decision Drivers

    - Access Semantics and Protocol
      > Select storage according to object, block, file, managed file-system, transfer, or hybrid access requirements rather than by service familiarity alone.

    - Performance and Latency
      > Match the service to latency sensitivity, IOPS, throughput, read/write profile, concurrency, and data-locality requirements.

    - Durability, Availability, and Disaster Recovery
      > Prefer managed durability and availability features, define backup coverage, and support recovery objectives through replication, snapshots, restore testing, and lifecycle policy.

    - Security and Compliance
      > Enforce encryption, least-privilege access, network boundary controls, audit logging, retention controls, and compliance evidence for stored data.

    - Cost and Lifecycle Management
      > Align storage class, lifecycle transition, provisioned throughput, replication, snapshot retention, and transfer design with the expected data temperature and access pattern.

    - Migration and Hybrid Integration
      > Support online, offline, and hybrid data movement without forcing application rewrites where gateway, transfer, or managed file-system compatibility is more appropriate.

    - Operational Simplicity and Governance
      > Standardize provisioning through infrastructure as code, reusable modules, tagging, monitoring, backup policies, and architecture review checklists.

## 3. Decision

Adopt a workload-driven AWS storage portfolio. Amazon S3 is the default durable object storage and data foundation. Amazon EBS is selected for EC2-attached block storage. Amazon EFS is selected for elastic shared Linux file storage. Amazon FSx is selected when a workload requires a managed file system with Windows, Lustre, OpenZFS, or NetApp ONTAP compatibility. AWS Backup is selected for centralized backup governance. AWS DataSync, AWS Storage Gateway, AWS Transfer Family, and AWS Snowball are selected as supporting services for migration, transfer, partner exchange, offline import, and hybrid access patterns.

### 3.1. Amazon S3

Use Amazon S3 as the default storage service for object data, application artifacts, logs, static assets, analytics data, machine-learning datasets, backups, archives, and data lake foundations. S3 must be preferred when data is accessed through object APIs, requires broad durability, requires independent scaling from compute, benefits from lifecycle transitions, or needs event-driven integration with downstream systems.

1. Rationale

    - Access Semantics and Protocol
      > S3 provides object storage semantics and API-based access that fit immutable or versioned objects, unstructured data, static content, logs, datasets, and data lake use cases.

    - Durability, Availability, and Disaster Recovery
      > S3 provides managed durability and availability characteristics, versioning, replication, lifecycle policies, and storage classes suitable for backup, archive, and business-continuity patterns.

    - Security and Compliance
      > S3 supports encryption, bucket policies, IAM access controls, Block Public Access, access logging, object ownership controls, retention controls, and governance workflows.

    - Cost and Lifecycle Management
      > S3 storage classes and lifecycle rules allow data to move from frequently accessed storage to infrequent-access or archive tiers as access patterns change.

### 3.2. Amazon EBS

Use Amazon EBS for persistent block storage attached to Amazon EC2 instances or EC2-backed workloads that require low-latency block devices, operating-system volumes, database volumes, transactional I/O, or volume-level snapshots. EBS must not be treated as a shared file system or object store; it is selected when the application expects a locally attached block device and when the Availability Zone placement model is acceptable.

1. Rationale

    - Access Semantics and Protocol
      > EBS exposes block volumes that can be formatted with file systems, used as database storage, or attached to EC2 instances as durable block devices.

    - Performance and Latency
      > EBS volume types allow storage performance to be matched to IOPS, throughput, latency, and cost requirements for stateful compute and database workloads.

    - Durability, Availability, and Disaster Recovery
      > EBS snapshots and replication within an Availability Zone provide mechanisms for recovery, migration, and backup compliance when integrated with lifecycle and backup policy.

    - Operational Simplicity and Governance
      > Standardized volume types, encryption defaults, snapshot schedules, and resize procedures can be codified in infrastructure-as-code modules.

### 3.3. Amazon EFS

Use Amazon EFS for serverless, elastic, shared file storage across Linux-based Amazon EC2 instances, containers, and serverless workloads that require POSIX-style file access, concurrent mounts, and automatic capacity scaling. EFS is preferred for shared application content, DevOps workspaces, containerized application state, content management systems, and analytics workflows that need shared NFS file semantics without file-server administration.

1. Rationale

    - Access Semantics and Protocol
      > EFS provides shared file-system semantics and NFS access for workloads that cannot be represented naturally as objects or single-instance block volumes.

    - Operational Simplicity and Governance
      > EFS reduces file-server administration by providing managed, elastic file storage with lifecycle management and integration with AWS compute services.

    - Durability, Availability, and Disaster Recovery
      > EFS can be included in centralized backup and lifecycle policies and supports architectures that require shared access across multiple compute clients.

    - Cost and Lifecycle Management
      > EFS storage classes and lifecycle management allow cost optimization for infrequently accessed file data.

### 3.4. Amazon FSx

Use Amazon FSx when a workload requires a managed file system with specific protocol, performance, or compatibility characteristics that EFS does not provide. Select FSx for Windows File Server for native Windows and SMB workloads, FSx for Lustre for high-performance compute and machine-learning workloads, FSx for OpenZFS for OpenZFS-compatible Linux file-system needs, and FSx for NetApp ONTAP for ONTAP feature compatibility, enterprise file services, or migration from NetApp environments.

1. Rationale

    - Access Semantics and Protocol
      > FSx aligns AWS-managed storage with established file-system families and protocols, reducing migration friction for legacy, enterprise, and performance-sensitive applications.

    - Performance and Latency
      > FSx options provide workload-specific performance profiles, including high-throughput and low-latency file storage for demanding analytics, HPC, media, and enterprise file workloads.

    - Migration and Hybrid Integration
      > FSx can preserve application assumptions around SMB, Lustre, OpenZFS, or ONTAP behavior where rewriting to S3 or EFS would introduce unacceptable risk or cost.

    - Operational Simplicity and Governance
      > Managed provisioning, patching, backups, and monitoring reduce operational burden compared with self-managed file servers.

### 3.5. AWS Backup

Use AWS Backup as the default centralized control plane for backup policy, retention, restore testing, reporting, and compliance evidence across supported AWS storage resources. Service-native backup capabilities may be used, but policy intent must be represented centrally where AWS Backup support exists.

1. Rationale

    - Durability, Availability, and Disaster Recovery
      > Central backup policy improves recovery consistency by coordinating backup schedules, retention, cross-account or cross-Region protection, and restore validation.

    - Security and Compliance
      > Immutable backups, logically air-gapped vault patterns, audit reporting, and policy evidence support regulatory and ransomware-resilience requirements.

    - Operational Simplicity and Governance
      > Central governance prevents each workload from inventing independent backup mechanisms and simplifies operational review.

### 3.6. AWS Data Transfer and Hybrid Access Services

Use AWS DataSync for secure online migration, replication, and transfer between on-premises storage, other clouds, and AWS storage services. Use AWS Storage Gateway when on-premises applications need low-latency access to cloud-backed storage while preserving file, tape, or block workflows. Use AWS Transfer Family when managed SFTP, FTPS, FTP, AS2, or browser-based file exchange must land data in S3 or EFS. Use AWS Snowball when data volume, network constraints, disconnected environments, or edge requirements make offline transfer preferable.

1. Rationale

    - Migration and Hybrid Integration
      > Data movement patterns differ from steady-state storage patterns; dedicated transfer and gateway services reduce migration risk and preserve existing application or partner workflows.

    - Security and Compliance
      > Managed transfer, gateway, and offline migration services provide encryption, identity integration, access controls, logging, and operational evidence that ad hoc copy mechanisms often lack.

    - Cost and Lifecycle Management
      > Purpose-built migration paths reduce network bottlenecks, failed transfers, operational rework, and excessive temporary storage costs.

    - Operational Simplicity and Governance
      > Standardized migration and hybrid access services make data movement reviewable, repeatable, and observable.

## 4. Considered

### 4.1. Single Storage Service Standard

A single storage-service standard would require every workload to use one default AWS storage service, typically Amazon S3, regardless of access pattern.

- Pros

  - Simplicity
    > A single service reduces the number of infrastructure modules, policies, and operational procedures.

  - Cost Visibility
    > Centralized storage consumption is easier to track and optimize.

- Cons

  - Semantic Mismatch
    > Object storage cannot safely replace block devices or file systems for workloads that require POSIX semantics, shared mounts, database volumes, or native file-system protocols.

  - Migration Risk
    > Legacy applications may require extensive rewrites if their storage assumptions are forced into an object API.

  - Performance Risk
    > A single service cannot satisfy all latency, IOPS, throughput, concurrency, and protocol expectations.

### 4.2. Amazon S3

[Amazon S3](https://aws.amazon.com/s3/) is an object storage service for storing and retrieving data at large scale, with storage classes, lifecycle management, security controls, and integrations across AWS analytics, application, and machine-learning services.

- Pros

  - Default Object Storage
    > Fits object, log, artifact, static asset, backup, archive, data lake, analytics, and machine-learning dataset workloads.

  - Durability and Scale
    > Provides managed durability, availability, elastic capacity, and broad integration without provisioning file servers or block devices.

  - Lifecycle Optimization
    > Supports storage classes and lifecycle transitions for cost management across hot, warm, cold, and archive data.

- Cons

  - File-System Semantics
    > Does not provide native POSIX file-system semantics or transparent shared mounts for applications expecting a traditional file system.

  - Block-Device Semantics
    > Does not provide low-latency block-device behavior for operating-system volumes or transactional database storage.

### 4.3. Amazon EBS

[Amazon EBS](https://aws.amazon.com/ebs/) provides persistent block storage volumes that attach to Amazon EC2 instances and support file systems, databases, boot volumes, snapshots, and workload-specific performance choices.

- Pros

  - Low-Latency Block Storage
    > Fits EC2-backed operating-system volumes, database volumes, and applications that require durable block devices.

  - Performance Control
    > Volume types can be selected according to required IOPS, throughput, durability, and cost trade-offs.

  - Snapshot Support
    > EBS snapshots support backup, migration, disaster recovery, and lifecycle management.

- Cons

  - Availability Zone Scope
    > EBS placement is tied to Availability Zone design and requires explicit architecture for cross-zone or cross-region recovery.

  - Limited Sharing Semantics
    > EBS is not the default mechanism for multi-client shared file access.

### 4.4. Amazon EFS

[Amazon EFS](https://aws.amazon.com/efs/) provides serverless, elastic shared file storage for AWS compute services with NFS access and automatic scaling.

- Pros

  - Shared File Access
    > Fits workloads that need concurrent file access from multiple instances, containers, or serverless functions.

  - Managed Elasticity
    > Reduces capacity planning and file-server maintenance by scaling storage automatically.

  - Linux and Container Integration
    > Integrates naturally with Linux, containerized, and serverless workloads that require shared file state.

- Cons

  - Protocol Scope
    > NFS-oriented access does not fit native Windows SMB workloads or specialized enterprise file-system requirements.

  - Performance Fit
    > Performance-sensitive workloads may require careful mode, throughput, and access-pattern design or may be better served by FSx.

### 4.5. Amazon FSx

[Amazon FSx](https://aws.amazon.com/fsx/) provides fully managed file systems based on NetApp ONTAP, OpenZFS, Windows File Server, and Lustre.

- Pros

  - Compatibility
    > Preserves file-system semantics and administrative features for Windows, Lustre, OpenZFS, and ONTAP workloads.

  - Specialized Performance
    > Fits HPC, media processing, machine learning, enterprise file shares, and other workloads that require specialized file-system behavior.

  - Migration Path
    > Reduces migration risk when applications depend on existing SMB, Lustre, ZFS, or ONTAP assumptions.

- Cons

  - Service Selection Complexity
    > Requires explicit selection among FSx variants and careful mapping to workload requirements.

  - Cost and Administration
    > Specialized file systems require more deliberate performance, capacity, backup, and operations governance than default object storage.

### 4.6. AWS Backup

[AWS Backup](https://aws.amazon.com/backup/) centralizes and automates data protection across supported AWS services and hybrid workloads.

- Pros

  - Central Governance
    > Consolidates backup policies, retention, restore testing, compliance reporting, and data-protection operations.

  - Resilience Controls
    > Supports cross-account, cross-Region, immutable, and audit-oriented backup patterns where supported.

- Cons

  - Coverage Boundaries
    > Not every service feature or workload-specific backup requirement is fully represented by centralized policy alone.

  - Restore Discipline
    > Central backup configuration does not replace regular restore testing and application-level recovery validation.

### 4.7. AWS DataSync

[AWS DataSync](https://aws.amazon.com/datasync/) is a managed service for secure, high-performance migration and transfer between on-premises storage, other clouds, and AWS storage services.

- Pros

  - Online Transfer
    > Fits migrations, recurring transfers, replication, and data movement into S3, EFS, or FSx.

  - Integrity and Observability
    > Provides encryption in transit, data validation, monitoring, scheduling, filtering, and bandwidth controls.

- Cons

  - Not a Primary Store
    > DataSync moves and synchronizes data but does not replace the target storage service.

  - Network Dependency
    > Effective migration throughput depends on available network bandwidth, latency, and change rate.

### 4.8. AWS Storage Gateway

[AWS Storage Gateway](https://aws.amazon.com/storagegateway/) provides on-premises and in-cloud applications access to cloud-backed storage through file, tape, and volume gateway patterns.

- Pros

  - Hybrid Access
    > Preserves on-premises workflows while extending storage capacity, backup, archive, and recovery options into AWS.

  - Workflow Preservation
    > Supports S3 file access, virtual tape, and iSCSI block workflows for applications that cannot immediately migrate fully to cloud-native APIs.

- Cons

  - Hybrid Operational Surface
    > Requires gateway deployment, monitoring, network design, and cache-capacity management.

  - Transitional Architecture Risk
    > Long-lived gateway patterns can become permanent dependencies if migration objectives are not explicitly tracked.

### 4.9. AWS Transfer Family

[AWS Transfer Family](https://aws.amazon.com/aws-transfer-family/) provides managed file-transfer workflows that store data in Amazon S3 or Amazon EFS and support secure partner and business-to-business exchange patterns.

- Pros

  - Managed File Exchange
    > Supports secure managed transfers without maintaining bespoke SFTP, FTPS, FTP, AS2, or browser-based transfer infrastructure.

  - Storage Integration
    > Lands transferred data directly in S3 or EFS and supports workflow automation with AWS services.

- Cons

  - Protocol-Specific Scope
    > Useful for managed exchange protocols but not a general-purpose storage service.

  - Identity and Entitlement Design
    > Requires careful user isolation, directory mapping, identity provider integration, and audit controls.

### 4.10. AWS Snowball

[AWS Snowball](https://aws.amazon.com/snowball/) provides offline data transfer and edge capabilities for moving large datasets or operating in disconnected environments.

- Pros

  - Offline Migration
    > Fits petabyte-scale migration or constrained-network scenarios where online transfer would be too slow, costly, or unreliable.

  - Edge and Disconnected Operation
    > Supports data movement and compute use cases in remote or intermittently connected environments.

- Cons

  - Operational Lead Time
    > Physical device logistics, handling, chain of custody, and import scheduling must be planned explicitly.

  - Batch-Oriented Transfer
    > Snowball is less appropriate for continuous synchronization or frequently changing datasets.

## 5. Consequences

- Positive

  - Workload Fit
    > Storage choices will align with protocol, latency, concurrency, durability, migration, and operational requirements rather than defaulting to one service.

  - Governance
    > Architecture reviews can apply a consistent selection matrix and verify that each workload uses the correct storage primitive.

  - Security Baselines
    > Encryption, network access, IAM, logging, retention, and backup requirements can be defined per storage category and encoded in reusable infrastructure modules.

  - Cost Optimization
    > Lifecycle policies, storage classes, volume types, throughput choices, backup retention, and migration paths can be evaluated explicitly during design.

  - Migration Clarity
    > Hybrid and legacy migration scenarios can use purpose-built transfer and gateway services without weakening the steady-state storage standard.

- Negative

  - Portfolio Complexity
    > The platform must maintain guidance, modules, monitoring, and runbooks for several AWS storage services rather than one universal service.

  - Review Overhead
    > Architecture review must validate access semantics and data lifecycle before approving storage choices.

  - Cross-Service Skill Requirements
    > Teams must understand object, block, file, backup, and migration trade-offs to avoid overfitting or underfitting the selected service.

- Risks

  - Misclassification
    > A workload may be assigned to the wrong service if access patterns, latency, concurrency, or migration constraints are not captured during design; mitigate through an architecture checklist and design review.

  - Cost Drift
    > Unbounded versioning, snapshots, provisioned throughput, replication, or retained backups may increase costs; mitigate through budgets, lifecycle rules, retention policies, and periodic storage reviews.

  - Security Drift
    > Inconsistent bucket policies, volume encryption, file-system permissions, gateway access, or transfer identities may weaken controls; mitigate through infrastructure-as-code modules, policy-as-code checks, and audit logging.

  - Recovery Assumptions
    > Backup configuration may be mistaken for recovery readiness; mitigate through scheduled restore tests and documented recovery runbooks.

## 6. Implementation

1. Define the storage selection matrix.

    Create project guidance that maps workload requirements to AWS storage services: object storage to S3, EC2-attached block devices to EBS, shared Linux file storage to EFS, specialized managed file systems to FSx, centralized data protection to AWS Backup, online migration to DataSync, hybrid access to Storage Gateway, managed partner exchange to Transfer Family, and offline transfer to Snowball.

2. Provide infrastructure-as-code modules.

    Implement reusable modules with opinionated defaults for S3 buckets, EBS volumes, EFS file systems, FSx file systems, AWS Backup plans, DataSync tasks, Storage Gateway deployments, Transfer Family servers, and Snowball import runbooks where applicable.

3. Establish security baselines.

    Require encryption at rest, least-privilege IAM, resource policies, KMS key ownership, public-access prevention where applicable, network boundary controls, service logging, object or file ownership controls, retention settings, and audit evidence for each storage category.

4. Establish lifecycle and retention baselines.

    Define lifecycle transitions, version retention, snapshot retention, backup vault policies, archival rules, replication criteria, restore testing cadence, and deletion safeguards according to data classification and recovery objectives.

5. Establish migration and hybrid-access patterns.

    Document when to use DataSync, Storage Gateway, Transfer Family, Snowball, direct application uploads, database-native migration tools, or service-specific replication mechanisms.

6. Add architecture review checks.

    Require design reviewers to record access semantics, performance profile, durability targets, backup coverage, data classification, lifecycle plan, migration approach, and estimated cost drivers for every persistent storage decision.

7. Validate conformance continuously.

    Add policy-as-code checks, infrastructure linting, tagging validation, cost anomaly monitoring, storage inventory reports, backup compliance reports, restore-test evidence, and periodic review of unused volumes, stale snapshots, unclassified buckets, and ungoverned file systems.

8. Affected areas.

    Apply this ADR to AWS workload architecture, infrastructure-as-code modules, platform engineering standards, data protection policy, security review, compliance evidence, migration planning, and cost-governance workflows.

## 7. References

- AWS Decision Guide [Choosing an AWS storage service](https://docs.aws.amazon.com/decision-guides/latest/storage-on-aws-how-to-choose/choosing-aws-storage-service.html) documentation.
- AWS [Cloud Storage Services on AWS](https://aws.amazon.com/products/storage/) product overview.
- Amazon [S3](https://aws.amazon.com/s3/) page.
- Amazon [EBS](https://aws.amazon.com/ebs/) page.
- Amazon [EFS](https://aws.amazon.com/efs/) page.
- Amazon FSx [product page](https://aws.amazon.com/fsx/) page.
- AWS [Backup](https://aws.amazon.com/backup/) page.
- AWS [DataSync](https://aws.amazon.com/datasync/) page.
- AWS [Storage Gateway](https://aws.amazon.com/storagegateway/) page.
- AWS [Transfer Family](https://aws.amazon.com/aws-transfer-family/) page.
- AWS [Snowball](https://aws.amazon.com/snowball/) page.
