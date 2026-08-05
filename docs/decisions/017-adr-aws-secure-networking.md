# 017-ADR: AWS Secure Networking

Architectural Decision Records (ADR) on adopting an AWS native, layered secure networking baseline for cloud workloads, service-to-service communication, internet-facing entry points, and hybrid connectivity.

- [1. State](#1-state)
- [2. Context](#2-context)
- [3. Decision](#3-decision)
  - [3.1. AWS Native Layered Secure Networking Baseline](#31-aws-native-layered-secure-networking-baseline)
- [4. Considered](#4-considered)
  - [4.1. AWS Native Layered Secure Networking Baseline](#41-aws-native-layered-secure-networking-baseline)
  - [4.2. VPC Peering Mesh](#42-vpc-peering-mesh)
  - [4.3. Transit Gateway-Only Hub-and-Spoke](#43-transit-gateway-only-hub-and-spoke)
  - [4.4. Public Endpoint-Centric Networking](#44-public-endpoint-centric-networking)
  - [4.5. Third-Party Network Virtual Appliances](#45-third-party-network-virtual-appliances)
  - [4.6. AWS Cloud WAN](#46-aws-cloud-wan)
- [5. Consequences](#5-consequences)
- [6. Implementation](#6-implementation)
- [7. References](#7-references)

## 1. State

- Author(s): Sentenz
- Date: 2026-07-09
- Status: Proposed

## 2. Context

AWS workloads require a secure networking model that can support isolated application environments, controlled ingress and egress, private access to managed services, scalable connectivity between VPCs, and governed hybrid access from on-premises or remote users. AWS provides purpose-built services across network foundations, global and hybrid connectivity, edge networking, application networking, and network security. A convention is required so that future AWS architectures select these services consistently rather than relying on ad hoc public endpoints, unmanaged peering relationships, or workload-local firewall rules.

1. Decision Drivers

    - Defense in Depth
      > Networking controls must combine subnet isolation, security groups, network access control lists, managed firewalls, DNS filtering, application-layer protection, and DDoS protection rather than depending on a single perimeter.

    - Private Connectivity by Default
      > Workloads should minimize exposure to the public internet and use private paths for AWS service access, SaaS access, service-to-service traffic, and hybrid connectivity where feasible.

    - Scalable Multi-VPC Routing
      > Connectivity between accounts, VPCs, environments, and Regions must remain understandable and governable as the number of networks grows.

    - Hybrid and Remote Access
      > The network model must support encrypted site connectivity, private dedicated connectivity, and identity-aware workforce access without broad trust in source networks.

    - Edge Availability and Protection
      > Public applications must use resilient edge and application controls for DNS, content delivery, load balancing, web-layer filtering, and DDoS mitigation.

    - Operability and Governance
      > Network design must be observable, auditable, reproducible through infrastructure as code, and centrally governed across accounts and environments.

    - Cost and Complexity Control
      > The baseline must avoid unnecessary appliances, route sprawl, and redundant data-processing charges while preserving room for stricter controls where risk requires them.

## 3. Decision

### 3.1. AWS Native Layered Secure Networking Baseline

Adopt an AWS native, layered secure networking baseline for AWS workloads. The baseline uses Amazon VPC as the isolation boundary, AWS PrivateLink and VPC endpoints for private service access, AWS Transit Gateway for scalable regional VPC and hybrid routing, managed network-security services for inspection and enforcement, and AWS edge services for protected public ingress. AWS Cloud WAN is reserved for organizations that require a centrally managed global WAN policy across Regions, branches, and data centers.

1. Rationale

    - Defense in Depth
      > Amazon VPC segmentation, security groups, network access control lists, AWS Network Firewall, Route 53 Resolver DNS Firewall, AWS WAF, AWS Shield, and Firewall Manager provide complementary controls at subnet, instance, DNS, network, application, and governance layers.

    - Private Connectivity by Default
      > AWS PrivateLink, interface endpoints, gateway endpoints, and private hosted zones reduce reliance on public routes for AWS service, SaaS, and internal service access.

    - Scalable Multi-VPC Routing
      > AWS Transit Gateway provides a managed hub for VPC-to-VPC, VPN, and Direct Connect connectivity, avoiding the operational complexity of full-mesh VPC peering for most multi-account environments.

    - Hybrid and Remote Access
      > AWS Site-to-Site VPN, AWS Direct Connect, AWS Client VPN, and AWS Verified Access cover encrypted network tunnels, deterministic private connectivity, remote workforce VPN, and identity-aware application access respectively.

    - Edge Availability and Protection
      > Amazon Route 53, Amazon CloudFront, Elastic Load Balancing, AWS Global Accelerator, AWS WAF, and AWS Shield support resilient public ingress with latency optimization, managed routing, application-layer filtering, and DDoS mitigation.

    - Operability and Governance
      > VPC Flow Logs, Reachability Analyzer, AWS Firewall Manager, AWS CloudWatch, AWS Config, and Amazon VPC IPAM provide visibility, policy governance, validation, and address-management controls needed for repeatable operations.

    - Cost and Complexity Control
      > Native managed services reduce appliance lifecycle management, while explicit placement of inspection points and private endpoints keeps data paths and routing behavior reviewable.

## 4. Considered

### 4.1. AWS Native Layered Secure Networking Baseline

[AWS networking and content delivery services](https://aws.amazon.com/products/networking/) combine VPC foundations, private connectivity, transit routing, managed firewalls, edge protection, DNS, load balancing, and observability services into a composable secure networking architecture.

- Pros

  - Security Coverage
    > Covers subnet, instance, DNS, network, application, edge, and DDoS protection layers with managed AWS services.

  - Service Alignment
    > Aligns with AWS decision guidance that groups services into networking foundations, global and hybrid connectivity, edge networking and content delivery, application networking, and network security.

  - Scalability
    > Supports multi-account and multi-VPC growth through Transit Gateway, PrivateLink, Firewall Manager, and IPAM without forcing a peering mesh.

  - Operational Integration
    > Integrates with AWS logging, monitoring, infrastructure-as-code, identity, and governance workflows.

- Cons

  - AWS Coupling
    > Relies on AWS-native services and may require abstraction for multi-cloud portability.

  - Design Discipline
    > Requires deliberate route-table design, endpoint placement, inspection-domain definition, and cost review to avoid unmanaged complexity.

### 4.2. VPC Peering Mesh

[Amazon VPC peering](https://docs.aws.amazon.com/vpc/latest/peering/what-is-vpc-peering.html) connects VPCs directly using private IP addressing without a separate transit hub.

- Pros

  - Simplicity for Small Topologies
    > Direct peering can be straightforward for a small number of VPCs with stable connectivity needs.

  - Low Control-Plane Overhead
    > Does not require a centralized routing service for point-to-point connectivity.

- Cons

  - Poor Scale Characteristics
    > Full-mesh peering creates route-table sprawl and complex change management as VPC count grows.

  - Limited Transitivity
    > VPC peering does not provide transitive routing, which makes centralized inspection and shared hybrid connectivity harder to standardize.

### 4.3. Transit Gateway-Only Hub-and-Spoke

[AWS Transit Gateway](https://docs.aws.amazon.com/vpc/latest/tgw/what-is-transit-gateway.html) centralizes VPC and hybrid network connectivity through a managed regional transit hub.

- Pros

  - Scalable Routing
    > Provides a managed hub-and-spoke model for VPC, VPN, and Direct Connect connectivity.

  - Segmentation
    > Supports route-table segmentation between environments, accounts, and trust zones.

- Cons

  - Incomplete Security Baseline
    > Routing centralization alone does not address private service access, DNS filtering, application-layer protection, DDoS mitigation, or endpoint governance.

  - Regional Scope
    > Multi-Region and global WAN patterns require additional design, peering, or AWS Cloud WAN depending on the operating model.

### 4.4. Public Endpoint-Centric Networking

Public endpoint-centric networking exposes services through public addresses and relies primarily on transport encryption, identity, and application controls.

- Pros

  - Low Initial Complexity
    > Public endpoints are simple to integrate with external users, APIs, and managed services.

  - Broad Reachability
    > Public internet routing avoids the need for private endpoint, VPN, or Direct Connect setup for basic access paths.

- Cons

  - Expanded Attack Surface
    > Public exposure increases dependency on internet-facing controls and broadens the set of externally reachable assets.

  - Weak Private-by-Default Posture
    > This approach conflicts with least-exposure networking for internal workloads, administrative surfaces, and service-to-service traffic.

### 4.5. Third-Party Network Virtual Appliances

Third-party network virtual appliances provide firewall, routing, intrusion-prevention, or secure web gateway capabilities from external vendors deployed inside AWS.

- Pros

  - Feature Continuity
    > Existing enterprise firewall policies and operational practices may be reused when the organization has standardized on a vendor.

  - Specialized Inspection
    > Advanced inspection, threat-intelligence, or compliance features may exceed the native capability required by some workloads.

- Cons

  - Operational Burden
    > Appliance lifecycle management, high availability, scaling, patching, and licensing add complexity compared with managed services.

  - Cost and Throughput Risk
    > Instance sizing, licensing, cross-AZ traffic, and inspection bottlenecks must be actively managed to avoid degraded availability or high cost.

### 4.6. AWS Cloud WAN

[AWS Cloud WAN](https://docs.aws.amazon.com/network-manager/latest/cloudwan/what-is-cloudwan.html) provides a managed global WAN for building, managing, and monitoring networks across AWS Regions, data centers, and branch locations.

- Pros

  - Global Policy Management
    > Centralizes global network policy for organizations with multi-Region, branch, and data-center connectivity requirements.

  - Operational Visibility
    > Provides global-network management and monitoring capabilities for complex WAN environments.

- Cons

  - Premature for Regional Baselines
    > Adds policy and operating-model overhead when workloads only require regional VPC connectivity and a limited number of hybrid links.

  - Complementary Rather Than Foundational
    > Does not replace the need for VPC segmentation, PrivateLink, edge protection, DNS security, and application-layer controls.

## 5. Consequences

- Positive

  - Reduced Exposure
    > Private endpoints, VPC segmentation, and controlled ingress reduce the number of assets reachable from the public internet.

  - Consistent Security Posture
    > Standardized use of native security controls improves repeatability across accounts, Regions, and workload teams.

  - Scalable Connectivity
    > Transit Gateway and PrivateLink reduce peering sprawl while preserving clear ownership boundaries between networks and services.

  - Improved Auditability
    > Centralized logging, reachability validation, firewall policy management, and IP address management improve evidence collection and operational review.

- Negative

  - Architecture Complexity
    > The baseline introduces multiple managed services that require clear ownership, route design, policy design, and documentation.

  - AWS Service Dependency
    > The convention is optimized for AWS-native workloads and may not translate directly to non-AWS environments.

  - Cost Management Required
    > Transit routing, firewall inspection, NAT gateways, endpoints, and cross-AZ traffic can increase cost without explicit traffic-path review.

- Risks

  - Misconfigured Routes or Policies
    > Incorrect route tables, endpoint policies, firewall rules, or security groups can create unintended reachability; mitigate through infrastructure-as-code review, Reachability Analyzer, AWS Config rules, and staged rollout.

  - Centralized Inspection Bottlenecks
    > Concentrated firewall or NAT paths can become throughput or availability bottlenecks; mitigate through multi-AZ deployment, capacity monitoring, and workload-specific bypass rules only where justified.

  - Incomplete Ownership Model
    > Ambiguous responsibility between platform, security, and application teams can leave controls unmanaged; mitigate through documented control ownership and periodic architecture reviews.

## 6. Implementation

1. Define Network Account and Environment Boundaries

    Establish account-level ownership for shared networking services, inspection, DNS, logging, and IP address management. Segment workload accounts by environment and trust boundary.

2. Implement VPC Segmentation

    Create VPCs with public, private, inspection, and data subnets as required. Use security groups as the primary workload-level control and network access control lists as stateless subnet guardrails.

3. Standardize Private Service Access

    Use AWS PrivateLink, interface endpoints, gateway endpoints, and endpoint policies for AWS service access, SaaS access, and internal producer-consumer service patterns where private connectivity is feasible.

4. Centralize Regional Connectivity

    Use AWS Transit Gateway for regional VPC-to-VPC, Site-to-Site VPN, and Direct Connect connectivity. Define separate route tables for production, non-production, shared services, and inspection zones.

5. Enforce Managed Network Security Controls

    Deploy AWS Network Firewall and Route 53 Resolver DNS Firewall where centralized traffic inspection, egress control, or DNS-layer protection is required. Manage common policies with AWS Firewall Manager when multiple accounts are in scope.

6. Protect Public Ingress

    Route public applications through Amazon Route 53, Elastic Load Balancing, Amazon CloudFront or AWS Global Accelerator where appropriate, AWS WAF for web-layer filtering, and AWS Shield for DDoS protection.

7. Govern Hybrid and Workforce Access

    Use Direct Connect for predictable private connectivity, Site-to-Site VPN for encrypted site connectivity, Client VPN for network-level remote access, and AWS Verified Access for identity-aware access to private web applications.

8. Enable Observability and Audit Evidence

    Enable VPC Flow Logs, firewall logs, load balancer access logs, WAF logs, DNS query logs where required, CloudWatch metrics and alarms, AWS Config rules, and IPAM inventory for reviewable operations.

9. Affected Areas

    Apply this convention to AWS landing-zone design, infrastructure-as-code modules, account vending, workload onboarding, network security policy, DNS architecture, public ingress patterns, and hybrid connectivity runbooks.

10. Validation

    Validate conformance through infrastructure-as-code checks, route-table review, endpoint-policy review, security-group review, AWS Reachability Analyzer, AWS Config compliance rules, firewall policy review, and periodic architecture threat modeling.

## 7. References

- AWS Decision Guides [Choosing an AWS networking and content delivery service](https://docs.aws.amazon.com/decision-guides/latest/networking-on-aws-how-to-choose/choosing-networking-and-content-delivery-service.html) documentation.
- AWS [Networking and Content Delivery on AWS](https://aws.amazon.com/products/networking/) product overview.
- Amazon VPC [VPC peering](https://docs.aws.amazon.com/vpc/latest/peering/what-is-vpc-peering.html) documentation.
- AWS Transit Gateway [What is a transit gateway?](https://docs.aws.amazon.com/vpc/latest/tgw/what-is-transit-gateway.html) documentation.
- AWS Cloud WAN [What is AWS Cloud WAN?](https://docs.aws.amazon.com/network-manager/latest/cloudwan/what-is-cloudwan.html) documentation.
