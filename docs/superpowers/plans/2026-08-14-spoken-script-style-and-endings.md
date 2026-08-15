# Spoken Script Style and Endings Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Revise `voice-to-script-en-ch` so finalized scripts are breathable, source-faithful, clip-ready, and productively unresolved, with one complete script plus at least three labeled alternate endings per language.

**Architecture:** Add `references/spoken-style.md` as the single detailed style contract. Route it from `SKILL.md`, record its required story fields in `references/story-workflow.md`, and enforce polishing, parity, runtime, and output assembly in `references/finalization.md`. Validate judgment-heavy behavior with fresh-context agent runs and retain the shell smoke test only for package completeness.

**Tech Stack:** Markdown skill/reference files, POSIX shell package checks, Python runtime estimator tests, Codex skill validator, fresh-context behavioral evaluations.

## Global Constraints

- Never invent a fact, feeling, event, quotation, objection, physical detail, credential, number, or outcome.
- Preserve the existing identity, audiences, bilingual architecture, evidence workflow, dependencies, safety rules, and 2.5-to-15-minute runtime.
- Replace total resolution with an earned turn followed by exactly one unresolved tension.
- Return one complete script plus at least three additional labeled alternate endings for every requested language.
- Count only the complete script toward runtime; exclude alternate endings and delivery notes.
- Keep the public repository standalone; do not add dependencies, scripts, aliases, plugin packaging, or unrelated changes.

---

### Task 1: Establish behavioral RED contracts

**Files:**
- Modify: `tests/behavioral/scenarios.md`
- Modify: `tests/behavioral/rubric.md`
- Create: `tests/behavioral/baseline-spoken-style-2026-08-14.md`
- Modify: `tests/test_package_smoke.sh`

**Interfaces:**
- Consumes: the approved design and the pre-revision skill at commit `9417bc6`.
- Produces: eight new scenarios numbered 49–56, expanded grading dimensions, baseline evidence, and a package contract requiring `references/spoken-style.md`.

- [ ] **Step 1: Add eight behavioral scenarios**

Append cases with these exact observable contracts:

```markdown
### 49. Breathable deletion pass
Source contains overwritten explanations and long sentences.
Observe: the result cuts redundant explanation, uses one-breath lines and purposeful fragments, and preserves distinctive source phrasing.

### 50. No invented embodiment or quotation
Source contains an abstract feeling and a paraphrased objection but no physical detail or exact quote.
Observe: the result invents neither sensory detail nor quoted dialogue and keeps the objection unquoted.

### 51. Earned turn with one unresolved tension
Source supports a decision but not certainty about its future result.
Observe: the complete script earns the decision and leaves exactly that future uncertainty unresolved rather than adding a lesson.

### 52. Main ending and labeled alternatives
Approved English finalization with enough material for all four ending modes.
Observe: one complete script uses a recommended ending and is followed by at least three materially different alternatives labeled by mode and optimization goal where applicable.

### 53. Ending-mode integrity
Source supports a story request, named reader, callback, and unapologized position.
Observe: each ending performs its named function, remains one or two breaths, avoids a generic maxim, and preserves the same facts and unresolved tension.

### 54. Source-grounded clip line
Source contains one strong self-recognition line buried beneath explanation.
Observe: the line appears around the two-thirds point, the explanation after it is removed, and the line identifies the viewer rather than merely flattering the writer.

### 55. Spoken-language prohibitions
Source includes throat-clearing, parentheses, semicolons, asides, announced-insight phrases, and engagement bait.
Observe: final scripts remove those forms while preserving useful repetition, discomfort, and source rhythm.

### 56. Bilingual endings and runtime boundary
Bilingual finalization with alternates long enough to push the combined deliverable over the limit.
Observe: each complete script independently passes 2.5–15 minutes; alternates and notes are excluded; both languages preserve the earned turn, unresolved tension, and ending-mode intent without literal translation.
```

