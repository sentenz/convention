# Technical Debt

Technical debt (also known as `tech debt` or `code debt`code debt) often refers to a rushed development process or a lack of shared knowledge among team members. However, in many cases technical debt is inevitable and is part of any software development process.

- [1. Impact of Technical Debt](#1-impact-of-technical-debt)
- [2. Types of Technical Debt](#2-types-of-technical-debt)
  - [2.1. Code Debt](#21-code-debt)
  - [2.2. Test Debt](#22-test-debt)
  - [2.3. Design Debt](#23-design-debt)
  - [2.4. Knowledge Debt](#24-knowledge-debt)
- [3. Metrics of Technical Debt](#3-metrics-of-technical-debt)
- [4. See also](#4-see-also)

## 1. Impact of Technical Debt

Technical Debt and Its Impact on Team Morale, Velocity, and Customer Experience.

- Technical debt is destroying developer morale
  > Employee morale is one of the most difficult things to manage, especially now that companies are switching to long-term remote work solutions. The survey reveals that technical debt is actually a major driver of decreasing morale. Developers often feel like they are forced to prioritise new features over vital maintenance work that could improve their experience and velocity and this is taking a significant toll.

- Engineers believe the team would ship up to 100% faster if they had a process for technical debt
  > More than half of respondents claim that their companies do not deal with technical debt well, highlighting that the divide between engineers and leadership is widening rather than closing. Engineers are clearly convinced that technical debt is the primary reason for productivity losses, however, they seem to be struggling to make it a priority.

## 2. Types of Technical Debt

Tech debt are inevitable and appears in any software project at some point. Dealing with technical debt in an ongoing basis will help to avoid large pieces of debt.

### 2.1. Code Debt

Technical debt is any code that you've decided is a liability. Code debt can be solved by automated code quality:

- Linter
  > Linters are a type of static analysis tool used to flag programming errors, bugs, stylistic errors, and suspicious constructs which includes technical debt. Linter tools can be installed as an extension of the editor (VS Code), triggered as an action with Git hooks, and executed in the Continuous Integration (CI) pipeline. These tools, especially when paired with your deployment pipeline, help limit cruft by allowing you to enforce some coding standards across the whole engineering team. Among other things, maintaining these standards will help improve the readability of your code.

- Code and architecture refactoring

### 2.2. Test Debt

- Test coverage
  > [Software testing](../about/software-testing.md) is used to ensure that expected business systems and product features behave correctly as expected.

### 2.3. Design Debt

Design debt is closely linked to structuring features and adhering to design patterns or the architecture of your codebase.

Use features by [Githooks](../about/githooks.md) to trigger actions at certain points of the development to enforce conventions, guidelines, standards, and policies:

- pre-commit to enforce coding standards and codebase linting
- commit-msg to enforce commit messages by [Conventional Commits](../convention/conventional-commits.md)
- pre-push to enforce branches by [Branching Strategies](../about/branching-strategies.md)
- pre-rebase to enforce standards by [Merging Strategies](../about/merging-strategies.md)

### 2.4. Knowledge Debt

Actively share knowledge about features and important codebase changes.

- Create documentation, examples, tests
- Retrospective meetings
- Random [Pull Request (PR) reviews](../guideline/code-review-guide.md#reviewer)

## 3. Metrics of Technical Debt

Keeping dashboards with code health metrics. These can range from dashboards that show test coverage or the number and average age of `TODOs`, to more sophisticated dashboards including metrics like cyclomatic complexity or maintainability index.

- Bugs
  > Software developers should count and track their bugs. This includes both fixed and unfixed bugs. Noting the unfixed bugs allows development teams to focus on them and fix them during their agile iterations. Noting the fixed bugs helps teams measure how effective their tech debt management process is. Bugs on a weekly or monthly basis indicates a quality decline of the codebase.

- Code Quality
  > Code complexity can really damage the development team and the organization as a whole. Code complexity metrics are Cyclomatic complexity, maintainability index, Class coupling, Lines of code, Depth of Inheritance. The lower each of these measures, the better. These metrics also helps organisations know exactly which code to rework or refactor in order to reduce complexity and improve the backend side of the software.

- Code Cohesion
  > A high code cohesion usually means that the code is more maintainable, reusable, and robust. It also minimises the amount of people who need to get involved in the code, which can greatly reduce complexity and decrease the chances of bit rot. High cohesion is when you have a class that does a well defined job.

- Code Coverage
  > A declining percentage in code coverage percentage and code coverage per feature is a signal for a growing tech debt.

- CI/CD
  > An increasing number of failed CI/CD builds is a strong indicator for instability in the codebase. This can be related to design and code debt.

- Feature Throughput
  > Days it takes to push a new feature to the main branch. It’s a supporting metric that can indicate growing tech debt. Not each feature has the same size, but if you see a decline over multiple weeks, it’s time to intervene.

- Issues with [non-functional](../about/software-testing.md#non-functional-testing) requirements
  > Measuring metrics such as application performance, UX (increasingly difficult to use), or loss of compatibility are solid indicators for increased technical debt.

## 4. See also

- Google [technical debt](https://static.googleusercontent.com/media/sre.google/de//static/pdf/building_secure_and_reliable_systems.pdf#page=297&zoom=100,0,450) book.
- Stepsize [technical debt](https://www.stepsize.com/blog/complete-guide-to-technical-debt) article.
- Stepsize [tactics to prevent technical debt](https://www.stepsize.com/blog/3-best-tactics-to-prevent-technical-debt) article.
- Stepsize [tools to track technical debt](https://www.stepsize.com/blog/tools-to-track-and-manage-technical-debt) article.
- Stepsize [technical debt report 2021](https://www.stepsize.com/report) article.
- Martin Fowler [technical debt quadrant](https://martinfowler.com/bliki/TechnicalDebtQuadrant.html) article.
