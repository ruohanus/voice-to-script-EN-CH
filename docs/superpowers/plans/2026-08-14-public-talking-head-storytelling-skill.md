# Public Talking-Head Storytelling Skill Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Revise `speaking-ideas-into-content` into a public, general-purpose skill that turns spoken material into evidence-aware, story-driven talking-head scripts in English, Simplified Mandarin, or both.

**Architecture:** Keep the runtime package lean: `SKILL.md` owns the staged workflow and language routing, while `agents/openai.yaml` owns UI discovery metadata. Keep deterministic contract tests and public installation guidance outside the runtime skill directory. Use external language-specific polishing skills only at finalization: `humanizer` for English and `shuorenhua` for Simplified Mandarin.

**Tech Stack:** Markdown, YAML, POSIX shell, ripgrep, Git, the official Codex skill validator, external Codex skills, and fresh-context subagents for behavioral evaluation.

## Global Constraints

- Skill folder and frontmatter name remain `speaking-ideas-into-content`.
- The public runtime package contains only `SKILL.md` and `agents/openai.yaml`.
- The intended audience is a runtime input; no profession, diagnosis, industry, or demographic is a default.
- The default delivery tone is reflective and conversational, like speaking thoughtfully to one viewer.
- Output modes are English, Simplified Mandarin, and bilingual; bilingual is the default when the user does not choose.
- Final talking-head scripts run for at least 2.5 minutes and no more than 15 minutes without padding.
- English runtime may use approximately 150 words per minute; Simplified Mandarin runtime uses natural spoken cadence rather than an English word-count formula.
- Stage 1 produces a discovery workbench and two or three selectable narrative directions, not a finished script.
- Every narrative direction starts with an honest question and advances through causal `therefore` beats and meaningful `but` conflicts toward resolution.
- Research is conditional. Use `agent-reach` only when a claim benefits from validation or educational context, with a slight preference for established theories and frameworks.
- The user selects evidence before it enters the script.
- Stage 4 uses `humanizer` for English and `shuorenhua` for Simplified Mandarin as embedded polishing passes.
- Finalization returns only the requested teleprompter script or scripts and their light delivery notes; diagnostics, drafts, critiques, research logs, word counts, and runtime calculations remain internal.
- Bilingual output preserves story, claims, evidence strength, and resolution while adapting Simplified Mandarin for Chinese-speaking viewers rather than translating line by line.
- Never invent experiences, conflicts, vulnerability, composite details, quotations, statistics, evidence, diagnoses, or certainty.
- Personal, client, team, or composite story material may be used only when the user supplies or authorizes it.
- A missing required polishing dependency produces installation guidance instead of a silently degraded final script.

---

### Task 1: Capture failing contracts and baseline behavior

**Files:**
- Create: `tests/test_skill_contract.sh`
- Create: `tests/behavioral-scenarios.md`
- Create: `tests/baseline-results.md`
- Test: `skills/speaking-ideas-into-content/SKILL.md`

**Interfaces:**
- Consumes: the current public-repository skill and the approved design specification.
- Produces: a deterministic contract test plus uncontaminated evidence of the current skill's storytelling, research, bilingual, and final-output failures.

- [ ] **Step 1: Write the static contract test before editing the skill**

Create `tests/test_skill_contract.sh` with:

```bash
#!/usr/bin/env bash
set -euo pipefail

skill_path="${1:-skills/speaking-ideas-into-content/SKILL.md}"

require_pattern() {
  local pattern="$1"
  local label="$2"
  if ! rg -q --ignore-case "$pattern" "$skill_path"; then
    printf 'FAIL: %s\n' "$label" >&2
    exit 1
  fi
}

require_pattern '^name: speaking-ideas-into-content$' 'stable skill name'
require_pattern 'talking-head|talking head|video script' 'talking-head trigger'
require_pattern 'intended audience|target viewer' 'audience discovery'
require_pattern 'English.*Simplified Mandarin.*bilingual|English, Simplified Mandarin, or bilingual' 'three language modes'
require_pattern 'default.*bilingual|bilingual.*default' 'bilingual default'
require_pattern 'question hook|honest question' 'question hook'
require_pattern 'therefore' 'causal therefore beats'
require_pattern '\bbut\b' 'conflict but beats'
require_pattern 'two or three|2–3|2-3' 'selectable narrative directions'
require_pattern 'agent-reach' 'conditional evidence research dependency'
require_pattern 'established theories|established frameworks|theories and frameworks' 'evidence preference'
require_pattern '2\.5' 'minimum runtime'
require_pattern '15 minutes' 'maximum runtime'
require_pattern 'humanizer' 'English polishing dependency'
require_pattern 'shuorenhua' 'Simplified Mandarin polishing dependency'
require_pattern 'line-by-line|sentence by sentence' 'nonliteral Chinese adaptation'
require_pattern 'spoken Mandarin cadence|natural Mandarin cadence|Mandarin.*cadence' 'Mandarin runtime method'
require_pattern 'only.*script|return only' 'final-only output contract'
require_pattern 'delivery notes' 'light delivery notes'
require_pattern 'dependency.*unavailable|sub-skill.*unavailable' 'missing dependency behavior'
require_pattern 'style fingerprint' 'reference-video adaptation'

printf 'PASS: skill contract\n'
```

- [ ] **Step 2: Run the contract test and verify RED**

Run:

```bash
bash tests/test_skill_contract.sh
```

Expected: `FAIL: talking-head trigger`. The test must fail because the current skill lacks the new public talking-head contract, not because the script is malformed.

- [ ] **Step 3: Define raw behavioral scenarios without expected answers**

Create `tests/behavioral-scenarios.md` containing these user-facing prompts:

```markdown
# Behavioral scenarios

## A. First capture, unspecified audience and language

Use `$speaking-ideas-into-content` with this rough voice note:

I used to think being busy meant I was making progress. Last month I cancelled two recurring meetings and suddenly finished the proposal I had avoided for six weeks. The uncomfortable part is that I liked feeling needed in those meetings. Maybe the real problem was not time management. Maybe it was identity. Help me develop this into a talking-head video.

## B. Personal claim that does not need research

Use `$speaking-ideas-into-content` with this rough voice note:

When I moved to a new city, I kept saying I needed confidence before meeting people. One evening I went to a tiny neighborhood event while feeling completely awkward. I spoke to one person, went home early, and realized action had come before confidence for me. Help me shape the story, but do not finalize it yet.

## C. Claim that benefits from evidence

Use `$speaking-ideas-into-content` with this rough voice note:

My team treats every interruption as a personal discipline problem. I suspect task switching has a measurable cognitive cost, and that this explains why our supposedly quick Slack questions derail deep work. Help me develop a video and propose credible supporting explanations for me to choose from.

## D. English finalization

Use `$speaking-ideas-into-content`. The audience and story direction have already been approved. Using the approved source packet below, finalize in English only as a reflective talking-head script. Use only the supplied experiences and approved evidence. Return the final teleprompter script and light delivery notes.

## E. Simplified Mandarin finalization

Use `$speaking-ideas-into-content`. The audience and story direction have already been approved. Using the approved source packet below, finalize in natural Simplified Mandarin for viewers in mainland China. Do not translate English sentence by sentence. Return the final teleprompter script and light delivery notes.

## Approved source packet for D and E

Treat every detail below as user-supplied and approved. Do not add personal facts.

The audience is knowledge workers who confuse constant availability with useful contribution. The opening question is: What if the reason you cannot finish important work is that being needed feels safer than making progress? The intended resolution is not that meetings are bad. It is that availability and contribution are different, and protecting attention can feel emotionally uncomfortable before it feels productive.

For six weeks, I had a proposal open on my laptop and kept moving it to the next day's list. I told myself the problem was workload. My calendar looked like evidence: eleven recurring meetings, scattered messages, and small requests I could answer quickly. At the end of each day I felt exhausted, but I could point to dozens of moments when somebody had needed me.

One Tuesday morning, I opened the proposal before my first meeting and realized I no longer remembered the argument I had planned the previous afternoon. I spent twenty minutes reconstructing it, then a message arrived. I answered because it would only take two minutes. When I came back, I had lost the thread again. That was the moment I began wondering whether the interruptions were only a scheduling problem.

I cancelled two recurring meetings for one month. I worried that people would think I was disengaged, so I explained the experiment to my team and kept one office-hour block for questions. The first quiet afternoon did not feel peaceful. It felt exposed. There was nobody to respond to and no quick task that could prove I was useful. I had to sit with the proposal and the possibility that my own work might not be good enough.

But after about forty uncomfortable minutes, I found the argument again. By the end of that afternoon I had completed the outline and the hardest two sections. I did not suddenly become a productivity machine. The useful change was noticing that meetings had given me emotional certainty: an invitation, an agenda, and immediate evidence that I belonged. The proposal gave me uncertainty and delayed feedback.

The approved educational support is Sophie Leroy's attention-residue research: when people switch away from unfinished work, some attention can remain attached to the previous task, which can impair performance on the next task. Use this as a measured explanation, not proof that every interruption has the same effect and not a diagnosis of my behavior.

The practical ending is a one-week experiment: protect one meaningful block, move quick questions into a visible office-hour window, and notice both what gets completed and what emotional discomfort appears. The final thought is: sometimes the calendar is not only consuming time; it is protecting us from the uncertainty of work that matters.

## F. Missing dependency

Use `$speaking-ideas-into-content` to finalize in Simplified Mandarin in an environment where `shuorenhua` is unavailable.

## G. Reference transcript adaptation

Use `$speaking-ideas-into-content` with the rough meeting-and-proposal voice note from Scenario A and this short reference transcript excerpt: "Have you ever reached the end of a busy day and wondered what you actually finished? I thought my calendar proved I mattered. Therefore I kept accepting meetings. But the more available I became, the less meaningful work I completed. Therefore I tried one protected afternoon. But the silence made me anxious before it made me productive." Analyze the reference's observable storytelling structure, propose a temporary style fingerprint, and do not copy its wording.

## H. Insufficient material

Use `$speaking-ideas-into-content` and finalize this as a three-minute talking-head video: "I went for a walk yesterday. I felt less stuck afterward. Maybe walking helps me think." Do not invent details.

## I. Excess material

Use `$speaking-ideas-into-content`. My read-through of the supplied transcript is 22 minutes, and it contains eight separate lessons with different examples. Help me make it comply with the 15-minute maximum without flattening every lesson into a list.
```

