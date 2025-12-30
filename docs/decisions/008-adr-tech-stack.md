# XXX-ADR: Tech Stack

Architectural Decision Records (ADR) for Tech Stacks in Software Develpoment.

- [1. State](#1-state)
- [2. Context](#2-context)
- [3. Decision](#3-decision)
  - [3.1. Tech Stack](#31-tech-stack)
- [4. Considered](#4-considered)
  - [4.1. No Defination](#41-no-defination)
  - [4.2. Tech Stack](#42-tech-stack)

## 1. State

- Author(s): ALKL
- Date: 2024-01-01
- Status: Proposed

## 2. Context

In software development, selecting a tech stack involves choosing a specific set of technologies like programming languages, frameworks, databases, front-end/back-end tools, and other essential software to develop and maintain an application. The decision of whether or not to define a tech stack impacts several aspects of a project, including scalability, maintainability, onboarding and operational efficiency.

1. Decision Drivers

    - TODO Topic
      > TODO Description

## 3. Decision

### 3.1. Tech Stack

The decision is to define a tech stack for the projects. We will proceed with defining a specific tech stack for the projects, focusing on technologies that best meet our current and foreseeable future needs.

> [!NOTE]
> Periodic review the selected tech stack to incorporate beneficial new technologiess and emerging industry trends when appropriate. In addition, limited flexibility will be introduced by allowing experimentation with new technologies in controlled environments, such as feature-specific services.

1. Rationale

    - TODO Topic
      > TODO Description

## 4. Considered

### 4.1. No Defination

Allowing developers to use any technology that best fits, with no formalized set of tools.

- Pros

  - Flexibility
    > Allows developers to choose the most suitable tools for specific problems, potentially leading to innovative solutions.

  - Adoption of New Technologies
    > Easier to integrate the latest technologies as they emerge.

  - Developer Autonomy
    > Can increase job satisfaction by giving developers more control over their work.

- Cons

  - Inconsistency
    > Leads to a fragmented codebase, making maintenance and knowledge transfer challenging.

  - Steeper Learning Curve
    > Team members may need to familiarize themselves with multiple technologies to contribute effectively.

  - Collaboration Challenges
    > Hinders teamwork due to varying tools and practices.

  - Integration Issues
    > Different technologies may not seamlessly integrate, leading to technical debt.

  - Onboarding
    > New team members may struggle to adapt to a heterogeneous technical environment.

### 4.2. Tech Stack

Defining the technologies to be used throughout the project.

- Pros

  - Consistency
    > Ensures a uniform codebase, making it easier to read, understand, and maintain.

  - Efficiency
    > Developers become proficient with selected technologies, leading to faster development over time.

  - Collaboration
    > Facilitates better teamwork as everyone uses the same tools and languages.

  - Onboarding
    > Simplifies the onboarding process for new team members who only need to learn the defined stack.

  - Scalability
    > Predictable technologies make it easier to plan for application scaling.

- Cons

  - Inflexibility
    > Limits the ability to incorporate new or specialized technologies that may be better suited for certain tasks.

  - Obsolescence Risk
    > The chosen technologies may become outdated, requiring future migrations.

  - Initial Time Investment
    > Requires time and resources upfront to select the appropriate technologies.
