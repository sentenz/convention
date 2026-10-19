"""Regression tests for Markdown examples and list block ownership."""

import importlib.util
import unittest
from pathlib import Path
from xml.etree import ElementTree

import markdown


ROOT = Path(__file__).resolve().parents[2]
SPEC = importlib.util.spec_from_file_location(
    "docs_markdown", ROOT / "scripts/docs_markdown.py"
)
COMPAT = importlib.util.module_from_spec(SPEC)
SPEC.loader.exec_module(COMPAT)


class MarkdownCompatibilityTests(unittest.TestCase):
    def render(self, source):
        converted = COMPAT.prepare_markdown(source)
        html = markdown.markdown(
            converted, extensions=["admonition", "pymdownx.superfences"]
        )
        return ElementTree.fromstring(f"<article>{html}</article>")

    def test_indented_code_lists_remain_literal(self):
        for source in (
            "    - Literal parent\n      - Literal child",
            "- Parent\n\n        - Literal parent\n          - Literal child",
        ):
            with self.subTest(source=source):
                page = self.render(source)
                code = page.find(".//code")
                self.assertIsNotNone(code)
                self.assertIn("- Literal parent\n  - Literal child", "".join(code.itertext()))

    def test_nested_bullets_preserve_levels_and_siblings(self):
        for indent in ("  ", "    "):
            with self.subTest(indent=len(indent)):
                source = f"- Parent\n{indent}- Child\n{indent}{indent}- Grandchild\n{indent}- Sibling\n- Next\n"
                page = self.render(source)
                self.assertEqual(len(page.findall("./ul/li")), 2)
                self.assertEqual(len(page.findall("./ul/li/ul/li")), 2)
                self.assertEqual(len(page.findall("./ul/li/ul/li/ul/li")), 1)

    def test_mixed_list_indentation_preserves_continuations(self):
        page = self.render(
            "1. Step\n\n    - Child\n      - Grandchild\n\n"
            "        Continued paragraph.\n\n      - Sibling\n\n"
            "    > Step quote.\n\n2. Next\n"
        )
        self.assertEqual(len(page.findall("./ol/li")), 2)
        step = page.find("./ol/li")
        self.assertEqual(len(step.findall("./ul/li/ul/li")), 2)
        self.assertIn("Continued paragraph.", "".join(step.find("./ul/li/ul/li").itertext()))
        self.assertIsNotNone(step.find("./blockquote"))

    def test_nested_list_examples_remain_literal_in_fences(self):
        for fence in ("```", "~~~", "````"):
            with self.subTest(fence=fence):
                literal = "- Parent\n  - Child\n    - Grandchild"
                source = f"{fence}markdown\n{literal}\n{fence}"
                self.assertEqual(COMPAT.prepare_markdown(source), source)
                page = self.render(source)
                self.assertIn(literal, "".join(page.find(".//code").itertext()))
                self.assertIsNone(page.find("./ul"))

    def test_fenced_examples_keep_relative_indentation_inside_nested_lists(self):
        page = self.render(
            "- Parent\n  - Child\n\n    ```markdown\n"
            "    - Literal parent\n      - Literal child\n    ```\n\n  - Sibling\n"
        )
        self.assertEqual(len(page.findall("./ul/li/ul/li")), 2)
        code = page.find("./ul/li/ul/li//code")
        self.assertIsNotNone(code)
        self.assertIn("- Literal parent\n  - Literal child", "".join(code.itertext()))

    def test_fenced_alert_examples_remain_literal(self):
        for fence in ("```", "~~~", "````", "~~~~"):
            with self.subTest(fence=fence):
                example = f"{fence}markdown\n> [!NOTE]\n> Literal alert.\n{fence}"
                source = example + "\n\n> [!TIP]\n> Live alert."
                converted = COMPAT.prepare_markdown(source)
                self.assertIn(example, converted)
                page = self.render(source)
                code = page.find(".//code")
                self.assertIn("> [!NOTE]\n> Literal alert.", "".join(code.itertext()))
                self.assertEqual(len(page.findall("./div[@class='admonition tip']")), 1)
                self.assertIsNone(page.find(".//div[@class='admonition note']"))

    def test_shorter_or_mismatched_fences_do_not_end_example(self):
        for inner in ("```", "~~~", "````not-a-closer"):
            with self.subTest(inner=inner):
                source = f"````markdown\n{inner}\n> [!NOTE]\n> Literal.\n````"
                self.assertEqual(COMPAT.prepare_markdown(source), source)

    def test_list_nested_fenced_alert_example(self):
        source = (
            "- Examples\n\n"
            "  ```markdown\n"
            "  > [!NOTE]\n"
            "  > Literal alert.\n"
            "  ```\n\n"
            "  > [!TIP]\n"
            "  > Live alert."
        )
        page = self.render(source)
        item = page.find("./ul/li")
        self.assertIn("> [!NOTE]", "".join(item.find(".//code").itertext()))
        self.assertIsNotNone(item.find("./div[@class='admonition tip']"))
        self.assertIsNone(item.find(".//div[@class='admonition note']"))

    def test_peer_blockquotes_stay_outside_nested_list(self):
        for quote in ("> Peer quote.", "> [!NOTE]\n    > Peer note."):
            with self.subTest(quote=quote):
                source = f"1. Step\n\n    - Child\n\n    {quote}"
                step = self.render(source).find("./ol/li")
                child = step.find("./ul/li")
                self.assertEqual("".join(child.itertext()).strip(), "Child")
                self.assertEqual(len(step), 3)
                self.assertIn(step[2].tag, ("blockquote", "div"))

    def test_shallower_blockquotes_end_list_continuations(self):
        source = "1. Step\n\n    - Child\n\n> [!NOTE]\n> Outside."
        page = self.render(source)
        self.assertIsNotNone(page.find("./div[@class='admonition note']"))
        self.assertIsNone(page.find("./ol//div[@class='admonition note']"))

    def test_deeper_blockquotes_remain_list_children(self):
        source = "1. Step\n\n    - Child\n\n      > [!NOTE]\n      > Nested."
        page = self.render(source)
        self.assertIsNotNone(page.find("./ol/li/ul/li/div[@class='admonition note']"))


if __name__ == "__main__":
    unittest.main()
