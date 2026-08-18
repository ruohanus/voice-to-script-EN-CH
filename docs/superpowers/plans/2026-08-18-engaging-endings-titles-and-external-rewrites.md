# Engaging Endings, Titles, and External Rewrites Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Add source-faithful, aftereffect-led endings, platform-specific title packages, and two default external rewrite versions to `voice-to-script-en-ch`.

**Architecture:** Keep stage routing and runtime logic unchanged. Put detailed spoken-ending rules in `spoken-style.md`, final output assembly and title-package requirements in `finalization.md`, and Claude/DeepSeek transformation contracts in `external-polish.md`; keep `SKILL.md` as the concise routing boundary. Extend observable behavioral scenarios and the rubric before changing those references.

**Tech Stack:** Markdown skill instructions, shell smoke checks, Python runtime tests, fresh-context Codex behavioral evaluation.

**Spec:** `docs/superpowers/specs/2026-08-18-engaging-endings-titles-and-external-rewrites-design.md`

## Global Constraints

- Preserve all existing discovery, storytelling, research, bilingual, runtime, polishing, safety, and installation behavior not explicitly changed by the spec.
- Never invent facts, events, feelings, motives, quotations, evidence, credentials, results, or certainty.
- Keep final scripts as talking-head teleprompter narration rather than articles or essays.
- Keep English routed to Claude and Simplified Chinese routed to DeepSeek.
- Request both external versions by default.
- Keep runtime measurement limited to the frozen body plus recommended conclusion.
- Do not rename the skill or GitHub repository.

---

### Task 1: Behavioral contracts

**Files:**
- Modify: `tests/behavioral/scenarios.md`
- Modify: `tests/behavioral/rubric.md`
- Modify: `tests/test_package_smoke.sh`

**Interfaces:**
- Consumes: the approved design's observable output requirements.
- Produces: scenario and rubric contracts that later skill-reference changes must satisfy.

- [ ] **Step 1: Add failing behavioral scenarios**

Add scenarios covering the six ending approaches and aftereffect labels, implicit preservation of one unresolved tension, platform-specific title packages, both default external versions, per-version fresh titles, and the different structure permissions of the two versions.

- [ ] **Step 2: Add deterministic package gates for endings and titles**

Require the ending-palette and title-packaging references to exist and update the expected scenario count. These checks guard package completeness; behavioral scenarios remain the authority for output quality.

- [ ] **Step 3: Run the smoke suite and verify RED**

Run: `sh tests/test_package_smoke.sh`

Expected: FAIL because the current skill lacks the new ending/title/two-version contracts or because the scenario count has changed before the implementation references exist.

### Task 2: Ending and title behavior

**Files:**
- Modify: `skills/voice-to-script-en-ch/references/spoken-style.md`
- Modify: `skills/voice-to-script-en-ch/references/finalization.md`
- Modify: `skills/voice-to-script-en-ch/SKILL.md`

**Interfaces:**
- Consumes: Task 1 contracts.
- Produces: six ending approaches, recommended-plus-three selection, platform title packages, and final-output ordering.

- [ ] **Step 1: Implement the ending palette**

Replace metric promises with intended viewer aftereffects. Add story invitation, callback with new meaning, open decision, concrete final image, unapologized position, and next real move; make named-reader recognition optional across approaches.

- [ ] **Step 2: Implement platform title generation**

Add three TikTok options and three Instagram cover/caption packages per English script, plus three Xiaohongshu note-title/cover-phrase packages per Chinese script. Require independent bilingual adaptation and source-faithful emotional clickability.

- [ ] **Step 3: Update the final-output boundary**

Place platform titles after ending alternatives and before light delivery notes. Keep titles outside measured runtime.

- [ ] **Step 4: Run smoke and runtime suites**

Run: `sh tests/test_package_smoke.sh && python3 -m unittest tests/test_runtime_estimator.py -v`

Expected: PASS.

### Task 3: Two-version Claude and DeepSeek handoffs

**Files:**
- Modify: `skills/voice-to-script-en-ch/references/external-polish.md`
- Modify: `skills/voice-to-script-en-ch/references/finalization.md`
- Modify: `skills/voice-to-script-en-ch/SKILL.md`

**Interfaces:**
- Consumes: the finalized script, source-truth record, ending choices, title packages, audience, and authorized runtime.
- Produces: one copy-paste prompt per requested language that requests both named versions by default.

- [ ] **Step 1: Add failing deterministic gates for the external handoff**

Require both named external versions, their different structural permissions, the source-truth record, and per-version platform titles.

- [ ] **Step 2: Run the smoke suite and verify RED**

Run: `sh tests/test_package_smoke.sh`

Expected: FAIL because the current handoff still requests one structure-locked replacement and lacks per-version title sets.

- [ ] **Step 3: Replace the single-replacement contract**

Define `Same Story, Better Delivery` with content, event order, major beat order, and ending concepts locked while spoken language remains flexible.

- [ ] **Step 4: Add the structural rewrite contract**

Define `Same Material, Stronger Storytelling` with presentation order, reveal timing, tempo, hook, emotional progression, clip-line placement, and ending strategy flexible while source truth and real chronology remain locked.

- [ ] **Step 5: Add source-truth and per-version title requirements**

Include a compact source-truth record and require fresh platform-title sets for both external versions. Remove the rigid ten-percent word-count rule in favor of the authorized runtime and no-padding rule.

- [ ] **Step 6: Run deterministic verification**

Run: `sh tests/test_package_smoke.sh && python3 -m unittest tests/test_runtime_estimator.py -v`

Expected: PASS.

### Task 4: Fresh-context behavior and deployment validation

**Files:**
- Create or modify: `tests/behavioral/results-engaging-endings-titles-2026-08-18.md`
- Create: `tests/behavioral/fixtures/engaging-endings-titles-2026-08-18/` artifacts as needed

**Interfaces:**
- Consumes: the complete revised skill package.
- Produces: reproducible behavioral evidence and a validated deployable package.

- [ ] **Step 1: Run fresh-context evaluation**

Exercise at least one English finalization, one Simplified Chinese finalization, and one bilingual or external-handoff case. Preserve raw prompts and outputs. Confirm title formats, ending diversity, source fidelity, both default rewrite versions, and per-version title sets.

- [ ] **Step 2: Validate the skill package**

Run the system `quick_validate.py` against `skills/voice-to-script-en-ch`, then run the smoke and runtime suites again.

- [ ] **Step 3: Review the final diff**

Run `git diff --check`, inspect `git diff --stat` and the full diff, and confirm no unrelated behavioral or identity changes.

- [ ] **Step 4: Normalize the installed skill and publish**

Update the canonical local `voice-to-script-en-ch` installation only after repository validation, validate it, commit the repository changes, and push the existing branch/remote without renaming the GitHub repository.
