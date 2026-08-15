#!/usr/bin/env python3
"""Deterministically estimate spoken runtime for supported script languages."""

from __future__ import annotations

import argparse
import json
import re
import sys
from typing import Dict, Union


ENGLISH_WORDS_PER_MINUTE = 150
CHINESE_HAN_CHARACTERS_PER_MINUTE = 240
MINIMUM_SECONDS = 150.0
MAXIMUM_SECONDS = 900.0

_HAN_RE = re.compile(r"[\u3400-\u4dbf\u4e00-\u9fff\uf900-\ufaff]")
_LATIN_WORD_RE = re.compile(r"[A-Za-z]+(?:['’][A-Za-z]+)?(?:-[A-Za-z]+)*")
_GENERAL_WORD_RE = re.compile(r"\b[\w]+(?:['’][\w]+)?(?:-[\w]+)*\b", re.UNICODE)


def classify_seconds(seconds: float) -> str:
    """Classify an estimate against the hard 2.5-to-15-minute range."""
    if seconds < MINIMUM_SECONDS:
        return "too_short"
    if seconds > MAXIMUM_SECONDS:
        return "too_long"
    return "within_range"


def estimate_seconds(text: str, language: str) -> float:
    """Return estimated spoken seconds for English or Simplified Chinese."""
    if language == "en":
        word_count = len(_GENERAL_WORD_RE.findall(text))
        return word_count / ENGLISH_WORDS_PER_MINUTE * 60
    if language == "zh":
        han_count = len(_HAN_RE.findall(text))
        latin_word_count = len(_LATIN_WORD_RE.findall(text))
        return (
            han_count / CHINESE_HAN_CHARACTERS_PER_MINUTE * 60
            + latin_word_count / ENGLISH_WORDS_PER_MINUTE * 60
        )
    raise ValueError("language must be 'en' or 'zh'")


def estimate(text: str, language: str) -> Dict[str, Union[str, int, float]]:
    seconds = estimate_seconds(text, language)
    result: Dict[str, Union[str, int, float]] = {
        "language": language,
        "estimated_seconds": round(seconds, 2),
        "estimated_minutes": round(seconds / 60, 2),
        "status": classify_seconds(seconds),
    }
    if language == "en":
        result["word_count"] = len(_GENERAL_WORD_RE.findall(text))
        result["rate"] = ENGLISH_WORDS_PER_MINUTE
        result["rate_unit"] = "words_per_minute"
    else:
        result["han_character_count"] = len(_HAN_RE.findall(text))
        result["latin_word_count"] = len(_LATIN_WORD_RE.findall(text))
        result["han_rate"] = CHINESE_HAN_CHARACTERS_PER_MINUTE
        result["latin_rate"] = ENGLISH_WORDS_PER_MINUTE
    return result


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--language", choices=("en", "zh"), required=True)
    parser.add_argument(
        "path",
        nargs="?",
        help="UTF-8 script file. If omitted, read the script from standard input.",
    )
    args = parser.parse_args()

    if args.path:
        with open(args.path, "r", encoding="utf-8") as script_file:
            script = script_file.read()
    else:
        script = sys.stdin.read()

    json.dump(estimate(script, args.language), sys.stdout, ensure_ascii=False)
    sys.stdout.write("\n")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
