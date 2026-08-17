# Adaptive Discovery and Story-Led Runtime Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Make `voice-to-script-en-ch` collect richer story material before angle selection, use adaptive post-selection discovery, treat 2–15 minutes as a preferred rather than hard range, and provide optional Claude/DeepSeek replacement-script prompts after final delivery.

**Architecture:** Keep `SKILL.md` as the compact router and precedence contract. Put discovery and angle-state behavior in `references/story-workflow.md`, keep runtime-bearing assembly in `references/finalization.md`, add a focused `references/external-polish.md` for third-party handoff prompts, and make `scripts/estimate_runtime.py` report descriptive preferred-range status without rejecting out-of-window scripts. Behavioral scenarios remain the authoritative generative contract; unit and smoke tests cover deterministic boundaries and package wiring.

**Tech Stack:** Markdown skill instructions, Python 3 standard library runtime estimator, POSIX shell smoke checks, `unittest`, fresh-context Codex behavioral runs, Git.

## Global Constraints

- Preserve factual integrity, attribution, source speech status, the user's real experience, and the no-invention rule above every other requirement.
- Ask for duration once per new script project unless the user already supplied it; never repeat the intake question on later passes in the same project.
- Use tailored batches of exactly 4–6 discovery questions and always allow selective answers, skipping, or freestyle input.
- Withhold story-angle proposals until the five-part readiness gate passes, unless the user explicitly says `draft now` or `finalize now`.
- Present one best-supported angle plus two promising alternatives whose missing material is named precisely.
- Always offer one optional 4–6-question strengthening pass after angle selection.
- Reopen angle selection only after a material change to meaning, conflict or stakes, audience promise, user position, or best-supported angle.
- Treat 2–15 minutes as preferred, not mandatory; approximately 45 seconds is acceptable, and scripts above 15 minutes require a one-video, series, or narrower-story choice before drafting.
- Never pad to duration or cut essential meaning solely to fit the preferred range.
- Preserve the existing research approval, bilingual independence, Humanizer, `shuorenhua`, spoken-style, clip-line, ending, privacy, and source-integrity contracts.
- Claude and DeepSeek are optional post-finalization handoffs, not replacements for required local polishing skills or automatic external integrations.
- Never send user material to an external service automatically.

---

### Task 1: Define the RED behavioral and package contracts

**Files:**
- Modify: `tests/behavioral/scenarios.md`
- Modify: `tests/behavioral/rubric.md`
- Modify: `tests/test_package_smoke.sh`
- Modify: `docs/testing.md`
- Create: `tests/behavioral/baseline-adaptive-discovery-2026-08-17.md`
- Create: `tests/behavioral/fixtures/adaptive-discovery-2026-08-17/packet-1-thin-short.md`
- Create: `tests/behavioral/fixtures/adaptive-discovery-2026-08-17/packet-2-angle-shift.md`
- Create: `tests/behavioral/fixtures/adaptive-discovery-2026-08-17/packet-3-bilingual-ready.md`

**Interfaces:**
- Consumes: Existing scenarios 1–56, rubric dimensions, package smoke helpers, and the approved design at `docs/superpowers/specs/2026-08-17-adaptive-discovery-and-runtime-design.md`.
- Produces: Scenarios 57–70, a 70-scenario smoke contract, three neutral source packets, and an honest pre-change baseline for Tasks 2–5.

- [ ] **Step 1: Add the new behavioral scenarios**

Append these exact scenario headings and observable contracts to `tests/behavioral/scenarios.md`:

