# 017-ADR: Multi-Environment Management for Kubernetes

Architectural Decision Records (ADR) on the design, tooling, and local-to-cloud topology strategy for segregating and managing Development (dev), Staging (stage), and Production (prod) environments in Kubernetes.

- [1. State](#1-state)
- [2. Context](#2-context)
- [3. Decision](#3-decision)
  - [3.1. Kustomize for Configuration Management](#31-kustomize-for-configuration-management)
  - [3.2. GitOps Directory-per-Environment via ArgoCD](#32-gitops-directory-per-environment-via-argocd)
  - [3.3. Local K3s for Dev with Dedicated Cloud Staging and Production](#33-local-k3s-for-dev-with-dedicated-cloud-staging-and-production)
- [4. Considered](#4-considered)
  - [4.1. Kustomize](#41-kustomize)
  - [4.2. Helm](#42-helm)
  - [4.3. K3s (Local Node Kubernetes)](#43-k3s-local-node-kubernetes)
  - [4.4. Fully Cloud-Hosted Environments (Shared Dev/Stage Cluster)](#44-fully-cloud-hosted-environments-shared-devstage-cluster)
- [5. Consequences](#5-consequences)
- [6. Implementation](#6-implementation)
- [7. References](#7-references)

## 1. State

- Author(s): Platform Engineering Team
- Date: 2026-06-18
- Status: Accepted

## 2. Context

The project requires a robust infrastructure topology to support rapid iterations in development while ensuring maximum security, compliance, and zero downtime in production. We must manage three distinct lifecycles: Development (frequent, ephemeral changes), Staging (pre-production integration testing), and Production (highly guarded, customer-facing).

1. Decision Drivers

    - Configuration Drift Minimization
      > Infrastructure manifests must remain synchronized across all environments to guarantee that what is tested in staging behaves identically in production.

    - Configuration Clarity
      > Environment-specific configuration must be visible, reviewed, and separated from application code and container images.

    - Environment Isolation
      > Production workloads must be protected from non-production failures, experiments, credentials, and access permissions.

    - Environmental Parity
      > Staging must closely mirror production configuration to ensure valid release testing, while development environments prioritize flexibility and rapid iteration.

    - Compliance and Auditability
      > Production environments must satisfy regulatory requirements for access controls, audit logging, and data protection.

    - Blast Radius Containment
      > Misconfigurations or resource exhaustion in non-production environments must never impact the production environment.

    - Operational Velocity and Automation
      > Promotions between environments should be auditable, repeatable, and automated via code review practices rather than manual execution.

    - Cost Optimization
      > Resource utilization must be balanced intelligently, avoiding the financial overhead of redundant production-grade hardware for development tiers.

## 3. Decision

### 3.1. Kustomize for Configuration Management

Kustomize is selected to manage environment-specific manifest configurations using a base-and-overlay pattern.

1. Rationale

    - Configuration Drift Minimization
      > Maintaining a single `base/` blueprint for deployments guarantees that schema changes are inherited globally across both local K3s instances and cloud tiers.

    - Configuration Clarity
      > Kustomize enforces plain, declarative YAML overlays, separating environmental variables and configurations from the core application logic and image definitions.

    - Environmental Parity
      > Using the same foundational base layers ensures that the structural setup of resources remains near-identical across environments, altering only scale or target variables via targeted patches.

### 3.2. GitOps Directory-per-Environment via ArgoCD

ArgoCD is selected as the GitOps controller for cloud environments, mapping environments to distinct folders within a centralized infrastructure repository, and using pull requests to manage environment promotions.

1. Rationale

    - Compliance and Auditability
      > Storing all configurations in Git creates an immutable ledger of cluster changes. Merging pull requests acts as the formal approval gate for cloud changes.

    - Operational Velocity and Automation
      > ArgoCD automates cluster updates upon code merges, removing human error from manual `kubectl` operations and streamlining promotion workflows.

    - Configuration Clarity
      > The complete state of every environment is explicitly visible and version-controlled within a dedicated repository structure.

### 3.3. Local K3s for Dev with Dedicated Cloud Staging and Production

The `dev` environment is shifted entirely off the cloud and onto local developer workstations using K3s. Staging and Production remain cloud-hosted, with Staging in a multi-tenant shared integration cluster and Production residing on its own dedicated, physically isolated cloud cluster.

1. Rationale

    - Cost Optimization
      > Offloading individual development sandboxes to local workstations lowers cloud infrastructure expenses to zero for non-integration dev tasks.

    - Blast Radius Containment
      > Development environments are physically separated from cloud zones, ensuring that credential leaks, testing failures, or local cluster crashes cannot cross cloud network boundaries or affect Staging and Production.

    - Environmental Parity
      > K3s is a fully CNCF-certified distribution, giving developers high-fidelity Kubernetes API parity locally while retaining the flexibility to iterate rapidly without remote registry pipeline latencies.

## 4. Considered

### 4.1. Kustomize

[Kustomize](https://kustomize.io/) is a template-free customization tool for Kubernetes manifests embedded directly within `kubectl`.

- Pros

  - High Configuration Clarity
    > Uses plain YAML manifests, avoiding the readability challenges of complex parameter interpolation strings.

  - Native Integration
    > Built natively into `kubectl`, eliminating dependencies on external binary distribution wrappers for debugging locally.

- Cons

  - Limited Conditional Logic
    > Lacks advanced control structures like loops or conditional evaluation, occasionally resulting in verbose patching files for highly dynamic configurations.

### 4.2. Helm

[Helm](https://helm.sh/) is a package manager for Kubernetes that utilizes template rendering driven by environment-specific values files.

- Pros

  - Rich Ecosystem
    > Possesses a massive public ecosystem of pre-packaged third-party charts for common infrastructure dependencies.

  - Lifecycle Control
    > Provides native rollback mechanisms and release version tracking out of the box.

- Cons

  - Complex Maintenance
    > Writing and maintaining custom templates introduces high cognitive overhead and syntax errors that can obscure configuration clarity during fast-paced local iterations.

### 4.3. K3s (Local Node Kubernetes)

[K3s](https://k3s.io/) is a highly lightweight, fully compliant Kubernetes distribution optimized for local development and edge computing.

- Pros

  - Resource Efficient
    > Packaged as a single binary with low memory consumption (less than 512 MB RAM), preserving local laptop hardware performance.

  - Production Fidelity
    > Fully CNCF-certified, ensuring high environmental parity with enterprise cloud Kubernetes engines (EKS, GKE, AKS).

- Cons

  - Local Resource Consumption
    > Strains older developer hardware if running a large number of microservices simultaneously.

### 4.4. Fully Cloud-Hosted Environments (Shared Dev/Stage Cluster)

Consolidating all tiers into cloud infrastructure, using a shared physical cluster hosting logically isolated `dev` and `stage` environments via namespaces.

- Pros

  - Offloaded Computing
    > Keeps resource-heavy applications off developer machines, preserving local laptop battery and performance.

- Cons

  - Continuous Idle Costs
    > Cloud resources run continuously even when developers are offline, violating cost optimization principles.

  - Higher Blast Radius Risk
    > Sharing a cluster control plane between developer testing and staging increases the probability that resource exhaustion or configuration mistakes impact integration testing.

## 5. Consequences

- Positive

  - Streamlined Compliance Audits
    > Git logs serve as an absolute source of truth, making historical state analysis and compliance reviews effortless.

  - Zero Dev Cloud Spend
    > Eliminates computing costs for individual development sandbox clusters.

  - High-Fidelity Pre-Prod Testing
    > Staging mirrors Production layout while K3s matches API signatures locally, maintaining a high level of environmental parity.

- Negative

  - Ingress Controller Divergence
    > K3s ships natively with Traefik as its default ingress controller, whereas cloud production environments typically utilize NGINX or cloud provider ALBs.

- Risks

  - Workstation Resource Contention
    > Large microservice architectures may overwhelm local developer machine memory allocations.

  - Mitigation
    > Use Kustomize components to strip out non-essential companion microservices (such as heavy logging or tracing stacks) within the local dev overlay.

## 6. Implementation

1. K3s Developer Bootstrapping Script
    > Provide an automated local shell script to spin up K3s, preconfigured to bypass default Traefik deployments if parity with cloud NGINX ingress routing is required.

2. Ingress Component Patching via Kustomize
    > Structure `k8s-infrastructure/components/` to split ingress configurations. The `environments/dev/kustomization.yaml` overlay loads local routing variants, while `environments/prod/` binds to cloud-native load balancers.

3. GitOps Branching and Promotion Policy
    > Enforce branch protections on the infrastructure repository requiring at least one peer review approval before changes are synced to Staging or Production by ArgoCD.

## 7. References

- K3s Architecture [Guidelines](https://docs.k3s.io/architecture) documentation.
- Kustomize Overlays [Documentation](https://kubectl.docs.kubernetes.io/references/kustomize/glossary/#overlay) page.
- ArgoCD GitOps [Best Practices](https://argo-cd.readthedocs.io/en/stable/user-guide/best-practices/) guide.
