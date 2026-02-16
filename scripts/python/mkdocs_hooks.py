"""MkDocs hooks for dynamic navigation and CommonMark compatibility."""

from __future__ import annotations

import re
from pathlib import Path
from typing import Any

_ALERT_TYPE_MAP: dict[str, tuple[str, str]] = {
    "NOTE": ("note", "Note"),
    "TIP": ("tip", "Tip"),
    "IMPORTANT": ("important", "Important"),
    "WARNING": ("warning", "Warning"),
    "CAUTION": ("danger", "Caution"),
}

_ALERT_MARKER_RE = re.compile(
    r"^\[!(?P<type>NOTE|TIP|IMPORTANT|WARNING|CAUTION)\]\s*(?P<title>.*)$"
)
_LIST_ITEM_RE = re.compile(r"^(?P<indent>\s*)(?P<marker>(?:[-*+]|\d+[.)]))(?P<gap>\s+)")
_TOC_ITEM_RE = re.compile(
    r"^(?P<indent>\s*)[-*+]\s+\[[^\]]+\]\(#[-a-zA-Z0-9_:.%]+\)\s*$"
)
_FENCE_MARKERS = ("```", "~~~")


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


def on_config(config: Any, **_kwargs: Any) -> Any:
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


def _read_blockquote(lines: list[str], start: int) -> tuple[list[str], int, str]:
    """Read consecutive blockquote lines from ``start`` index."""
    quote_block: list[str] = []
    index = start
    base_indent = " " * (len(lines[start]) - len(lines[start].lstrip(" ")))

    while index < len(lines):
        candidate = lines[index]
        candidate_stripped = candidate.lstrip()
        if not candidate_stripped.startswith(">"):
            break
        content = candidate_stripped[1:]
        if content.startswith(" "):
            content = content[1:]

        if _ALERT_MARKER_RE.match(content) and any(
            part.strip() for part in quote_block
        ):
            break

        quote_block.append(content)
        index += 1

    return quote_block, index, base_indent


def _alert_block_to_admonition(
    quote_block: list[str], base_indent: str
) -> list[str] | None:
    """Convert a quote block to admonition markdown if it starts with an alert marker."""
    if not quote_block:
        return None

    marker_index = 0
    while marker_index < len(quote_block) and not quote_block[marker_index].strip():
        marker_index += 1

    if marker_index >= len(quote_block):
        return None

    match = _ALERT_MARKER_RE.match(quote_block[marker_index])
    if not match:
        return None

    alert_type = match.group("type")
    css_class, default_title = _ALERT_TYPE_MAP[alert_type]
    custom_title = match.group("title").strip()
    title = custom_title or default_title

    converted = [f'{base_indent}!!! {css_class} "{title}"']
    for body_line in quote_block[marker_index + 1 :]:
        converted.append(f"{base_indent}    {body_line}" if body_line else "")

    if len(converted) == 1:
        converted.append("")

    return converted


def _line_indent(line: str) -> int:
    """Return leading-space indentation width."""
    return len(line) - len(line.lstrip(" "))


def _normalize_toc_section_block(lines: list[str], start: int, end: int) -> None:
    """Normalize indentation for one contiguous TOC list block."""
    toc_indents = sorted(
        {
            len(match.group("indent"))
            for line in lines[start:end]
            for match in [_TOC_ITEM_RE.match(line)]
            if match is not None
        }
    )
    indent_to_level = {indent: level for level, indent in enumerate(toc_indents)}

    for index in range(start, end):
        line = lines[index]
        match = _TOC_ITEM_RE.match(line)
        if match is None:
            continue
        raw_indent = len(match.group("indent"))
        level = indent_to_level[raw_indent]
        normalized_indent = " " * (level * 4)
        lines[index] = f"{normalized_indent}{line.lstrip()}"


