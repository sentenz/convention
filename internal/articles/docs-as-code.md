# Docs as Code

Docs as Code is a set of principles and practices that aims to treat documentation as code, and apply software development practices to documentation.

Docs as Code treats documentation as a codebase, with the same level of rigor and discipline as software development. This involves using version control systems (such as Git), markup languages (such as Markdown), and static site generators (such as Jekyll) to create and manage documentation.

- [1. Category](#1-category)
  - [1.1. Markup Languages](#11-markup-languages)
    - [1.1.1. Markdown](#111-markdown)
    - [1.1.2. AsciiDoc](#112-asciidoc)
    - [1.1.3. reStructuredText](#113-restructuredtext)
  - [1.2. UML](#12-uml)
    - [1.2.1. Structural Diagrams](#121-structural-diagrams)
    - [1.2.2. Behavioral Diagrams](#122-behavioral-diagrams)
    - [1.2.3. Interaction Diagrams](#123-interaction-diagrams)
    - [1.2.4. Tools](#124-tools)
  - [1.3. Static Site Generators](#13-static-site-generators)
- [2. Principle](#2-principle)
- [3. Best Practice](#3-best-practice)
- [4. Terminology](#4-terminology)
- [5. References](#5-references)

## 1. Category

### 1.1. Markup Languages

#### 1.1.1. Markdown

[Markdown](https://github.com/commonmark/commonmark-spec) is a lightweight markup language that is widely used for creating documentation. It is easy to learn and read, and allows for easy formatting and structuring of text. Markdown files typically have the extension `.md`.

Markdown syntax to format text and can be converted to HTML, PDF, or other formats.

Example:

```markdown
# Heading 1

## Heading 2

### Heading 3

This is a paragraph of text.

* This is a bullet point.
* This is another bullet point.

1. This is a numbered list.
2. This is another item in the numbered list.
```

#### 1.1.2. AsciiDoc

[AsciiDoc](https://asciidoc.org/) is markup language that is designed for creating technical documentation. It is more powerful than Markdown and allows for more advanced formatting and structuring. AsciiDoc files typically have the extension `.adoc` or `.asciidoc`.

AsciiDoc can be converted to HTML, PDF, EPUB, and other formats.

Example:

```markdown
= Heading 1

== Heading 2

=== Heading 3

This is a paragraph of text.

* This is a bullet point.
* This is another bullet point.

1. This is a numbered list.
2. This is another item in the numbered list.
```

#### 1.1.3. reStructuredText

reStructuredText is a markup language that is used for creating technical documentation. It is more powerful than Markdown and allows for more advanced formatting and structuring. reStructuredText files typically have the extension `.rst`.

reStructuredText can be converted to HTML, LaTeX, and other formats. reStructuredText supports features, including tables, footnotes, and citations.

Example:

```markdown
Heading 1
=========

Heading 2
---------

Heading 3
^^^^^^^^^

This is a paragraph of text.

* This is a bullet point.
* This is another bullet point.

1. This is a numbered list.
2. This is another item in the numbered list.
```

### 1.2. UML

[Unified Modeling Language (UML)](https://www.uml.org/) is a graphical modeling language used to visualize, specify, and document software systems. It includes a variety of diagrams that can be used to model different aspects of a system.

In the context of Docs as Code, UML can be used to model and document the relationships and interactions between different components of the documentation system, such as the documentation files, the version control system, the build tools, and the hosting platform. UML can also be used to model the workflows and processes involved in creating, reviewing, and publishing documentation.

#### 1.2.1. Structural Diagrams

Structural diagrams represent the static structure of a system, including its components, classes, and relationships.

- Class diagrams
  > Class diagrams show the structure of a system by modeling the classes and their relationships. They include attributes and methods associated with each class.

Example:

```markdown
+---------------------+
|     Employee        |
+---------------------+
| - id: int           |
| - name: String      |
| - email: String     |
+---------------------+
| + getDetails()      |
| + setDetails()      |
+---------------------+
```

- Object diagrams
  > Object diagrams show the instances of classes and their relationships. They are useful for showing how a system works at a particular point in time.

Example:

```markdown
+---------------------+
|     Employee        |
+---------------------+
| - id: 1001          |
| - name: "John Doe"  |
+---------------------+
```

#### 1.2.2. Behavioral Diagrams

Behavioral diagrams represent the dynamic behavior of a system, including its interactions, collaborations, and workflows. Some examples of behavioral diagrams include:

- Use case diagrams
  > Use case diagrams show the interactions between a system and its users. They include actors (users or other systems) and use cases (actions or tasks that the system performs).

Example:

```markdown
+---------+       +---------+
|  Actor  |       |  Actor  |
+---------+       +---------+
      |              |
      |              |
+---------------------------+
|         Use Case          |
+---------------------------+
```

- Sequence diagrams
  > Sequence diagrams show the interactions between different objects or components in a system over time. They include messages exchanged between the objects and the order in which they occur.

Example:

```markdown
Actor -> System: Request
System -> Database: Query
Database -> System: Results
System -> Actor: Response
```

#### 1.2.3. Interaction Diagrams

Interaction diagrams are a specific type of behavioral diagram in UML, along with activity diagrams, state machine diagrams, and timing diagrams. Interaction diagrams focus on the interactions between objects or components in a system, while other types of behavioral diagrams focus on different aspects of system behavior.

- Sequence diagrams
  > Sequence diagrams show the interactions between objects or components over time.

Example:

```markdown
Customer -> Online Store: Browse products
Online Store -> Database: Retrieve product list
Database -> Online Store: Send product list
Online Store -> Customer: Display product list
Customer -> Online Store: Select product
Online Store -> Database: Retrieve product details
Database -> Online Store: Send product details
Online Store -> Customer: Display product details
Customer -> Online Store: Add product to cart
Online Store -> Customer: Update cart
```

- Communication diagrams
  > Communication diagrams show the interactions between objects or components in a system by modeling the messages exchanged between them.

Example:

```markdown
+-------------------+        +------------------+
|    Customer       |        |   Order          |
+-------------------+        +------------------+
         |                         |
         | order placed            |
         |------------------------>|
         |                         |
         | payment requested       |
         |<------------------------|
         |                         |
         | payment received        |
         |------------------------>|
         |                         |
         | order fulfilled         |
         |<------------------------|
         |                         |
```

#### 1.2.4. Tools

- [PlantUML](https://github.com/plantuml/plantuml)
  > PlantUML is an open-source tool for creating UML diagrams using a simple text-based syntax. It supports a wide range of UML diagram types and can generate diagrams in various formats, including PNG, SVG, and LaTeX.

- [Mermaid](https://github.com/mermaid-js/mermaid/)
  > Mermaid is an open-source tool for creating diagrams using a simple text-based syntax. It supports a wide range of diagram types, including UML diagrams, flowcharts, and sequence diagrams. It offers a variety of styling options and can generate diagrams in various formats, including SVG and PNG. Mermaid is particularly useful for creating diagrams in environments that don't support graphical diagramming tools, such as Markdown files or README files on GitHub. The text-based syntax makes it easy to include diagrams in documentation and other text-based files. Mermaid is also highly customizable, allowing users to define their own styles and diagram types using JavaScript.

### 1.3. Static Site Generators

[Static Site Generators (SSGs)](../about/static-site-generators.md) are tools that use markup languages to generate static websites. SSG allow teams to write documentation using markup languages and generate a static website that can be hosted on web servers.

SSG work process:

- Content Creation
  > Create website's content using a markup language like Markdown or HTML. Organize the content into pages, blog posts, and other types of content.

- Template Creation
  > Create a set of templates that define the structure and design of the website. Templates typically use a templating language like Handlebars or Liquid to define placeholders for the content.

- Building
  > Run the SSG tool to `build` the website. The tool reads the content and templates and generates a set of static HTML, CSS, and JavaScript files. The files are typically organized into a directory structure that mirrors the structure of your content.

- Deployment
  > Deploy the static files to a web server or a content delivery network (CDN) that can serve them to users.

## 2. Principle

By applying these principles, Docs as Code aims to improve the quality, consistency, and efficiency of documentation, and integrate documentation more closely with the software development process.

- Version Control
  > Docs as Code advocates for storing documentation in a version control system (VCS), such as Git, to manage changes over time, enable collaboration, and provide a history of changes.

- Automation
  > Automation is a key principle of Docs as Code, with the goal of reducing manual effort and ensuring consistency in documentation. Automation can include tools for generating documentation from source code or other data sources, running tests on documentation, and deploying documentation to various platforms.

- Collaboration
  > Docs as Code encourages collaboration between developers, technical writers, and other stakeholders in the documentation process, using tools like code reviews, pull requests, and issue tracking to facilitate communication and feedback.

- Consistency
  > Docs as Code aims to establish and maintain consistency in documentation, using style guides, branding guidelines, and other standards to ensure a unified voice and style across documentation.

- Continuous Improvement
  > Docs as Code advocates for continuous improvement in documentation, using metrics and feedback to identify areas for improvement, and incorporating changes into the documentation process.

## 3. Best Practice

By following these best practices, organizations can improve the quality, consistency, and efficiency of their documentation, and integrate it more closely with the software development process. Additionally, they can benefit from the scalability and maintainability of code-based documentation.

- Use a structured format
  > Using a structured format, such as Markdown or AsciiDoc, can improve consistency, readability, and maintainability of documentation. Structured formats provide a standard way of organizing information, making it easier for readers to find what they need and for authors to update and modify content.

- Write documentation as code
  > Writing documentation as code, with the same level of care and attention as software code, can improve the quality and consistency of documentation. This includes following coding conventions, documenting code changes, and using code review processes to ensure high quality.

- Automate documentation generation
  > Automating the generation of documentation from source code can reduce the manual effort involved in documentation and ensure that documentation is up-to-date with the latest changes in the codebase. This can be achieved using tools like Sphinx or Javadoc.

- Create a single source of truth
  > Creating a single source of truth for documentation, such as a documentation repository, can reduce duplication and ensure consistency across documentation. This can be achieved by centralizing documentation in a single location and using version control to manage changes.

- Use templates and style guides
  > Using templates and style guides can ensure consistency in formatting and style across documentation, making it easier for readers to navigate and understand. This can also reduce the effort involved in creating and maintaining documentation by providing a standardized framework.

- Collaborate with stakeholders
  > Collaborating with stakeholders, such as developers, product managers, and users, can improve the quality and relevance of documentation. This can be achieved through feedback mechanisms, like surveys or user testing, and by involving stakeholders in the documentation process.

## 4. Terminology

By understanding these key terminology related to Docs as Code, teams can better implement Docs as Code practices and improve the quality, consistency, and efficiency of their documentation.

- Modular documentation
  > Modular documentation involves breaking documentation into smaller, reusable components, such as templates, snippets, and examples, to improve efficiency and consistency in documentation.

- Automation
  > Automation involves using tools and processes to reduce manual effort in creating and maintaining documentation. Automation can include tools for generating documentation from source code, running tests on documentation, and deploying documentation to various platforms.

- Pull request
  > A proposed change to a code or documentation repository, typically submitted for review by other team members.

- Readme file
  > A file in a code repository that contains information about the project, including installation instructions, usage guidelines, and other information.

- API documentation
  > Documentation that describes how to use an application programming interface (API), typically including information on endpoints, parameters, and response formats.

- Documentation pipeline
  > A series of steps that documentation goes through, such as writing, editing, reviewing, and publishing.

- Documentation generator
  > A tool that automatically generates documentation from source code or other data sources, such as Swagger or Javadoc.

- Style guide
  > A set of standards and guidelines for writing documentation, including language usage, formatting, and tone.

- Single source of truth
  > A principle that promotes having a single, authoritative source for information, to avoid confusion and inconsistencies.

- DocOps
  > A term used to describe the integration of documentation into the software development process, similar to DevOps.

- Doc site
  > A website or portal that hosts documentation, often including search functionality, navigation, and other features.

- Knowledge base
  > A centralized repository of information, often including documentation, FAQs, and other resources.

- Content management system (CMS)
  > A software platform for managing digital content, such as documentation, articles, or multimedia.

## 5. References

- Sentenz [static site generators](../about/static-site-generators.md) article.
- Sentenz [comment](../about/comment.md) article.
