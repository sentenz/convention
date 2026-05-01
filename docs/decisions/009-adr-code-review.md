# 009-ADR: Code Review

Architectural Decision Records (ADR) for Code Reviews in Software Development.

- [1. State](#1-state)
- [2. Context](#2-context)
- [3. Decision](#3-decision)
  - [3.1. Hybrid Code Review](#31-hybrid-code-review)
  - [3.2. Automated Code Review](#32-automated-code-review)
  - [3.3. Asynchronous Code Review](#33-asynchronous-code-review)
  - [3.4. Synchronous Code Review (Optional)](#34-synchronous-code-review-optional)
- [4. Considered](#4-considered)
  - [4.1. No Code Review](#41-no-code-review)
  - [4.2. Automated Code Review](#42-automated-code-review)
  - [4.3. Asynchronous Code Review](#43-asynchronous-code-review)
  - [4.4. Synchronous Code Review](#44-synchronous-code-review)
- [5. Consequences](#5-consequences)
- [6. Implementation](#6-implementation)
- [7. References](#7-references)

## 1. State

- Author(s): Sentenz
- Date: 2024-10-11
- Status: Proposed

## 2. Context

Code review is a systematic software quality assurance technique for developers in which the code is reviewed to find and fix errors, improve code quality, knowledge sharing and team collaboration, and enforce coding standards.

1. Decision Drivers

    - Code Quality
      > Ensure that code meets established quality standards, reducing the likelihood of bugs, security vulnerabilities, and technical debt.

    - Knowledge Sharing
      > Promote collaborative learning and knowledge transfer across the team to prevent knowledge silos and foster collective code ownership.

    - Automation
      > Reduce manual effort and accelerate feedback cycles by automating routine checks for style, formatting, and basic quality issues.

    - Team Collaboration
      > Foster a culture of constructive peer collaboration and continuous improvement through structured review workflows.

    - Scalability
      > Ensure the review process remains effective and manageable as the codebase and team grow over time.

## 3. Decision

### 3.1. Hybrid Code Review

A hybrid Code Review process that combines `Automated Code Review` with `Asynchronous Code Review` is selected. Additionally, `Synchronous Code Review` will be utilized as needed specifically for Business Logic or Domain Logic. This approach leverages the efficiency of automation, the thoroughness of structured reviews, and the collaborative benefits of peer meetings when dealing with complex or critical areas of the codebase.

1. Rationale

    - Code Quality
      > The hybrid approach combines automated quality gates for consistent enforcement of standards with thorough human reviews for complex logic, architecture, and design decisions, achieving comprehensive quality assurance.

    - Knowledge Sharing
      > Asynchronous peer reviews through Merge Requests and Pull Requests facilitate mentorship and collective code ownership, while optional synchronous meetings provide a deeper collaborative understanding of complex business and domain logic.

    - Automation
      > Automated Code Review handles routine style, formatting, and basic quality checks efficiently, reducing the cognitive load on human reviewers and enabling them to focus on higher-order concerns such as architecture and functionality.

    - Team Collaboration
      > Pull Requests provide structured collaboration touchpoints with clear traceability, while optional Peer Review meetings enable real-time discussion for critical or complex areas of the codebase.

    - Scalability
      > Automation manages review volume as the codebase grows, structured asynchronous reviews scale naturally with the team, and synchronous reviews are reserved for critical areas to limit scheduling overhead.

### 3.2. Automated Code Review

Automated Code Review will handle routine checks, enforcing coding standards, and catching basic errors quickly. This reduces the burden on developers and allows structured reviews to focus on more complex and critical aspects of the code.

### 3.3. Asynchronous Code Review

Asynchronous Code Review will be reserved for significant code changes, architectural decisions, and areas requiring deeper scrutiny. This ensures high code quality, fosters team collaboration, and supports knowledge sharing without overloading the review process for minor changes.

### 3.4. Synchronous Code Review (Optional)

Synchronous Code Review utilizing Peer Review meetings will be employed as needed for Business Logic or Domain Logic. These meetings provide a platform for discussing complex business rules, ensuring that the implementation aligns with domain requirements, and facilitating a deeper understanding among team members. By limiting Synchronous Code Review to these critical areas, we manage scheduling overhead and maintain scalability while enhancing the quality of essential components.

## 4. Considered

### 4.1. No Code Review

Proceed without implementing any formal code review process. Developers commit code directly to the main branch without peer evaluation.

- Pros:

  - Speed
    > Faster code integration with no delays for reviews.

  - Simplicity
    > Reduced process overhead and administrative burden.

- Cons:

  - Quality Risks
    > Higher likelihood of bugs, security vulnerabilities, and inconsistent code quality.

  - Knowledge Silos
    > Limited knowledge sharing among team members, leading to expertise concentration.

  - Maintenance Challenges
    > Increased difficulty in maintaining and scaling the codebase.

### 4.2. Automated Code Review

Utilize tools and scripts to automatically review code for style, formatting, and basic quality checks before integration.

- Pros:

  - Efficiency
    > Quickly identifies common issues without human intervention.

  - Consistency
    > Enforces coding standards uniformly across the codebase.

  - Continuous Integration
    > Integrates seamlessly with CI/CD pipelines for real-time feedback.

- Cons:

  - Limited Scope
    > Cannot assess complex logic, architectural decisions, or nuanced design patterns.

  - False Positives/Negatives
    > May flag non-issues or miss critical problems requiring human judgment.

  - Dependency on Tools
    > Reliance on the effectiveness and maintenance of automated tools.

### 4.3. Asynchronous Code Review

Implement a formal code review process where peers review each other’s code, providing feedback on functionality, design, and adherence to standards.

- Pros:

  - Enhanced Quality
    > Thorough evaluation of code logic, architecture, and design patterns.

  - Knowledge Sharing
    > Promotes team collaboration and collective code ownership.

  - Mentorship Opportunities
    > Facilitates learning and professional growth among team members.

  - Merge Requests/Pull Requests
    > Provides a structured workflow for integrating code changes, ensuring traceability and facilitating review and approval processes.

  - Peer Review
    > Encourages accountability and fosters a culture of continuous improvement through direct feedback from peers.

- Cons:

  - Time-Consuming
    > Can slow down the development process due to the need for reviewer availability.

  - Potential for Conflicts
    > Differences in opinions may lead to interpersonal tensions if not managed properly.

  - Scalability Issues
    > May become challenging to manage as the team or codebase grows.

### 4.4. Synchronous Code Review

Conduct regular meetings where team members present and discuss their code changes in a collaborative setting, allowing for collective feedback and discussion.

- Pros:

  - Collaborative Feedback
    > Encourages open discussion and collective problem-solving.

  - Real-Time Communication
    > Immediate clarification of issues and suggestions.

  - Knowledge Sharing
    > Enhances team understanding of different parts of the codebase.

  - Flexibility
    > Adaptable to various types of projects and team sizes.

- Cons:

  - Scheduling Overhead
    > Requires coordination of meeting times, which can be time-consuming.

  - Potential for Dominance
    > Some voices may overshadow others, leading to uneven participation.

  - Scalability Issues
    > As the team or codebase grows, meetings may become longer and less effective.

  - Disruption to Workflow
    > Interruptions for meetings can affect developer focus and productivity.

## 5. Consequences

- Positive

  - Improved Code Quality
    > The hybrid approach enforces consistent quality standards through automation while human reviews catch complex logic errors, architecture issues, and security concerns.

  - Knowledge Sharing
    > Structured asynchronous peer reviews promote collective code ownership and mentorship across team members.

  - Automation Efficiency
    > Automated checks reduce repetitive review burden, freeing reviewers to focus on higher-order concerns.

- Negative

  - Review Overhead
    > Maintaining a hybrid process requires coordination between automated pipelines, asynchronous reviewers, and optional synchronous meetings, increasing process complexity.

  - Scheduling Challenges
    > Synchronous Code Review meetings require availability coordination, which can slow development velocity for time-sensitive changes.

- Risks

  - Tool Dependency
    > Reliance on automated review tools introduces risk of false positives or missed issues. Mitigation: Regularly evaluate and calibrate automated tools to minimize noise and ensure coverage.

  - Review Fatigue
    > High review volume may lead to reduced thoroughness over time. Mitigation: Define review scope clearly, limit required reviewers per change, and reserve synchronous reviews for complex areas only.

## 6. Implementation

1. Code Review Process

    - Code Development
      - Developers write code adhering to the established coding standards and guidelines.

    - Automated Code Review
      - Upon committing code to a feature branch, automated code review tools (e.g. ESLint, SonarQube) will automatically analyze the code for style, formatting, and basic quality issues.
      - The CI/CD pipeline will enforce that all automated checks pass before allowing the code to proceed to the next stage.

    - Merge Requests/Pull Requests
      - Developers create Merge Requests (MRs) or Pull Requests (PRs) to propose their code changes for integration into the main branch.
      - Each MR/PR must include a descriptive title, summary of changes, and any relevant documentation or links to related issues.

    - Asynchronous Code Review
      - Assigned reviewers will manually inspect the code for functionality, design, performance, security, and adherence to architectural principles.
      - Reviews should be completed within a defined timeframe (e.g. 48 hours) to prevent bottlenecks.

    - Synchronous Code Review (Optional)
      - For changes involving Business Logic or Domain Logic, a Peer Review Meeting will be scheduled.
      - During the meeting, authors present their changes, and the team collaboratively discusses and evaluates the implementation.

    - Feedback and Revisions
      - Authors address any feedback or requested changes from reviewers.
      - Iterative review cycles continue until the code meets all quality and functionality standards.

    - Approval and Merge
      - Once approved, the code is merged into the main branch.
      - Post-merge automated tests ensure that the integration does not introduce regressions.

2. Review Checklist

    A standardized checklist will be used during Asynchronous Code Reviews to ensure consistency and thoroughness.

    - Code Quality
      - Adherence to coding standards and style guidelines.
      - Clear and descriptive naming conventions.
      - Proper documentation and comments where necessary.

    - Functionality
      - Correct implementation of the required features or fixes.
      - No unintended side effects or regressions.

    - Design and Architecture
      - Alignment with the overall system architecture and design principles.
      - Proper use of design patterns and best practices.
      - Scalability and maintainability considerations.

    - Performance
      - Efficient algorithms and data structures.
      - Optimization for performance-critical sections.

    - Security
      - Proper handling of sensitive data.
      - Protection against common vulnerabilities (e.g. SQL injection, XSS).

    - Testing
      - Adequate unit and integration tests.
      - Coverage of edge cases and error conditions.

    - Documentation
      - Updated documentation reflecting the changes.
      - Clear instructions for any new setup or configuration.

3. Reviewer Responsibilities

    Reviewers play a pivotal role in maintaining code quality and fostering team collaboration.

    - Thorough Inspection
      - Carefully examine the code changes against the review checklist.
      - Ensure that the code meets all functional and non-functional requirements.

    - Constructive Feedback
      - Provide clear, actionable, and respectful feedback.
      - Highlight both strengths and areas for improvement.

    - Knowledge Sharing
      - Share insights and best practices to promote collective code ownership.
      - Mentor less experienced team members through guidance and suggestions.

    - Timely Reviews
      - Complete reviews within the defined timeframe to maintain development momentum.
      - Communicate promptly if additional time is needed.

    - Conflict Resolution
      - Handle disagreements professionally, focusing on objective criteria.
      - Collaborate with authors to reach consensus on necessary changes.

4. Author Responsibilities

    Authors are responsible for preparing their code for review and addressing feedback effectively.

    - Preparation
      - Write clean, well-documented code adhering to established standards.
      - Include comprehensive commit messages and documentation in MRs/PRs.

    - Automated Checks
      - Ensure that all automated code review checks pass before submitting for manual review.
      - Address any issues flagged by automated tools promptly.

    - Engagement
      - Actively participate in the review process by responding to feedback and making necessary revisions.
      - Clarify any misunderstandings or questions raised by reviewers.

    - Responsiveness
      - Address review comments in a timely manner to avoid delays.
      - Communicate progress and any challenges encountered during revisions.

    - Continuous Improvement
      - Incorporate feedback to enhance code quality and personal development.
      - Stay updated with best practices and evolving coding standards.

## 7. References

- Sentenz [Code Review](../guides/code-review-guide.md) guide.