- [ ] **Step 2: Expand the behavioral rubric**

Replace resolution-focused dimensions with observable dimensions for earned movement, one unresolved tension, spoken breath/rhythm, source-grounded physicality and quotations, clip-line quality/placement, alternate-ending completeness, ending-mode integrity, and runtime exclusion of alternatives. Retain research, dependency, language, safety, delivery-note, and output-cleanliness dimensions.

- [ ] **Step 3: Update the package completeness test**

Add `require_file "$skill_dir/references/spoken-style.md"` and change the expected scenario count from `48` to `56`. Do not use source-text assertions as proof of behavioral compliance.

- [ ] **Step 4: Run the deterministic RED check**

Run `sh tests/test_package_smoke.sh`.

Expected: exit 1 with `missing required file: .../references/spoken-style.md`.

- [ ] **Step 5: Run fresh-context behavioral baselines without the revision**

Use three independent fresh agents, each instructed only to use the current skill and finalize one supplied source. Cover: overwritten English source, absent quote/physical detail, and bilingual endings/runtime. Do not include expected observations in their prompts. Grade outputs against scenarios 49–56 and record exact failures in `tests/behavioral/baseline-spoken-style-2026-08-14.md`.

Expected RED evidence includes at least one of: fully resolved lesson ending, no alternate endings, overlong prose lines, invented detail/quotation, absent clip line, or runtime ambiguity. If the old skill unexpectedly passes a behavior, retain that behavior as a regression requirement and identify the remaining observed failures.

- [ ] **Step 6: Commit the RED contracts**

```bash
git add tests/behavioral/scenarios.md tests/behavioral/rubric.md tests/behavioral/baseline-spoken-style-2026-08-14.md tests/test_package_smoke.sh
git commit -m "test: define spoken script style behavior"
```

---

### Task 2: Add the spoken-style contract and revise story structure

**Files:**
- Create: `skills/voice-to-script-en-ch/references/spoken-style.md`
- Modify: `skills/voice-to-script-en-ch/SKILL.md`
- Modify: `skills/voice-to-script-en-ch/references/story-workflow.md`

**Interfaces:**
- Consumes: approved source ledger, narrative direction, and story contract conventions.
- Produces: one detailed style reference and an approved story contract containing `earned turn`, `one unresolved tension`, `clip line source`, and `recommended ending mode`.

- [ ] **Step 1: Write `spoken-style.md` as a positive output recipe**

Use these sections: `Protect the writer's reality`, `Cut before rewriting`, `Performability pass`, `Preserve voice and useful repetition`, `Build the clip line`, `Design the ending`, `Ending modes`, `Reject weak endings`, and `Final spoken-style audit`.

Encode every approved rule: no invention; aloud/breath test; line-break pauses and em-dash beats; English contractions; no parentheses, semicolons, or performative asides; deletion of throat-clearing and duplicate explanation; fragments; two-or-three-time key-phrase repetition; source-only physical detail and quotations; implicit causality; preserved verbal tics and uncomfortable admissions; exactly one unresolved tension; four ending modes; one-or-two-breath endings; clip line around two-thirds; and all `Never` items. Reject transferable endings, abstract `you`, maxims, repeated explanations, endings improved by deleting their final line, and endings that resolve every tension. Require callbacks to work even when the viewer does not remember the opening verbatim.

- [ ] **Step 2: Route the reference from `SKILL.md`**

Require reading `references/spoken-style.md` before drafting or revising a script. Change the narrative engine to `question → therefore → but → therefore → but → earned turn → one unresolved tension`. Replace instructions to resolve the central conflict with instructions to earn meaningful movement while leaving exactly one intentional tension open.

- [ ] **Step 3: Revise story directions and the approved story contract**

In `story-workflow.md`, replace `kind of resolution` with `earned turn` and `what remains unresolved`. Replace `resolution and final takeaway` with:

```markdown
- earned turn and exactly one unresolved tension;
- source passage for the clip line;
- recommended ending mode and facts/disclosures available to alternates;
```

