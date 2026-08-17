# Adaptive discovery baseline — 2026-08-17

## Purpose and method

This is a pre-production-change behavioral baseline for the public skill at commit `7e511dbce24bdc51f9fd05371c65c803c52c54a7`. The production `skills/voice-to-script-en-ch` files were not edited before or during these runs. Test-contract and fixture changes in this branch do not change the skill invoked by the runs.

Packet 1 and packet 3 were run in separate fresh ephemeral contexts with:

```bash
codex exec --ephemeral --dangerously-bypass-hook-trust -s read-only -C . \
  -o /tmp/adaptive-baseline-packet-N.md - \
  < tests/behavioral/fixtures/adaptive-discovery-2026-08-17/packet-N.md
```

Packet 2 began with the same ephemeral command. The CLI returned session `01a0110a-e657-72a2-87d6-66e1582bc46e`, but `codex exec resume --ephemeral` returned `no rollout found`, so that ephemeral CLI mode could not accept the required later turn. The two-turn fallback used one persistent `codex exec` session, `01a0110b-f587-73f3-80c7-753da399097d`, with the same model, working directory, and source packet. It is explicitly a tooling fallback, not an assertion that ephemeral resume worked.

## Exact prompts and evidence identifiers

### Packet 1 — thin short

Prompt:

```text
I keep thinking about a meeting last Thursday. Two teammates were waiting for me to approve a tiny wording change. I said I'd look later, and everyone moved to something else. It felt strange, but I don't yet know what I think it means. Help me turn this into a talking-head script.
```

Ephemeral trace: `01a01108-9fec-7ea3-a97f-56874930a313`.
Exact final response: `/tmp/adaptive-baseline-packet-1.md` at run time. It immediately supplied three narrative directions, then five source-specific questions. It did not ask for duration or explain freestyle.

### Packet 2 — angle shift

First prompt:

```text
I left a stable operations job to build a small product with a friend. At first I described it as wanting more freedom. The clearest moment was closing my laptop after another planning meeting and realizing I couldn't remember one decision I'd made for myself that week. I was scared of losing a reliable salary, but I resigned anyway. Help me develop this as a video story. I haven't chosen a length.
```

Simulated selection after the first angle checkpoint:

```text
I select Direction 1, the freedom angle.
```

Later prompt after that selection:

```text
There's something I left out. The real reason wasn't freedom. My younger brother had asked why I always sounded angry after work. I dismissed him, then heard myself speaking to a teammate in exactly the same impatient tone two days later. I wasn't mainly trying to escape the schedule. I was afraid of becoming someone I didn't like. I still don't know whether starting a company will change that.
```

Persistent fallback trace: `01a0110b-f587-73f3-80c7-753da399097d`.
Exact final responses: `/tmp/adaptive-baseline-packet-2-first.md`, `/tmp/adaptive-baseline-packet-2-selection.md`, and `/tmp/adaptive-baseline-packet-2-later.md` at run time. The first response supplied three angles without duration intake. After selection it asked one gap question. After the later material it said that the story's center had changed, but supplied only a revised spine and one question rather than a refreshed three-angle checkpoint.

### Packet 3 — bilingual ready

Prompt:

```text
I used to answer every question on my team because being useful made me feel secure. One Tuesday, a designer moved a deadline while I was on a client call because she assumed she still needed my approval. The client waited, the designer waited, and I came out of the call feeling important for about ten seconds. Then I realized I had built a team that paused when I disappeared.

The conflict is that I kept telling everyone I wanted ownership from them, but I corrected small decisions before they could learn from them. A colleague had told me that I was moving too quickly for anyone else to take the wheel. I didn't believe her at the time. After the delayed deadline, I chose two kinds of decisions the team could make without me for a three-week experiment. I'm relieved, but I still don't know whether I'll trust the system when a decision goes badly.

I can imagine this being about control, identity, or what delegation actually costs. I ultimately want both an English and natural Simplified Chinese script, but help me develop the story before drafting. I haven't chosen the duration.
```

Ephemeral trace: `01a0110a-0ffa-70c1-b460-c8fd8063ce0d`.
Exact final response: `/tmp/adaptive-baseline-packet-3.md` at run time. It supplied three directions and one recommendation, but did not request duration or explain freestyle.

## Scenario 57–70 grades

| Scenario | Grade | Baseline evidence |
| --- | --- | --- |
| 57. Duration intake | fail | All three no-duration packets proceeded without asking once for exact duration, rough range, or freestyle. |
| 58. Freestyle explanation | fail | No response explained freestyle, the preferred 2–15-minute window, adaptive questioning, a compact 45-second story, or no-padding. |
| 59. Tailored discovery batch | fail | Packet 1 asked five source-specific questions, but neither offered selective/skip/freestyle permission nor withheld three narrative directions. |
| 60. Readiness gate | fail | The thin packet immediately received three narrative directions despite missing a meaningful conflict, recognizable stakes, and earned change. This is the explicit premature-angle failure. |
| 61. Late checkpoint | partial | Packet 3 had enough story material and received an angle checkpoint before drafting, but the workflow does not defer angles when readiness is incomplete. |
| 62. Best-supported alternatives | partial | Packet 3 recommended one direction and gave useful strengthening details for two others, but did not label one as `best-supported` and ready or label the others as promising alternatives. |
| 63. Developmental-angle gaps | not applicable | The packets did not select a promising alternative. |
| 64. Post-selection strengthening | fail | After selecting Direction 1, packet 2 received one generic gap question, not an optional 4–6-question strengthening batch with selective/skip/freestyle/`draft now` options. |
| 65. Minor additions | not applicable | No packet added a non-material strengthening detail after selection. |
| 66. Material-change re-selection | fail | Packet 2's later prompt materially changed the motive and strongest conflict. The response recognized that shift, but gave no refreshed three-angle choice. |
| 67. Immediate-draft override | not applicable | No packet used `finalize now`. |
| 68. Sub-two-minute story | not applicable | No packet requested a 45–90-second final draft. |
| 69. Above-15-minute choice | not applicable | No packet requested a scope requiring more than 15 minutes. |
| 70. External-polish handoff | fail | The current public skill has no `Claude` or `DeepSeek` handoff contract, and its final-output boundary ends after scripts and light delivery notes. No privacy-aware optional handoff appeared in the collected responses. |

## Required focused observations

- **Premature angle proposal:** fail. Packet 1 received three directions before its conflict, stakes, or change were known.
- **Question count and specificity:** partial/fail. Packet 1 had five specific questions, but the required permission and angle withholding were absent; packet 2 after selection asked only one question.
- **Duration explanation:** fail. No no-duration packet received a duration choice or freestyle explanation.
- **Material-change handling:** fail. Packet 2's response correctly described the changed center, but did not reopen selection with three refreshed angles.
- **External handoff:** fail. The skill and observed output provide neither language routing nor a privacy/source-locked replacement-script handoff.

This baseline preserves adjacent strengths—source-grounded questions, indirect handling of unquoted speech, and recognition that packet 2 changed the story—without treating them as passes for the new adaptive-discovery contract.
