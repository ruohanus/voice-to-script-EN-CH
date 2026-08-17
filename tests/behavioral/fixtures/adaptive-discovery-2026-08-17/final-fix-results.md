# Final adaptive-discovery fix-wave results

Date: 2026-08-17

## Isolation and dispatch

Every context used the exact instruction and raw-turn sequence in `final-fix-evaluator-dispatch.md`, `codex-cli 0.146.0`, model `gpt-5.6-sol`, and reasoning effort `medium`. Each initial command started a fresh context. Multi-turn sessions were resumed only for later raw turns in the same case. Evaluators were not given findings, scenarios, rubric, expected observations, earlier outputs, design, plan, or reports.

The successful packet 3, scenario 67, and packet 4 runs read implementation commit `dbc758a93067378321b3570893dcff0b00b0cff0`. Packet 2 began from the same strengthening state before the later unrelated runtime-stop and no-duration-finalize clarifications. Scenarios 63 and 65 began after the over-15 priority wording and before only the unrelated no-duration-finalize clarification. Scenario 69 attempt 3 contains the final over-15 priority wording; the later implementation change affects only missing-duration immediate finalization.

| Context | Raw tracked turns | Exact output | Session identifier | Grade |
|---|---|---|---|---|
| Packet 2 refreshed selection | `final-fix-packet-2-turn-1.md` through `turn-4.md` | `final-fix-packet-2-output.md` | `01a01178-5d73-7f02-aa45-f74e9f98bd9b` | pass |
| Packet 3 reproducibility | `packet-3-bilingual-ready.md` | `final-fix-packet-3-output.md` | `01a01183-b283-75b2-9143-2bb36bd94a8b` | pass |
| Scenario 63 | `final-fix-selected-angle-source.md`, `final-fix-scenario-63-turn-2.md`, `turn-3.md` | `final-fix-scenario-63-output.md` | `01a0117a-ed40-78b1-a62e-d270c4558ea8` | pass |
| Scenario 65 | `final-fix-selected-angle-source.md`, `final-fix-scenario-65-turn-2.md`, `turn-3.md` | `final-fix-scenario-65-output.md` | `01a0117a-ed3f-7122-860c-52c932bbf7ee` | pass |
| Scenario 67 attempt 1 | `final-fix-scenario-67-turn-1.md` | `final-fix-scenario-67-red-output.md` | `01a0117c-6e16-7aa2-a799-c46755989609` | fail |
| Scenario 67 attempt 2 | `final-fix-scenario-67-turn-1.md`, `turn-2.md` | `final-fix-scenario-67-output.md` | `01a0117f-c9e6-7170-ad29-3b9df35ed478` | pass |
| Scenario 69 attempt 1 | `final-fix-scenario-69.md` | `final-fix-scenario-69-red-output.md` | `01a01176-61f9-7fd1-b142-46b5a22f6dff` | fail |
| Scenario 69 attempt 2 | `final-fix-scenario-69.md` | `final-fix-scenario-69-red-output-2.md` | `01a01178-5dca-7d52-ad65-5524f1c180e8` | fail |
| Scenario 69 attempt 3 | `final-fix-scenario-69.md` | `final-fix-scenario-69-red-output-3.md` | `01a01179-f349-73d2-8fd4-a193115f5e0d` | fail; stop condition reached |
| Packet 4 motive rerun | `packet-4-short-finalize.md` | `final-fix-packet-4-output.md` | `01a0117f-cacf-7211-88f6-0d0bc2eaf1c9` | pass |

Codex emitted repeatable model-cache warnings (`missing field base_instructions`) and one rejected attempt by the evaluator to write a temporary file outside its workspace. All listed processes completed with exit code 0 and wrote complete user-facing outputs. No evaluator modified the repository.

The approved focused release-fix cycle used the same isolated instruction and the strengthened `final-fix-scenario-69.md` raw packet. It preserved the original three failures above and produced these additional artifacts:

| Context | Exact output | Session identifier | Grade |
|---|---|---|---|
| Scenario 69 focused attempt 1 | `final-fix-scenario-69-red-output-4.md` | `01a011df-a743-7c60-af16-fc8d9f3aaf63` | fail; drafted instead of stopping |
| Scenario 69 focused attempt 2 | `final-fix-scenario-69-red-output-5.md` | `01a011e7-7154-7373-b8f3-6bc3a5a11faf` | fail; treated the initial request as a resolved choice, then was interrupted |
| Scenario 69 focused attempt 3 | `final-fix-scenario-69-green-output.md` | `01a011e9-6429-7623-8929-a0701f1a4dac` | pass |

The interrupted second focused attempt is represented by its exact two user-facing progress messages; it has no fabricated final response. The third attempt completed with exit code 0. No focused evaluator modified the repository.

## Behavioral grading

### Refreshed selection and one strengthening offer per revision

Packet 2 first selected the best-supported freedom/agency angle and received one six-question strengthening offer. The later raw turn materially changed the story from freedom to fear of becoming an impatient person, so the evaluator explained the shift and displayed a refreshed three-choice checkpoint. Selecting the refreshed best-supported angle produced one new six-question strengthening offer tailored to the new revision. It did not reuse or suppress the prior offer. Pass.

### Scenario 63 — developmental gap questions and selected-angle `draft now`