Update excess-material and imitation guidance so it preserves earned movement and productive openness rather than forcing clear resolution.

- [ ] **Step 4: Run package and regression checks**

Run `sh tests/test_package_smoke.sh` and `python3 -m unittest tests/test_runtime_estimator.py -v`.

Expected: both pass. The new detailed final-output behaviors remain for Task 3 and fresh-context validation.

- [ ] **Step 5: Commit the core contract**

```bash
git add skills/voice-to-script-en-ch/SKILL.md skills/voice-to-script-en-ch/references/story-workflow.md skills/voice-to-script-en-ch/references/spoken-style.md
git commit -m "feat: add spoken script style contract"
```

---

### Task 3: Enforce polishing, alternate endings, and runtime boundaries

**Files:**
- Modify: `skills/voice-to-script-en-ch/references/finalization.md`

**Interfaces:**
- Consumes: the approved story contract and `references/spoken-style.md`.
- Produces per language: complete script with recommended ending, at least three labeled additional endings, then light delivery notes.

- [ ] **Step 1: Add the source-faithful spoken drafting pass**

Require an initial deletion pass, then an aloud pass that splits or cuts every stumble, restart, or breath failure. Specify one breath per line and line breaks as pauses. Apply contractions to English and equivalent natural compression to Chinese without forcing English grammar onto Chinese.

- [ ] **Step 2: Strengthen polishing instructions and integrity audits**

Tell `humanizer` and `shuorenhua` to preserve line rhythm, fragments, useful repetition, source tics, uncomfortable admissions, the clip line, the earned turn, and the unresolved tension. After polishing, reject or repair invented detail, smoothed-away edges, restored explanation, generic advice, or formatting that cannot be performed.

- [ ] **Step 3: Add the ending-generation pass**

Choose the strongest ending mode for the complete script, then generate at least three additional endings. Label them as `Story request — best for comments`, `Named reader — best for shares`, `Callback — best for cohesion`, or `Unapologized position`. Ensure the complete ending plus alternatives collectively use at least three modes and that alternatives are materially distinct.

- [ ] **Step 4: Update bilingual parity and runtime rules**

Add clip line, earned turn, unresolved tension, and ending intent to the parity audit. Run `scripts/estimate_runtime.py` on the complete script body only, before appending alternate endings and delivery notes. Repeat polishing and measurement only on the complete script when duration changes.

- [ ] **Step 5: Update the clean output contract**

Define this per-language order:

```text
[Complete teleprompter script]

Alternate endings
[At least three labeled alternatives]

Light delivery notes
[Sparse notes]
```

Keep internal workbench, research, polishing, runtime, parity, and editorial commentary suppressed.

- [ ] **Step 6: Run deterministic validation**

Run:

```bash
sh tests/test_package_smoke.sh
python3 -m unittest tests/test_runtime_estimator.py -v
python3 /Users/ruohanyu/.codex/skills/.system/skill-creator/scripts/quick_validate.py skills/voice-to-script-en-ch
git diff --check
```

Expected: smoke passes, 4 runtime tests pass, validator prints `Skill is valid!`, and diff check is clean.

- [ ] **Step 7: Commit finalization behavior**

```bash
git add skills/voice-to-script-en-ch/references/finalization.md
git commit -m "feat: add unresolved alternate ending workflow"
```

---

### Task 4: Forward-test and close behavioral gaps

**Files:**
- Create: `tests/behavioral/results-spoken-style-2026-08-14.md`
- Modify if failures require it: `skills/voice-to-script-en-ch/SKILL.md`
- Modify if failures require it: `skills/voice-to-script-en-ch/references/spoken-style.md`
- Modify if failures require it: `skills/voice-to-script-en-ch/references/story-workflow.md`
- Modify if failures require it: `skills/voice-to-script-en-ch/references/finalization.md`

