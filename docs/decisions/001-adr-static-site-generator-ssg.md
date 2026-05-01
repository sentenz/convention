# 001-ADR: Static Site Generator (SSG)

Architectural Decision Records (ADR) on a Static Site Generator (SSG) for a project documentation site.

- [1. State](#1-state)
- [2. Context](#2-context)
- [3. Decision](#3-decision)
  - [3.1. Hugo](#31-hugo)
- [4. Considered](#4-considered)
  - [4.1. Hugo](#41-hugo)
  - [4.2. MkDocs](#42-mkdocs)
  - [4.3. Docusaurus](#43-docusaurus)
- [5. Consequences](#5-consequences)
- [6. Implementation](#6-implementation)
- [7. References](#7-references)

## 1. State

- Author(s): Sentenz
- Date: 2024-05-28
- Status: Proposed

## 2. Context

Our project requires the generation of a static website. The website will contain documentation, articles, guides and other static content. The primary contenders for the static site generator (SSG) are Hugo, MkDocs, and Docusaurus.

1. Decision Drivers

    - Ease of Use
      > The simplicity of setup and use.

    - Performance
      > Speed of site generation and performance of the generated site.

    - Customization and Extensibility
      > Ability to customize themes and extend functionality.

    - Community and Support
      > Availability of community support, plugins, and documentation.

    - Integration
      > Compatibility with existing tools and workflows.

    - Markdown Flavor
      > Support for different Markdown flavors and extended Markdown features.

    - Markup Languages
      > Support for other markup languages besides Markdown.

## 3. Decision

### 3.1. Hugo

Hugo was selected due to its superior performance, flexibility, extensive customization options, robust Markdown support through Goldmark, and support for multiple markup languages including AsciiDoc and reStructuredText. Although it has a steeper learning curve and more complex configuration compared to MkDocs, its speed and ability to handle large sites efficiently make it the best choice for our project. Additionally, Hugo's strong community support and comprehensive documentation ensure that any challenges can be addressed effectively.

1. Rationale

    - Ease of Use
      > Hugo provides extensive documentation and a wide range of community themes, making it approachable despite an initial learning curve. Once familiar, content management and site configuration are manageable for the team.

    - Performance
      > Hugo is built with Go and is one of the fastest SSGs available, capable of building thousands of pages per second, significantly improving the development workflow for large documentation sites.

    - Customization and Extensibility
      > Hugo supports custom themes, shortcodes, and data templates, enabling extensive customization of content presentation and site structure without external dependencies.

    - Community and Support
      > Hugo has a large, active community with comprehensive official documentation, a broad selection of themes and plugins, and active forums for troubleshooting and guidance.

    - Integration
      > Hugo integrates seamlessly with CI/CD pipelines, version control workflows, and popular deployment platforms such as GitHub Pages and Netlify, aligning with our existing toolchain.

    - Markdown Flavor
      > Hugo uses Goldmark, a CommonMark-compliant Markdown parser with extension support, offering greater flexibility for advanced Markdown features compared to the alternatives considered.

    - Markup Languages
      > Hugo natively supports multiple markup languages including Markdown, AsciiDoc, and reStructuredText, providing flexibility for diverse content authoring needs across the team.

## 4. Considered

### 4.1. Hugo

[Hugo](https://gohugo.io/) is a fast and flexible open-source static site generator written in Go.

- Pros:

  - Performance
    > Hugo is one of the fastest SSGs available, capable of building large sites quickly.

  - Flexibility
    > Supports a wide range of content types and taxonomies.

  - Customization
    > Extensive theming capabilities and support for custom templates.

  - Documentation
    > Comprehensive documentation and a large community.

  - Content Management
    > Supports multiple content formats (Markdown, HTML, AsciiDoc, RST).

  - Markdown Flavor
    > Supports `Goldmark`, which is an extension-rich implementation of the compatible `CommonMark` specification. This allows for advanced Markdown features and customization.

  - Markup Languages
    > Supports various markup languages including Markdown, AsciiDoc, and reStructuredText (RST).

- Cons:

  - Learning Curve
    > Can be complex for beginners due to its wide range of features and options, and the Go-based templating system can be complicated for those unfamiliar with the language.

  - Configuration
    > Initial setup and configuration can be more involved compared to simpler tools.

### 4.2. MkDocs

[MkDocs](https://www.mkdocs.org/) is a fast, simple static site generator geared towards building project documentation using Markdown.

- Pros:

  - Ease of Use
    > Simple and straightforward, especially for documentation websites.

  - Configuration
    > Minimal configuration required to get started.

  - Documentation
    > Good documentation and a friendly community.

- Cons:

  - Performance
    > Slower than Hugo for large sites.

  - Customization
    > Limited theming and customization options compared to Hugo and Docusaurus.

  - Extensibility
    > Fewer plugins and extensions available.

  - Markdown Flavor
    > Uses `Python-Markdown`, which adheres strictly to `John Gruber's Markdown` specification. This includes a strict 4-space indentation requirement for code blocks, which can be less flexible compared to other Markdown flavors.

  - Markup Languages
    > Primarily supports Markdown, with limited support for other markup languages.

### 4.3. Docusaurus

[Docusaurus](https://docusaurus.io/) is a static-site generator built with React, optimized for creating documentation websites with versioning and internationalization support.

- Pros:

  - Ease of Use
    > Designed for documentation with a strong focus on ease of use.

  - Customization
    > Good theming options and support for React components.

  - Integration
    > Works well with existing JavaScript/React projects.

  - Community
    > Active community and support from Facebook.

  - Markdown Flavor
    > Uses `Remark/MDX`, which supports JSX within Markdown, enabling complex interactions and component embedding.

- Cons:

  - Performance
    > Slower build times compared to Hugo.

  - Learning Curve
    > Requires knowledge of React and JavaScript for advanced customization.

  - Size
    > Heavier dependencies due to its React-based architecture.

  - Markup Languages
    > Primarily supports Markdown with JSX, limited support for other markup languages.

## 5. Consequences

- Positive

  - Performance
    > Fast build times will improve the development workflow and scalability of the website.

  - Flexibility
    > Ability to handle various content types and complex structures.

  - Community
    > Access to a large number of themes, plugins, and support resources.

  - Markdown
    > Support for advanced Markdown features and customization options.

  - Markup Languages
    > Support for multiple markup languages increases flexibility in content authoring.

- Negative

  - Learning Curve
    > Team members will need to invest time in learning Hugo's configuration and capabilities.

  - Complexity
    > Initial setup may be more involved, requiring careful planning and configuration.

- Risks

  - Templating Complexity
    > Hugo's Go-based templating may introduce complexity for team members unfamiliar with the language. Mitigation: Provide team training and maintain shared template libraries to reduce duplication and onboarding effort.

  - Version Upgrades
    > Breaking changes between Hugo versions may require updates to templates and configuration. Mitigation: Pin Hugo to a specific version in CI/CD pipelines and test upgrades in a staging environment before rolling out to production.

## 6. Implementation

1. Installation

    Install Hugo on all development machines and CI/CD runners using the project's pinned version to ensure consistent builds across all environments.

2. Site Initialization

    Create the site structure using `hugo new site <name>` and configure the `hugo.toml` configuration file with the project name, base URL, language settings, and content directory layout.

3. Theme Configuration

    Select and integrate a Hugo theme, or create a custom theme aligned with the project's design requirements. Document the theme configuration and any customizations in the repository.

4. Content Migration

    Migrate existing documentation content into Hugo's content directory structure, organizing pages into appropriate sections and updating internal links and references accordingly.

5. CI/CD Integration

    Configure CI/CD pipelines to install Hugo, build the static site, and deploy the output on each commit to the main branch. Pin the Hugo version in the pipeline configuration to ensure reproducible builds.

6. Validation

    Validate the generated site output by running broken-link checks and reviewing the rendered content structure to confirm all pages, assets, and references resolve correctly before deployment.

## 7. References

- Sentenz [Docs as Code](../articles/docs-as-code.md) article.
- Docusaurus [Official Documentation](https://docusaurus.io/docs) page.
- Hugo [Official Documentation](https://gohugo.io/documentation/) page.
- MkDocs [Official Documentation](https://www.mkdocs.org/user-guide/writing-your-docs/) page.
