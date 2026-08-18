#!/bin/sh
set -eu

repo_root=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
skill_dir="$repo_root/skills/voice-to-script-en-ch"

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

require_case_pattern() {
  pattern=$1
  path=$2
  label=$3
  rg -q "$pattern" "$path" || {
    printf 'missing case-sensitive contract: %s\n' "$label" >&2
    exit 1
  }
}

reject_pattern() {
  pattern=$1
  path=$2
  label=$3
  if rg -q --ignore-case "$pattern" "$path"; then
    printf 'stale or forbidden contract: %s\n' "$label" >&2
    exit 1
  fi
}

require_file "$repo_root/README.md"
require_file "$repo_root/LICENSE"
require_file "$repo_root/THIRD_PARTY_NOTICES.md"
require_file "$skill_dir/SKILL.md"
require_file "$skill_dir/agents/openai.yaml"
require_file "$skill_dir/references/story-workflow.md"
require_file "$skill_dir/references/evidence-research.md"
require_file "$skill_dir/references/finalization.md"
require_file "$skill_dir/references/external-polish.md"
require_file "$skill_dir/references/spoken-style.md"
require_file "$skill_dir/scripts/estimate_runtime.py"
require_file "$repo_root/tests/behavioral/fixtures/adaptive-discovery-2026-08-17/final-fix-evaluator-dispatch.md"
require_file "$repo_root/tests/behavioral/fixtures/adaptive-discovery-2026-08-17/final-fix-selected-angle-source.md"
require_file "$repo_root/tests/behavioral/fixtures/adaptive-discovery-2026-08-17/final-fix-scenario-67-turn-1.md"
require_file "$repo_root/tests/behavioral/fixtures/adaptive-discovery-2026-08-17/final-fix-scenario-69.md"
require_file "$repo_root/tests/behavioral/fixtures/adaptive-discovery-2026-08-17/final-fix-results.md"
require_file "$repo_root/tests/behavioral/fixtures/adaptive-discovery-2026-08-17/final-fix-packet-2-output.md"
require_file "$repo_root/tests/behavioral/fixtures/adaptive-discovery-2026-08-17/final-fix-packet-3-output.md"
require_file "$repo_root/tests/behavioral/fixtures/adaptive-discovery-2026-08-17/final-fix-packet-4-output.md"
require_file "$repo_root/tests/behavioral/fixtures/adaptive-discovery-2026-08-17/final-fix-scenario-63-output.md"
require_file "$repo_root/tests/behavioral/fixtures/adaptive-discovery-2026-08-17/final-fix-scenario-65-output.md"
require_file "$repo_root/tests/behavioral/fixtures/adaptive-discovery-2026-08-17/final-fix-scenario-67-output.md"
require_file "$repo_root/tests/behavioral/fixtures/adaptive-discovery-2026-08-17/final-fix-scenario-69-red-output-3.md"
require_file "$repo_root/tests/behavioral/fixtures/adaptive-discovery-2026-08-17/final-fix-scenario-69-red-output-4.md"
require_file "$repo_root/tests/behavioral/fixtures/adaptive-discovery-2026-08-17/final-fix-scenario-69-red-output-5.md"
require_file "$repo_root/tests/behavioral/fixtures/adaptive-discovery-2026-08-17/final-fix-scenario-69-green-output.md"

