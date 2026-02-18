# MkDocs Convention Plugin

A MkDocs plugin for dynamic navigation generation and GitHub alert conversion, harmonized with Material for MkDocs.

## Features

- **Dynamic Navigation Generation**: Automatically generates navigation based on the directory structure in your `docs_dir`
- **GitHub Alerts Conversion**: Converts GitHub-style alert blockquotes to MkDocs admonitions
- **CommonMark Compatibility**: Normalizes CommonMark-style formatting for Python-Markdown compatibility
- **Material for MkDocs Integration**: Designed to work seamlessly with Material for MkDocs theme

## Installation

### Local Installation

From the repository root:

```bash
pip install -e .
```

### Production Installation

```bash
pip install mkdocs-convention-plugin
```

## Usage

Add the plugin to your `mkdocs.yml`:

```yaml
plugins:
  - search
  - convention
```

### Configuration Options

```yaml
plugins:
  - convention:
      enabled: true          # Enable/disable the plugin (default: true)
      generate_nav: true     # Enable/disable automatic navigation generation (default: true)
      convert_alerts: true   # Enable/disable GitHub alerts conversion (default: true)
```

## Features in Detail

### Dynamic Navigation Generation

The plugin automatically generates navigation based on your content directory structure:

- Top-level markdown files (excluding `index.md`) are added as main navigation items
- `README.md` files are titled as "Home"
- Directories become navigation sections with their markdown files as items
- Files and directories are sorted alphabetically (with README.md first in each directory)
- File and directory names are converted to readable titles (hyphens and underscores become spaces)

### GitHub Alerts Conversion

Converts GitHub-style alert blockquotes to MkDocs admonitions:

**Input (GitHub style):**
```markdown
> [!NOTE]
> This is a note
```

**Output (MkDocs admonition):**
```markdown
!!! note "Note"
    This is a note
```

Supported alert types:
- `[!NOTE]` → `!!! note`
- `[!TIP]` → `!!! tip`
- `[!IMPORTANT]` → `!!! important`
- `[!WARNING]` → `!!! warning`
- `[!CAUTION]` → `!!! danger`

Custom titles are supported:
```markdown
> [!NOTE] Custom Title
> Content here
```

### CommonMark Compatibility

The plugin normalizes several CommonMark formatting patterns for Python-Markdown:

- TOC section indentation (converts 2-space to 4-space nesting)
- List item blockquote indentation
- Nested block elements in lists

## Migration from Hooks

If you were previously using the `scripts/python/mkdocs_hooks.py` file, you can now remove it and the `hooks` section from your `mkdocs.yml`:

**Before:**
```yaml
hooks:
  - scripts/python/mkdocs_hooks.py

plugins:
  - search
```

**After:**
```yaml
plugins:
  - search
  - convention
```

## License

Apache-2.0
