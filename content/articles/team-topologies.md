# Team Topologies

[Team Topologies](https://teamtopologies.com/) is an organizational design framework that provides a clear, practical model for organizing business and technology teams for fast flow. It optimizes team structures and interaction modes to reduce cognitive load and enhance the continuous delivery of software value.

- [1. Category](#1-category)
  - [1.1. Team Types](#11-team-types)
  - [1.2. Interaction Modes](#12-interaction-modes)
- [2. Principles](#2-principles)
- [3. References](#3-references)

## 1. Category

### 1.1. Team Types

Core team types define the distinct responsibilities, boundaries, and mandates assigned to organizational units. Defining strict team types helps reduce ambiguity, eliminate overlapping responsibilities, and protect teams from expanding cognitive load.

1. Types and Scopes

    - Stream-Aligned Team
      > A stream-aligned team is focused on a continuous flow of work aligned to a single business domain or value stream. They are cross-functional, autonomous, and capable of delivering value from concept to production without handoffs.

      ```yaml
      team:
        name: "checkout-experience"
        type: "stream-aligned"
        capability: "e-commerce-checkout"
        cognitive_load: "low"
        primary_focus: "optimize-conversion-rate"
      ```

    - Enabling Team
      > An enabling team consists of specialists who help stream-aligned teams acquire new capabilities, tools, and engineering practices. They act as internal consultants or coaches, avoiding permanent ownership of application code.

      ```yaml
      team:
        name: "test-automation-enablers"
        type: "enabling"
        capability: "ci-cd-and-testing-frameworks"
        engagement_model: "short-term-coaching"
      ```

    - Complicated-Subsystem Team
      > A complicated-subsystem team is responsible for a part of the system that requires deep, specialized knowledge or complex technical expertise. They insulate stream-aligned teams from overwhelming technical complexities.

      ```yaml
      team:
        name: "cryptographic-engine"
        type: "complicated-subsystem"
        specialization: "quantum-resistant-encryption"
        interface: "gRPC-api"
      ```

    - Platform Team
      > A platform team builds and maintains an underlying digital platform (such as internal APIs, infrastructure services, or development tools) that enables stream-aligned teams to deliver value autonomously and with minimal friction.

      ```yaml
      team:
        name: "kubernetes-infrastructure"
        type: "platform"
        offering: "internal-developer-platform"
        consumption_model: "self-service"
      ```

### 1.2. Interaction Modes

[Interaction Modes](https://teamtopologies.com/key-concepts) define how different team types collaborate and communicate with one another. Clear interaction boundaries prevent friction, avoid unintended dependencies, and establish predictable operational behavior across the organization.

1. Types and Scopes

    - `Collaboration`
      > Two teams working closely together for a defined period to discover, innovate, or resolve cross-boundary challenges. It features high communication overhead but yields fast discovery.

      ```yaml
      interaction:
        mode: "collaboration"
        parties: ["checkout-experience", "kubernetes-infrastructure"]
        objective: "co-design-service-mesh-ingress"
        duration: "2-weeks"
      ```

    - `X-as-a-Service`
      > One team consumes a component, API, or service provided by another team with minimal friction or direct interaction. The boundary is clean and supported by strong documentation.

      ```yaml
      interaction:
        mode: "x-as-a-service"
        provider: "kubernetes-infrastructure"
        consumer: "checkout-experience"
        interface: "backstage-developer-portal"
      ```

    - `Facilitating`
      > One team (typically an enabling team) coaches, guides, or clears obstacles for another team, helping them learn a new capability or adopt a new tool without taking over execution.

      ```yaml
      interaction:
        mode: "facilitating"
        provider: "test-automation-enablers"
        consumer: "checkout-experience"
        focus: "transition-to-playwright-testing"
        duration: "3-sprints"
      ```

## 2. Principles

- Conway's Law
  > Structure teams to match the desired software architecture. The organization's communication structures heavily influence the design of the systems they build, making an Inverse Conway Maneuver crucial for architectural success.

- Team Cognitive Load
  > Treat team cognitive load as a limiting factor for engineering velocity. Size teams and domain boundaries appropriately so that team members can fully understand and own their codebase without burnout.

- Evolutionary Architecture
  > Recognize that team structures must change over time as software and organizational needs evolve. Avoid establishing permanent, static structures and instead design for dynamic reconfiguration.

- Fast Flow
  > Optimize all organization and system design choices to accelerate the end-to-end delivery of value, minimizing wait times, handoffs, and external blockers.

- Team-First Approach
  > Treat the team, not the individual, as the fundamental unit of delivery. Foster long-lived, high-trust teams with stable membership to maximize collaboration efficiency and domain expertise.

- Loose Coupling
  > Design teams and software systems to be loosely coupled but highly aligned, minimizing cross-team dependencies and unlocking independent, decentralized deployment paths.

## 3. References

- Team Topologies [Official Key Concepts](https://teamtopologies.com/key-concepts) page.
- Martin Fowler [Team Topologies](https://martinfowler.com/bliki/TeamTopologies.html) article.