```markdown
### 57. Duration intake or supplied-duration recognition

Input variants: a new project with no duration; a new project that already requests 90 seconds.
Observe: the first variant asks once for exact duration, rough range, or freestyle; the second accepts 90 seconds without asking again; later passes in either project do not repeat the duration intake.

### 58. Freestyle and story-led window explanation

Input: a new project with usable material but no duration.
Observe: the response explains that freestyle is allowed, 2–15 minutes is preferred rather than mandatory, questioning scales with material quality and intended length, a strong compact story may be about 45 seconds, and the story will not be padded.

### 59. Tailored discovery batch

Input: thin source material with one concrete event but unclear conflict, stakes, and change.
Observe: the response asks 4–6 source-specific questions with plausible narrative payoff and explicitly permits selective answers, skipping, or continued freestyle; it does not present story angles.

### 60. Readiness gate withholds premature angles

Input: material lacking a meaningful conflict, recognizable stakes, and earned change.
Observe: the response continues discovery and does not propose narrative directions merely because usable material exists.

### 61. Late story-selection checkpoint

Input: material containing a central question, concrete event, meaningful conflict and stakes, earned change, and enough material for an honest target-length story.
Observe: only now does the response present the story-selection checkpoint, before writing a polished draft.

### 62. Best-supported and developmental alternatives

Input: one draft-ready angle plus two plausible but under-supported perspectives.
Observe: the checkpoint labels one angle best-supported and ready, presents two promising alternatives without calling them weaker, and names the exact additional material each alternative needs.

### 63. Developmental-angle gap questions

Input: the user selects one promising alternative from scenario 62.
Observe: the next 4–6 questions target that alternative's named gaps rather than reverting to generic discovery.

### 64. Optional post-selection strengthening pass

Input: the user selects the best-supported angle.
Observe: the response offers one optional 4–6-question strengthening batch, states what it could improve, and allows selective answers, freestyle, skipping, or `draft now`.

### 65. Minor additions preserve the selected angle

Input: after selection, the user adds a useful detail that strengthens a beat without changing meaning, conflict, audience promise, position, or angle support.
Observe: the detail is merged without another angle checkpoint.

### 66. Material change reopens angle selection

Input: after selection, the user adds material that changes the central meaning, strongest conflict, audience promise, position, or best-supported angle.
Observe: the response briefly explains the shift and presents a refreshed set of three angles, which may be completely new.

### 67. Immediate-draft override remains honest

Input: thin material plus `finalize now`, with no duration supplied.
Observe: the response asks only for exact duration, rough range, or freestyle; after that choice it skips optional discovery and angle comparison, chooses the strongest supportable story, and neither invents nor pads.

### 68. Sub-two-minute story is allowed

Input: source material supports a compelling 45-to-90-second story but not an interesting two-minute story.
Observe: the skill delivers the shorter complete story, reports it as below the preferred range without treating it as invalid, and does not pad it.

### 69. Above-15-minute choice

Input: source material and requested scope genuinely require more than 15 minutes.
Observe: before drafting, the response offers one longer video, a short series, or a narrower story and recommends the option with the strongest narrative coherence.

### 70. Optional external-polish handoff

Input: completed bilingual finalization.
Observe: after each finalized script and light notes, the response gives a privacy-aware optional handoff: Claude for English and DeepSeek for Simplified Chinese. Each copy-paste prompt requests a complete replacement script, permits attention and spoken-rhythm improvements, locks facts and approved narrative decisions, prohibits invention, retains indirect speech and endings, and keeps length within 10 percent.
```

- [ ] **Step 2: Align earlier scenarios and the rubric with the soft runtime contract**

In scenarios 37, 38, 48, and 56, replace hard 2.5-minute validity language with these requirements:

```markdown
The runtime-bearing script is the complete body plus recommended conclusion. The estimator describes whether it is below, within, or above the preferred 2–15-minute window. A result outside that window is not invalid solely because of duration. `finalize now` may skip optional discovery but still requires one duration-or-freestyle choice when duration is absent.
```

Replace rubric dimension 18 and its runtime note with:

```markdown
18. Story-led runtime handling for the complete body plus recommended conclusion: explicit target respected when supportable, preferred 2–15-minute status reported, no padding below range, and required choice before drafting above range.

For runtime, grade each requested language independently. Measure the complete teleprompter body plus its recommended conclusion. Exclude the visible recommended-ending heading, alternate endings, delivery notes, and optional external-polish handoff. Duration outside 2–15 minutes is acceptable when the story supports it and the workflow follows the below- or above-range contract.
```

