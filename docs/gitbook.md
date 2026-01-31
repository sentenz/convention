# GitBook Documentation

This repository uses [HonKit](https://github.com/honkit/honkit) (a maintained GitBook fork) to generate static documentation with strict CommonMark compliance.

## Features

- **Static Site Generation**: GitBook-compatible SSG using HonKit
- **CommonMark Compliance**: Strict CommonMark markdown rendering
- **Navigation**: Automatic navigation from `content/articles/` and `content/guides/`
- **GitHub Pages**: Automated deployment via GitHub Actions

## Local Development

### Prerequisites

- Node.js >= 14.0.0
- npm

### Setup

```bash
# Install dependencies
make setup-pages

# Or manually
npm install
```

### Build

```bash
# Build the documentation
make pages

# Or manually
npx honkit build . _book
```

### Serve Locally

```bash
# Serve with live reload
npx honkit serve
```

The documentation will be available at `http://localhost:4000`.

## Project Structure

```
.
├── README.md              # Main documentation page
├── SUMMARY.md            # Navigation structure (auto-generated)
├── book.json             # GitBook configuration
├── content/
│   ├── articles/         # Technical articles
│   ├── guides/           # How-to guides
│   └── convention/       # Convention documents
├── styles/
│   └── website.css       # Custom styling
└── scripts/
    └── generate_summary.sh  # Navigation generator
```

## Navigation

The navigation structure (`SUMMARY.md`) is automatically generated from the markdown files in:
- `content/articles/`
- `content/guides/`
- `content/convention/`

To regenerate the navigation:

```bash
./scripts/generate_summary.sh
```

## GitHub Pages Deployment

Documentation is automatically built and deployed to GitHub Pages on every push to the `main` branch via the `.github/workflows/gitbook-pages.yml` workflow.

### Workflow Steps

1. Checkout repository
2. Setup Node.js environment
3. Install dependencies
4. Generate navigation (SUMMARY.md)
5. Build documentation with HonKit
6. Deploy to GitHub Pages

## Configuration

### book.json

The `book.json` file contains the GitBook configuration:

- **title**: Documentation title
- **description**: Site description
- **language**: Content language (en)
- **structure**: File structure configuration
- **plugins**: GitBook plugins (currently minimal)
- **styles**: Custom CSS files

### Customization

To customize the appearance, edit:
- `styles/website.css` - Custom CSS styles
- `book.json` - GitBook configuration

## CommonMark Compliance

HonKit uses the CommonMark specification for markdown rendering, ensuring:
- Consistent markdown interpretation
- Predictable rendering behavior
- Standards-based documentation

## References

- [HonKit Documentation](https://github.com/honkit/honkit)
- [CommonMark Specification](https://commonmark.org/)
- [GitBook Legacy Documentation](https://github.com/GitbookIO/gitbook)
