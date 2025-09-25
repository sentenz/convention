# ADR Static Site Generator (SSG)

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
- [6. References](#6-references)

## 1. State

- Author(s): ALKL
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
      > TODO

    - Performance
      > TODO

    - Customization and Extensibility
      > TODO

    - Community and Support
      > TODO

    - Integration
      > TODO

    - Markdown Flavor
      > TODO

    - Markup Languages
      > TODO

## 4. Considered

### 4.1. Hugo

- Pros

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

- Cons

  - Learning Curve
    > Can be complex for beginners due to its wide range of features and options, and the Go-based templating system can be complicated for those unfamiliar with the language.

  - Configuration
    > Initial setup and configuration can be more involved compared to simpler tools.

### 4.2. MkDocs

- Pros

  - Ease of Use
    > Simple and straightforward, especially for documentation websites.

  - Configuration
    > Minimal configuration required to get started.

  - Documentation
    > Good documentation and a friendly community.

- Cons

  - Performance
    > Slower than Hugo for large sites.

  - Customization
    > Limited theming and customization options compared to Hugo and Docusaurus.

  - Extensibility:
    > Fewer plugins and extensions available.

  - Markdown Flavor
    > Uses `Python-Markdown`, which adheres strictly to `John Gruber's Markdown` specification. This includes a strict 4-space indentation requirement for code blocks, which can be less flexible compared to other Markdown flavors.

  - Markup Languages
    > Primarily supports Markdown, with limited support for other markup languages.

### 4.3. Docusaurus

- Pros

  - Ease of Use
    > Designed for documentation with a strong focus on ease of use.

  - Customization
    > Good theming options and support for React components.

  - Integration
    > Works well with existing JavaScript/React projects.

  - Community
    > Active community college and support from Facebook.

  - Markdowns Flavor
    > Uses `Remark/MDX`, which supports JSX within Markdown, enabling complex interactions and component embedding.

- Cons

  - Performance
    > Slower build times compared to Hugo.

  - Learning Curve
    > Requires knowledge of React and JavaScript for advanced customization.

  - Size
    > Heavier dependencies due to its React-based architecture.

  - Markup Languages
    > Primarily supports Markdown with JSX, limited support for other markup languages.

## 5. Consequences

1. Positive

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

2. Negative

    - Learning Curve
      > Team members will need to invest time in learning Hugo's configuration and capabilities.

    - Complexity
      > Initial setup may be more involved, requiring careful planning and configuration.

## 6. References

- Sentenz [Static Site Generator (SSG)](../articles/static-site-generator-ssg.md) article.
- Docusaurus [Official Documentation](https://docusaurus.io/docs) page.
- Hugo [Official Documentation](https://gohugo.io/documentation/) page.
- MkDocs [Official Documentation](https://www.mkdocs.org/user-guide/writing-your-docs/) page.