def _normalize_toc_sections(markdown: str) -> str:
    """Normalize TOC sections that use internal-anchor list links.

    Dedicated pass for nested TOC lists, so CommonMark-style 2-space nesting
    is converted into stable 4-space levels for Python-Markdown.
    """

    lines = markdown.splitlines()
    index = 0

    while index < len(lines):
        if _TOC_ITEM_RE.match(lines[index]) is None:
            index += 1
            continue

        start = index
        toc_item_count = 0
        while index < len(lines):
            line = lines[index]
            if not line.strip():
                index += 1
                continue
            if _TOC_ITEM_RE.match(line) is None:
                break
            toc_item_count += 1
            index += 1

        end = index
        if toc_item_count >= 2:
            _normalize_toc_section_block(lines, start, end)

    return "\n".join(lines)


def _normalize_list_item_indent_for_nested_block(
    lines: list[str], item_index: int, item_indent: int
) -> int:
    """Normalize list item indent when it contains nested block syntax."""
    if item_indent % 4 == 0:
        return item_indent

    scan = item_index + 1
    while scan < len(lines) and not lines[scan].strip():
        scan += 1

    if scan >= len(lines):
        return item_indent

    candidate = lines[scan]
    if _line_indent(candidate) <= item_indent:
        return item_indent

    candidate_stripped = candidate.lstrip(" ")
    is_fence = _fence_marker(candidate_stripped) is not None
    is_blockquote = candidate_stripped.startswith(">")

    normalized_indent = item_indent
    if is_fence or is_blockquote:
        normalized_indent = ((item_indent // 4) + 1) * 4
    else:
        previous_sibling_indent = _previous_sibling_list_indent(
            lines, item_index, item_indent
        )
        if (
            previous_sibling_indent is not None
            and previous_sibling_indent > item_indent
        ):
            normalized_indent = previous_sibling_indent

    if normalized_indent == item_indent:
        return item_indent

    lines[item_index] = f'{" " * normalized_indent}{lines[item_index].lstrip()}'
    return normalized_indent


def _is_list_item(line: str) -> bool:
    """Check whether a line starts a list item."""
    return _LIST_ITEM_RE.match(line) is not None


def _previous_sibling_list_indent(
    lines: list[str], item_index: int, item_indent: int
) -> int | None:
    """Return indentation of the previous sibling list item when available."""
    index = item_index - 1

    while index >= 0:
        candidate = lines[index]
        stripped = candidate.lstrip(" ")

        if not stripped:
            index -= 1
            continue

        if stripped.startswith(">") or _fence_marker(stripped) is not None:
            index -= 1
            continue

        match = _LIST_ITEM_RE.match(candidate)
        if match is None:
            return None

        indent = len(match.group("indent"))
        if indent <= item_indent + 3:
            return indent

        return None

    return None


def _is_list_break(line: str, item_indent: int) -> bool:
    """Decide if a line starts a sibling or parent list item."""
    return _is_list_item(line) and _line_indent(line) <= item_indent + 3


def _fence_marker(stripped_line: str) -> str | None:
    """Return fence marker if line starts with a fenced-code delimiter."""
    for marker in _FENCE_MARKERS:
        if stripped_line.startswith(marker):
            return marker
    return None


def _insert_blank_before_immediate_list_block(
    lines: list[str], item_index: int, item_indent: int
) -> int:
    """Separate immediate nested blockquotes under list items with a blank line."""
    next_index = item_index + 1
    if next_index >= len(lines):
        return item_index

    candidate = lines[next_index]
    if not candidate.strip():
        return item_index

    candidate_stripped = candidate.lstrip(" ")
    has_nested_blockquote = candidate_stripped.startswith(">")

    if _line_indent(candidate) >= item_indent and has_nested_blockquote:
        lines.insert(next_index, "")
        return item_index + 1

    return item_index


def _set_line_indentation_if_needed(
    lines: list[str],
    index: int,
    stripped_line: str,
    current_indent: int,
    desired_indent: int,
) -> None:
    """Set line indentation to the desired level when current is smaller."""
    if current_indent < desired_indent:
        lines[index] = f'{" " * desired_indent}{stripped_line}'


def _should_stop_list_continuation_scan(
    active_fence_marker: str | None,
    candidate_line: str,
    stripped_line: str,
    candidate_indent: int,
    item_indent: int,
    line_fence_marker: str | None,
) -> bool:
    """Return whether continuation scan should stop for current list item."""
    if active_fence_marker is not None:
        return False

    if _is_list_break(candidate_line, item_indent):
        return True

    return (
        candidate_indent <= item_indent
        and not stripped_line.startswith(">")
        and line_fence_marker is None
    )


def _normalize_list_item_continuation_blocks(
    lines: list[str], item_index: int, item_indent: int
) -> None:
    """Normalize continuation blocks for a specific list item."""
    look_ahead = item_index + 1
    active_fence_marker: str | None = None
    desired_indent = item_indent + 4

    while look_ahead < len(lines):
        candidate = lines[look_ahead]
        stripped = candidate.lstrip(" ")
        candidate_indent = _line_indent(candidate)
        line_fence_marker = _fence_marker(stripped)

        if not stripped:
            look_ahead += 1
            continue

        if _should_stop_list_continuation_scan(
            active_fence_marker,
            candidate,
            stripped,
            candidate_indent,
            item_indent,
            line_fence_marker,
        ):
            break

        if active_fence_marker is not None:
            _set_line_indentation_if_needed(
                lines, look_ahead, stripped, candidate_indent, desired_indent
            )
            if line_fence_marker == active_fence_marker:
                active_fence_marker = None
            look_ahead += 1
            continue

        if line_fence_marker is not None:
            _set_line_indentation_if_needed(
                lines, look_ahead, stripped, candidate_indent, desired_indent
            )
            active_fence_marker = line_fence_marker
            look_ahead += 1
            continue

        if stripped.startswith(">") and candidate_indent < desired_indent:
            lines[look_ahead] = f'{" " * desired_indent}{stripped}'

        look_ahead += 1


def _normalize_list_blockquote_indentation(markdown: str) -> str:
    """Normalize CommonMark list-item blockquote indentation.

    CommonMark accepts list continuations like ``  >`` beneath a list item,
    while Python-Markdown usually expects at least four spaces relative to the
    list item indentation for nested block elements.
    """

    lines = markdown.splitlines()
    index = 0
    active_fence_marker: str | None = None

    while index < len(lines):
        stripped_line = lines[index].lstrip(" ")
        line_fence_marker = _fence_marker(stripped_line)

        if line_fence_marker is not None:
            if active_fence_marker is None:
                active_fence_marker = line_fence_marker
            elif line_fence_marker == active_fence_marker:
                active_fence_marker = None
            index += 1
            continue

        if active_fence_marker is not None:
            index += 1
            continue

        match = _LIST_ITEM_RE.match(lines[index])
        if not match:
            index += 1
            continue

        item_indent = len(match.group("indent"))
        item_indent = _normalize_list_item_indent_for_nested_block(
            lines, index, item_indent
        )
        index = _insert_blank_before_immediate_list_block(lines, index, item_indent)
        _normalize_list_item_continuation_blocks(lines, index, item_indent)

        index += 1

    return "\n".join(lines)


def _convert_github_alerts(markdown: str) -> str:
    """Convert GitHub alert blockquotes to MkDocs admonition markdown.

    This keeps the content as markdown so MkDocs extensions and Material
    features (TOC/permalinks, code copy, tabs, etc.) still run as usual.
    """

    normalized_markdown = _normalize_toc_sections(markdown)
    normalized_markdown = _normalize_list_blockquote_indentation(normalized_markdown)
    lines = normalized_markdown.splitlines()
    converted: list[str] = []
    index = 0

    while index < len(lines):
        raw_line = lines[index]
        if not raw_line.lstrip().startswith(">"):
            converted.append(raw_line)
            index += 1
            continue

        quote_start = index
        quote_block, index, base_indent = _read_blockquote(lines, index)
        admonition_block = _alert_block_to_admonition(quote_block, base_indent)

        if admonition_block is None:
            converted.extend(lines[quote_start:index])
        else:
            converted.extend(admonition_block)

    return "\n".join(converted)


def on_page_markdown(markdown: str, **_kwargs: Any) -> str:
    """Pre-process markdown while keeping MkDocs markdown extension pipeline."""
    return _convert_github_alerts(markdown)
