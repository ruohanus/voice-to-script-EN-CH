# Speaking Ideas Into Content Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Build, validate, forward-test, and install a personal Codex skill that implements the voice-to-content workflow approved in the design specification.

**Architecture:** Keep the runtime package self-contained: `SKILL.md` defines the staged interaction contract and `agents/openai.yaml` exposes concise UI metadata. Author and test the package in this repository, then install the verified directory into the user's personal Codex skills directory.

**Tech Stack:** Markdown, YAML, the official `skill-creator` initialization and validation scripts, Git, and fresh-context Codex subagents for behavioral evaluation.

## Global Constraints

- Skill folder and frontmatter name: `speaking-ideas-into-content`.
- Personal installation target: `${CODEX_HOME}/skills/speaking-ideas-into-content` when `CODEX_HOME` is set, otherwise `~/.codex/skills/speaking-ideas-into-content`.
- The first raw recording or transcript produces a five-part discovery workbench, not a finished post.
- The discovery workbench contains, in order: Material bank, Content soul, Skeleton, Gaps and support, Next voice-pass prompts.
- The workflow supports repeated voice passes and only polishes after explicit finalization or user confirmation that the material is ready.
- Final polishing removes verbal clutter while preserving meaning, personality, emotion, and natural rhythm.
- Do not invent experiences, quotations, statistics, evidence, or certainty.
- Reply in the user's language unless requested otherwise.
- The runtime package contains only `SKILL.md` and `agents/openai.yaml`.

---

### Task 1: Scaffold and specify the runtime skill

**Files:**
- Create: `skills/speaking-ideas-into-content/SKILL.md`
- Create: `skills/speaking-ideas-into-content/agents/openai.yaml`
- Test: `/Users/ruohanyu/.codex/skills/.system/skill-creator/scripts/quick_validate.py`

**Interfaces:**
- Consumes: the approved design at `docs/superpowers/specs/2026-08-13-speaking-ideas-into-content-design.md` and five recorded baseline failures.
- Produces: a discoverable skill package whose first-stage response follows the five-section contract and whose later stages enrich and polish content.

- [ ] **Step 1: Initialize the skill package**

Run:

```bash
python3 /Users/ruohanyu/.codex/skills/.system/skill-creator/scripts/init_skill.py speaking-ideas-into-content \
  --path skills \
  --interface 'display_name=Speaking Ideas Into Content' \
  --interface 'short_description=Turn voice notes into structured, authentic content' \
  --interface 'default_prompt=Use $speaking-ideas-into-content to help me develop this voice note into publishable content while preserving my voice.'
```

Expected: the command creates `SKILL.md` and `agents/openai.yaml` with no resource directories.

- [ ] **Step 2: Verify the scaffold fails the behavioral/specification gate**

Run:

```bash
rg -n 'Material bank|Content soul|Next voice-pass prompts|Finalize' skills/speaking-ideas-into-content/SKILL.md
```

Expected: no matches, proving the generated scaffold does not yet implement the approved workflow.

- [ ] **Step 3: Write the minimal staged skill**

Replace the scaffold with a `SKILL.md` that contains:

```yaml
---
name: speaking-ideas-into-content
description: Use when a user wants to develop a voice note, recording, transcript, ramble, or scattered spoken thoughts into an article, post, script, or other publishable content while retaining their authentic voice.
---
```

The body must define:

- Input classification for first capture, subsequent voice pass, and finalization.
- The exact five-section Stage 1 response contract.
- The merge-and-deepen Stage 2 loop.
- The voice-preserving Stage 3 cleanup contract.
- Truthfulness and transcription-uncertainty guardrails.
- A compact quick-reference table and one end-to-end example.
- Common mistakes keyed to the observed baseline failure of drafting too early.

- [ ] **Step 4: Verify the specification markers and metadata**

Run:

```bash
rg -n 'Material bank|Content soul|Skeleton|Gaps and support|Next voice-pass prompts|Stage 2|Stage 3|Common mistakes' skills/speaking-ideas-into-content/SKILL.md
python3 /Users/ruohanyu/.codex/skills/.system/skill-creator/scripts/quick_validate.py skills/speaking-ideas-into-content
```

Expected: every marker is present and the validator reports `Skill is valid!`.

- [ ] **Step 5: Commit the runtime package**

```bash
git add skills/speaking-ideas-into-content docs/superpowers/plans/2026-08-13-speaking-ideas-into-content.md
git commit -m "feat: add speaking ideas into content skill"
```

### Task 2: Forward-test and refine behavior

**Files:**
- Modify if required: `skills/speaking-ideas-into-content/SKILL.md`
- Test: fresh-context subagent responses using the raw skill artifact

**Interfaces:**
- Consumes: the complete skill directory and raw user scenarios without expected answers or author conclusions.
- Produces: evidence that the skill generalizes to first capture, subsequent pass, and explicit finalization.

