"""Markdown compatibility preprocessing adapted from sentenz/convention.

Adapted from sentenz/skills at 108ae2ca08adc1e464212be52c3a74db0a075873.
"""

from __future__ import annotations

import re

from markdown.extensions import Extension
from markdown.preprocessors import Preprocessor

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
_FENCE_MARKERS = ("```", "~~~")


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


def _normalize_list_indentation(markdown: str) -> str:
    """Map source list nesting to Python-Markdown's four-space levels.

    Track source indentation separately from output indentation so two- and
    four-space lists, their continuation blocks, and dedents retain ownership.
    Fenced examples keep their contents and relative indentation unchanged.
    """
    output: list[str] = []
    stack: list[tuple[int, int]] = []
    active_fence: str | None = None
    fence_shift = 0

    for line in markdown.splitlines():
        stripped = line.lstrip(" ")
        indent = _line_indent(line)
        fence = re.match(r"(`{3,}|~{3,})(.*)$", stripped)

        if active_fence is not None:
            output.append(" " * fence_shift + line if line else line)
            if (
                fence is not None
                and fence[1][0] == active_fence[0]
                and len(fence[1]) >= len(active_fence)
                and not fence[2].strip()
            ):
                active_fence = None
            continue

        if not stripped:
            output.append(line)
            continue

        while stack and indent <= stack[-1][0]:
            stack.pop()

        item = _LIST_ITEM_RE.match(line)
        if item is not None:
            # A standalone indented block is code, not a new list.
            if not stack and indent >= 4:
                output.append(line)
                continue
            # Do not reinterpret an indented code example inside a list as a
            # child item. Its indentation is relative to the owning item.
            if stack and indent >= stack[-1][0] + 8:
                source_indent, target_indent = stack[-1]
                output.append(" " * (target_indent + indent - source_indent) + stripped)
                continue
            normalized = stack[-1][1] + 4 if stack else indent
            stack.append((indent, normalized))
            if output and output[-1].lstrip().startswith(">"):
                output.append("")
            output.append(" " * normalized + stripped)
            continue

        shift = 0
        if stack:
            source_indent, target_indent = stack[-1]
            shift = target_indent - source_indent + max(0, 4 - (indent - source_indent))
        output.append(" " * shift + line)
        if fence is not None:
            active_fence = fence[1]
            fence_shift = shift

    return "\n".join(output)


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
    candidate_indent: int,
    item_indent: int,
    line_fence_marker: str | None,
) -> bool:
    """Return whether continuation scan should stop for current list item."""
    if active_fence_marker is not None:
        return False

    if _is_list_break(candidate_line, item_indent):
        return True

    # Peer and parent blockquotes belong outside this list item.
    return candidate_indent <= item_indent and line_fence_marker is None


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
    """Convert GitHub alert blockquotes to Python Markdown admonition syntax.

    This keeps the content as markdown so Markdown extensions and the theme
    features (TOC/permalinks, code copy, tabs, etc.) still run as usual.
    """

    normalized_markdown = _normalize_list_indentation(markdown)
    normalized_markdown = _normalize_list_blockquote_indentation(normalized_markdown)
    lines = normalized_markdown.splitlines()
    converted: list[str] = []
    index = 0
    active_fence: str | None = None

    while index < len(lines):
        raw_line = lines[index]
        stripped_line = raw_line.lstrip()
        fence_match = re.match(r"(`{3,}|~{3,})(.*)$", stripped_line)

        if active_fence is not None:
            # Only a bare delimiter of the same kind and sufficient length closes
            # the example; shorter or mismatched fences remain literal content.
            if (
                fence_match is not None
                and fence_match[1][0] == active_fence[0]
                and len(fence_match[1]) >= len(active_fence)
                and not fence_match[2].strip()
            ):
                active_fence = None
            converted.append(raw_line)
            index += 1
            continue

        if fence_match is not None:
            active_fence = fence_match[1]

        if not stripped_line.startswith(">"):
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


def prepare_markdown(markdown: str) -> str:
    """Pre-process Markdown before the Zensical extension pipeline."""
    return _convert_github_alerts(markdown)


# Zensical does not execute MkDocs hooks; register a Markdown preprocessor.


class ConventionMarkdown(Preprocessor):
    def run(self, lines):
        return prepare_markdown("\n".join(lines)).splitlines()


class ConventionExtension(Extension):
    def extendMarkdown(self, md):
        md.preprocessors.register(ConventionMarkdown(md), "convention_markdown", 35)


def makeExtension(**kwargs):
    return ConventionExtension(**kwargs)