require_pattern '^name: voice-to-script-en-ch$' "$skill_dir/SKILL.md" 'stable skill name'
require_case_pattern '^  display_name: "voice to script en/ch"$' "$skill_dir/agents/openai.yaml" 'public display name'
require_pattern '\$voice-to-script-en-ch' "$skill_dir/agents/openai.yaml" 'canonical invocation'
require_pattern 'voice-to-script-en-ch' "$repo_root/README.md" 'canonical skill slug'
require_pattern 'npx skills add ruohanus/voice-to-script-en-ch --skill voice-to-script-en-ch -g -a codex -y' "$repo_root/README.md" 'direct GitHub Skills CLI install command'
require_pattern 'npx skills add \./skills/voice-to-script-en-ch -g -a codex -y' "$repo_root/README.md" 'already-cloned Skills CLI install command'
require_pattern '\$HOME/\.agents/skills/voice-to-script-en-ch/' "$repo_root/README.md" 'native Codex user skill location'
require_pattern '\$REPO_ROOT/\.agents/skills/voice-to-script-en-ch/' "$repo_root/README.md" 'native Codex repository skill location'
require_pattern 'third-party.*Skills CLI|Skills CLI.*third-party' "$repo_root/README.md" 'third-party Skills CLI distinction'
require_pattern 'native Codex' "$repo_root/README.md" 'native Codex installation distinction'
require_case_pattern '^# voice to script en/ch$' "$repo_root/README.md" 'lowercase public product name'
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
require_pattern '2.*15.*preferred|preferred.*2.*15' "$skill_dir" 'preferred runtime window'
require_pattern '4.*6.*question' "$skill_dir" 'adaptive discovery batch'
require_pattern 'best-supported angle' "$skill_dir" 'late story-selection checkpoint'
require_pattern 'Claude' "$skill_dir" 'English external-polish handoff'
require_pattern 'DeepSeek' "$skill_dir" 'Chinese external-polish handoff'
require_pattern 'planned_preferred_status' "$skill_dir" 'pre-draft preferred-range state'
require_pattern 'measured_preferred_status' "$skill_dir" 'frozen final measured-range state'
require_pattern 'above-15 first response contract' "$skill_dir" 'positive above-15 response contract'
require_pattern 'scope_choice_required' "$skill_dir" 'unresolved above-15 scope state'
require_pattern 'acknowledge.*preferred window' "$skill_dir" 'above-15 acknowledgement slot'
require_pattern 'only.*one longer video.*short series.*narrower story' "$skill_dir" 'three-option above-15 response shape'
require_pattern 'recommend.*narrative coherence' "$skill_dir" 'above-15 recommendation slot'
require_pattern 'before.*source-sufficiency|before.*source sufficiency' "$skill_dir" 'target-first scope ordering'
require_pattern 'runtime preflight.*before.*other route|before.*other route.*runtime preflight' "$skill_dir" 'runtime preflight route precedence'
require_pattern 'initial.*one.*video.*not.*scope choice|not.*scope choice.*initial.*one.*video' "$skill_dir" 'initial long-video request remains unresolved'
require_pattern 'scope_choice_resolved.*follow-up|follow-up.*scope_choice_resolved' "$skill_dir" 'scope resolution requires checkpoint follow-up'
require_pattern 'angle_revision' "$skill_dir" 'per-angle-revision strengthening state'
require_pattern 'more discovery.*honestly shorter.*additional freestyle.*narrower angle' "$skill_dir" 'unsupported explicit-target choices'
require_pattern 'selected angle.*draft now|draft now.*selected angle|authorized angle.*draft now|draft now.*authorized angle' "$skill_dir" 'phase-aware selected-angle drafting'
require_pattern 'do not infer.*freestyle|never infer.*freestyle' "$skill_dir" 'no-duration immediate-draft stop'
require_pattern 'motive|interiority' "$skill_dir/references/finalization.md" 'motive-inference source audit'
require_pattern 'invalidates.*measured|measured.*invalidates' "$skill_dir/references/finalization.md" 'post-measurement edit invalidation'
require_pattern 'placeholder.*intact|intact.*placeholder' "$skill_dir/references/external-polish.md" 'nonduplicating prompt placeholder rule'
require_pattern 'story invitation' "$skill_dir/references/spoken-style.md" 'story-invitation ending approach'
require_pattern 'callback with new meaning' "$skill_dir/references/spoken-style.md" 'callback ending approach'
require_pattern 'open decision' "$skill_dir/references/spoken-style.md" 'open-decision ending approach'
require_pattern 'concrete final image' "$skill_dir/references/spoken-style.md" 'concrete-image ending approach'
require_pattern 'next real move' "$skill_dir/references/spoken-style.md" 'forward-motion ending approach'
require_pattern 'intended.*aftereffect|aftereffect.*intended' "$skill_dir/references/spoken-style.md" 'viewer-aftereffect ending labels'
require_pattern 'three TikTok' "$skill_dir/references/finalization.md" 'TikTok title options'
require_pattern 'three Instagram' "$skill_dir/references/finalization.md" 'Instagram title packages'
require_case_pattern '笔记标题' "$skill_dir/references/finalization.md" 'Xiaohongshu note title field'
require_case_pattern '封面短句' "$skill_dir/references/finalization.md" 'Xiaohongshu cover phrase field'
require_case_pattern 'Same Story, Better Delivery' "$skill_dir/references/external-polish.md" 'delivery-focused external version'
require_case_pattern 'Same Material, Stronger Storytelling' "$skill_dir/references/external-polish.md" 'structural external version'
require_pattern 'both versions.*default|default.*both versions' "$skill_dir/references/external-polish.md" 'two external versions by default'
require_pattern 'source-truth record' "$skill_dir/references/external-polish.md" 'external source-truth record'
require_pattern 'major beat order' "$skill_dir/references/external-polish.md" 'version-one beat-order lock'
require_pattern 'presentation order' "$skill_dir/references/external-polish.md" 'version-two presentation freedom'
require_pattern 'each version.*three TikTok|three TikTok.*each version' "$skill_dir/references/external-polish.md" 'per-version English titles'
require_case_pattern '每个版本.*三组小红书|三组小红书.*每个版本' "$skill_dir/references/external-polish.md" 'per-version Chinese titles'

require_case_pattern 'Input: English scripts at 299, 300, 2,250, and 2,251 words\.' "$repo_root/tests/behavioral/scenarios.md" 'English preferred boundary vectors'
require_case_pattern 'Input: Chinese scripts at 479, 480, 3,600, and 3,601 Han characters\.' "$repo_root/tests/behavioral/scenarios.md" 'Chinese preferred boundary vectors'
reject_pattern '2\.5-minute minimum|never returns an over-15-minute script|two or three selectable directions' "$repo_root/tests/behavioral/scenarios.md" 'pre-revision behavioral scenarios'

if rg -n '/Users/|Simplified Mandarin|Jenny Hoyos|Jessica McCabe|Struthless|How to ADHD|Tracey Marks' \
  "$repo_root/README.md" "$repo_root/skills" "$repo_root/tests/behavioral"; then
  printf 'public package contains personal paths, deprecated language labels, or named-creator runtime guidance\n' >&2
  exit 1
fi

scenario_count=$(rg -c '^### [0-9]+\.' "$repo_root/tests/behavioral/scenarios.md")
test "$scenario_count" -eq 77 || {
  printf 'expected 77 behavioral scenarios, found %s\n' "$scenario_count" >&2
  exit 1
}

printf 'package smoke checks passed\n'