- [ ] **Step 1: Run five first-capture micro-tests**

Give five fresh-context agents the skill path and this raw request:

```text
Use $speaking-ideas-into-content at <absolute-skill-path>. Here is a rough voice-note transcript: I keep waiting until I have a perfect idea before posting, but useful thoughts show up while I walk or drive. Talking lets me discover what I think. Writing makes me freeze and over-edit. Maybe consistency is making capture easy enough that I do it. Please turn this into content.
```

Expected for each response:

- The five headings appear once and in the required order.
- The answer ends by inviting a second voice pass.
- No finished social post appears.
- No experience, fact, evidence, or certainty is invented.

- [ ] **Step 2: Run a second-pass test**

Give a fresh agent the skill plus the initial transcript and this follow-up:

```text
Second pass: Yesterday I tried recording while walking. I spoke for seven minutes without stopping. The useful realization was that a blank page asks me to discover and edit simultaneously, while recording separates those jobs. Keep developing it.
```

Expected: the response merges the new material, preserves the original soul unless genuinely changed, strengthens the skeleton and emotional arc, and reports only remaining high-value gaps or readiness to polish.

- [ ] **Step 3: Run an explicit-finalization test**

Give a fresh agent the skill plus both transcripts and this instruction:

```text
Skip another recording and finalize this now as a concise first-person LinkedIn post. Keep my plainspoken voice and do not add research or personal details.
```

Expected: the finished post comes first; verbal clutter is removed; the supplied “seven minutes” detail remains accurate; no unsupported facts or experiences appear; a brief editorial note follows only if useful.

- [ ] **Step 4: Refine and re-test any observed gap**

If a test omits a required section or drafts too early, strengthen the positive response contract in `SKILL.md`. If a test invents support, strengthen the source-labeling rule. Re-run the failing scenario and then the complete five-test first-capture set.

- [ ] **Step 5: Re-run static validation**

```bash
python3 /Users/ruohanyu/.codex/skills/.system/skill-creator/scripts/quick_validate.py skills/speaking-ideas-into-content
git diff --check
```

Expected: validator success and no whitespace errors.

### Task 3: Install and audit the personal skill

**Files:**
- Install: `${CODEX_HOME:-$HOME/.codex}/skills/speaking-ideas-into-content/SKILL.md`
- Install: `${CODEX_HOME:-$HOME/.codex}/skills/speaking-ideas-into-content/agents/openai.yaml`

**Interfaces:**
- Consumes: the validated repository package.
- Produces: an auto-discoverable personal skill that can be invoked with `$speaking-ideas-into-content`.

- [ ] **Step 1: Resolve and inspect the exact install target**

```bash
printf '%s\n' "${CODEX_HOME:-$HOME/.codex}/skills/speaking-ideas-into-content"
test ! -e "${CODEX_HOME:-$HOME/.codex}/skills/speaking-ideas-into-content" || find "${CODEX_HOME:-$HOME/.codex}/skills/speaking-ideas-into-content" -maxdepth 2 -type f -print
```

Expected: the exact target is known before copying; an existing skill, if any, is inspected rather than silently overwritten.

- [ ] **Step 2: Install the verified package**

If the target does not exist, create its parent and copy the directory:

```bash
mkdir -p "${CODEX_HOME:-$HOME/.codex}/skills"
cp -R skills/speaking-ideas-into-content "${CODEX_HOME:-$HOME/.codex}/skills/speaking-ideas-into-content"
```

If the target exists, compare it with the repository package and request explicit overwrite approval before replacing it.

- [ ] **Step 3: Validate the installed copy and compare it byte-for-byte**

```bash
python3 /Users/ruohanyu/.codex/skills/.system/skill-creator/scripts/quick_validate.py "${CODEX_HOME:-$HOME/.codex}/skills/speaking-ideas-into-content"
diff -r skills/speaking-ideas-into-content "${CODEX_HOME:-$HOME/.codex}/skills/speaking-ideas-into-content"
```

Expected: `Skill is valid!` and no diff output.

- [ ] **Step 4: Complete the requirement-by-requirement audit**

Check:

- Source analysis: design specification contains all five video-derived stages.
- Runtime workflow: skill defines Stage 1, Stage 2, and Stage 3 contracts.
- Authenticity: truthfulness, uncertainty, and voice-preservation rules are present.
- Discoverability: folder name, YAML description, UI metadata, and explicit `$speaking-ideas-into-content` invocation agree.
- Quality: static validator, behavioral tests, installed-copy validator, and byte comparison all pass.

- [ ] **Step 5: Commit refinements, if any**

```bash
git add skills/speaking-ideas-into-content docs/superpowers/plans/2026-08-13-speaking-ideas-into-content.md
git commit -m "test: verify voice-to-content workflow"
```

Skip this commit only if Task 2 required no changes after the Task 1 commit.
