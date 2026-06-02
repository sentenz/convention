---
name: adr
description: Creates and maintains Architecture Decision Records (ADRs) following a structured format with State, Context, Decision, Considered, Consequences, Implementation, and References sections. Supports single-option decisions, multi-option decisions within one decision scope, multiple complementary decisions, and deferred decisions. Use when creating, updating, or reviewing architectural decisions, or when the user mentions ADR, architecture decisions, technical decisions, or design records.
metadata:
  version: "1.0.5"
  activation:
    implicit: true
    priority: 1
    triggers:
      - "adr"
      - "architecture decision"
      - "architectural decision"
      - "decision record"
      - "technical decision"
      - "design decision"
      - "create adr"
      - "write adr"
      - "add adr"
    match:
      languages: ["markdown"]
      paths:
        - "docs/decisions/**/*.md"
        - "**/decisions/**/*.md"
        - "**/adr/**/*.md"
      prompt_regex: "(?i)(\\badr\\b|architecture decision|architectural decision|decision record|technical decision|design decision)"
  usage:
    load_on_prompt: true
    autodispatch: true
---

# Architecture Decision Records (ADR)

Instructions for AI agents on creating and maintaining Architecture Decision Records (ADRs) to document significant architectural and technical decisions within a project.

- [1. Benefits](#1-benefits)
- [2. Principles](#2-principles)
  - [2.1. Characteristics](#21-characteristics)
  - [2.2. Status Lifecycle](#22-status-lifecycle)
- [3. Structure](#3-structure)
  - [3.1. State](#31-state)
  - [3.2. Context](#32-context)
  - [3.3. Decision](#33-decision)
  - [3.4. Considered](#34-considered)
  - [3.5. Consequences](#35-consequences)
  - [3.6. Implementation](#36-implementation)
  - [3.7. References](#37-references)
- [4. Workflow](#4-workflow)
- [5. Style Guide](#5-style-guide)
- [6. Template](#6-template)
  - [6.1. ADR File Template](#61-adr-file-template)
- [7. References](#7-references)

## 1. Benefits

- Traceability
  > ADRs provide a historical record of architectural decisions, enabling teams to understand why specific choices were made, reducing the risk of revisiting resolved problems.

- Knowledge Sharing
  > Documenting decisions and their rationale helps onboard new team members quickly and ensures shared understanding across the organization.

- Accountability
  > Clearly identifying authors, dates, and decision status creates ownership and transparency around architectural choices.

- Informed Alternatives Review
  > Recording considered alternatives with their pros and cons enables future reviewers to evaluate whether circumstances have changed enough to revisit a decision.

- Consequence Awareness
  > Explicitly documenting positive and negative consequences of a decision helps teams prepare mitigations and set realistic expectations.

## 2. Principles

### 2.1. Characteristics

ADRs should embody the following characteristics to maximize their value.

- Atomic
  > Each ADR addresses one clearly scoped decision concern. A single ADR may select one option or multiple complementary options from Considered, but it must not bundle unrelated decision concerns in one record.

- Immutable
  > Once an ADR reaches `Accepted` status, its content should not be altered retroactively. Changes in direction require a new ADR that supersedes the old one.

- Concise
  > ADRs should be as brief as the decision complexity allows. Use bullet points, tables, and structured sections rather than long prose.

- Linked
  > Cross-reference related ADRs, issues, pull requests, and external resources to build a navigable decision graph.

### 2.2. Status Lifecycle

Each ADR moves through a defined set of statuses.

- Proposed
  > The decision is under active discussion and has not yet been formally accepted.

- Accepted
  > The decision has been reviewed and approved. Implementation may proceed.

- Rejected
  > The proposal was reviewed but not accepted. The rationale for rejection must be documented in the Context or Consequences section.

- Deprecated
  > The decision was once valid but is no longer applicable. A newer decision should be referenced.

- Superseded
  > The decision has been replaced by a newer ADR. The superseding ADR number and link must be provided.

## 3. Structure

### 3.1. State

The State section captures administrative metadata for the ADR.

- Author(s)
  > Initials or usernames of the individuals who authored the ADR.

- Date
  > The date the ADR was created or last meaningfully updated (ISO 8601 format: `YYYY-MM-DD`).

- Status
  > The current lifecycle status of the ADR (see [Status Lifecycle](#22-status-lifecycle)).

### 3.2. Context

The Context section describes the circumstances that necessitated the decision.

- Background
  > Explain the problem, requirement, or situation that needs to be addressed. Provide enough background for a reader unfamiliar with the project to understand why a decision was needed.

- Decision Drivers
  > List the key criteria, constraints, and quality attributes that will guide the decision (e.g., performance, ease of use, maintainability, cost, compliance).

### 3.3. Decision

The Decision section records the decision outcome from the Considered options. The decision may take one of three forms:

- Single Selection
  > One option from Considered is selected as the solution to the problem described in Context.
- Multiple Selection
  > Multiple options from Considered are selected and may be complementary or interdependent, collectively forming the decision.
- Deferred
  > No options from Considered are selected at this time. The decision is deferred until more information is available or conditions change.

For each selected option, create a subsection with the option name and explain the rationale for its selection, referencing the decision drivers from Context. For deferred decisions, document the reason for deferral and the next steps to resolve it.

### 3.4. Considered

The Considered section enumerates all options evaluated during the decision process. Each option may be selected (wholly or partially), combined with others, or rejected in the Decision section.

- Option Description
  > Briefly describe each option, including a link to its official documentation or repository.

- Pros
  > List the strengths of the option relative to the decision drivers.

- Cons
  > List the weaknesses, limitations, or risks of the option.

### 3.5. Consequences

The Consequences section captures the impact of the decision once implemented.

- Positive Consequences
  > Describe the expected benefits and improvements resulting from the decision.

- Negative Consequences
  > Describe known trade-offs, technical debt, or limitations introduced by the decision.

- Risks
  > Identify any residual risks or uncertainties that remain after the decision and outline planned mitigations.

### 3.6. Implementation

The Implementation section provides actionable guidance for applying the decision.

- Steps
  > Enumerate the concrete steps required to implement the decision.

- Affected Areas
  > Identify the repositories, modules, or systems impacted by the decision.

- Validation
  > Describe how conformance with the decision will be verified (e.g., linting rules, CI checks, code review criteria).

### 3.7. References

The References section lists all external and internal resources cited in the ADR.

- Links
  > Include links to official documentation, related ADRs, relevant issues, pull requests, and standards.

## 4. Workflow

1. Identify

    Identify a significant architectural or technical decision that needs to be made or documented (e.g., choice of framework, library, pattern, toolchain, or process).

2. Issue/Merge Request Creation

    Create an issue or merge request in the relevant repository to propose the ADR. Use a descriptive title that follows the canonical ADR title schema (see Style Guide).

3. Number and Name

    Assign the next sequential three-digit number and create a descriptive kebab-case file name derived from the canonical ADR title context following the convention:

    ```plaintext
    NNN-adr-<topic>[-<scope>].md
    ```

    Examples:

    - Title with scope
      > An `ADR on Dependency Manager for C/C++` would have the file name `015-adr-dependency-manager-c-cpp.md`.
    - Title without scope
      > An `ADR on Git Hooks Manager` would have the file name `016-adr-git-hooks-manager.md`.

4. Place

    Create the ADR file in the designated decisions directory:

    ```plaintext
    docs/decisions/NNN-adr-<topic>[-<scope>].md
    ```

5. Draft

    Fill in all sections using the [ADR File Template](#61-adr-file-template). Set the status to `Proposed`.

6. Review

    Submit the ADR for peer review via a pull request. Address feedback and update the content as needed.

7. Accept or Reject

    Update the status to `Accepted` or `Rejected` once a decision is reached. Document the rationale for rejection if applicable.

8. Supersede

    When a decision changes, create a new ADR and set its status to `Accepted`. Update the old ADR's status to `Superseded` and add a link to the new ADR.

## 5. Style Guide

- Issue/Merge Request (MR) Title Refinement
  > When drafting or reviewing an issue or merge request that introduces or updates an ADR, refine the issue/MR title to match the canonical ADR title schema `ADR on <Topic> [for <Scope>]`. Prefer consistency between issue title, merge request title, and ADR H1 title.

  - `<Topic>`
    > Should be a concise, specific technical concern, tool, or practice.
  - `<Scope>`
    > Optional. Include `for <Scope>` only when it meaningfully narrows the decision applicability.

- File Naming
  > Use the pattern `NNN-adr-<topic>[-<scope>].md` with lowercase kebab-case for the title segment. The prefix `NNN` is a zero-padded three-digit sequence number (e.g., `001`, `012`). The `-<scope>` segment is optional and must be omitted when scope is not present (do not leave a trailing dash). Derive the slug from the canonical ADR title.

- Heading Levels
  > Use H1 (`#`) for the ADR title, H2 (`##`) for top-level sections (State, Context, Decision, Considered, etc.), and H3 (`###`) for subsections (individual options or decisions under Decision or options under Considered). Support multiple decisions by using multiple H3 subsections under Decision (e.g., 3.1, 3.2, 3.3) when applicable.

- Decision Drivers
  > Group decision drivers under a single numbered list item (`1. Decision Drivers`). List each driver as a bullet (`-`) with a blockquote (`>`) providing a one-sentence description.

- Alternatives
  > Each considered option should be an H3 subsection using the option's proper name. Use `- Pros` / `- Cons` with nested blockquote descriptions for each point. Not all considered options must be selected in the Decision section; some may be documented here as rejected or deferred.

- Status Field
  > Always include exactly one of the defined statuses: `Proposed`, `Accepted`, `Rejected`, `Deprecated`, or `Superseded`.

- Superseded Link
  > When status is `Superseded`, append a link to the superseding ADR in the State section:

  ```markdown
  - Superseded by: [NNN-adr-new-title](NNN-adr-new-title.md)
  ```

- Language
  > Write in clear, formal English. Use present tense for the Decision section and past tense only when describing historical context.

- TOC
  > Include a Markdown table of contents with anchor links at the top of each ADR.

## 6. Template

Use this template for new ADRs. Replace all `<placeholder>` values with actual content.

### 6.1. ADR File Template

```markdown
# NNN-ADR: <Topic> [for <Scope>]

Architectural Decision Records (ADR) on <brief one-sentence description of the decision topic>.

- [1. State](#1-state)
- [2. Context](#2-context)
- [3. Decision](#3-decision)
  - [3.1. <Option or Decision Name 1>](#31-<option-or-decision-anchor>)
  - [3.2. <Option or Decision Name 2>](#32-<option-or-decision-anchor>)
- [4. Considered](#4-considered)
  - [4.1. <Option 1 Name>](#41-<option-1-anchor>)
  - [4.2. <Option 2 Name>](#42-<option-2-anchor>)
- [5. Consequences](#5-consequences)
- [6. Implementation](#6-implementation)
- [7. References](#7-references)

## 1. State

- Author(s): <initials or username>
- Date: <YYYY-MM-DD>
- Status: Proposed

## 2. Context

<Describe the problem, requirement, or situation that motivated this decision. Provide enough background for someone unfamiliar with the project to understand why a decision was needed.>

1. Decision Drivers

    - <Driver 1>
      > <One-sentence description of the criterion.>

    - <Driver 2>
      > <One-sentence description of the criterion.>

    - <Driver 3>
      > <One-sentence description of the criterion.>

## 3. Decision

### 3.1. <Option Name 1>

<Brief explanation of why this option was selected or how it contributes to the overall decision. Reference the decision drivers.>

1. Rationale

    - <Driver 1>
      > <How this option satisfies this driver.>

    - <Driver 2>
      > <How this option satisfies this driver.>

### 3.2. <Option Name 2>

<If multiple options are selected, include additional subsections for each chosen option. If no options are selected, document the deferral reason and next steps.>

1. Rationale

    - <Driver 1>
      > <How this option satisfies this driver.>

    - <Driver 2>
      > <How this option satisfies this driver.>

## 4. Considered

### 4.1. <Option 1 Name>

[<Option 1 Name>](<link-to-official-docs-or-repo>) <brief one-sentence description>.

- Pros

  - <Strength 1>
    > <Description.>

  - <Strength 2>
    > <Description.>

- Cons

  - <Weakness 1>
    > <Description.>

  - <Weakness 2>
    > <Description.>

### 4.2. <Option 2 Name>

[<Option 2 Name>](<link-to-official-docs-or-repo>) <brief one-sentence description>.

- Pros

  - <Strength 1>
    > <Description.>

- Cons

  - <Weakness 1>
    > <Description.>

## 5. Consequences

- Positive

  - <Positive 1>
    > <Expected benefits and improvements.>

  - <Positive 2>
    > <Expected benefits and improvements.>

- Negative

  - <Negative 1>
    > <Known trade-offs, technical debt, or limitations introduced.>

  - <Negative 2>
    > <Known trade-offs, technical debt, or limitations introduced.>

- Risks

  - <Risk 1>
    > <Residual risks and planned mitigations.>

  - <Risk 2>
    > <Residual risks and planned mitigations.>

## 6. Implementation

1. <Step 1>

    <Describe the first implementation action.>

2. <Step 2>

    <Describe the next implementation action.>

3. <Step 3>

    <Describe validation or verification.>

## 7. References

- <Reference 1> [title](<url>) page/repo/article.
- <Reference 2> [title](<url>) page/repo/article.
```

## 7. References

- Architecture Decision Records [overview](https://adr.github.io/) page.
- Michael Nygard's original [ADR proposal](https://cognitect.com/blog/2011/11/15/documenting-architecture-decisions) article.
- MADR (Markdown Architectural Decision Records) [specification](https://adr.github.io/madr/) page.
- ADR GitHub [organization](https://github.com/adr) page.