Add rubric dimensions for intake efficiency, question quality, readiness-gate integrity, adaptive re-selection, and external-handoff fidelity.

Use these exact dimensions after the existing list:

```markdown
26. One-time duration intake and accurate freestyle explanation.
27. Source-specific 4–6-question discovery quality and skip/freestyle permission.
28. Five-part readiness-gate integrity and late angle-selection timing.
29. Best-supported versus promising-alternative honesty and gap specificity.
30. Post-selection strengthening quality and material-change re-selection discipline.
31. Optional external-polish privacy, source-lock, replacement-script, and language-routing fidelity.
```

- [ ] **Step 3: Add three neutral fresh-context packets**

Write these raw user-style packets with no expected answers or evaluation language:

```markdown
# packet-1-thin-short.md

I keep thinking about a meeting last Thursday. Two teammates were waiting for me to approve a tiny wording change. I said I'd look later, and everyone moved to something else. It felt strange, but I don't yet know what I think it means. Help me turn this into a talking-head script.

# packet-2-angle-shift.md

## First message

I left a stable operations job to build a small product with a friend. At first I described it as wanting more freedom. The clearest moment was closing my laptop after another planning meeting and realizing I couldn't remember one decision I'd made for myself that week. I was scared of losing a reliable salary, but I resigned anyway. Help me develop this as a video story. I haven't chosen a length.

## Later message after selecting the freedom angle

There's something I left out. The real reason wasn't freedom. My younger brother had asked why I always sounded angry after work. I dismissed him, then heard myself speaking to a teammate in exactly the same impatient tone two days later. I wasn't mainly trying to escape the schedule. I was afraid of becoming someone I didn't like. I still don't know whether starting a company will change that.

# packet-3-bilingual-ready.md

I used to answer every question on my team because being useful made me feel secure. One Tuesday, a designer moved a deadline while I was on a client call because she assumed she still needed my approval. The client waited, the designer waited, and I came out of the call feeling important for about ten seconds. Then I realized I had built a team that paused when I disappeared.

The conflict is that I kept telling everyone I wanted ownership from them, but I corrected small decisions before they could learn from them. A colleague had told me that I was moving too quickly for anyone else to take the wheel. I didn't believe her at the time. After the delayed deadline, I chose two kinds of decisions the team could make without me for a three-week experiment. I'm relieved, but I still don't know whether I'll trust the system when a decision goes badly.

I can imagine this being about control, identity, or what delegation actually costs. I ultimately want both an English and natural Simplified Chinese script, but help me develop the story before drafting. I haven't chosen the duration.
```

For packet 2, send `First message` first. Send `Later message after selecting the freedom angle` only after the first angle checkpoint and the user's simulated selection. Do not mention scenario numbers, desired behavior, or the planned fix during a run.

- [ ] **Step 4: Update deterministic package assertions**

Change `tests/test_package_smoke.sh` to require 70 scenarios and replace the obsolete `2.5` assertion with case-insensitive assertions for:

```sh
require_pattern '2.*15.*preferred|preferred.*2.*15' "$skill_dir" 'preferred runtime window'
require_pattern '4.*6.*question' "$skill_dir" 'adaptive discovery batch'
require_pattern 'best-supported angle' "$skill_dir" 'late story-selection checkpoint'
require_pattern 'Claude' "$skill_dir" 'English external-polish handoff'
require_pattern 'DeepSeek' "$skill_dir" 'Chinese external-polish handoff'
```

Update `docs/testing.md` from 56 to 70 required behavioral cases.

- [ ] **Step 5: Run RED checks against the unchanged skill**

Run:

```bash
sh tests/test_package_smoke.sh
python3 -m unittest tests/test_runtime_estimator.py -v
```

Expected: smoke test fails because the current skill still declares a hard 2.5–15-minute range and lacks the adaptive-discovery and external-polish contracts; runtime tests remain green because Task 2 has not changed them yet.

- [ ] **Step 6: Capture the pre-change behavioral baseline**

