# Hugo Static Site Generator

This repository uses [Hugo](https://gohugo.io/) as a Static Site Generator (SSG) with CommonMark support via the Goldmark Markdown renderer.

## Overview

Hugo is a fast, flexible static site generator that supports CommonMark-compliant Markdown through its built-in Goldmark renderer. This provides:

- **CommonMark Compliance**: Ensures consistent Markdown rendering across different platforms
- **Extended Markdown**: Support for advanced features like tables, footnotes, and task lists
- **Fast Build Times**: Hugo is known for its exceptional build performance
- **GitHub-style Auto IDs**: Automatic heading ID generation compatible with GitHub

## Setup

### Install Hugo

Run the setup script to install Hugo Extended:

```bash
make setup-hugo
```

Or manually:

```bash
./scripts/setup_hugo.sh
```

This will download and install Hugo Extended version 0.139.3 to `/usr/local/bin`.

### Verify Installation

```bash
hugo version
```

## Usage

### Build the Site

Build the static site using the Makefile:

```bash
make hugo
```

This will:
1. Read the `hugo.yml` configuration
2. Process all Markdown files in the `content/` directory
3. Generate the static site in the `public/` directory

### Development Server

To preview the site locally:

```bash
hugo server
```

Then visit `http://localhost:1313` in your browser.

### Complete Workflow

Run the complete workflow (setup + build):

```bash
make workflow-hugo
```

## Configuration

The Hugo configuration is defined in `hugo.yml` at the root of the repository.

Key configuration highlights:

```yaml
# Goldmark (CommonMark) configuration
markup:
  goldmark:
    renderer:
      unsafe: true  # Allow raw HTML in markdown
    parser:
      autoHeadingID: true
      autoHeadingIDType: "github"  # GitHub-style heading IDs
```

## Content Structure

```
content/
├── _index.md          # Homepage content
├── articles/          # Technical articles
├── guides/            # Comprehensive guides
└── convention/        # Standards and conventions
```

## Deployment

### GitHub Pages

The repository includes a GitHub Actions workflow (`.github/workflows/hugo-pages.yml`) that automatically builds and deploys the site to GitHub Pages when changes are pushed to the main branch.

To enable GitHub Pages:
1. Go to repository Settings → Pages
2. Set Source to "GitHub Actions"
3. The site will be available at `https://sentenz.github.io/convention/`

## Templates

Basic HTML templates are provided in the `layouts/_default/` directory:

- `baseof.html` - Base template with site structure and styling
- `single.html` - Template for individual pages
- `list.html` - Template for section list pages
- `index.html` - Template for the homepage

## CommonMark Features

Hugo's Goldmark renderer supports:

- Standard CommonMark syntax
- GitHub Flavored Markdown (GFM) extensions
- Tables
- Strikethrough
- Task lists
- Automatic heading IDs
- Code blocks with syntax highlighting

## References

- [Hugo Documentation](https://gohugo.io/documentation/)
- [Goldmark (CommonMark) Renderer](https://github.com/yuin/goldmark)
- [CommonMark Specification](https://commonmark.org/)
- [Hugo Markdown Configuration](https://gohugo.io/getting-started/configuration-markup/)
