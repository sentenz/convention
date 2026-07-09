# 017-ADR: AWS Networking

Architectural Decision Records (ADR) on standardizing AWS networking conventions for secure, resilient, observable, and scalable cloud workloads.

- [1. State](#1-state)
- [2. Context](#2-context)
- [3. Decision](#3-decision)
  - [3.1. Amazon VPC Multi-AZ Subnet Tiers](#31-amazon-vpc-multi-az-subnet-tiers)
  - [3.2. AWS PrivateLink and VPC Endpoints](#32-aws-privatelink-and-vpc-endpoints)
  - [3.3. AWS Transit Gateway Hub-and-Spoke Connectivity](#33-aws-transit-gateway-hub-and-spoke-connectivity)
  - [3.4. Security Group First Segmentation and Flow-Log Observability](#34-security-group-first-segmentation-and-flow-log-observability)
- [4. Considered](#4-considered)
  - [4.1. Amazon VPC Multi-AZ Subnet Tiers](#41-amazon-vpc-multi-az-subnet-tiers)
  - [4.2. AWS PrivateLink and VPC Endpoints](#42-aws-privatelink-and-vpc-endpoints)
  - [4.3. AWS Transit Gateway Hub-and-Spoke Connectivity](#43-aws-transit-gateway-hub-and-spoke-connectivity)
  - [4.4. VPC Peering Mesh](#44-vpc-peering-mesh)
  - [4.5. Flat Public Subnet VPC](#45-flat-public-subnet-vpc)
  - [4.6. NAT-Only AWS Service Access](#46-nat-only-aws-service-access)
- [5. Consequences](#5-consequences)
- [6. Implementation](#6-implementation)
- [7. References](#7-references)

## 1. State

- Author(s): Sentenz
- Date: 2026-07-09
- Status: Proposed

## 2. Context

AWS workloads require a repeatable networking baseline that separates public ingress, private application traffic, isolated data-plane resources, AWS service access, and inter-VPC connectivity. Ad hoc VPC layouts increase the risk of overlapping CIDR blocks, overly permissive ingress, brittle route tables, unnecessary public internet paths, and inconsistent observability. A standard convention is needed so application teams can compose AWS infrastructure without re-solving foundational network design for each workload.

1. Decision Drivers

    - Security Boundary Clarity
      > The network design must make public, private, and isolated trust boundaries explicit and enforce least-privilege connectivity by default.

    - Availability Zone Resilience
      > Workloads must be deployable across multiple Availability Zones without depending on a single subnet, route, or egress path for critical traffic.

    - Private AWS Service Access
      > Traffic to supported AWS services should remain on private AWS networking paths whenever practical instead of traversing public internet egress.

    - Scalable Interconnect
      > Multi-account, multi-VPC, and hybrid connectivity must avoid unbounded point-to-point route complexity as the estate grows.

    - Operability and Auditability
      > Network intent must be visible through infrastructure-as-code review, flow telemetry, and automated reachability validation.

    - Cost Awareness
      > NAT gateways, Transit Gateway attachments, endpoints, public IPv4 addresses, and log ingestion must be used deliberately because they introduce recurring cost.

## 3. Decision

### 3.1. Amazon VPC Multi-AZ Subnet Tiers

Amazon VPC with explicit multi-AZ subnet tiers is selected as the baseline AWS network topology. Each workload environment should use a VPC with non-overlapping CIDR allocation, DNS support enabled, route tables managed as code, and subnet tiers for public ingress or egress, private application resources, and isolated data resources.

1. Rationale

    - Security Boundary Clarity
      > Separating public, private, and isolated subnets makes exposure intent explicit and reduces accidental placement of workloads on internet-routable paths.

    - Availability Zone Resilience
      > Repeating subnet tiers across Availability Zones allows load-balanced and stateful services to tolerate an Availability Zone impairment.

    - Operability and Auditability
      > Route tables, subnet metadata, and tags provide reviewable evidence of intended traffic paths and ownership.

### 3.2. AWS PrivateLink and VPC Endpoints

AWS PrivateLink and VPC endpoints are selected as the preferred mechanism for accessing supported AWS services and privately exposed internal services. Gateway endpoints should be used for Amazon S3 and DynamoDB where applicable. Interface endpoints should be used for AWS services, shared platform services, and cross-account service access when private connectivity and endpoint policy controls are required.

1. Rationale

    - Private AWS Service Access
      > VPC endpoints reduce dependence on public IPv4 egress and keep supported service traffic on private AWS networking paths.

    - Security Boundary Clarity
      > Endpoint policies and security groups enable access control near the network boundary as a complement to IAM policies.

    - Cost Awareness
      > Gateway endpoints can reduce NAT gateway dependency for high-volume S3 and DynamoDB traffic, while interface endpoints are adopted selectively where their per-hour and per-data-processing costs are justified.

### 3.3. AWS Transit Gateway Hub-and-Spoke Connectivity

AWS Transit Gateway is selected for shared inter-VPC, cross-account, and hybrid connectivity when more than two VPCs, shared services, inspection, VPN, or Direct Connect integration is required. Transit Gateway route tables must be segmented by trust zone or environment to prevent unintended transitive reachability.

1. Rationale

    - Scalable Interconnect
      > A hub-and-spoke model avoids the operational burden of maintaining a full mesh of VPC peering connections and per-VPC routes.

    - Security Boundary Clarity
      > Separate Transit Gateway route tables allow controlled propagation and association for production, non-production, shared-services, and inspection domains.

    - Operability and Auditability
      > Centralized attachments and route tables provide a reviewable control plane for multi-VPC reachability.

### 3.4. Security Group First Segmentation and Flow-Log Observability

Security groups are selected as the primary workload-level network control, supported by network ACLs only where subnet-level guardrails are required. VPC Flow Logs must be enabled for production VPCs, and Reachability Analyzer should be used to validate critical connectivity paths and blocked paths during infrastructure review.

1. Rationale

    - Security Boundary Clarity
      > Security groups express resource-level ingress and egress intent and can be reviewed against application communication requirements.

    - Operability and Auditability
      > Flow logs provide traffic metadata for investigation, and reachability analysis verifies whether configured routes, ACLs, and security groups match intended connectivity.

    - Cost Awareness
      > Logging scope, retention, and destination must be tuned to preserve useful evidence without uncontrolled ingestion or archival cost.

## 4. Considered

### 4.1. Amazon VPC Multi-AZ Subnet Tiers

[Amazon VPC](https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html) provides logically isolated virtual networks, subnets, route tables, gateways, endpoints, flow logs, and connectivity constructs for AWS resources.

- Pros

  - Security Boundary Clarity
    > Distinct public, private, and isolated subnets provide a comprehensible placement model for workloads, load balancers, NAT gateways, databases, and internal services.

  - Availability Zone Resilience
    > Repeating subnet tiers across Availability Zones supports resilient application and data-plane deployment patterns.

  - Operability
    > Subnets, route tables, and tags are visible in infrastructure-as-code plans and can be validated during review.

- Cons

  - Address Planning
    > CIDR allocation must be coordinated across accounts, Regions, VPCs, and hybrid networks to avoid overlaps.

  - Route Table Complexity
    > Fine-grained subnet tiers increase the number of route tables and associations that must be maintained and tested.

### 4.2. AWS PrivateLink and VPC Endpoints

[AWS PrivateLink and VPC endpoints](https://docs.aws.amazon.com/vpc/latest/privatelink/concepts.html) provide private connectivity from a VPC to supported AWS services, endpoint services, service networks, or shared resources.

- Pros

  - Private AWS Service Access
    > Supported service traffic can avoid public internet egress and reduce dependency on public IPv4 paths.

  - Policy Control
    > Interface endpoint policies and endpoint security groups add network-adjacent controls in addition to identity-based authorization.

  - Cost Optimization for Common Services
    > Gateway endpoints for Amazon S3 and DynamoDB avoid NAT gateway data processing for those services.

- Cons

  - Endpoint Sprawl
    > Interface endpoints introduce per-service, per-AZ resources that require lifecycle management, tagging, and policy review.

  - Service Coverage
    > Not every service, protocol, or third-party dependency is reachable through a VPC endpoint, so controlled NAT egress remains necessary.

### 4.3. AWS Transit Gateway Hub-and-Spoke Connectivity

[AWS Transit Gateway](https://docs.aws.amazon.com/vpc/latest/tgw/what-is-transit-gateway.html) provides a regional transit hub for connecting VPCs, VPNs, Direct Connect gateways, peering attachments, and related network attachments.

- Pros

  - Scalable Interconnect
    > Central attachments reduce the number of bilateral connections and routes required in multi-VPC environments.

  - Segmented Routing
    > Multiple Transit Gateway route tables support separate routing domains for environments, shared services, inspection, and hybrid access.

  - Hybrid Readiness
    > VPN and Direct Connect integration provides a consistent model for on-premises connectivity.

- Cons

  - Central Dependency
    > A misconfigured Transit Gateway route table or attachment can affect multiple VPCs and must be governed carefully.

  - Cost
    > Attachments and data processing introduce recurring charges that must be allocated to consuming accounts or platforms.

### 4.4. VPC Peering Mesh

[VPC peering](https://docs.aws.amazon.com/vpc/latest/peering/what-is-vpc-peering.html) provides private point-to-point connectivity between two VPCs.

- Pros

  - Direct Connectivity
    > Peering is simple for one or two VPC pairs that require direct private communication.

  - No Central Transit Resource
    > Small environments can avoid a Transit Gateway dependency and its associated attachment costs.

- Cons

  - Poor Scale Characteristics
    > Each new VPC can require additional peering connections and explicit route-table updates, which becomes difficult to govern at estate scale.

  - No Transitive Routing
    > Peering does not provide transitive routing, so it is unsuitable as the primary multi-VPC backbone.

### 4.5. Flat Public Subnet VPC

A flat public subnet VPC places most workload resources in internet-routable subnets and relies primarily on host-level or security-group controls.

- Pros

  - Simplicity
    > It reduces initial routing and NAT configuration for small experiments or disposable prototypes.

  - Low Initial Cost
    > It can avoid NAT gateways and interface endpoints during early experimentation.

- Cons

  - Excessive Exposure
    > Workload placement in public subnets increases the likelihood of accidental internet reachability.

  - Weak Boundary Model
    > It does not distinguish ingress, application, and data trust zones in the network topology.

  - Production Unsuitability
    > It does not provide the segmentation expected for regulated, multi-team, or long-lived environments.

### 4.6. NAT-Only AWS Service Access

NAT-only AWS service access routes private subnet traffic to AWS public service endpoints through public NAT gateways and an internet gateway.

- Pros

  - Broad Compatibility
    > It works for internet destinations and AWS services that do not support VPC endpoints.

  - Operational Familiarity
    > It is widely understood and simple to model with private subnet default routes.

- Cons

  - Public Egress Dependency
    > Supported AWS service calls still traverse public endpoints instead of private endpoint paths.

  - Cost Concentration
    > High-volume traffic through NAT gateways can introduce avoidable data processing cost.

  - Coarser Access Control
    > NAT gateways do not provide service-specific endpoint policies, so least-privilege service access must rely more heavily on IAM and application configuration.

## 5. Consequences

- Positive

  - Secure Default Placement
    > Workloads are placed in private or isolated subnets unless explicit public ingress is required.

  - Resilient Network Topology
    > Subnet tiers and egress paths can be replicated across Availability Zones for production workloads.

  - Private Service Connectivity
    > Supported AWS service access can use VPC endpoints, reducing unnecessary public internet dependency.

  - Scalable Multi-VPC Routing
    > Transit Gateway provides a standard pattern for shared services, inspection, and hybrid connectivity.

  - Improved Troubleshooting
    > Flow logs and reachability analysis provide evidence for diagnosing routing, security group, and network ACL issues.

- Negative

  - Higher Baseline Complexity
    > The standard requires CIDR planning, route table discipline, endpoint lifecycle management, and explicit connectivity reviews.

  - Additional Recurring Cost
    > NAT gateways, interface endpoints, Transit Gateway attachments, and log ingestion can increase the fixed cost of each environment.

  - Governance Dependency
    > Central route tables, shared endpoints, and account-level conventions require platform ownership and review discipline.

- Risks

  - CIDR Overlap
    > Overlapping address plans can block VPC peering, Transit Gateway routing, and hybrid integration. Mitigation: allocate CIDRs through a central IP address management process before provisioning.

  - Over-Permissive Security Groups
    > Broad ingress or egress rules can undermine subnet segmentation. Mitigation: require named security group rules, restricted sources, and automated checks for administrative ports and `0.0.0.0/0` exposure.

  - Endpoint Policy Drift
    > Default or overly broad endpoint policies can allow unintended service access. Mitigation: version endpoint policies in infrastructure code and review them with IAM changes.

  - Central Connectivity Blast Radius
    > Transit Gateway misconfiguration can create unintended reachability between environments. Mitigation: isolate route tables by trust zone and validate critical reachability paths before promotion.

## 6. Implementation

1. Allocate address space.

    Reserve non-overlapping IPv4 and, where required, IPv6 CIDR ranges through the platform address-management process. Document environment, account, Region, and owner metadata before creating the VPC.

2. Provision the VPC and subnet tiers.

    Create one VPC per workload environment or account boundary. Enable DNS support and DNS hostnames. Create public, private, and isolated subnet tiers across at least two Availability Zones for production workloads.

3. Define routing explicitly.

    Associate each subnet tier with an explicit route table. Public subnets may route to an internet gateway. Private subnets may route external IPv4 egress through NAT gateways only when no private endpoint exists. Isolated subnets must not have default routes to internet or NAT gateways.

4. Configure private AWS service access.

    Add gateway endpoints for Amazon S3 and DynamoDB where those services are used. Add interface endpoints for required AWS APIs, shared platform services, and cross-account services when private access or endpoint policies are required.

5. Control ingress and egress.

    Place internet-facing load balancers and NAT gateways only in public subnets. Place application workloads in private subnets and data services in isolated subnets where possible. Use security groups as the primary control and network ACLs only for subnet-level guardrails.

6. Standardize inter-VPC connectivity.

    Use Transit Gateway for multi-VPC, shared-service, inspection, VPN, or Direct Connect connectivity. Segment Transit Gateway route tables by trust zone and avoid peering meshes except for small, isolated, explicitly approved cases.

7. Enable observability.

    Enable VPC Flow Logs for production VPCs and send logs to the approved central destination. Define retention, partitioning, encryption, and cost allocation tags for the log destination.

8. Validate network intent.

    Use infrastructure-as-code review, static policy checks, and Reachability Analyzer for critical paths such as public ingress to load balancers, private application-to-data access, endpoint access, and intentionally blocked administrative access.

## 7. References

- AWS [What is Amazon VPC?](https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html) documentation.
- AWS [Subnets for your VPC](https://docs.aws.amazon.com/vpc/latest/userguide/configure-subnets.html) documentation.
- AWS [Control traffic to your AWS resources using security groups](https://docs.aws.amazon.com/vpc/latest/userguide/vpc-security-groups.html) documentation.
- AWS [AWS PrivateLink concepts](https://docs.aws.amazon.com/vpc/latest/privatelink/concepts.html) documentation.
- AWS [NAT gateways](https://docs.aws.amazon.com/vpc/latest/userguide/vpc-nat-gateway.html) documentation.
- AWS [What is AWS Transit Gateway for Amazon VPC?](https://docs.aws.amazon.com/vpc/latest/tgw/what-is-transit-gateway.html) documentation.
- AWS [Logging IP traffic using VPC Flow Logs](https://docs.aws.amazon.com/vpc/latest/userguide/flow-logs.html) documentation.
- AWS [What is Reachability Analyzer?](https://docs.aws.amazon.com/vpc/latest/reachability/what-is-reachability-analyzer.html) documentation.