Run packet 1 and packet 3 in separate ephemeral contexts against the current skill with this command pattern, substituting each exact tracked single-turn packet path:

```bash
codex exec --ephemeral --dangerously-bypass-hook-trust -s read-only -C . \
  -o /tmp/adaptive-baseline-packet-1.md - \
  < tests/behavioral/fixtures/adaptive-discovery-2026-08-17/packet-1-thin-short.md
```

For packet 2, use one isolated persistent same-context session because `codex exec --ephemeral` cannot be resumed. Send `First message`, wait for the first angle checkpoint, send the simulated freedom-angle selection, then send `Later message after selecting the freedom angle`. Do not use prior output, scenario guidance, or another packet's context in that session. Record the session ID, exact prompts, exact final responses or trace identifiers, and scenario 57–70 grades in `tests/behavioral/baseline-adaptive-discovery-2026-08-17.md`.

The baseline must explicitly grade premature angle proposal, question count and specificity, duration explanation, material-change handling, and external handoff. Do not relabel a current failure as pass because it uses adjacent terminology.

- [ ] **Step 7: Commit the RED contract**

```bash
git add tests/behavioral/scenarios.md tests/behavioral/rubric.md tests/test_package_smoke.sh docs/testing.md tests/behavioral/baseline-adaptive-discovery-2026-08-17.md tests/behavioral/fixtures/adaptive-discovery-2026-08-17
git commit -m "test: define adaptive story discovery behavior"
```

---

### Task 2: Make runtime estimation descriptive and story-led

**Files:**
- Modify: `tests/test_runtime_estimator.py`
- Modify: `skills/voice-to-script-en-ch/scripts/estimate_runtime.py`

**Interfaces:**
- Consumes: `estimate_seconds(text: str, language: str) -> float` and the existing JSON CLI.
- Produces: `classify_seconds(seconds: float) -> str` returning `below_preferred`, `within_preferred`, or `above_preferred`; JSON adds `within_preferred_range: bool` while preserving counts and rates.

- [ ] **Step 1: Write failing preferred-window tests**

Replace hard-boundary assertions and extend the CLI test with:

```python
def test_preferred_window_is_two_to_fifteen_minutes(self):
    estimator = load_estimator()
    self.assertEqual(estimator.classify_seconds(45.0), "below_preferred")
    self.assertEqual(estimator.classify_seconds(119.99), "below_preferred")
    self.assertEqual(estimator.classify_seconds(120.0), "within_preferred")
    self.assertEqual(estimator.classify_seconds(900.0), "within_preferred")
    self.assertEqual(estimator.classify_seconds(900.01), "above_preferred")

def test_short_and_long_results_are_descriptive_not_invalid(self):
    estimator = load_estimator()
    short = estimator.estimate("word " * 113, "en")
    long = estimator.estimate("word " * 2251, "en")
    self.assertEqual(short["status"], "below_preferred")
    self.assertFalse(short["within_preferred_range"])
    self.assertEqual(long["status"], "above_preferred")
    self.assertFalse(long["within_preferred_range"])
```

Update the existing CLI expectation to:

```python
self.assertEqual(result["status"], "within_preferred")
self.assertTrue(result["within_preferred_range"])
```

- [ ] **Step 2: Run tests to verify RED**

Run:

```bash
python3 -m unittest tests/test_runtime_estimator.py -v
```

Expected: FAIL because `classify_seconds(120.0)` returns `too_short`, 45 seconds returns `too_short`, and `within_preferred_range` does not exist.

- [ ] **Step 3: Implement the preferred-range API**

Change the estimator constants and classifier to:

```python
PREFERRED_MINIMUM_SECONDS = 120.0
PREFERRED_MAXIMUM_SECONDS = 900.0


def classify_seconds(seconds: float) -> str:
    """Describe an estimate against the preferred 2-to-15-minute window."""
    if seconds < PREFERRED_MINIMUM_SECONDS:
        return "below_preferred"
    if seconds > PREFERRED_MAXIMUM_SECONDS:
        return "above_preferred"
    return "within_preferred"
```

