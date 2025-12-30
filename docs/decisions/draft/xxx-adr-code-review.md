# XXX-ADR: Code Review

## Considered

1. No Code Review

    Developers directly push their code to the main branch without any formal review process. This approach eliminates any checkpoints or approvals before code is merged and deployed.

    - Pros

      - Speed
        > Changes can be merged and deployed much faster, reducing lead time.
      - Autonomy
        > Developers have more freedom and responsibility, fostering ownership.
      - No bottlenecks
        > No waiting for reviews, which may be useful in smaller or time-sensitive projects.

    - Cons

      - Lower Code Quality
        > Without review, there is a higher risk of bugs or non-standard code being introduced.
      - Lack of Knowledge Sharing
        > Team members don’t get the chance to learn from each other’s code or discuss improvements.
      - Technical Debt Risk
        > Without checks, bad practices or architectural issues may accumulate.
      - Security Risks
        > Vulnerabilities may slip through without an additional layer of oversight.

2. Automated Code Review

    Involves the use of tools that automatically scan code for issues, such as syntax errors, security vulnerabilities, and style violations. These tools are typically integrated into the CI/CD pipeline to run after every commit or merge request.

    - Pros

      - Consistency
        > Automated tools ensure consistent enforcement of coding standards and guidelines across the codebase.
      - Speed
        > Faster than manual reviews, making it easier to identify and correct basic issues in real-time.
      - Objective
        > Tools don't have biases and can perform code analysis based purely on rules.
      - Scalability
        > Can handle large projects with many commits more efficiently than human reviews.

    - Cons

      - Limited Scope
        > Automated tools can only detect syntactical or some security-related issues; they cannot assess design quality, intent, or business logic.
      - False Positives
        > Automated tools may flag false positives or less important issues, which may lead to frustration or wasted time.
      - Lack of Human Insight
        > Cannot provide the deeper feedback that comes from peer developers with domain expertise.
      - Maintenance
        > The tooling itself requires maintenance, configuration, and regular updates to remain effective.

3. Code Review

    Developers examining another's code before it is merged into the base branch. The reviewer(s) evaluate the code for correctness, adherence to best practices, and overall design quality. This process can be formal (with specific approval steps) or informal (such as peer reviews).

    - Pros

      - Improved Code Quality
        > Reviewers can spot design flaws, logic errors, or architectural issues that automated tools may miss.
      - Knowledge Sharing
        > Peers get to see each other's code, enhancing team learning and promoting best practices.
      - Collaboration
        > Code reviews foster discussions and help build a collaborative culture.
      - Security and Risk Mitigation
        > Peer review is more likely to catch potential security vulnerabilities.

    - Cons

      - Time Consuming
        > Peer reviews can slow down the development process, especially for large teams or urgent changes.
      - Human Bias
        > Reviewers may bring personal biases into the review process, sometimes leading to conflicts or inefficiencies.
      - Reviewer Fatigue
        > Consistently reviewing others’ code can lead to fatigue and reduced attention to detail over time.
      - Dependency on Expertise
        > The quality of the review can vary depending on the experience of the reviewer.