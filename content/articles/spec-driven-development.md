# Spec-Driven Development

Spec-Driven Development (SDD) is a software development approach that defines specifications before implementation. The specification becomes the reference for what the software should do, how it should be verified, and which outcomes are considered complete.

SDD treats specifications as living artifacts that guide design, implementation, and testing. It complements practices such as [software testing](../articles/software-testing.md), especially Test-Driven Development (TDD), Behavior-Driven Development (BDD), and Acceptance Test-Driven Development (ATDD).

- [1. Category](#1-category)
  - [1.1. Specification Types](#11-specification-types)
    - [1.1.1. Behavioral Specification](#111-behavioral-specification)
    - [1.1.2. Contract Specification](#112-contract-specification)
    - [1.1.3. Acceptance Specification](#113-acceptance-specification)
  - [1.2. Workflow](#12-workflow)
    - [1.2.1. Specification Discovery](#121-specification-discovery)
    - [1.2.2. Executable Specification](#122-executable-specification)
    - [1.2.3. Implementation Feedback Loop](#123-implementation-feedback-loop)
- [2. Principles](#2-principles)
- [3. Best Practice](#3-best-practice)
- [4. Terminology](#4-terminology)
- [5. References](#5-references)

## 1. Category

### 1.1. Specification Types

#### 1.1.1. Behavioral Specification

Behavioral specifications describe how a system should respond to user actions, events, or external stimuli. They focus on observable outcomes and are often expressed with scenarios, examples, or acceptance criteria that can be reviewed by both technical and non-technical stakeholders.

#### 1.1.2. Contract Specification

Contract specifications define the expected structure and semantics of interfaces, such as APIs, events, files, or messages. They describe valid inputs, outputs, error conditions, and compatibility expectations so that producers and consumers can evolve independently with shared guarantees.

#### 1.1.3. Acceptance Specification

Acceptance specifications define the conditions that must be satisfied for a feature to be considered complete. They capture business rules, edge cases, and quality constraints, and they are frequently used as the basis for automated acceptance tests.

### 1.2. Workflow

#### 1.2.1. Specification Discovery

Specification discovery is the collaborative activity of refining requirements into concrete rules and examples before implementation starts. The goal is to remove ambiguity early and create a shared understanding of the desired behavior, constraints, and success criteria.

#### 1.2.2. Executable Specification

Executable specifications are written in a format that can be checked automatically, such as Gherkin scenarios, contract tests, schema validation, or API specifications. This makes the specification an active part of the delivery pipeline instead of passive documentation.

Example:

```gherkin
Feature: Password reset

  Scenario: Registered user requests a reset link
    Given a registered user exists
    When the user requests a password reset
    Then the system sends a reset link to the user's email address
```

#### 1.2.3. Implementation Feedback Loop

In SDD, implementation follows the specification and produces fast feedback whenever behavior diverges from the defined rules. If the expected behavior changes, the specification should be updated first, and the implementation should then be adapted to satisfy the revised specification.

## 2. Principles

1. Specification Before Implementation

    Teams define the intended behavior, rules, and interfaces before writing production code. This reduces rework and creates a clear target for development.

2. Shared Understanding

    Specifications should be understandable by developers, testers, and product stakeholders. A shared specification reduces interpretation gaps and improves collaboration.

3. Single Source of Truth

    The specification should be the authoritative reference for the expected behavior of a feature or system. Requirements, validation, and implementation discussions should trace back to the same artifact.

4. Executable Verification

    Whenever possible, the specification should be expressed in a form that can be validated automatically. This turns requirements into continuous feedback instead of a one-time review exercise.

5. Traceability

    Code changes, automated tests, and acceptance criteria should map back to specific specification items. Traceability makes change impact easier to understand and helps prevent coverage gaps.

6. Living Documentation

    Specifications should evolve with the software instead of becoming outdated after delivery. Keeping the specification current preserves it as a useful design and maintenance artifact.

## 3. Best Practice

1. Start with examples

    Capture concrete examples, rules, and counterexamples before discussing implementation details. Examples make ambiguity visible and help clarify expected behavior.

2. Define boundaries and invariants

    Specify inputs, outputs, error handling, and non-negotiable business rules. Clear boundaries reduce hidden assumptions and make specifications easier to verify.

3. Prefer executable formats for critical behavior

    Use formats such as Gherkin, OpenAPI, JSON Schema, or contract tests when the specification should drive automation. Executable specifications strengthen confidence in delivery and regression protection.

4. Keep internal design out of the specification

    Focus the specification on externally visible behavior and stable contracts. Over-specifying implementation details makes change harder and couples the specification to incidental design choices.

5. Review specification changes like code changes

    Changes to specifications can change the system's meaning, scope, or compatibility. Review them with the same rigor as production code and tests.

6. Version specifications with the codebase

    Store specifications next to the code, tests, and supporting documentation. Versioning them together improves traceability and ensures that behavior changes are visible in history.

7. Use SDD together with TDD and BDD

    SDD defines the feature-level or system-level intent, while TDD and BDD can drive implementation and executable examples at finer levels of detail. These approaches reinforce each other when applied consistently.

## 4. Terminology

- Specification
  > A structured description of expected behavior, rules, interfaces, or constraints for a software system.

- Executable Specification
  > A specification expressed in a form that can be automatically validated by tests, schema checks, or other tooling.

- Acceptance Criteria
  > Conditions that determine whether a feature satisfies its intended business outcome and is ready to be accepted.

- Contract Test
  > An automated check that verifies whether an implementation conforms to an agreed interface or message contract.

- Example Mapping
  > A collaborative technique for turning requirements into rules, questions, and examples before implementation.

- Living Documentation
  > Documentation that is kept current through regular updates and automated verification as the system evolves.

## 5. References

- Sentenz [software testing](../articles/software-testing.md) article.
- Martin Fowler [Specification by Example](https://martinfowler.com/bliki/SpecificationByExample.html) article.
- Cucumber [Behavior-Driven Development](https://cucumber.io/docs/bdd/) guide.
- OpenAPI Initiative [OpenAPI Specification](https://spec.openapis.org/oas/latest.html) documentation.
- Gojko Adzic [Specification by Example](https://specificationbyexample.com/) resource.