In `estimate`, compute `status = classify_seconds(seconds)` once and include:

```python
"status": status,
"within_preferred_range": status == "within_preferred",
"preferred_minimum_seconds": PREFERRED_MINIMUM_SECONDS,
"preferred_maximum_seconds": PREFERRED_MAXIMUM_SECONDS,
```

Do not add a hard-validity field or reject below/above results.

- [ ] **Step 4: Run runtime tests to verify GREEN**

Run:

```bash
python3 -m unittest tests/test_runtime_estimator.py -v
```

Expected: all runtime estimator tests pass, including English, Simplified Chinese, mixed text, preferred boundaries, and JSON output.

- [ ] **Step 5: Commit the estimator change**

```bash
git add tests/test_runtime_estimator.py skills/voice-to-script-en-ch/scripts/estimate_runtime.py
git commit -m "feat: make runtime guidance story led"
```

---

### Task 3: Implement adaptive discovery and late angle selection

**Files:**
- Modify: `skills/voice-to-script-en-ch/SKILL.md`
- Modify: `skills/voice-to-script-en-ch/references/story-workflow.md`

**Interfaces:**
- Consumes: Source ledger, current-stage router, approved story contract, and the preferred-range estimator status from Task 2.
- Produces: One-time `duration_choice`, five-field `story_readiness`, three-choice `angle_checkpoint`, optional `strengthening_pass`, and material-change `angle_reopen_reason` in the internal workflow.

- [ ] **Step 1: Add failing focused contract checks**

Before editing the skill, run:

```bash
sh tests/test_package_smoke.sh
```

Expected: FAIL on at least the preferred runtime, 4–6 questions, best-supported angle, Claude, or DeepSeek contract.

- [ ] **Step 2: Rewrite the stage router in `SKILL.md`**

Replace the first-capture direction proposal with this compact state progression:

```markdown
| Input state | Action |
|---|---|
| New script project | Reflect usable material, ask once for exact duration, rough range, or freestyle unless already supplied, explain the story-led window, then begin discovery. |
| Discovery pass | Merge material into the source ledger and ask 4–6 highest-value questions; allow selective answers, skipping, or freestyle. Do not propose angles before readiness. |
| Readiness gate passes | Present one best-supported angle and two promising alternatives with named material gaps. |
| User selects an angle | Record it and offer one optional 4–6-question strengthening pass. |
| New material after selection | Merge minor additions; reopen angle selection only after a material change to meaning, conflict or stakes, audience promise, position, or best-supported angle. |
| User says `draft now` or `finalize now` | If duration is absent, ask only for exact duration, rough range, or freestyle; then skip optional discovery and use the strongest supportable story without invention or padding. |
| Selected scope exceeds 15 minutes | Before drafting, offer one longer video, a short series, or a narrower story and recommend the most coherent choice. |
```

Change the precedence/runtime text from a hard 2.5–15-minute gate to the user-authorized target plus the preferred 2–15-minute window. Update the final-output boundary so optional external-polish handoff content is allowed after notes.

- [ ] **Step 3: Replace the first-response contract in `story-workflow.md`**

Add a `New-project duration intake` section containing these non-negotiable points:

```markdown
- Ask once per new project unless duration is already supplied.
- Offer exact duration, rough range, or freestyle.
- Explain that freestyle aims for 2–15 minutes, may be about 45 seconds when that is the strongest complete story, may exceed 15 minutes after a scope choice, and never pads.
- Explain that question depth follows requested duration and the quality of available material.
```

Replace immediate narrative directions with discovery batches of 4–6 source-specific questions. Require the selective-answer, skip, or freestyle permission in each batch.

- [ ] **Step 4: Add the readiness and angle-state contracts**

Add the exact five-field readiness gate:

```markdown
1. compelling central question;
2. concrete moment or event;
3. meaningful conflict with recognizable stakes;
4. earned change, decision, realization, or position;
5. enough source-grounded material for the intended duration, or an honestly shorter complete script.
```

