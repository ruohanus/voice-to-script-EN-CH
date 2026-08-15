import importlib.util
import json
import subprocess
import sys
import unittest
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
SCRIPT = ROOT / "skills" / "speaking-ideas-into-content" / "scripts" / "estimate_runtime.py"


def load_estimator():
    spec = importlib.util.spec_from_file_location("estimate_runtime", SCRIPT)
    module = importlib.util.module_from_spec(spec)
    assert spec.loader is not None
    spec.loader.exec_module(module)
    return module


class RuntimeEstimatorTests(unittest.TestCase):
    def test_english_boundaries_use_150_words_per_minute(self):
        estimator = load_estimator()
        self.assertEqual(estimator.estimate_seconds("word " * 375, "en"), 150.0)
        self.assertEqual(estimator.estimate_seconds("word " * 2250, "en"), 900.0)
        self.assertEqual(estimator.classify_seconds(149.99), "too_short")
        self.assertEqual(estimator.classify_seconds(150.0), "within_range")
        self.assertEqual(estimator.classify_seconds(900.0), "within_range")
        self.assertEqual(estimator.classify_seconds(900.01), "too_long")

    def test_simplified_chinese_boundaries_use_240_han_characters_per_minute(self):
        estimator = load_estimator()
        self.assertEqual(estimator.estimate_seconds("你" * 600, "zh"), 150.0)
        self.assertEqual(estimator.estimate_seconds("你" * 3600, "zh"), 900.0)

    def test_chinese_mixed_text_counts_han_characters_and_latin_words(self):
        estimator = load_estimator()
        text = ("你" * 240) + " " + ("word " * 150)
        self.assertEqual(estimator.estimate_seconds(text, "zh"), 120.0)

    def test_cli_returns_machine_readable_result(self):
        completed = subprocess.run(
            [sys.executable, str(SCRIPT), "--language", "zh"],
            input="你" * 600,
            text=True,
            capture_output=True,
            check=True,
        )
        result = json.loads(completed.stdout)
        self.assertEqual(result["language"], "zh")
        self.assertEqual(result["estimated_seconds"], 150.0)
        self.assertEqual(result["status"], "within_range")


if __name__ == "__main__":
    unittest.main()
