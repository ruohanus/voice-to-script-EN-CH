# Over-15 Runtime Release Fix Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Make the first response to an above-15-minute one-video scope reliably offer only the required three scope choices, prove it with valid source-rich evidence, and release the already-completed adaptive-discovery revision.

**Architecture:** Treat `scope_choice_required` as a state transition that precedes source-sufficiency analysis. Express its first response as a positive ordered output contract, test that contract deterministically, then forward-test it from a fresh context using a substantive long-form source packet.

**Tech Stack:** Markdown skill instructions and fixtures, POSIX shell contract tests, Python `unittest`, Codex CLI fresh-context evaluation, Git.

## Global Constraints

- Change only the above-15 decision order and the evidence needed to validate it.
- Preserve all other storytelling, research, bilingual, runtime, polishing, safety, source-integrity, ending, and workflow behavior.
- Preserve the three historical Scenario 69 failures as RED evidence.
- Do not rename the skill or GitHub repository.
- Do not push or mirror the runtime until every release gate passes.
- If three fresh correction attempts fail, stop for architectural review.
- `.ai/testing-profile.yaml` and `engtest` are absent; use the repository-declared commands in `docs/testing.md` plus the Skill Creator validator.

---

### Task 1: Add a RED structural contract and valid Scenario 69 input

**Files:**
- Modify: `tests/test_package_smoke.sh`
- Modify: `tests/behavioral/fixtures/adaptive-discovery-2026-08-17/final-fix-scenario-69.md`
- Modify: `tests/behavioral/fixtures/adaptive-discovery-2026-08-17/final-fix-evaluator-dispatch.md`

**Interfaces:**
- Consumes: Scenario 69's predicate in `tests/behavioral/scenarios.md` and the failed outputs retained beside the fixture.
- Produces: a deterministic structural expectation and a raw packet that independently establishes intentional long-form scope.

- [ ] **Step 1: Tighten the package contract before production edits**

Add these assertions after the existing runtime-state assertions in `tests/test_package_smoke.sh`:

```sh
require_pattern 'above-15 first response contract' "$skill_dir" 'positive above-15 response contract'
require_pattern 'scope_choice_required' "$skill_dir" 'unresolved above-15 scope state'
require_pattern 'acknowledge.*preferred window' "$skill_dir" 'above-15 acknowledgement slot'
require_pattern 'only.*one longer video.*short series.*narrower story' "$skill_dir" 'three-option above-15 response shape'
require_pattern 'recommend.*narrative coherence' "$skill_dir" 'above-15 recommendation slot'
require_pattern 'before.*source-sufficiency|before.*source sufficiency' "$skill_dir" 'target-first scope ordering'
```

These assertions intentionally require a positive response recipe that the current production skill does not contain as a named structural contract.

- [ ] **Step 2: Replace the thin raw packet with supplied evidence**

Rewrite `final-fix-scenario-69.md` as a first-person source packet for an 18-minute English talking-head video. Keep the four chronological periods, but supply at least twelve concrete scene records across them. Each record must include:

- location and visible action;
- remembered dialogue explicitly marked exact or indirect;
- the conflict or decision in that scene;
- the consequence that changes the next scene.

The packet must also supply the speaker's own stated motive where relevant, the earned shift from deciding for the father to asking which risk he preferred, and the unresolved fear about preventable consequences. End with this scope instruction:

```text
I want one 18-minute video because removing any of these four periods would break the causal progression. Finalize now in English only. Do not add research.
```

Do not say that unprovided recordings contain the missing details. The fixture itself is the evidence.

- [ ] **Step 3: Register the revised raw packet without leaking expectations**

In `final-fix-evaluator-dispatch.md`, retain the generic evaluator instruction and the Scenario 69 mapping to the same raw fixture. Add one sentence to the artifact notes stating that historical `*-red-output*.md` files remain immutable and that a successful rerun must be stored as `final-fix-scenario-69-green-output.md`.

- [ ] **Step 4: Run RED and verify the reason**

Run:

```bash
sh tests/test_package_smoke.sh
```

Expected: nonzero exit with `missing contract: positive above-15 response contract`. A syntax error, missing fixture, or another earlier failure is not valid RED evidence.

- [ ] **Step 5: Commit the test-only RED state**

```bash
git add tests/test_package_smoke.sh \
  tests/behavioral/fixtures/adaptive-discovery-2026-08-17/final-fix-scenario-69.md \
  tests/behavioral/fixtures/adaptive-discovery-2026-08-17/final-fix-evaluator-dispatch.md
git commit -m "test: require target-first over-15 response"
```