Define the checkpoint as one best-supported ready angle plus two promising alternatives. Require hook, audience promise, conflict and stakes, progression, earned turn, one unresolved tension, ending effect, expected duration, and missing material for each. Require gap-targeted questions when the user selects a promising alternative.

- [ ] **Step 5: Add post-selection strengthening and adaptive reopening**

Require one optional 4–6-question strengthening offer after selection. State that the user may answer selectively, freestyle, skip, or say `draft now`.

Define the reopening predicate exactly as:

```markdown
Reopen only when new material changes the central meaning, strongest conflict or stakes, audience promise, user's actual position, or which angle is best supported. Explain the shift briefly and present a refreshed three-choice checkpoint. Incorporate all lesser additions without re-selection.
```

Update the approved story contract to record requested or inferred duration and `below_preferred`, `within_preferred`, or `above_preferred` status.

- [ ] **Step 6: Run focused tests**

Run:

```bash
sh tests/test_package_smoke.sh
python3 -m unittest tests/test_runtime_estimator.py -v
python3 /Users/ruohanyu/.codex/skills/.system/skill-creator/scripts/quick_validate.py skills/voice-to-script-en-ch
```

Expected: runtime tests and skill validation pass. Smoke may still fail only on Claude/DeepSeek if Task 4 has not yet added the external-polish reference.

- [ ] **Step 7: Commit adaptive discovery**

```bash
git add skills/voice-to-script-en-ch/SKILL.md skills/voice-to-script-en-ch/references/story-workflow.md
git commit -m "feat: delay story selection until discovery is ready"
```

---

### Task 4: Implement story-led finalization and optional external polishing

**Files:**
- Modify: `skills/voice-to-script-en-ch/SKILL.md`
- Modify: `skills/voice-to-script-en-ch/references/finalization.md`
- Create: `skills/voice-to-script-en-ch/references/external-polish.md`
- Modify: `README.md`

**Interfaces:**
- Consumes: Task 2 estimator statuses, Task 3 approved story contract, finalized English and/or Simplified Chinese script sections.
- Produces: Nonblocking below/above-range handling and a per-language optional external-polish section with privacy warning and copy-paste prompt.

- [ ] **Step 1: Add the external-polish reference to package smoke**

Add:

```sh
require_file "$skill_dir/references/external-polish.md"
```

Run `sh tests/test_package_smoke.sh`.

Expected: FAIL with `missing required file`.

- [ ] **Step 2: Replace the hard runtime gate in `finalization.md`**

Rename `Hard runtime gate` to `Story-led runtime check` and implement:

```markdown
- Measure the complete teleprompter body plus recommended conclusion exactly as before.
- Treat `within_preferred` as the normal 2–15-minute result.
- For `below_preferred`, keep the shorter result when extending it would require padding, repetition, or invention; deepen it only with approved material.
- For `above_preferred`, do not draft until the user chooses one longer video, a short series, or a narrower story.
- An explicit user duration remains the target when the source can support it honestly.
- Never reject an otherwise complete script solely for `below_preferred` or an authorized `above_preferred` result.
```

Update every remaining hard-gate or 2.5-minute statement in `SKILL.md`, `finalization.md`, and the approved story contract. Keep the runtime-bearing unit unchanged.

- [ ] **Step 3: Create `references/external-polish.md`**

Create a focused reference with:

```markdown
# Optional external polishing

Offer this only after finalization and all internal integrity checks. Never send content automatically. Warn the user not to upload private or sensitive material unless comfortable sharing it with the third-party service.

Use Claude for English and DeepSeek for Simplified Chinese. In bilingual mode, provide both prompts separately. The external service returns a complete replacement script, not critique.
```

Copy the complete Claude and DeepSeek fenced prompts verbatim from sections `Claude copy-paste prompt` and `DeepSeek copy-paste prompt` in `docs/superpowers/specs/2026-08-17-adaptive-discovery-and-runtime-design.md`. Preserve the 10-percent length lock, fact and speech-status lock, one unresolved tension, clip-line successor, labeled endings, no-invention restrictions, and output-only instruction.