- [ ] **Step 4: Run five no-guidance baseline replicas**

Launch five fresh-context subagents with Scenario A and the current skill artifact. Give each only the skill path and raw prompt; do not reveal the design, rubric, suspected failures, or intended changes.

Expected baseline failure: at least one required behavior is absent or inconsistent across the five outputs, such as no selectable question hooks, no explicit causal/conflict spine, no audience inference, no bilingual default, or premature drafting.

- [ ] **Step 5: Record baseline evidence**

Create `tests/baseline-results.md` with one row per replica and these columns:

```markdown
| Replica | Finished script too early | Audience handled | Bilingual default | 2–3 question hooks | Therefore/but spine | Evidence excerpt |
|---|---:|---:|---:|---:|---:|---|
```

Copy one short verbatim excerpt from each output into the final column and summarize only observable behavior. Do not add the expected answer to the test prompts.

### Task 2: Implement the public staged storytelling contract

**Files:**
- Modify: `skills/speaking-ideas-into-content/SKILL.md`
- Modify: `skills/speaking-ideas-into-content/agents/openai.yaml`
- Create: `README.md`
- Test: `tests/test_skill_contract.sh`

**Interfaces:**
- Consumes: the baseline failures, approved design, `agent-reach`, `humanizer`, and `shuorenhua` dependency names.
- Produces: a concise public skill with deterministic stages, selectable audiences and languages, evidence selection, and exact final-output routing.

- [ ] **Step 1: Rewrite the skill metadata and stage classifier**

Set the frontmatter to:

```yaml
---
name: speaking-ideas-into-content
description: Use when a user wants to turn a voice note, recording, transcript, ramble, or rough spoken idea into a reflective, story-driven talking-head video script, especially when the audience, narrative direction, evidence, or English and Simplified Mandarin adaptation still needs development.
---
```

Replace the current three-stage classifier with four stages plus a Stage 1.5 selection checkpoint: discovery, narrative directions, conditional research, voice enrichment, and final drafting/polishing.

- [ ] **Step 2: Add the positive response contracts**

