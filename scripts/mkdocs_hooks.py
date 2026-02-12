"""MkDocs hooks for dynamic navigation and CommonMark rendering."""

from __future__ import annotations

from pathlib import Path
from typing import Any

from markdown_it import MarkdownIt


_commonmark = MarkdownIt("commonmark", {"html": True})


def _format_title(value: str) -> str:
    """Convert a file or directory name into a readable title."""
    return value.replace("-", " ").replace("_", " ").title()


def _sorted_markdown_files(path: Path) -> list[Path]:
    """Return markdown files sorted with README.md first."""
    return sorted(
        (entry for entry in path.iterdir() if entry.is_file() and entry.suffix == ".md"),
        key=lambda item: (item.name.lower() != "readme.md", item.name.lower()),
    )


def _nav_entry(markdown_file: Path, root: Path) -> dict[str, str]:
    """Create a MkDocs nav entry for a markdown file."""
    relative_path = markdown_file.relative_to(root).as_posix()
    title = "Home" if relative_path.lower() == "readme.md" else _format_title(markdown_file.stem)
    return {title: relative_path}


def on_config(config: Any, **kwargs: Any) -> Any:
    """Generate navigation based on top-level folders in the content directory."""
    docs_root = Path(config["docs_dir"])

    nav: list[Any] = []

    for markdown_file in _sorted_markdown_files(docs_root):
        nav.append(_nav_entry(markdown_file, docs_root))

    for directory in sorted((entry for entry in docs_root.iterdir() if entry.is_dir()), key=lambda item: item.name.lower()):
        section_items = [_nav_entry(markdown_file, docs_root) for markdown_file in _sorted_markdown_files(directory)]
        if section_items:
            nav.append({_format_title(directory.name): section_items})

    config["nav"] = nav

    return config


def on_page_markdown(markdown: str, **kwargs: Any) -> str:
    """Render markdown using a CommonMark-compliant parser before MkDocs processing."""
    return _commonmark.render(markdown)