- [ ] **Step 4: Wire the handoff into the final output contract**

In `SKILL.md`, tell finalization to read `references/external-polish.md`. In `finalization.md`, append this user-facing structure after each requested language's light notes:

```text
Optional external polish
[Privacy warning]
[Claude prompt for English or DeepSeek prompt for Simplified Chinese]
```

For bilingual output, keep each prompt with its matching language section. State explicitly that Humanizer and `shuorenhua` ran before this optional handoff and are not replaced by it.

- [ ] **Step 5: Update the public README**

Revise the feature summary and runtime paragraph to state:

```markdown
The skill asks once for an exact duration, rough range, or freestyle. Freestyle aims for a preferred 2–15-minute window, but a strong story may be shorter and an authorized story may be longer. The skill never pads merely to reach a minimum.
```

Describe late story selection, the best-supported plus two developmental alternatives, optional post-selection questions, and optional Claude/DeepSeek handoff. Include the third-party privacy caveat and clarify that these services do not replace Humanizer or `shuorenhua`.

- [ ] **Step 6: Run deterministic GREEN checks**

Run:

```bash
sh tests/test_package_smoke.sh
python3 -m unittest tests/test_runtime_estimator.py -v
python3 /Users/ruohanyu/.codex/skills/.system/skill-creator/scripts/quick_validate.py skills/voice-to-script-en-ch
git diff --check
```

Expected: package smoke passes with 70 scenarios; all runtime tests pass; validator reports `Skill is valid!`; diff check is clean.

- [ ] **Step 7: Commit finalization and handoff**

```bash
git add skills/voice-to-script-en-ch/SKILL.md skills/voice-to-script-en-ch/references/finalization.md skills/voice-to-script-en-ch/references/external-polish.md README.md tests/test_package_smoke.sh
git commit -m "feat: add story-led finalization handoff"
```

---

### Task 5: Forward-test, document, mirror, and prepare release

**Files:**
- Create: `tests/behavioral/results-adaptive-discovery-2026-08-17.md`
- Create: `tests/behavioral/fixtures/adaptive-discovery-2026-08-17/green-packet-1-output.md`
- Create: `tests/behavioral/fixtures/adaptive-discovery-2026-08-17/green-packet-2-output.md`
- Create: `tests/behavioral/fixtures/adaptive-discovery-2026-08-17/green-packet-3-output.md`
- Modify if needed: `skills/voice-to-script-en-ch/SKILL.md`
- Modify if needed: `skills/voice-to-script-en-ch/references/story-workflow.md`
- Modify if needed: `skills/voice-to-script-en-ch/references/finalization.md`
- Modify if needed: `skills/voice-to-script-en-ch/references/external-polish.md`

**Interfaces:**
- Consumes: Tasks 1–4, neutral packets, scenarios 57–70, rubric, deterministic tests.
- Produces: Auditable fresh-context evidence, one canonical installed runtime copy, a reviewed release commit, and a clean branch ready for the user's chosen integration action.

- [ ] **Step 1: Run the three neutral packets in isolated contexts**

Run packet 1 and packet 3 in separate ephemeral contexts with only the public skill and raw packet available. For packet 2, use one isolated persistent same-context session: send `First message`, wait for the first angle checkpoint, send the simulated freedom-angle selection, then send `Later message after selecting the freedom angle`. Do not disclose scenario numbers, expected behavior, previous failures, or planned fixes, and do not carry context between packets.

Capture exact final outputs as the three `green-packet-*-output.md` files. Record the command, model/runtime context, and trace identifier when available in `results-adaptive-discovery-2026-08-17.md`.

- [ ] **Step 2: Grade all applicable new scenarios**

Use rubric grades `pass`, `partial`, `fail`, or `not applicable`. Explicitly count each question batch, inspect whether angles appeared before readiness, identify every named alternative gap, compare pre- and post-shift angles, and verify that optional external prompts preserve facts, speech status, runtime, clip-line successor, unresolved tension, and endings.