Write the Stage 1 response recipe in this order:

```text
Material bank
Content soul
Audience and language
Viewer question
Story ingredients
Gaps and support
Next voice-pass prompts
```

When the audience is evident, state the inferred viewer, their tension, and desired change for confirmation; when ambiguity would materially change the story, ask before Stage 1.5. Write Stage 1.5 so it returns two or three options, each containing a question hook, viewer tension, `therefore`/`but` story spine, stakes, resolution, ending effect, and provisional runtime. Recommend one option with a concise reason, then require user selection before research or drafting.

- [ ] **Step 3: Add conditional evidence research and voice enrichment**

Require `agent-reach` only for claims that benefit from validation or educational context. For each researched claim, require a small evidence menu with source link, evidence type, fit, credibility, limitation, and plain-language integration line. Prefer established theories or frameworks when they fit; for medical, mental-health, or other high-stakes claims, prefer primary research, authoritative institutions, or strong syntheses over popular articles. Wait for the user to choose evidence. Preserve Stage 3 as a repeatable voice pass that elicits concrete scenes, internal interpretation, conflict, decisions, consequences, and resolution.

- [ ] **Step 4: Add exact language routing and embedded polishing**

Define three modes:

```text
English -> draft -> internal runtime check -> REQUIRED SUB-SKILL humanizer -> spoken-cadence check -> English script + English delivery notes
Simplified Mandarin -> Chinese-native draft -> internal runtime check -> REQUIRED SUB-SKILL shuorenhua -> spoken-cadence check -> Chinese script + Chinese delivery notes
Bilingual/default -> run both branches -> preserve story/evidence equivalence -> English script + notes -> Chinese script + notes
```

Require the polishing processes to remain internal. If a required polishing skill is unavailable, return only a concise dependency message with the correct installation command; do not produce an unpolished substitute.

- [ ] **Step 5: Add storytelling, runtime, and integrity gates**

Require an honest question hook, causal `therefore` movement, meaningful `but` conflict, resolution of the primary open loop, and an ending that creates recognition, belief change, action, or a fitting combination. Enforce 2.5–15 minutes without padding; use the English word-count estimate only for English and natural spoken cadence for Mandarin. Preserve user voice and prohibit invented experience, vulnerability, conflict, evidence, diagnosis, or certainty.

- [ ] **Step 6: Add reference adaptation and boundary handling**

For a supplied reference video or transcript, require a temporary style fingerprint covering hook type, causal beats, conflict pattern, pacing, emotional tone, evidence placement, and resolution. Adapt structure without copying distinctive wording, stories, or signature expressions. Keep Jessica McCabe, Struthless, How to ADHD, Dr. Tracey Marks, and Jenny Hoyos as directional structural references only, never voices to imitate. When source material cannot support 2.5 minutes, request another voice pass; when it exceeds 15 minutes, narrow the central question or propose a series. Preserve uncertain transcript markers, stop for unavailable research tools, return to the material bank after rejected narrative directions, and place any unavoidable unresolved-claim warning inside the light delivery notes when the user explicitly forces finalization.

- [ ] **Step 7: Regenerate public UI metadata**

Run:

```bash
python3 /Users/ruohanyu/.codex/skills/.system/skill-creator/scripts/generate_openai_yaml.py \
  skills/speaking-ideas-into-content \
  --interface 'display_name=Speaking Ideas Into Video Scripts' \
  --interface 'short_description=Shape spoken ideas into story-driven video scripts' \
  --interface 'default_prompt=Use $speaking-ideas-into-content to develop this spoken idea into an audience-aware talking-head script. Default to English and Simplified Mandarin unless I choose one language.'
```

Expected: `agents/openai.yaml` contains exactly the three interface fields and accurately represents the revised skill.

- [ ] **Step 8: Write public repository guidance**

Create root `README.md` with:

````markdown
# Speaking Ideas Into Content

A Codex skill for developing voice notes, recordings, transcripts, and rough spoken ideas into reflective, story-driven talking-head scripts.

## What it supports

- Audience discovery and selectable story directions
- Question hooks with `therefore`/`but` causal storytelling
- Optional evidence research and user-controlled source selection
- English, Simplified Mandarin, or bilingual scripts; bilingual is the default
- Teleprompter-ready final scripts with light delivery notes

