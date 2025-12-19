# XXX-ADR: Language for Technical Documentation

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

- Pros:
  - Simplifies maintenance and reduces risk of contradictory guidance.
  - Faster review cycles and lower cognitive load for maintainers.
  - Simplified documentation CI pipelines and automation.
  - Eliminates translation costs and delays.
  - Aligns with the majority of technical documentation standards.

- Cons:
  - Limits accessibility for non-English speaking audiences.
  - Potential perception of reduced local market investment.
  - May require additional support channels for non-English speakers.

### 4.2. Multi Language

Author in English and translate to multiple languages.

- Pros:
  - Increases accessibility for a global audience.
  - Leverages existing translation services and tools.
  - Supports diverse user base and enhances global reach.
  - Aligns with locales requiring native-language documentation.

- Cons:
  - Higher maintenance overhead and risk of inconsistencies.
  - Slower review and publication cycles due to translation delays.
  - Increased costs for translation and localization services.
  - May lead to fragmentation of the user experience across different languages.
  - Challenges in ensuring quality and accuracy across all languages.
  - Risk of misalignment between original and translated content.
  - Potential legal and compliance risks if translations are inaccurate or misleading.

### 4.3. AI Agents

AI tools to assist with translation and quality assurance (QA) based on English.

- Pros:
  - Leverages cutting-edge technology for translation and quality assurance.
  - Potentially reduces costs and speeds up the translation process.
  - Reduces human error in translation and QA.
  - Enhances maintainability with AI-assisted updates and reviews.
  - Improves accessibility with AI-generated translations.
  - Enables rapid iteration and updates with AI support.
  - Facilitates multilingual support without extensive human resources.
  - Provides scalability for handling large volumes of documentation.
  - Allows for continuous improvement through machine learning and feedback loops.

- Cons:
  - AI translations may lack accuracy and nuance, leading to potential misinterpretations.
  - Requires investment in AI technology and training.
  - Dependence on AI tools may introduce new risks and uncertainties.
  - Ongoing evaluation of AI tools and their impact on documentation quality.
  - Potential security and privacy concerns with AI-generated content.

## 5. Consequences

- Positive
  - Streamlined documentation processes with reduced complexity.
  - Faster publication cycles and improved responsiveness to changes.
  - Lower costs associated with translation and maintenance.
  - Clear and consistent documentation in a single language.

- Negative
  - Reduced accessibility for non-English speaking audiences.
  - Potential need for additional support channels for non-English speakers.
  - Risk of alienating non-English speaking users or markets.