Do not mark scenario 68 passing unless the produced short script is complete and unpadded. Do not mark scenario 70 passing from model names alone; inspect the full copy-paste constraints and privacy warning.

- [ ] **Step 3: Correct only evidence-backed failures and rerun affected packets**

For each `partial` or `fail`, write the exact observed output and violated contract into the results file. Make the smallest instruction change in the responsible reference, rerun only the affected packet in a new isolated context, and retain both the failing and succeeding exact outputs when the fix changes release confidence.

Stop after three consecutive speculative fixes to the same failure class and report the remaining concern instead of layering unverified instructions.

- [ ] **Step 4: Run the complete release gate**

Run:

```bash
sh tests/test_package_smoke.sh
python3 -m unittest tests/test_runtime_estimator.py -v
python3 /Users/ruohanyu/.codex/skills/.system/skill-creator/scripts/quick_validate.py skills/voice-to-script-en-ch
git diff --check
git status --short
```

Expected: smoke passes, all runtime tests pass, validator reports `Skill is valid!`, diff check is clean, and status contains only intended Task 5 evidence or corrective files before commit.

- [ ] **Step 5: Commit behavioral evidence and any proven corrections**

```bash
git add tests/behavioral/results-adaptive-discovery-2026-08-17.md tests/behavioral/fixtures/adaptive-discovery-2026-08-17 skills/voice-to-script-en-ch
git commit -m "test: validate adaptive discovery workflow"
```

If `skills/voice-to-script-en-ch` has no Task 5 corrections, Git will simply omit unchanged files.

- [ ] **Step 6: Request a whole-branch review**

Review from the parent of Task 1's RED-contract commit through `HEAD`. Require the reviewer to check all 14 new scenarios, earlier scenario consistency, runtime API compatibility, source fidelity, finalize-now friction, optional external privacy, and exact prompt preservation. Resolve Critical and Important findings before release; record Minor deferrals explicitly.

- [ ] **Step 7: Mirror only the canonical local runtime copy**

First inspect candidate installations:

```bash
find /Users/ruohanyu/.agents/skills /Users/ruohanyu/.codex/skills -maxdepth 2 -type d \( -iname '*voice*script*' -o -iname '*speaking*ideas*' \) -print 2>/dev/null | sort
```

Require exactly one intended canonical target at `/Users/ruohanyu/.codex/skills/voice-to-script-en-ch`. Then mirror:

```bash
rsync -a --delete --exclude='__pycache__' --exclude='*.pyc' skills/voice-to-script-en-ch/ /Users/ruohanyu/.codex/skills/voice-to-script-en-ch/
python3 /Users/ruohanyu/.codex/skills/.system/skill-creator/scripts/quick_validate.py /Users/ruohanyu/.codex/skills/voice-to-script-en-ch
diff -qr --exclude='__pycache__' --exclude='*.pyc' skills/voice-to-script-en-ch /Users/ruohanyu/.codex/skills/voice-to-script-en-ch
```

Expected: installed validator reports `Skill is valid!` and `diff -qr` prints nothing. Do not delete or alter unrelated skill directories.

- [ ] **Step 8: Re-run verification on the exact release commit**

Run:

```bash
sh tests/test_package_smoke.sh
python3 -m unittest tests/test_runtime_estimator.py -v
python3 /Users/ruohanyu/.codex/skills/.system/skill-creator/scripts/quick_validate.py skills/voice-to-script-en-ch
git diff --check
test -z "$(git status --porcelain)"
git rev-parse HEAD
```

Expected: every command succeeds, worktree is clean, and the printed SHA identifies the reviewed release candidate.

- [ ] **Step 9: Hand off the integration decision**

Do not force-push or rename the repository. After the reviewed release candidate is green, use `superpowers:finishing-a-development-branch` and execute the user's chosen integration path. If the user authorizes a direct update to public `main`, push without force and verify `git ls-remote origin refs/heads/main` matches the local release SHA.