### Task 2: Implement the minimal target-first state transition

**Files:**
- Modify: `skills/voice-to-script-en-ch/SKILL.md`
- Modify: `skills/voice-to-script-en-ch/references/finalization.md`
- Test: `tests/test_package_smoke.sh`

**Interfaces:**
- Consumes: a supplied duration target or expected one-video scope and the unresolved/resolved scope state.
- Produces: `scope_choice_required` or `scope_choice_resolved`, with a deterministic first-response shape for the former.

- [ ] **Step 1: Add the positive response contract to the main router**

Replace the current prose-only runtime-stop paragraph in `SKILL.md` with a compact named block equivalent to:

```markdown
### Above-15 first response contract

If a supplied target or expected one-video scope exceeds 15 minutes and no scope choice has been made, set `scope_choice_required`. This transition occurs before source-sufficiency assessment.

While `scope_choice_required`, the complete response has these parts in order:

1. Acknowledge that the request exceeds the preferred window.
2. Offer only: one longer video, a short series, or a narrower story.
3. Recommend one option based on narrative coherence.

End the turn. Do not draft, assess whether the source can fill the chosen shape, or show the four-option unsupported-target menu. After the user chooses, set `scope_choice_resolved`, assess source sufficiency for that shape, and use the unsupported-target menu only if the selected shape lacks honest support.
```

Keep the existing workflow-table rows, but make their state names and ordering match this block. Do not change any duration number or other state transition.

- [ ] **Step 2: Make finalization consume the same state**

In `references/finalization.md`, replace the duplicated ambiguous ordering prose with a precondition keyed to `scope_choice_required` and `scope_choice_resolved`. It must route the unresolved state back to the named three-part contract and forbid building the approved story contract until the choice is resolved.

- [ ] **Step 3: Run GREEN for the deterministic contract**

Run:

```bash
sh tests/test_package_smoke.sh
```

Expected: `package smoke checks passed` and exit zero.

- [ ] **Step 4: Run focused regression checks**

Run:

```bash
python3 -m unittest tests/test_runtime_estimator.py -v
python3 /Users/ruohanyu/.codex/skills/.system/skill-creator/scripts/quick_validate.py skills/voice-to-script-en-ch
git diff --check HEAD^
```

Expected: 8 tests pass, `Skill is valid!`, and no diff-check output.

- [ ] **Step 5: Commit the minimal production correction**

```bash
git add skills/voice-to-script-en-ch/SKILL.md \
  skills/voice-to-script-en-ch/references/finalization.md
git commit -m "fix: prioritize over-15 scope selection"
```

### Task 3: Forward-test Scenario 69 and reconcile evidence

**Files:**
- Create: `tests/behavioral/fixtures/adaptive-discovery-2026-08-17/final-fix-scenario-69-green-output.md`
- Modify: `tests/behavioral/fixtures/adaptive-discovery-2026-08-17/final-fix-results.md`
- Modify: `tests/behavioral/results-adaptive-discovery-2026-08-17.md`
- Format only: tracked Markdown evidence files reported by the commit-range whitespace check

**Interfaces:**
- Consumes: the revised public skill and only the raw Scenario 69 fixture in a fresh evaluator context.
- Produces: exact immutable output plus an internally consistent pass/fail record.

- [ ] **Step 1: Run one isolated evaluation**

From the repository root, run the generic instruction already recorded in `final-fix-evaluator-dispatch.md`:

```bash
codex exec --dangerously-bypass-hook-trust -s workspace-write -C . \
  -m gpt-5.6-sol -c 'model_reasoning_effort="medium"' --json --ephemeral \
  -o /tmp/voice-to-script-scenario-69-green.md \
  'Act as a fresh user-facing evaluator. Read and follow only the revised public skill at skills/voice-to-script-en-ch, its routed repository references, and any required installed polishing dependency that the public skill explicitly routes. Treat the stdin block as the only raw user request for this turn. Do not inspect behavioral scenarios, rubric, baseline, result, finding, design, plan, report, or prior-output files. Do not modify the repository; use temporary files only when the public skill requires runtime estimation. Return only the exact user-facing response, without grading or evaluator metadata.' \
  < tests/behavioral/fixtures/adaptive-discovery-2026-08-17/final-fix-scenario-69.md
```

- [ ] **Step 2: Grade the exact response before copying it**

The response passes only if all are true:

- it acknowledges the above-preferred scope;
- it offers one longer video, a short series, and a narrower story;
- it recommends one based on narrative coherence;
- it does not offer discovery, an honestly shorter script, more freestyle material, or a narrower angle as a four-choice menu;
- it does not draft any part of the script.

