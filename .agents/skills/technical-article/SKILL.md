---
name: technical-article
description: Creates, revises, and reviews technical articles using formal encyclopedic language, numbered Markdown sections, manual tables of contents, coherent taxonomies, practical examples, and source-qualified references. Use for technical or engineering articles and knowledge-base entries, especially Markdown files under content/articles, docs/articles, or articles.
metadata:
  version: "1.0.5"
  activation:
    implicit: true
    priority: 1
    triggers:
      - "technical article"
      - "engineering article"
      - "convention article"
      - "technical knowledge base"
      - "technical writing"
      - "content/articles"
      - "docs/articles"
    match:
      languages: ["markdown"]
      paths:
        - "content/articles/**/*.md"
        - "docs/articles/**/*.md"
        - "articles/**/*.md"
      prompt_regex: "(?i)(technical article|engineering article|convention article|technical knowledge[- ]base|technical writing|content/articles|docs/articles)"
  usage:
    load_on_prompt: true
    autodispatch: true
---

# Technical Article

Instructions for AI agents on creating, revising, and reviewing technical articles using formal language, coherent structure, precise terminology, practical examples, and verifiable references.

- [1. Benefits](#1-benefits)
- [2. Principles](#2-principles)
  - [2.1. Language](#21-language)
  - [2.2. Content Integrity](#22-content-integrity)
- [3. Structure](#3-structure)
  - [3.1. File and Title](#31-file-and-title)
  - [3.2. Introduction](#32-introduction)
  - [3.3. Table of Contents](#33-table-of-contents)
  - [3.4. Numbered Sections](#34-numbered-sections)
  - [3.5. Taxonomies and Definitions](#35-taxonomies-and-definitions)
  - [3.6. Examples and Data](#36-examples-and-data)
  - [3.7. References](#37-references)
- [4. Workflow](#4-workflow)
  - [4.1. Create](#41-create)
  - [4.2. Revise](#42-revise)
  - [4.3. Review](#43-review)
- [5. Style Guide](#5-style-guide)
  - [5.1. Voice and Tone](#51-voice-and-tone)
  - [5.2. Terminology](#52-terminology)
  - [5.3. Sentences and Paragraphs](#53-sentences-and-paragraphs)
  - [5.4. Lists and Blockquotes](#54-lists-and-blockquotes)
  - [5.5. Links and Citations](#55-links-and-citations)
  - [5.6. Code, Tables, and Admonitions](#56-code-tables-and-admonitions)
- [6. Quality Gates](#6-quality-gates)
- [7. Resources](#7-resources)
- [8. References](#8-references)

## 1. Benefits

- Consistency
  > A stable article grammar makes technical content predictable across topics and allows readers to locate definitions, categories, principles, examples, and references without relearning the document structure.

- Readability
  > Concise definitional paragraphs, explicit headings, and term-definition lists reduce cognitive load while preserving technical precision.

- Navigability
  > A manually maintained hierarchical table of contents and numbered headings expose the conceptual hierarchy and provide direct navigation for long articles.

- Reusability
  > Taxonomies, terminology lists, practical examples, and qualified references make each article useful as both an introduction and a durable engineering reference.

- Reviewability
  > Deterministic formatting and evidence rules allow reviewers to separate structural defects, language defects, and technical inaccuracies.

## 2. Principles

### 2.1. Language

- Formal
  > Use neutral English suitable for software engineers, systems engineers, security professionals, and technical decision-makers.

- Encyclopedic
  > Define the subject before prescribing practices. Explain what a concept is, how it is categorized, and where it is applied before presenting recommendations.

- Precise
  > Prefer domain-specific nouns and verbs over broad or promotional wording. Distinguish standards, specifications, protocols, tools, frameworks, practices, metrics, and architectural patterns.

- Impersonal
  > Prefer third-person or impersonal constructions. Avoid first-person narration, direct second-person address, rhetorical questions, and conversational filler.

- Declarative
  > State definitions, relationships, constraints, and outcomes directly. Use modal verbs only when expressing an actual requirement, recommendation, possibility, or uncertainty.

### 2.2. Content Integrity

- Evidence
  > Support externally verifiable claims with authoritative sources. Prefer standards bodies, official documentation, primary research, and canonical repositories.

- Currency
  > Verify time-sensitive facts, version-specific behavior, performance thresholds, legal requirements, and product capabilities before including them.

- Scope
  > Keep each article centered on one technical subject. Link to adjacent articles rather than duplicating substantial background material.

- Taxonomic Coherence
  > Group concepts by one explicit classification dimension at a time. Do not mix tools, practices, outcomes, and properties as peers unless the section explains the relationship.

- Examples
  > Use examples that are syntactically valid, technically plausible, and directly connected to the preceding explanation.

## 3. Structure

### 3.1. File and Title

- File Name
  > Use a lowercase kebab-case file name that identifies the subject, for example `technical-debt.md`, `feature-flags.md`, or `file-systems.md`.

- Frontmatter
  > Do not add YAML frontmatter to article files unless the target repository explicitly requires it.

- H1 Title
  > Begin with exactly one H1 heading containing the canonical subject name in title case.

  ```markdown
  # Feature Flags
  ```

### 3.2. Introduction

Place one or two concise paragraphs immediately after the H1 heading.

1. Definition

    Define the subject in the first sentence. Expand an acronym on first use when it is not universally self-evident in the article domain.

2. Context

    Explain the subject's purpose, operational role, or relationship to software engineering. Introduce no detailed taxonomy before the table of contents.

Example:

```markdown
# Feature Flags

Feature flags are runtime controls that enable or disable application behavior without requiring a new deployment. They decouple code deployment from feature release and support controlled rollout, experimentation, and operational mitigation.
```

### 3.3. Table of Contents

Insert a manually maintained Markdown table of contents after the introduction and before the first H2 section.

- Hierarchy
  > Mirror every numbered H2, H3, and material H4 heading using two-space indentation per level.

- Labels
  > Include the complete numeric prefix and heading text.

- Anchors
  > Use GitHub-compatible lowercase anchors. Remove punctuation according to GitHub heading rules while preserving hyphens between words.

- Completeness
  > Add, remove, or rename table-of-contents entries whenever headings change.

Example:

```markdown
- [1. Category](#1-category)
  - [1.1. Deployment Strategies](#11-deployment-strategies)
    - [1.1.1. Blue-Green Deployment](#111-blue-green-deployment)
    - [1.1.2. Canary Deployment](#112-canary-deployment)
- [2. Principle](#2-principle)
- [3. Best Practice](#3-best-practice)
- [4. Terminology](#4-terminology)
- [5. References](#5-references)
```

### 3.4. Numbered Sections

Use Arabic decimal numbering in every article heading below H1.

- H2
  > Use `## 1. <Section>` for top-level sections.

- H3
  > Use `### 1.1. <Subsection>` for second-level sections.

- H4
  > Use `#### 1.1.1. <Topic>` only when a subsection contains a substantial taxonomy that requires another level.

- Depth
  > Prefer no more than four heading levels including H1. Replace excessive heading depth with term-definition lists or tables.

- Canonical Sections
  > Select only sections that contribute to the subject. Common corpus-compatible labels include `Benefits`, `Category`, `Principle`, `Principles`, `Best Practice`, `Terminology`, and `References`.

- Order
  > Start with foundational concepts and categories, continue with principles or practices, then conclude with terminology and references.

### 3.5. Taxonomies and Definitions

Use prose for conceptual transitions and term-definition lists for scannable technical content.

- Section Lead
  > Open a major section with one or two paragraphs that explain the classification dimension or purpose of the section.

- Term-Definition Pattern
  > Present a technical label as a bullet and its explanation as an indented blockquote.

  ```markdown
  - Atomicity
    > Atomicity ensures that a transaction completes as one unit or rolls back without retaining a partial result.
  ```

- Grouped Pattern
  > Use an ordered list item as a local group heading when a subsection contains several distinct views, such as conventions, examples, or tools.

- Label Capitalization
  > Use title case for conceptual labels and sentence case for descriptions.

- Description Quality
  > Start descriptions with the term's role, behavior, or defining property. Avoid circular definitions that repeat the label without adding meaning.

### 3.6. Examples and Data

- Standalone Examples
  > Introduce prose-level standalone examples with `Example:`. Within grouped subsections such as `Examples and Explanations`, use a descriptive example label instead.

- Code Examples
  > Use a fenced code block with the most accurate language identifier.

- Inline Syntax
  > Use backticks for commands, file paths, configuration keys, identifiers, literals, and short syntax fragments.

- Tables
  > Use Markdown tables for compact comparisons, matrices, metrics, commands, or enumerated reference data. Keep cell content parallel and avoid prose paragraphs inside cells.

- Diagrams
  > Use text-based diagrams such as Mermaid when relationships or flows cannot be explained efficiently with prose or a table.

- Admonitions
  > Use GitHub admonitions sparingly for constraints, caveats, cross-links, or information that materially changes interpretation.

  ```markdown
  > [!NOTE]
  > The metric threshold depends on the cited reporting period and must be verified before publication.
  ```

### 3.7. References

End every article with a numbered `References` section.

- Internal References
  > Use repository-relative links for related Sentenz articles.

  ```markdown
  - Sentenz [Versioning](../articles/versioning.md) article.
  ```

- External References
  > Name the organization or publisher before the linked title and identify the source type after the link.

  ```markdown
  - NIST [Secure Software Development Framework (SSDF) Version 1.1](https://csrc.nist.gov/pubs/sp/800/218/final) publication.
  - Kubernetes [Documentation](https://kubernetes.io/docs/) documentation.
  - GitHub [DORA Four Keys](https://github.com/dora-team/fourkeys) repository.
  ```

- Source Types
  > Use a precise qualifier such as `article`, `documentation`, `page`, `publication`, `repository`, `report`, `specification`, or `standard`.

- Relevance
  > Include only sources cited or materially used in the article. Do not create a general reading list unrelated to article claims.

## 4. Workflow

### 4.1. Create

1. Inspect

    Read neighboring files in the target article directory. Record the local heading vocabulary, link style, code-fence conventions, and related internal articles.

2. Scope

    Define the article subject, intended depth, and primary classification dimension. Separate adjacent subjects into cross-linked articles.

3. Research

    Collect authoritative primary sources. Verify terminology, standards, metrics, product behavior, and time-sensitive details.

4. Outline

    Select the required canonical sections and construct a numbered heading hierarchy before drafting prose.

5. Load Template

    Load [`assets/technical-article-template.md`](assets/technical-article-template.md) when creating a new article. Remove sections that do not contribute to the subject.

6. Draft Introduction

    Write the H1 title and one or two definitional paragraphs. Establish the subject and engineering context without front-loading implementation detail.

7. Build Table of Contents

    Mirror the planned heading hierarchy and generate exact GitHub-compatible anchors.

8. Write Sections

    Add section leads, term-definition lists, examples, tables, diagrams, and admonitions only where they improve comprehension.

9. Add References

    Add internal relative links and external source-qualified references. Ensure every material external claim has an appropriate authoritative source.

10. Validate

    Apply all [Quality Gates](#6-quality-gates) before returning or committing the article.

### 4.2. Revise

1. Preserve Intent

    Identify the existing article's subject, scope, and taxonomy before changing structure.

2. Load Template

    Load [`assets/technical-article-template.md`](assets/technical-article-template.md) before revising the article. Use it as a structural baseline, remove inapplicable template sections, and preserve valid article-specific sections.

3. Diagnose

    Separate defects into technical accuracy, taxonomy, organization, language, formatting, links, examples, and references.

4. Normalize

    Align the title, introduction, table of contents, numbering, heading levels, lists, blockquotes, code fences, and references with this skill.

5. Refine Language

    Replace vague, repetitive, conversational, or promotional wording with direct technical definitions and domain-appropriate verbs.

6. Reconcile Navigation

    Update anchors, cross-links, and references after every heading or file-name change.

7. Validate

    Re-run all quality gates and confirm that the revision does not remove technically relevant information without an explicit reason.

### 4.3. Review

1. Load Template

    Load [`assets/technical-article-template.md`](assets/technical-article-template.md) before reviewing an article. Use it as a structural baseline and do not report omitted optional sections as defects unless their absence creates a completeness or coherence problem.

2. Evaluate

    Review the article in the following order:

    1. Technical Correctness
    2. Scope and Taxonomic Coherence
    3. Structural Conformance
    4. Terminology and Acronyms
    5. Examples, Tables, and Diagrams
    6. Links and References
    7. Grammar, Punctuation, and Readability

3. Report Findings

    Report findings with the affected heading or line, the defect, its technical consequence, and a concrete correction. Prioritize factual errors and structural inconsistencies over stylistic preferences.

## 5. Style Guide

### 5.1. Voice and Tone

- Present Tense
  > Use present tense for definitions, capabilities, and current practices.

- Past Tense
  > Use past tense only for historical events or superseded behavior.

- Active Voice
  > Prefer active voice when the actor or mechanism matters.

- Passive Voice
  > Use passive voice when the process or result is the focus and the actor is irrelevant.

- Impersonal Perspective
  > Avoid first-person and second-person pronouns.

- Professional Tone
  > Avoid humor, idioms, rhetorical questions, exclamation marks, and marketing language.

- Qualified Language
  > Avoid unqualified adjectives such as `easy`, `simple`, `powerful`, `modern`, `best`, or `obvious`.

- Normative Modal Verbs
  > Use `should`, `must`, `may`, and `can` according to their actual normative meaning.

### 5.2. Terminology

- Acronym Expansion
  > Expand acronyms on first use, for example `Mean Time to Recovery (MTTR)`.

- Canonical Capitalization
  > Preserve canonical capitalization for technologies, standards, protocols, and organizations.

- Preferred Terminology
  > Use one preferred term consistently; introduce aliases only when they are widely used or needed for searchability.

- Concept Classification
  > Distinguish a product from its category, a framework from a methodology, and a metric from the outcome it measures.

- Literal Tokens
  > Use backticks for literal tokens, not for ordinary emphasis.

- Domain Definitions
  > Define uncommon domain terms before relying on them in later sections.

### 5.3. Sentences and Paragraphs

- Topic Sentence
  > Begin each paragraph with its main technical claim.

- Paragraph Scope
  > Keep one conceptual purpose per paragraph.

- Sentence Construction
  > Prefer direct subject-verb-object construction.

- Redundancy
  > Remove repeated definitions and duplicated conclusions.

- Parallel Grammar
  > Use parallel grammar across peer list items and table rows.

- Complete Sentences
  > Use complete sentences in prose and blockquote descriptions.

- Terminal Punctuation
  > Keep heading text and list labels free of terminal punctuation.

- Example Notation
  > Prefer `for example` in prose; use `e.g.` only where compact notation is appropriate.

- Adjacent Qualifications
  > State limitations and trade-offs adjacent to the capability they qualify.

### 5.4. Lists and Blockquotes

- Unordered Lists
  > Use unordered lists for taxonomies, properties, principles, tools, and terminology.

- Ordered Lists
  > Use ordered lists for workflows, local group headings, and sequences.

- Blockquote Descriptions
  > Place the description on the next line as an indented blockquote.

- Item Separation
  > Separate complex list items with blank lines.

- Parallel Labels
  > Keep peer labels grammatically parallel.

- Category Grouping
  > Avoid a flat list when items belong to distinct categories; introduce subsections or grouped ordered-list headings instead.

### 5.5. Links and Citations

- First Material Mention
  > Link a technology, standard, or framework at its first material mention.

- Source Authority
  > Prefer official documentation and primary sources over aggregators.

- Internal Links
  > Use relative links for repository-local articles.

- Descriptive Link Text
  > Use descriptive link text rather than raw URLs.

- Link Frequency
  > Avoid linking every repeated occurrence of the same term.

- Destination Accuracy
  > Ensure linked text accurately represents the destination.

- Claim Support
  > Do not cite a source for a claim the source does not support.

### 5.6. Code, Tables, and Admonitions

- Plaintext Fences
  > Use `plaintext` for abstract syntax, terminal output, and language-neutral examples.

- Shell and Source Fences
  > Use `bash` for shell commands and a language-specific fence for source code.

- Example Completeness
  > Keep code examples minimal but complete enough to demonstrate the stated concept.

- Secure Examples
  > Do not include insecure or deprecated code without an explicit warning and safer alternative.

- Table Applicability
  > Use tables only when columns represent stable comparable attributes.

- Table Consistency
  > Align table headers consistently and keep terminology parallel.

- Admonition Purpose
  > Use admonitions for high-value caveats; do not use them as decorative callouts.

- Mermaid Validity
  > Ensure Mermaid diagrams use valid syntax and meaningful node labels.

## 6. Quality Gates

An article is complete only when all applicable gates pass.

- Scope
  > The article covers one coherent subject and links to adjacent subjects instead of duplicating them.

- Definition
  > The first paragraph defines the subject and establishes its engineering context.

- Navigation
  > The table of contents matches every numbered heading and every anchor resolves correctly.

- Numbering
  > Heading numbers are sequential, hierarchical, and consistent after insertions or deletions.

- Taxonomy
  > Peer concepts share one classification dimension and use parallel labels and descriptions.

- Language
  > The prose is formal, declarative, impersonal, technically precise, and free of unsupported promotional claims.

- Terminology
  > Acronyms are expanded on first use, canonical names are preserved, and aliases are controlled.

- Examples
  > Code, commands, diagrams, and data are valid, relevant, and consistent with the explanation.

- Evidence
  > Material claims use authoritative sources, and time-sensitive claims have been verified.

- Links
  > Internal paths are relative and valid; external links use descriptive text and resolve to the intended source.

- References
  > The final section contains only used sources and qualifies each source with an accurate source type.

- Formatting
  > Markdown renders correctly, code fences are balanced, tables are valid, and list indentation is consistent.

- Completeness
  > No placeholders, editorial notes, unverified assumptions, or unfinished sections remain.

## 7. Resources

- [`assets/technical-article-template.md`](assets/technical-article-template.md)
  > Complete structural baseline for convention-style technical articles. Load it during create, revise, and review workflows; adapt optional sections to the subject rather than enforcing them mechanically.

## 8. References

- GitHub [Basic writing and formatting syntax](https://docs.github.com/en/get-started/writing-on-github) documentation.
- CommonMark [Specification](https://spec.commonmark.org/) specification.
- Agent Skills [Specification](https://agentskills.io/specification) specification.