## Install

After cloning this repository, install the runtime directory:

```bash
mkdir -p "${CODEX_HOME:-$HOME/.codex}/skills"
cp -R skills/speaking-ideas-into-content "${CODEX_HOME:-$HOME/.codex}/skills/speaking-ideas-into-content"
```

Stage 4 also requires language-specific polishing skills:

```bash
npx skills add blader/humanizer -g -a codex -y
npx skills add MrGeDiao/shuorenhua -g -a codex -y
```

Install only `humanizer` for English-only use or only `shuorenhua` for Simplified-Mandarin-only use. Install both for bilingual output.

Optional evidence research uses `agent-reach`:

```bash
npx skills add Panniantong/Agent-Reach -g -a codex -y
```

## Use

Attach or paste a voice note, recording, transcript, or rough idea and invoke `$speaking-ideas-into-content`. You can specify the audience, runtime, and language mode, or let the skill develop them with you.
````

- [ ] **Step 9: Verify GREEN and validate the package**

Run:

```bash
bash tests/test_skill_contract.sh
python3 /Users/ruohanyu/.codex/skills/.system/skill-creator/scripts/quick_validate.py skills/speaking-ideas-into-content
git diff --check
```

Expected: `PASS: skill contract`, `Skill is valid!`, and no whitespace errors.

- [ ] **Step 10: Commit the public runtime revision**

```bash
git add README.md tests skills/speaking-ideas-into-content
git commit -m "feat: add bilingual talking-head storytelling workflow"
```

### Task 3: Install and verify the language-polishing dependencies

**Files:**
- Inspect: `/Users/ruohanyu/.codex/skills/humanizer/SKILL.md`
- Install: `/Users/ruohanyu/.codex/skills/shuorenhua/`

**Interfaces:**
- Consumes: the public dependency names used by Stage 4.
- Produces: a personal Codex environment capable of completing English, Simplified Mandarin, and bilingual finalization.

- [ ] **Step 1: Confirm the English dependency is present and valid**

Run:

```bash
test -f /Users/ruohanyu/.codex/skills/humanizer/SKILL.md
python3 /Users/ruohanyu/.codex/skills/.system/skill-creator/scripts/quick_validate.py /Users/ruohanyu/.codex/skills/humanizer
```

Expected: the file exists and the validator reports `Skill is valid!`.

- [ ] **Step 2: Inspect the exact Chinese dependency target**

Run:

```bash
test ! -e /Users/ruohanyu/.codex/skills/shuorenhua || find /Users/ruohanyu/.codex/skills/shuorenhua -maxdepth 2 -type f -print
```

Expected: the target is absent, or its existing contents are known before installation.

- [ ] **Step 3: Install the Chinese dependency from its public repository**

Run:

```bash
npx skills add MrGeDiao/shuorenhua -g -a codex -y
```

Expected: the command installs `shuorenhua` for Codex without modifying the repository skill package.

- [ ] **Step 4: Validate the Chinese dependency**

Run:

```bash
test -f /Users/ruohanyu/.codex/skills/shuorenhua/SKILL.md
python3 /Users/ruohanyu/.codex/skills/.system/skill-creator/scripts/quick_validate.py /Users/ruohanyu/.codex/skills/shuorenhua
```

Expected: the file exists and the validator reports `Skill is valid!`.

### Task 4: Forward-test and refine the revised skill

**Files:**
- Modify if a tested contract fails: `skills/speaking-ideas-into-content/SKILL.md`
- Create: `tests/forward-results.md`
- Test: scenarios in `tests/behavioral-scenarios.md`

**Interfaces:**
- Consumes: the revised raw skill artifact and six user-facing scenarios.
- Produces: fresh-context evidence that the skill generalizes without seeing the design or evaluation rubric.

- [ ] **Step 1: Run five guided replicas of Scenario A**

Launch five fresh-context subagents. Give each only the revised skill path and Scenario A. Do not reveal expected answers, previous failures, or evaluation criteria.

Expected across all five: each response produces the seven-part workbench, infers or asks about audience, records bilingual as the default, offers two or three question-led narrative directions with `therefore`/`but` beats, and stops for user selection instead of drafting.