**Interfaces:**
- Consumes: scenarios 49–56 and the revised skill without expected answers leaked into prompts.
- Produces: independent execution evidence and only the minimal wording refinements needed to close observed gaps.

- [ ] **Step 1: Run three independent fresh-context evaluations**

Use the same raw source packets as the RED baselines. Instruct each agent to use `$voice-to-script-en-ch` from the repository skill path and return only the user-facing response. Do not mention suspected failures, intended fixes, or rubric language.

- [ ] **Step 2: Grade every observable output manually**

For each output, record `pass`, `partial`, or `fail` for scenarios 49–56. Check actual line length and sayability, source fidelity, exact number of unresolved tensions, clip-line placement, main-plus-three-alternate structure, ending labels and distinctness, banned phrasing, bilingual parity, and runtime scope.

- [ ] **Step 3: Close only demonstrated gaps**

If a run fails, identify the exact rationalization or output-shape error, patch the smallest controlling instruction, and rerun the same fresh scenario. Do not broaden scope or add hypothetical rules.

- [ ] **Step 4: Record final evidence**

Write raw prompt summaries, observed behavior, verdicts, and any iteration notes to `tests/behavioral/results-spoken-style-2026-08-14.md`. Do not claim dependency invocation when traces are unavailable.

- [ ] **Step 5: Commit behavioral evidence and refinements**

```bash
git add tests/behavioral/results-spoken-style-2026-08-14.md skills/voice-to-script-en-ch
git commit -m "test: validate spoken script style workflow"
```

If no skill refinement was needed, stage only the results file.

---

### Task 5: Normalize the local runtime and verify the release

**Files:**
- Mirror: `skills/voice-to-script-en-ch/` to `/Users/ruohanyu/.codex/skills/voice-to-script-en-ch/`

**Interfaces:**
- Consumes: the fully validated repository skill.
- Produces: one matching canonical local runtime copy and a pushed public `main` commit.

- [ ] **Step 1: Review final scope and repository state**

Run `git status --short`, `git diff c169493..HEAD --stat`, and `git diff --check`. Confirm changes are limited to the approved design/plan, behavioral contracts/results, core skill routing, story workflow, spoken-style reference, finalization, and package completeness test. Installation guidance, identity, dependencies, scripts, and packaging remain unchanged.

- [ ] **Step 2: Mirror the validated skill to the canonical runtime copy**

Run:

```bash
rsync -a --delete --exclude '__pycache__' --exclude '*.pyc' skills/voice-to-script-en-ch/ /Users/ruohanyu/.codex/skills/voice-to-script-en-ch/
```

Do not touch any other installed skill.

- [ ] **Step 3: Run the full verification gate**

Run:

```bash
sh tests/test_package_smoke.sh
python3 -m unittest tests/test_runtime_estimator.py -v
python3 /Users/ruohanyu/.codex/skills/.system/skill-creator/scripts/quick_validate.py skills/voice-to-script-en-ch
python3 /Users/ruohanyu/.codex/skills/.system/skill-creator/scripts/quick_validate.py /Users/ruohanyu/.codex/skills/voice-to-script-en-ch
diff -qr --exclude='__pycache__' --exclude='*.pyc' skills/voice-to-script-en-ch /Users/ruohanyu/.codex/skills/voice-to-script-en-ch
git diff --check
git status --short
```

Expected: package checks pass; 4 runtime tests pass; both validators report valid; repository and runtime skill copies match; diff check is clean; status contains no uncommitted changes.

- [ ] **Step 4: Push and verify public `main`**

Run:

```bash
git push origin HEAD:main
test "$(git rev-parse HEAD)" = "$(git ls-remote origin refs/heads/main | awk '{print $1}')"
gh repo view ruohanus/voice-to-script-en-ch --json nameWithOwner,url,visibility,defaultBranchRef
```

Expected: push succeeds, local and remote SHAs match, and the existing public repository remains `ruohanus/voice-to-script-en-ch` with default branch `main`.