The selected promising alternative named two concrete gaps: the decision types and a representative correction. The next response asked five questions targeting those gaps, the experiment, and the selected angle's unresolved test. After `draft now`, the final script remained centered on asking for ownership while teaching the team to wait. It did not switch back to the original best-supported identity/control framing. Pass.

### Scenario 65 — minor addition without reopen

The evaluator offered one five-question strengthening pass after the best-supported selection. The user supplied one selective detail about the crossed-out printed schedule. The next response incorporated that detail and proceeded directly to the selected-angle script. It presented neither another angle checkpoint nor another strengthening offer. Pass.

### Scenario 67 — no-duration `finalize now`

Attempt 1 incorrectly inferred freestyle and drafted immediately; the exact output is retained. After the strict-stop clarification, attempt 2 returned only: `What duration would you like: an exact length, a rough range, or freestyle?` The `Freestyle.` turn then produced a complete, source-grounded short script without repeating intake, discovery, or angle comparison. Pass after one correction.

### Scenario 69 — above-15 choice

The original fix wave's three isolated attempts failed the required transition and remain tracked as RED history. The focused release-fix cycle replaced the outline-only input with sixteen supplied concrete scenes. Its first attempt drafted instead of stopping. Its second treated the original request for one 18-minute video as though the user had already selected from the required checkpoint. After the state contract made runtime preflight first and limited resolution to a follow-up selection, the third fresh attempt returned only the three scope choices and a narrative-coherence recommendation. It did not draft or show the unsupported-target menu. Scenario 69 passes from `final-fix-scenario-69-green-output.md`.

### Packet 4 — motive inference and short finalization

The original tracked artifact `green-packet-4-output.md` remains unchanged as the failing evidence; it asserted `I'd also been protecting my place as the fast, reliable one.` The fresh result uses only the supplied statement `I liked being the reliable one.` It contains no `protecting my place` or equivalent upgraded motive, and its external-polish template cannot lock that unsupported inference. Pass.

### Minor findings

- Runtime CLI boundary fields are now asserted as exactly `120.0` and `900.0`; all eight unit tests pass.
- Continuing to speak at an angle checkpoint is explicitly defined as merging material, retaining compatible state, reassessing readiness and angles, and not forcing selection.
- Final outputs now retain the documented external-polish placeholder, give an exact substitution instruction, and do not duplicate or recursively embed the script. The packet 4 and scenarios 63, 65, and 67 outputs demonstrate this behavior.

## Exact frozen-output runtime extraction

The commands below measure only the exact tracked body plus recommended conclusion, excluding its editorial heading, alternate endings, notes, and handoff.

```bash
awk '/^Recommended ending —/{next} /^Alternate endings$/{exit} {print}' tests/behavioral/fixtures/adaptive-discovery-2026-08-17/final-fix-packet-4-output.md | python3 skills/voice-to-script-en-ch/scripts/estimate_runtime.py --language en
```

```json
{"language": "en", "estimated_seconds": 76.0, "estimated_minutes": 1.27, "status": "below_preferred", "within_preferred_range": false, "preferred_minimum_seconds": 120.0, "preferred_maximum_seconds": 900.0, "word_count": 190, "rate": 150, "rate_unit": "words_per_minute"}
```

```bash
awk '/^## Assistant turn 3$/{on=1; next} on && /^Recommended ending —/{next} on && /^Alternate endings$/{exit} on{print}' tests/behavioral/fixtures/adaptive-discovery-2026-08-17/final-fix-scenario-63-output.md | python3 skills/voice-to-script-en-ch/scripts/estimate_runtime.py --language en
```

```json
{"language": "en", "estimated_seconds": 90.0, "estimated_minutes": 1.5, "status": "below_preferred", "within_preferred_range": false, "preferred_minimum_seconds": 120.0, "preferred_maximum_seconds": 900.0, "word_count": 225, "rate": 150, "rate_unit": "words_per_minute"}
```

```bash
awk '/^## Assistant turn 3$/{on=1; next} on && /^Recommended ending —/{next} on && /^Alternate endings$/{exit} on{print}' tests/behavioral/fixtures/adaptive-discovery-2026-08-17/final-fix-scenario-65-output.md | python3 skills/voice-to-script-en-ch/scripts/estimate_runtime.py --language en
```

```json
{"language": "en", "estimated_seconds": 88.8, "estimated_minutes": 1.48, "status": "below_preferred", "within_preferred_range": false, "preferred_minimum_seconds": 120.0, "preferred_maximum_seconds": 900.0, "word_count": 222, "rate": 150, "rate_unit": "words_per_minute"}
```

```bash
awk '/^## Assistant turn 2$/{on=1; next} on && /^Recommended ending —/{next} on && /^Alternate endings$/{exit} on{print}' tests/behavioral/fixtures/adaptive-discovery-2026-08-17/final-fix-scenario-67-output.md | python3 skills/voice-to-script-en-ch/scripts/estimate_runtime.py --language en
```

```json
{"language": "en", "estimated_seconds": 45.2, "estimated_minutes": 0.75, "status": "below_preferred", "within_preferred_range": false, "preferred_minimum_seconds": 120.0, "preferred_maximum_seconds": 900.0, "word_count": 113, "rate": 150, "rate_unit": "words_per_minute"}
```

All four exact delivered texts are complete and unpadded. Each final extraction is the authoritative `measured_preferred_status` for the tracked artifact.