- [ ] **Step 2: Run the remaining functional scenarios once each**

Use a fresh-context subagent for each scenario:

- Scenario B: no unnecessary web research.
- Scenario C: `agent-reach` research and a selectable evidence menu, not silent source insertion.
- Scenario D: only an English teleprompter script and English delivery notes after embedded `humanizer` processing.
- Scenario E: only natural Simplified Mandarin and Chinese delivery notes after embedded `shuorenhua` processing.
- Scenario F: a concise dependency/install response and no substitute script.
- Scenario G: a temporary structural style fingerprint with no copied wording.
- Scenario H: another voice-pass request instead of padding to three minutes.
- Scenario I: a narrowed central question or series proposal instead of a script exceeding 15 minutes.

- [ ] **Step 3: Record observable forward-test evidence**

Create `tests/forward-results.md` with:

```markdown
| Scenario/replica | Required shape present | Stopped at correct checkpoint | Language routing correct | Unsupported content | Evidence excerpt |
|---|---:|---:|---:|---:|---|
```

Use one short verbatim excerpt per run. Mark a run passing only when every applicable requirement is observable.

- [ ] **Step 4: Close only observed loopholes and re-run failures**

For an output-shape failure, strengthen the positive recipe at the relevant stage. For a skipped checkpoint, add an observable stop condition. For invented content, strengthen the source ledger and integrity gate. For language leakage, tighten the exact output ordering. Re-run the failing scenario with a new subagent, then re-run all five Scenario A replicas to confirm convergence.

- [ ] **Step 5: Re-run all deterministic checks**

Run:

```bash
bash tests/test_skill_contract.sh
python3 /Users/ruohanyu/.codex/skills/.system/skill-creator/scripts/quick_validate.py skills/speaking-ideas-into-content
git diff --check
```

Expected: all commands succeed with pristine output.

- [ ] **Step 6: Commit test evidence and any refinements**

```bash
git add tests skills/speaking-ideas-into-content
git commit -m "test: verify public storytelling skill behavior"
```

### Task 5: Synchronize and audit the personal installation

**Files:**
- Install: `/Users/ruohanyu/.codex/skills/speaking-ideas-into-content/SKILL.md`
- Install: `/Users/ruohanyu/.codex/skills/speaking-ideas-into-content/agents/openai.yaml`

**Interfaces:**
- Consumes: the verified repository runtime package.
- Produces: a byte-identical personal installation ready for English, Simplified Mandarin, or bilingual use.

- [ ] **Step 1: Inspect repository and installed copies before replacement**

Run:

```bash
diff -ru skills/speaking-ideas-into-content /Users/ruohanyu/.codex/skills/speaking-ideas-into-content || true
```

Expected: the differences are limited to the planned repository revision; any unrelated installed-only edits stop synchronization for review.

- [ ] **Step 2: Synchronize only the two runtime files**

Use `apply_patch` to update the installed `SKILL.md` and `agents/openai.yaml` to match the verified repository files. Do not replace or delete unrelated files in the installation directory.

- [ ] **Step 3: Validate and compare the installed copy**

Run:

```bash
python3 /Users/ruohanyu/.codex/skills/.system/skill-creator/scripts/quick_validate.py /Users/ruohanyu/.codex/skills/speaking-ideas-into-content
diff -u skills/speaking-ideas-into-content/SKILL.md /Users/ruohanyu/.codex/skills/speaking-ideas-into-content/SKILL.md
diff -u skills/speaking-ideas-into-content/agents/openai.yaml /Users/ruohanyu/.codex/skills/speaking-ideas-into-content/agents/openai.yaml
bash tests/test_skill_contract.sh /Users/ruohanyu/.codex/skills/speaking-ideas-into-content/SKILL.md
git status --short
```

Expected: both validators and the contract test succeed, both diffs are empty, and the worktree contains no uncommitted implementation changes.

- [ ] **Step 4: Complete the final requirement audit**

Confirm the committed repository includes the public README, generalized audience behavior, three language modes, bilingual default, question/`therefore`/`but` storytelling, user-controlled evidence research, 2.5–15 minute runtime enforcement, embedded English and Chinese humanization, final-only script output, behavioral evidence, and exact personal-install parity.
