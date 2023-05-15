# Architecture Decision Records

[Architecture Decision Records (ADRs)](https://adr.github.io/) are a mechanism for documenting significant architectural decisions made during a software project. They are essentially a form of technical documentation that captures the reasoning behind the decision-making process and provides a historical record of how the project evolved over time.

The purpose of ADRs is to ensure that important architectural decisions are properly recorded and communicated to other members of the development team, as well as stakeholders and future maintainers of the software. By creating a repository of ADRs, teams can establish a shared understanding of the architecture and the rationale behind it, which can help to maintain consistency, coherence and facilitate collaboration.

ADRs are a valuable tool for managing the complexity of software development, providing a structure to document and communicate architectural decisions. ADRs establish a clear understanding of the architecture and ensure that important decisions are properly recorded and communicated, ultimately leading to more effective and efficient development processes.

- [1. Category](#1-category)
  - [1.1. Structure](#11-structure)
  - [1.2. Naming Convention](#12-naming-convention)
- [2. Principle](#2-principle)
- [3. Best Practice](#3-best-practice)
- [4. Terminology](#4-terminology)
- [5. References](#5-references)


## 1. Category

### 1.1. Structure

The structure of an ADR follows a standardized format to ensure that the key information is captured and communicated effectively.

While there may be variations in the format based on specific needs, the following are the typical sections included in an ADR:

- Title
  > A concise and descriptive title that summarizes the decision.

- Status
  > The current state of the decision, such as "proposed," "accepted," or "deprecated." The status can help stakeholders understand the current state of the decision and what actions, if any, are needed to move it forward.

- Context
  > A description of the relevant background and circumstances that led to the decision. The context should explain the problem or opportunity that the decision addresses and any relevant constraints, such as technical limitations, organizational policies, or stakeholder preferences.

- Decision
  > A clear statement of the decision that was made. The decision should describe the chosen solution or course of action and how it addresses the problem or opportunity described in the context.

- Rationale
  > A description of the reasoning behind the decision, including any trade-offs or alternatives that were considered. The rationale should explain why the chosen solution or course of action was selected over other options and how it aligns with the system's goals and requirements.

- Consequences
  > An analysis of the likely effects of the decision on the system and its stakeholders. The consequences should describe any benefits or drawbacks of the decision, how it affects the system's functionality, performance, or other qualities, and how it affects the system's users, operators, or other stakeholders.

- Alternatives
  > A list of alternative solutions that were considered but ultimately rejected. The alternatives should describe any other options that were evaluated and why they were not selected.

The Markdown template includes the key sections typically included in an ADR, and can be customized to meet the specific needs of a project or organization.

```markdown
# Architecture Decision Record (ADR) [Number]: [Title]

## Status
[Proposed | Accepted | Rejected | Deprecated | Superseded | ...]

## Context
[Provide context for the decision, including any relevant background information, system architecture, business requirements, etc.]

## Decision
[State the decision that was made, using clear and concise language.]

## Rationale
[Explain the reasons behind the decision, including the problem or opportunity that the decision addresses, the constraints that were considered, and the options that were evaluated.]

## Alternatives
[List the alternative options that were considered before the decision was made, and explain why they were rejected or chosen.]

## Consequences
[Describe the potential impact of the decision on the system and its stakeholders, including any technical, operational, or business-related consequences.]

## Implementation
[Explain how the decision will be implemented, including any technical details, changes to the system's architecture or code, organizational or process-related changes, etc.]

## Related ADRs
[List any related ADRs that are relevant to the decision being documented.]

## References
[List any sources that were consulted or referenced in making the decision.]
```

### 1.2. Naming Convention

A naming convention for ADRs helps to organize and find specific records in a repository Important aspect of naming convention for ADRs is consistency.

- Identifier Sequence

  The unique identifier is a sequential number, which ensures that each ADR has a unique filename. The title should be a brief and descriptive summary of the decision, with words separated by hyphens.

  ```txt
  [unique-identifier]-[title].md
  ```

  An ADR file for a decision to use a microservices architecture might be named:

  ```txt
  0001-use-microservices-architecture.md
  ```

  The numbering system allows for easy tracking and sorting of ADRs in chronological order.

- Date Format

  In this convention, the date is written in the ISO 8601 format of year-month-day, which ensures that the files are sorted in chronological order. The short description should be a brief and meaningful summary of the decision, with words separated by hyphens.

  ```txt
  [YYYYMMDD]-[title].md
  ```

  For example, an ADR file for a decision to use a RESTful API design might be named:

  ```txt
  20230423-use-restful-api-design.md
  ```

## 2. Principle

- Clarity
  > ADRs should be written in clear and concise language that is easy to understand. They should avoid technical jargon and be accessible to a wide range of stakeholders, including non-technical ones.

- Consistency
  > ADRs should follow a consistent format and structure to make it easy for stakeholders to find and understand the information they need. This can include a consistent set of elements, such as title, status, context, decision, rationale, consequences, and alternatives.

- Relevance
  > ADRs should focus on decisions that have a significant impact on the system's architecture. They should not document trivial decisions or those that do not have a lasting impact.

- Accessibility
  > ADRs should be easily accessible to stakeholders. They should be stored in a centralized repository, such as a version control system, and be easy to search and retrieve.

- Timeliness
  > ADRs should be created and updated in a timely manner. They should be created as soon as possible after a significant architectural decision is made, and should be updated as necessary to reflect changes in the system or new information.

- Contextualization
  > ADRs should provide context for the decision being made. They should describe the problem or opportunity that the decision addresses, the constraints that were considered, and the options that were evaluated.

- Collaboration
  > ADRs should be created collaboratively by the stakeholders who were involved in making the decision. This can include architects, developers, managers, and other stakeholders who have a stake in the system's architecture.

## 3. Best Practice

- Use a standardized format
  > ADRs should follow a consistent and standardized format to make it easy for stakeholders to find and understand the information they need. This can include a consistent set of elements, such as title, status, context, decision, rationale, consequences, and alternatives.

- Create ADRs as soon as possible
  > ADRs should be created as soon as possible after a significant architectural decision is made. This helps to ensure that the decision and its context are accurately documented and that stakeholders have a clear understanding of why the decision was made.

- Use a version control system
  > ADRs should be stored in a version control system, such as Git, to ensure that they can be easily tracked, versioned, and updated over time. This also helps to ensure that the ADRs are easily accessible and searchable.

- Keep ADRs concise and focused
  > ADRs should be concise and focused on the key decision being made. They should avoid technical jargon and be accessible to a wide range of stakeholders, including non-technical ones.

- Use a consistent and descriptive naming convention
  > ADRs should be named in a consistent and descriptive way to make it easy to identify and search for them. A good naming convention can include the decision number, a brief summary of the decision, and the date it was made.

- Link ADRs to other artifacts
  > ADRs should be linked to other artifacts, such as requirements, design documents, and code changes. This helps to ensure that stakeholders have a clear understanding of the impact of the decision on the system and its components.

- Review and update ADRs regularly
  > ADRs should be reviewed and updated regularly to ensure that they accurately reflect the current state of the system and its architecture. This can include updating the decision, rationale, and consequences sections as necessary.

## 4. Terminology

- Decision
  > ADRs document important architectural decisions made during the design and development of a software system. The decision section of an ADR describes the specific decision that was made.

- Rationale
  > The rationale section of an ADR describes the reasons behind the decision. It should include a clear explanation of the problem or opportunity that the decision addresses, the constraints that were considered, and the options that were evaluated.

- Alternatives
  > The alternatives section of an ADR describes the alternative options that were considered before the decision was made. This section should provide a clear explanation of why each alternative was considered and why it was ultimately rejected or chosen.

- Consequences
  > The consequences section of an ADR describes the impact of the decision on the system and its stakeholders. This can include technical, operational, and business-related consequences.

- Status
  > The status section of an ADR describes the current state of the decision. It can include information about whether the decision has been implemented, is in progress, or has been abandoned.

- Context
  > The context section of an ADR provides background information about the system, the problem or opportunity that the decision addresses, and the stakeholders involved in the decision-making process.

- Stakeholders
  > ADRs are created for a wide range of stakeholders, including architects, developers, managers, and other stakeholders who have a stake in the system's architecture. The stakeholders section of an ADR should describe the individuals or groups involved in the decision-making process.

- Implementation
  > The implementation section of an ADR describes how the decision will be implemented. This can include technical details, such as changes to the system's architecture or code, as well as organizational or process-related changes.

## 5. References

- Github [ADR](https://github.com/adr) project.
- Github [ADR](https://github.com/joelparkerhenderson/architecture_decision_record) repository.
- Google [ADR](https://cloud.google.com/architecture/architecture-decision-records?hl=en) article.
- Sentenz [ISO 8601](../convention/iso-8601.md) article.
