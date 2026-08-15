#!/bin/sh
set -eu

repo_root=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
skill_dir="$repo_root/skills/speaking-ideas-into-content"

require_file() {
  test -f "$1" || {
    printf 'missing required file: %s\n' "$1" >&2
    exit 1
  }
}

require_pattern() {
  pattern=$1
  path=$2
  label=$3
  rg -q --ignore-case "$pattern" "$path" || {
    printf 'missing contract: %s\n' "$label" >&2
    exit 1
  }
}

require_file "$repo_root/README.md"
require_file "$repo_root/LICENSE"
require_file "$repo_root/THIRD_PARTY_NOTICES.md"
require_file "$skill_dir/SKILL.md"
require_file "$skill_dir/agents/openai.yaml"
require_file "$skill_dir/references/story-workflow.md"
require_file "$skill_dir/references/evidence-research.md"
require_file "$skill_dir/references/finalization.md"
require_file "$skill_dir/scripts/estimate_runtime.py"

require_pattern '^name: speaking-ideas-into-content$' "$skill_dir/SKILL.md" 'stable skill name'
require_pattern 'talking-head video script' "$skill_dir/SKILL.md" 'talking-head trigger'
require_pattern 'approved story contract' "$skill_dir" 'canonical story contract'
require_pattern 'English, Simplified Chinese, or bilingual' "$skill_dir" 'language modes'
require_pattern 'default.*bilingual|bilingual.*default' "$skill_dir" 'bilingual default'
require_pattern 'therefore' "$skill_dir" 'causal story logic'
require_pattern '\bbut\b' "$skill_dir" 'meaningful conflict logic'
require_pattern 'strongest available.*research|research.*capability' "$skill_dir" 'research capability abstraction'
require_pattern 'humanizer' "$skill_dir" 'English polishing dependency'
require_pattern 'shuorenhua' "$skill_dir" 'Chinese polishing dependency'
require_pattern 'return only|output only' "$skill_dir" 'clean final output'
require_pattern '2\.5' "$skill_dir" 'minimum runtime'
require_pattern '15 minutes' "$skill_dir" 'maximum runtime'

if rg -n '/Users/|Simplified Mandarin|Jenny Hoyos|Jessica McCabe|Struthless|How to ADHD|Tracey Marks' \
  "$repo_root/README.md" "$repo_root/skills" "$repo_root/tests/behavioral"; then
  printf 'public package contains personal paths, deprecated language labels, or named-creator runtime guidance\n' >&2
  exit 1
fi

scenario_count=$(rg -c '^### [0-9]+\.' "$repo_root/tests/behavioral/scenarios.md")
test "$scenario_count" -eq 48 || {
  printf 'expected 48 behavioral scenarios, found %s\n' "$scenario_count" >&2
  exit 1
}

printf 'package smoke checks passed\n'
