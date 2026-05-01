# 006-ADR: Language for Technical Documentation

Architecture Decision Record (ADR) describing the choice of language strategy for technical documentation.

- [1. State](#1-state)
- [2. Context](#2-context)
- [3. Decision](#3-decision)
  - [3.1. Single Language (English)](#31-single-language-english)
- [4. Considered](#4-considered)
  - [4.1. Single Language (English)](#41-single-language-english)
  - [4.2. Multi Language](#42-multi-language)
  - [4.3. AI Agents](#43-ai-agents)
- [5. Consequences](#5-consequences)
- [6. Implementation](#6-implementation)
- [7. References](#7-references)

## 1. State

- Author(s): Sentenz
- Date: 2025-10-14
- Status: Proposed

## 2. Context

Engineering, product, and compliance artifacts are produced by distributed teams and consumed by stakeholders across technical, legal, and operational domains. The choice of language strategy for authoring and publishing technical documentation is critical to ensuring clarity, maintainability, and accessibility.

1. Decision Drivers

    - Accuracy and Clarity
      > Technical documentation must be precise and unambiguous to avoid misinterpretation.

    - Maintainability
      > A single source of truth simplifies updates, version control, and reduces the risk of inconsistencies.

    - Accessibility
      > Documentation should be accessible to a global audience, balancing the need for localization with operational efficiency.

    - Speed of Iteration
      > Faster review and publication cycles are essential to keep documentation aligned with rapid software releases.

    - Cost Efficiency
      > Translation and localization efforts should be cost-effective, minimizing ongoing maintenance overhead.

    - AI Integration
      > Future-proofing documentation processes with AI tools for translation and quality assurance.

## 3. Decision

Adopt a **Single Language (English)** strategy for authoring and publishing technical documentation and requirements. The approach focuses on accuracy, maintainability, simpler CI automation, and speed of iteration while acknowledging the trade-offs in accessibility.

Where non-English access is required, translations will be provided selectively via controlled processes (human or AI-assisted with human review) prioritized by impact and compliance needs.

> [!NOTE]
> The decision will be revisited as AI-assisted translation technologies mature and become more reliable without compromising the integrity of the documentation. Enterprise-grade solutions and governance frameworks that support production use will be evaluated for accuracy, security, and operational fit before adoption.

### 3.1. Single Language (English)

1. Rationale

    - Accuracy and Clarity
      > English is the most widely used language in technical fields, reducing the risk of misinterpretation.

    - Maintainability
      > A single language source simplifies updates and reduces the risk of inconsistencies.

    - Accessibility
      > A single-language strategy limits access for non-English speaking audiences.

    - Speed of Iteration
      > Faster review and publication cycles are achievable without the overhead of translation.

    - Cost Efficiency
      > Eliminates ongoing translation costs and reduces maintenance overhead.

    - AI Integration
      > No approved, enterprise-grade AI assistant for translation, terminology control, and QA.

## 4. Considered

### 4.1. Single Language (English)

Author and publish exclusively in English.

- Pros

  - Simplified Maintenance
    > Simplifies maintenance and reduces risk of contradictory guidance.

  - Faster Review Cycles
    > Faster review cycles and lower cognitive load for maintainers.

  - Simplified CI Pipelines
    > Simplified documentation CI pipelines and automation.

  - Cost Elimination
    > Eliminates translation costs and delays.

  - Standards Alignment
    > Aligns with the majority of technical documentation standards.

- Cons

  - Limited Accessibility
    > Limits accessibility for non-English speaking audiences.

  - Market Perception
    > Potential perception of reduced local market investment.

  - Additional Support Channels
    > May require additional support channels for non-English speakers.

### 4.2. Multi Language

Author in English and translate to multiple languages.

- Pros

  - Global Accessibility
    > Increases accessibility for a global audience.

  - Translation Services
    > Leverages existing translation services and tools.

  - Global Reach
    > Supports diverse user base and enhances global reach.

  - Locale Alignment
    > Aligns with locales requiring native-language documentation.

- Cons

  - Maintenance Overhead
    > Higher maintenance overhead and risk of inconsistencies.

  - Slower Cycles
    > Slower review and publication cycles due to translation delays.

  - Increased Costs
    > Increased costs for translation and localization services.

  - UX Fragmentation
    > May lead to fragmentation of the user experience across different languages.

  - Quality Challenges
    > Challenges in ensuring quality and accuracy across all languages.

  - Content Misalignment
    > Risk of misalignment between original and translated content.

  - Legal Risks
    > Potential legal and compliance risks if translations are inaccurate or misleading.

### 4.3. AI Agents

AI tools to assist with translation and quality assurance (QA) based on English.

- Pros

  - Advanced Technology
    > Leverages cutting-edge technology for translation and quality assurance.

  - Cost and Speed
    > Potentially reduces costs and speeds up the translation process.

  - Reduced Human Error
    > Reduces human error in translation and QA.

  - Enhanced Maintainability
    > Enhances maintainability with AI-assisted updates and reviews.

  - Improved Accessibility
    > Improves accessibility with AI-generated translations.

  - Rapid Iteration
    > Enables rapid iteration and updates with AI support.

  - Multilingual Support
    > Facilitates multilingual support without extensive human resources.

  - Scalability
    > Provides scalability for handling large volumes of documentation.

  - Continuous Improvement
    > Allows for continuous improvement through machine learning and feedback loops.

- Cons

  - Accuracy Concerns
    > AI translations may lack accuracy and nuance, leading to potential misinterpretations.

  - Investment Requirements
    > Requires investment in AI technology and training.

  - AI Dependency
    > Dependence on AI tools may introduce new risks and uncertainties.

  - Ongoing Evaluation
    > Ongoing evaluation of AI tools and their impact on documentation quality.

  - Security and Privacy
    > Potential security and privacy concerns with AI-generated content.

## 5. Consequences

- Positive

  - Streamlined Processes
    > Streamlined documentation processes with reduced complexity.

  - Faster Publication
    > Faster publication cycles and improved responsiveness to changes.

  - Reduced Costs
    > Lower costs associated with translation and maintenance.

  - Consistency
    > Clear and consistent documentation in a single language.

- Negative

  - Reduced Accessibility
    > Reduced accessibility for non-English speaking audiences.

  - Support Channels
    > Potential need for additional support channels for non-English speakers.

  - Market Risk
    > Risk of alienating non-English speaking users or markets.

## 6. Implementation

1. Update Documentation Standards

    Update the contribution guidelines and documentation standards to reflect the single-language (English) strategy, including authoring conventions and review expectations.

2. Communicate to Stakeholders

    Communicate the language strategy to all teams and stakeholders through onboarding materials and internal announcements.

3. Establish Review Process

    Define a review process that ensures all documentation is authored, reviewed, and published in English before release.

4. Monitor and Evaluate

    Periodically evaluate the strategy against evolving AI translation capabilities and compliance requirements, adjusting the approach as enterprise-grade solutions mature.

## 7. References

- Sentenz [Docs as Code](../articles/docs-as-code.md) article.
