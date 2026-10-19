"""Regression coverage for staging the symlinked ADR publication tree."""

import importlib.util
from pathlib import Path
import tempfile
import tomllib
import unittest

ROOT = Path(__file__).resolve().parents[2]
SPEC = importlib.util.spec_from_file_location("docs", ROOT / "scripts/docs.py")
DOCS = importlib.util.module_from_spec(SPEC)
SPEC.loader.exec_module(DOCS)


class StagingTests(unittest.TestCase):
    def test_symlinked_pages_assets_updates_and_removals(self):
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            (root / "content").mkdir()
            (root / "docs/decisions").mkdir(parents=True)
            (root / "content/decisions").symlink_to("../docs/decisions", target_is_directory=True)
            page = root / "docs/decisions/001.md"
            page.write_text("# Decision")
            (root / "content/README.md").write_text("# Home")
            (root / "content/logo.svg").write_text("<svg/>")
            config = root / "zensical.toml"
            config.write_text('[project]\nsite_name = "Test"\ndocs_dir = "content"\nexclude_docs = "decisions/draft/"\n')
            before = DOCS.snapshot(root, config)
            generated = DOCS.prepare(config)
            project = tomllib.loads(generated.read_text())["project"]
            self.assertEqual(project["exclude_docs"], "decisions/draft/")
            staging = root / project["docs_dir"]
            self.assertEqual((staging / "decisions/001.md").read_text(), "# Decision")
            self.assertFalse((staging / "decisions").is_symlink())
            self.assertEqual((staging / "logo.svg").read_text(), "<svg/>")
            page.write_text("# Updated decision")
            self.assertNotEqual(before, DOCS.snapshot(root, config))
            DOCS.prepare(config)
            self.assertEqual((staging / "decisions/001.md").read_text(), "# Updated decision")
            page.unlink()
            DOCS.prepare(config)
            self.assertFalse((staging / "decisions/001.md").exists())
            self.assertEqual((root / "content/README.md").read_text(), "# Home")

    def test_extension_is_registered_with_markdown(self):
        import markdown
        html = markdown.markdown("> [!NOTE]\n> Preserved alert.", extensions=["scripts.docs_markdown", "admonition"])
        self.assertIn('class="admonition note"', html)


if __name__ == "__main__":
    unittest.main()