If it fails, preserve the output as a new RED artifact, return to systematic root-cause analysis, and change one hypothesis at a time. Stop after three failed correction attempts.

- [ ] **Step 3: Track the passing artifact exactly**

Use `apply_patch` to create `final-fix-scenario-69-green-output.md` with the exact contents of `/tmp/voice-to-script-scenario-69-green.md`. Do not normalize or rewrite the evaluator's words.

- [ ] **Step 4: Reconcile the evidence index**

Update `final-fix-results.md` and `results-adaptive-discovery-2026-08-17.md` to:

- retain all three historical failures as RED history;
- add the new run command/session identifier and exact GREEN grade;
- mark Scenario 69 pass only from the fresh output;
- remove the obsolete sentence claiming Scenarios 63, 65, 67, and 69 remain unexercised;
- state that all four now have tracked fresh evidence.

- [ ] **Step 5: Normalize evidence whitespace mechanically**

Run:

```bash
git diff --check b12aff0c1ebc7458d0d0252bf8f927ce34fc07c1..HEAD
```

For only the Markdown evidence files named by that output, remove trailing spaces with a formatting-only command, then rerun the same range check. Do not alter wording or line order.

- [ ] **Step 6: Commit the forward evidence**

```bash
git add tests/behavioral/fixtures/adaptive-discovery-2026-08-17 \
  tests/behavioral/results-adaptive-discovery-2026-08-17.md
git commit -m "test: prove over-15 scope precedence"
```

### Task 4: Verify, review, mirror, and publish

**Files:**
- Verify: repository package and exact feature-branch diff
- Replace after validation: `/Users/ruohanyu/.codex/skills/voice-to-script-en-ch`
- Push: existing `origin` repository; do not rename it

**Interfaces:**
- Consumes: the committed production fix and tracked behavioral evidence.
- Produces: one validated canonical local runtime and the same commit on the existing GitHub repository.

- [ ] **Step 1: Run the complete clean release gate**

Run on exact `HEAD`:

```bash
sh tests/test_package_smoke.sh
python3 -m unittest tests/test_runtime_estimator.py -v
python3 /Users/ruohanyu/.codex/skills/.system/skill-creator/scripts/quick_validate.py skills/voice-to-script-en-ch
git diff --check b12aff0c1ebc7458d0d0252bf8f927ce34fc07c1..HEAD
git status --short
```

Require package smoke success, 8/8 runtime tests, `Skill is valid!`, no range whitespace errors, and an empty status.

- [ ] **Step 2: Review scope and release diff**

Run:

```bash
git diff --stat fcd703e3efa869652c471444a99eac556cc0c339..HEAD
git diff --name-status fcd703e3efa869652c471444a99eac556cc0c339..HEAD
git diff -- skills/voice-to-script-en-ch/SKILL.md \
  skills/voice-to-script-en-ch/references/finalization.md
```

Confirm the second-cycle production diff changes only above-15 ordering and that the full branch still matches the approved adaptive-discovery specification.

- [ ] **Step 3: Inspect every local installation before replacement**

Use read-only discovery to list directories named `voice-to-script-en-ch` or the retired old slug under `/Users/ruohanyu/.codex/skills` and `/Users/ruohanyu/.agents/skills`. Confirm `/Users/ruohanyu/.codex/skills/voice-to-script-en-ch` is the single intended canonical target. Never touch unrelated skills.

- [ ] **Step 4: Build and validate a recoverable runtime replacement**

Create a temporary directory with `mktemp -d`, copy only `skills/voice-to-script-en-ch` into it, and validate that copy with `quick_validate.py`. Move the current canonical directory to Trash with a timestamped name, then move the validated replacement into `/Users/ruohanyu/.codex/skills/voice-to-script-en-ch`. Validate the installed copy again. Do not create an old-name alias.

- [ ] **Step 5: Verify remote ancestry and push the existing repository**

Run:

```bash
git fetch origin
git merge-base --is-ancestor origin/main HEAD
git push origin HEAD:main
```

If ancestry fails or the remote changed unexpectedly, stop without force-pushing. Leave the GitHub repository name unchanged.

- [ ] **Step 6: Confirm published and installed identity**

Run:

```bash
git ls-remote origin refs/heads/main
git rev-parse HEAD
python3 /Users/ruohanyu/.codex/skills/.system/skill-creator/scripts/quick_validate.py /Users/ruohanyu/.codex/skills/voice-to-script-en-ch
```

Report the matching local and remote commit, validation results, canonical installation path, preserved Trash backup, and any remaining non-blocking concern.
