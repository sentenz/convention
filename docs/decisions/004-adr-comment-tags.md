# 004-ADR: Comment Tags

Architectural Decision Records (ADR) on implementing Comment Tags for Software Projects.

- [1. State](#1-state)
- [2. Context](#2-context)
- [3. Decision](#3-decision)
  - [3.1. `TODO`](#31-todo)
  - [3.2. `FIXME`](#32-fixme)
  - [3.3. `NOTE`](#33-note)
  - [3.4. `DEPRECATED`](#34-deprecated)
  - [3.5. `XXX`](#35-xxx)
- [4. Considered](#4-considered)
  - [4.1. `TODO`](#41-todo)
  - [4.2. `FIXME`](#42-fixme)
  - [4.3. `NOTE`](#43-note)
  - [4.4. `DEPRECATED`](#44-deprecated)
  - [4.5. `XXX`](#45-xxx)
  - [4.6. `HACK`](#46-hack)
  - [4.7. `BUG`](#47-bug)
  - [4.8. `OPTIMIZE`](#48-optimize)
  - [4.9. `NIT`](#49-nit)
- [5. Consequences](#5-consequences)
- [6. Implementation](#6-implementation)
- [7. References](#7-references)

## 1. State

- Author(s): Sentenz
- Date: 2024-07-03
- Status: Proposed

## 2. Context

In a scale software project, maintaining a consistent and clear codebase is critical. Comment tags such as `TODO`, `FIXME`, and `NOTE` are commonly used to highlight various types of issues, improvements, or important notes in the code. However, the inconsistent use of these tags can lead to confusion and reduce the overall effectiveness of the comments. Standardizing the use of these tags will help improve code readability, facilitate better collaboration among developers, and streamline the process of addressing technical debt and bugs.

## 3. Decision

We will standardize the use of the following comment tags across the entire codebase.

### 3.1. `TODO`

`TODO` tag should be used for tasks that need to be completed but are not immediately critical. It can include enhancements, feature implementations, or code refactoring.

```python
# TODO Implement the user authentication mechanism
```

### 3.2. `FIXME`

`FIXME` tag is used to point out code that is currently broken, buggy, or incorrect.

```python
# FIXME This function returns incorrect values for negative inputs. See issue sentenz/convention#123.
```

### 3.3. `NOTE`

The `NOTE` tag is used to provide supplementary information about the code, which might not be immediately obvious to the reader. This can include explanations of complex logic, rationale for certain decisions, or any other information that could be helpful for understanding the code.

```python
# NOTE This algorithm assumes input is always sorted
```

### 3.4. `DEPRECATED`

`DEPRECATED` tag is used to mark code that is obsolete and should be avoided in new developments. It should include a description of why the code is deprecated and, if applicable, suggest alternative solutions or point to updated code.

```python
# DEPRECATED Use the new `calculate_metrics` function instead of this method
```

### 3.5. `XXX`

`XXX` tag should be used to draw attention to code that is potentially problematic or risky and needs further review or scrutiny. It can be used to highlight code that may not adhere to best practices, is fragile, or is a temporary solution that requires a more permanent fix.

```python
# XXX This is a quick fix for the deadline. Needs proper error handling
```

## 4. Considered

### 4.1. `TODO`

Indicate tasks that need to be done in the future.

- Pros

  - Task Management
    > Clearly identifies tasks that need to be done, aiding in task management.

- Cons

  - Maintenance
    > Can become outdated if not regularly maintained.

  - Task Tracking
    > May lead to an accumulation of unfinished tasks if not properly tracked.

### 4.2. `FIXME`

Highlight code that is broken or incorrect and needs to be fixed.

- Pros

  - Code Quality
    > Clearly marks broken or incorrect code, making it easier to prioritize fixes.

- Cons

  - Redundancy
    > Overlaps with `BUG`, leading to potential redundancy.

  - Fix Management
    > Can lead to neglected fixes if not properly managed.

### 4.3. `NOTE`

Provide additional information or context about the code.

- Pros

  - Readability
    > Provides additional context, improving code readability and understanding.

- Cons

  - Overuse
    > Can be overused for trivial information, cluttering the codebase.

  - Maintenance
    > May become outdated or irrelevant over time.

### 4.4. `DEPRECATED`

Mark code that is outdated and should not be used in new developments.

- Pros

  - Code Guidance
    > Clearly marks outdated code, guiding developers to use current solutions.

- Cons

  - Maintenance
    > Requires regular updates to reflect current best practices.

  - Code Removal
    > Can lead to confusion if deprecated code is not removed promptly.

### 4.5. `XXX`

Draw attention to potentially problematic or risky code that needs further review.

- Pros

  - Risk Identification
    > Highlights potentially risky or problematic code, ensuring careful review.

  - Linter Bypass
    > Useful for marking places where linters are disabled, indicating potential issues.

- Cons

  - Redundancy
    > Can overlap with `HACK` and `FIXME`, leading to redundancy.

  - Prioritization
    > May not be prioritized, leading to unresolved risky code.

### 4.6. `HACK`

Indicates a temporary workaround or a quick fix that is not an ideal solution.

- Pros

  - Code Quality
    > Clearly marks code that is not ideal and needs to be revisited.

- Cons

  - Redundancy
    > Often overlaps with `FIXME` and `XXX`, leading to potential redundancy.

  - Code Practices
    > May encourage the use of poor coding practices if not addressed promptly.

### 4.7. `BUG`

Specifically marks known bugs in the code.

- Pros

  - Bug Tracking
    > Clearly identifies known bugs, making it easier to track and prioritize fixes.

- Cons

  - Redundancy
    > Overlaps with `FIXME`, which already serves a similar purpose.

  - Codebase Clutter
    > Can clutter the codebase if overused or not properly managed.

### 4.8. `OPTIMIZE`

Highlights code that needs performance improvements.

- Pros

  - Performance Focus
    > Focuses on performance-related issues, which can be crucial for high-performance applications.

- Cons

  - Redundancy
    > Can be too specific and overlaps with `TODO` for performance-related tasks.

  - Consistency
    > May not be used consistently if not enforced strictly.

### 4.9. `NIT`

Marks minor issues or nitpicks that do not affect functionality but could improve clarity.

- Pros

  - Code Quality
    > Helps identify minor improvements that can enhance code quality and readability.

- Cons

  - Codebase Clutter
    > Can lead to excessive comments for trivial matters, cluttering the codebase.

  - Prioritization
    > May not be prioritized, leading to accumulation of minor issues.

## 5. Consequences

- Positive

  - Readability
    > Improved code readability and maintainability through consistent and descriptive comment tags.

  - Technical Debt
    > Better tracking and management of technical debt and bugs with standardized markers.

  - Collaboration
    > Enhanced collaboration among developers through clear and consistent comment conventions.

  - Risk Identification
    > Easier identification of potentially risky or problematic code areas that require further attention.

- Negative

  - Migration Effort
    > Requires initial effort to standardize existing comments in the codebase.

  - Onboarding
    > Developers need to be trained or made aware of the new comment tag standards.

## 6. Implementation

1. Documentation

    - Update the project's contribution guidelines to include the new standardized comment tags.

2. Code Review

    - Ensure all new code follows the standardized comment tags through the code review process.

3. Refactoring

    - Gradually refactor existing comments in the codebase to comply with the new standards.

4. Training

    - Conduct a workshop or provide resources to educate developers on the new comment tag standards.

## 7. References

- Sentenz [Comment](../articles/comment.md) article.
