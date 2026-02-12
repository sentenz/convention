"""MkDocs hooks for dynamic navigation and CommonMark rendering."""

from __future__ import annotations

import re
from html import escape
from pathlib import Path
from typing import Any

from markdown_it import MarkdownIt
from pygments import highlight as pygments_highlight
from pygments.formatters import HtmlFormatter
from pygments.lexers import get_lexer_by_name
from pygments.util import ClassNotFound

_PYGMENTS_FORMATTER = HtmlFormatter(cssclass="highlight")

_ALERT_TYPE_MAP: dict[str, tuple[str, str]] = {
    "NOTE": ("note", "Note"),
    "TIP": ("tip", "Tip"),
    "IMPORTANT": ("important", "Important"),
    "WARNING": ("warning", "Warning"),
    "CAUTION": ("danger", "Caution"),
}

_ALERT_BLOCK_RE = re.compile(
    r"<blockquote>\n<p>\[!(?P<type>"
    + "|".join(_ALERT_TYPE_MAP)
    + r")\]\n?(?P<content>.*?)</blockquote>",
    re.DOTALL,
)


def _convert_alerts(html: str) -> str:
    """Convert GitHub-style alert blockquotes into Material admonition divs.

    Transforms ``<blockquote><p>[!NOTE]…</blockquote>`` produced by the
    CommonMark renderer into ``<div class="admonition note">…</div>``
    recognised by the Material for MkDocs theme.
    """

    def _replace(match: re.Match) -> str:
        alert_type = match.group("type")
        css_class, title = _ALERT_TYPE_MAP[alert_type]
        content = match.group("content")
        return (
            f'<div class="admonition {css_class}">\n'
            f'<p class="admonition-title">{title}</p>\n'
            f"<p>{content}</div>\n"
        )

    return _ALERT_BLOCK_RE.sub(_replace, html)


def _render_fence(
    self: Any,
    tokens: list,
    idx: int,
    options: dict,
    env: dict,
) -> str:
    """Render fenced code blocks using Pygments for syntax highlighting.

    Produces ``<div class="highlight"><pre>…</pre></div>`` markup that is
    compatible with the Material for MkDocs theme and will **not** be
    double-wrapped by ``pymdownx.highlight``.
    """
    token = tokens[idx]
    info = token.info.strip() if token.info else ""
    lang = info.split()[0] if info else ""
    code = token.content

    if lang == "mermaid":
        return f'<pre class="mermaid">{escape(code)}</pre>\n'

    try:
        lexer = get_lexer_by_name(lang) if lang else get_lexer_by_name("text")
    except ClassNotFound:
        lexer = get_lexer_by_name("text")

    return pygments_highlight(code, lexer, _PYGMENTS_FORMATTER)


def _render_code_block(
    self: Any,
    tokens: list,
    idx: int,
    options: dict,
    env: dict,
) -> str:
    """Render indented code blocks using Pygments."""
    code = tokens[idx].content
    lexer = get_lexer_by_name("text")
    return pygments_highlight(code, lexer, _PYGMENTS_FORMATTER)


_commonmark = MarkdownIt("commonmark", {"html": True})
_commonmark.enable("table")
_commonmark.add_render_rule("fence", _render_fence)
_commonmark.add_render_rule("code_block", _render_code_block)


def _format_title(value: str) -> str:
    """Convert a file or directory name into a readable title."""
    return value.replace("-", " ").replace("_", " ").title()


def _sorted_markdown_files(
    path: Path, *, exclude: set[str] | None = None
) -> list[Path]:
    """Return markdown files sorted with README.md first."""
    skip = {name.lower() for name in (exclude or set())}
    return sorted(
        (
            entry
            for entry in path.iterdir()
            if entry.is_file()
            and entry.suffix == ".md"
            and entry.name.lower() not in skip
        ),
        key=lambda item: (item.name.lower() != "readme.md", item.name.lower()),
    )


def _nav_entry(markdown_file: Path, root: Path) -> dict[str, str]:
    """Create a MkDocs nav entry for a markdown file."""
    relative_path = markdown_file.relative_to(root).as_posix()
    title = (
        "Home"
        if relative_path.lower() == "readme.md"
        else _format_title(markdown_file.stem)
    )
    return {title: relative_path}


def on_config(config: Any, **kwargs: Any) -> Any:
    """Generate navigation based on top-level folders in the content directory."""
    docs_root = Path(config["docs_dir"])

    nav: list[Any] = []

    for markdown_file in _sorted_markdown_files(docs_root, exclude={"index.md"}):
        nav.append(_nav_entry(markdown_file, docs_root))

    for directory in sorted(
        (entry for entry in docs_root.iterdir() if entry.is_dir()),
        key=lambda item: item.name.lower(),
    ):
        section_items = [
            _nav_entry(markdown_file, docs_root)
            for markdown_file in _sorted_markdown_files(directory)
        ]
        if section_items:
            nav.append({_format_title(directory.name): section_items})

    config["nav"] = nav

    return config


def on_page_markdown(markdown: str, **kwargs: Any) -> str:
    """Render markdown using a CommonMark-compliant parser before MkDocs processing."""
    html = _commonmark.render(markdown)
    return _convert_alerts(html)
