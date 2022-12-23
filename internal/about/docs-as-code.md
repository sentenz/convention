# Docs as Code

Technical documentation as [Docs as Code](https://www.writethedocs.org/guide/docs-as-code/) refers to a philosophy where documents are treated as code with issue tracking, version control (Git),  code reviews, and automated testing.

Docs as Code enables a culture where authors and developers take ownership of documentation.

- [1. Markup](#1-markup)
  - [1.1. Markdown](#11-markdown)
  - [1.2. AsciiDoc](#12-asciidoc)
  - [1.3. reStructuredText](#13-restructuredtext)
- [2. UML](#2-uml)
  - [2.1. Mermaid](#21-mermaid)
  - [2.2. PlantUML](#22-plantuml)
- [3. References](#3-references)

## 1. Markup

[Markup language](https://en.m.wikipedia.org/wiki/Markup_language) refers to a text-encoding system consisting of a set of symbols inserted in a text document to control its structure, formatting, or the relationship between its parts.

### 1.1. Markdown

[Markdown (md)](https://github.com/commonmark/commonmark-spec) is a [plain text format](https://www.markdownguide.org/basic-syntax/) for writing structured documents, based on formatting conventions from email and usenet. Developed in 2004 by [John Gruber](https://daringfireball.net/projects/markdown/) in collaboration with Aaron Swartz.

[Hugo](https://gohugo.io/) is a popular Markdown framework for static site generator (SSG).

### 1.2. AsciiDoc

[AsciiDoc (adoc)](https://asciidoc.org/) is a [plain text markup](https://docs.asciidoctor.org/asciidoc/latest/syntax-quick-reference/) language for writing technical content. It is packed with semantic elements and equipped with features to modularize and reuse content. AsciiDoc content can be composed using a text editor, managed in a version control system, and published to multiple output formats.

The Asciidoc framework [Asciidoctor](https://asciidoctor.org/) is a Ruby-based text processor for parsing AsciiDoc into a document model. Asciidoctor converts plain text formats into HTML 5, DocBook 5, manual pages, PDF, and EPUB 3.

### 1.3. reStructuredText

[reStructuredText (rst)](https://docutils.sourceforge.io/rst.html) is a [plain text markup syntax](https://docutils.sourceforge.io/docs/user/rst/quickref.html) and parser system, primary defined and implement as a markup syntax for use in Python docstrings. reStructuredText is a revision and reinterpretation of the [Setext](https://docutils.sourceforge.io/mirror/setext.html) lightweight markup systems, the reStructuredText parser is a component of [Docutils](https://docutils.sourceforge.io/index.html).

[Sphinx](https://www.sphinx-doc.org/en/master/index.html) is a framework for reStructuredText created for Python documentation. Sphinx transforms reStructuredText plain-text files format into HTML (including Windows HTML Help), LaTeX (for printable PDF versions), ePub, Texinfo, and manual pages.

## 2. UML

The [Unified Modeling Language (UML)](https://www.uml.org/) is a universal development modeling language intended to visualize the design of a system.

UML is used to create diagrams:

- Sequence
- Class
- State
- Timeline
- Pie

As non-UML diagrams:

- JSON
- YAML
- Gantt
- mindmap
- Mathematical notation

### 2.1. Mermaid

[Mermaid](https://github.com/mermaid-js/mermaid/) is a diagramming and charting tool that uses [Markdown-inspired text definitions](https://mermaid-js.github.io/mermaid/#/./n00b-syntaxReference) and a renderer to create and modify complex diagrams.

### 2.2. PlantUML

[PlantUML](https://github.com/plantuml/plantuml) generate UML diagram from textual description.

## 3. References

- Sentenz [about web page](../about/web-page.md) article.
- GitHub [markdown](https://github.com/mattcone/markdown-guide) guide.
- docToolchain [docs](http://doctoolchain.org/docToolchain/v2.0.x/index.html) article.
- arc42 [docs](https://arc42.org/) article.
