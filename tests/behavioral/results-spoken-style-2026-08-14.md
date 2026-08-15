# Spoken-style forward evaluation — 2026-08-14

## Method and packet provenance

Three independent fresh-context runs read only the repository skill and the references it routes for finalization, then returned only a response to the supplied user request. They were not given the behavioral scenarios, rubric, plan, suspected failures, or intended fixes. The exact neutral wrapper and three source packets recovered from Task 1 are retained at `.superpowers/sdd/2026-08-14-spoken-script-style-and-endings/task-4-source-packets.md`; the packets cover overwritten English, no-detail English, and bilingual endings/runtime finalization.

The observations below are manually graded from the user-facing responses. No execution trace was available for polishing-skill invocation, so this evaluation does not claim that either dependency ran.

## Initial runs against the revised contract

### Overwritten English source

Prompt summary: English-only personal script for small-team leaders, with repeated explanation about postponing a handbook and a practical invitation requested.

Observed behavior: The response preserved the dated Wednesday sequence, cut the overwritten explanation into repeated short beats, used a source-grounded recognition line near the later third, and supplied three labeled alternate endings. Its main conclusion was neither visibly marked as the recommended ending nor identified with an ending mode.

| Scenario | Verdict | Evidence |
| --- | --- | --- |
| 49 | pass | Predominantly one-breath lines; the three repeated `handbook could wait` beats preserve useful source repetition without retaining the overwritten paragraph. |
| 50 | not applicable | This packet supplied dates and concrete events, so it is not the no-detail predicate. |
| 51 | pass | The notification-block decision is earned; the only remaining question is how to distinguish care from the habit of availability. |
| 52 | fail | Three alternates are labeled, but the complete script never identifies its ending as recommended or gives its mode. |
| 53 | partial | The alternates are concise and distinct, but the unidentified main ending cannot be checked for named-mode integrity. |
| 54 | partial | `I had confused being easy to reach with making things easier for other people` is source-grounded and late, but a caveat follows too closely for the clip-line separation to be unambiguous. |
| 55 | not applicable | The packet did not contain the full prohibition set. |
| 56 | not applicable | English-only request. |

### No-detail English source

Prompt summary: English-only personal script for first-time managers; the packet expressly prohibited invented physical detail and exact dialogue.

Observed behavior: The response kept the colleague's objection indirect, explicitly retained the absence of exact wording and physical detail, used short lines, and supplied three labeled alternates. Its closing generic viewer question was not a visibly selected mode and its main ending was not labeled recommended.

| Scenario | Verdict | Evidence |
| --- | --- | --- |
| 49 | pass | The response turns the source's causal loop into short, performable beats. |
| 50 | pass | It says `As I understood her point` and states that no exact words or physical detail were remembered; it adds neither. |
| 51 | pass | It earns the scoped review experiment while retaining only the future uncertainty about the team's decisions. |
| 52 | fail | It has three mode-labeled alternates but no identified recommended main ending. |
| 53 | partial | Alternate modes are short and distinct; the main generic question, `Where might your approval be teaching your team to wait?`, has no named mode and is not a lived-story request. |
| 54 | partial | `Waiting for my approval had been a system I was helping create` is source-grounded, but it is followed by explanatory material rather than isolated as a late clip line. |
| 55 | not applicable | The packet did not contain the full prohibition set. |
| 56 | not applicable | English-only request. |

### Bilingual endings/runtime source

Prompt summary: English and Simplified Chinese personal scripts with independently valid complete-script runtimes and concise alternates.

Observed behavior: The response returned both language sections in the required body/alternates/notes order, preserved the source sequence and high-stakes uncertainty, and used three exact-mode-labeled alternates for each language. Both main endings remain unlabeled and therefore their ending-mode intent is not externally verifiable.

| Scenario | Verdict | Evidence |
| --- | --- | --- |
| 49 | pass | Both versions use short spoken beats and retain the source's hesitation and self-correction. |
| 50 | not applicable | This packet contains a supplied spoken line and concrete meeting events. |
| 51 | pass | Each version earns naming the mismatch and leaves only the question of speaking when stakes are higher. |
| 52 | fail | Each section has three labeled alternates, but neither complete script visibly labels a recommended main ending. |
| 53 | partial | The alternates are concise, factual, and distinct, but the main ending is unnamed. |
| 54 | partial | The source-grounded `name the confusion` recognition line is late, but its surrounding explanation is retained. |
| 55 | not applicable | The packet does not include the complete prohibition set. |
| 56 | partial | The two complete scripts are visibly separate from alternates and notes, but the absent recommended-ending labels leave ending-mode intent uncheckable. |

## Demonstrated gap and correction

The three runs independently made the same output-shape rationalization: they selected or implied a conclusion but treated the recommended ending as invisible prose, while mode labels appeared only on alternates. This makes the main ending's mode integrity untestable and permits a generic viewer invitation. The smallest correction adds one finalization instruction: place the complete script's final one-or-two-breath conclusion beneath `Recommended ending — [mode]`, keep that editorial label out of runtime measurement, and require the conclusion itself to perform its selected named mode rather than use a generic reflective question.

## Rerun evidence

### Iteration history

1. Initial fresh runs: all three supplied exactly three labeled alternates, but none visibly identified the complete script's recommended ending. The no-detail main conclusion was a generic reflective question.
2. First refinement: required a visible `Recommended ending — [mode]` label and mode-shaped main ending. Fresh English reruns added the label, but one labeled a generic question as a callback and several alternates omitted the unresolved tension.
3. Second refinement: added a per-ending language audit that requires the selected mode and an explicit shared tension. Fresh English reruns supplied mode-shaped, tension-bearing endings, but the overwritten run still immediately paraphrased its late clip line.
4. Third refinement: made post-clip wording a hard ordering gate and required every ending to *state*, not merely imply, the unresolved tension. The final overwritten-English fresh run complies. The final bilingual fresh run regressed to a prose-only body with numbered, unlabeled alternates and no recommended-ending heading, so scenarios 49, 52, 53, and 56 remain failed there.

No fourth wording patch was made. Three minimal, evidence-backed instruction refinements already target the demonstrated rationalizations; the last run ignored the relevant output assembly rules rather than revealing a new missing rule. A fourth patch would be speculative. This residual is left for the independent task review's formal fix loop.

### Final overwritten English rerun

Observed behavior: The late source-grounded line, `I had confused being easy to reach with making things easier for other people`, is immediately followed by the caveat `I don't think messages are the enemy.` The main ending is visibly labeled `Recommended ending — Unapologized position`; it and all three alternates explicitly keep the question of how availability can help without making the team dependent.

| Scenario | Verdict | Evidence |
| --- | --- | --- |
| 49 | pass | One-breath or short spoken lines throughout; the repeated handbook phrase remains useful rather than explanatory padding. |
| 50 | not applicable | This packet is not the no-detail predicate. |
| 51 | pass | The notification-block decision is earned and the availability/dependence question is the sole remaining tension. |
| 52 | pass | A labeled recommended ending is followed by three distinct, mode-labeled alternates. |
| 53 | pass | The named reader, story request, callback, and unapologized position each perform their named function, remain concise, and state the shared tension. |
| 54 | fail | The immediately adjacent `I don't think messages are the enemy.` is a caveat, not the required advance to an event, time, or action. |
| 55 | not applicable | The packet does not provide the full prohibition predicate. |
| 56 | not applicable | English-only request. |

### Final no-detail English rerun

Observed behavior: The response preserves the objection as the writer's understanding, supplies no quotation or physical setting, uses a visibly labeled callback main ending, and gives concise alternate modes that each retain the uncertainty about whether scoped delegation works in the future.

| Scenario | Verdict | Evidence |
| --- | --- | --- |
| 49 | pass | The displayed lines are short and performable, with the causal loop expressed as concise beats. |
| 50 | pass | No exact dialogue, physical setting, or sensory detail is fabricated. |
| 51 | pass | The scoped review change is earned; future effectiveness remains the one open tension. |
| 52 | pass | The complete ending is visibly recommended and followed by three labeled, distinct alternates. |
| 53 | pass | The callback repeats the source's `final checkpoint` framing and all endings retain the same uncertainty. |
| 54 | pass | `Waiting for my approval had been a system I was helping create` is a late, source-grounded recognition line without an immediate restatement. |
| 55 | not applicable | The packet does not provide the full prohibition predicate. |
| 56 | not applicable | English-only request. |

### Final bilingual rerun — residual failure

Observed behavior: The response preserves the personal source facts and gives English and Chinese bodies, but its output abandons the required assembly: there is no `Recommended ending — [mode]` for either language; alternates are numbered and unlabeled; neither language segregates a mode-specific main ending from the complete body. The English and Chinese body prose also returns to long multi-sentence paragraphs rather than one-breath lines. Each complete body appears independently within the requested duration range when alternates and notes are excluded, but this cannot rescue the failed ending/output contracts. No invocation trace is available for the polishing dependencies.

| Scenario | Verdict | Evidence |
| --- | --- | --- |
| 49 | fail | Both bodies contain multi-sentence displayed paragraphs that are not one-breath teleprompter lines. |
| 50 | not applicable | This packet has supplied spoken wording and concrete meeting events. |
| 51 | partial | The central decision and high-stakes uncertainty are preserved, but the ending is not assembled as the required named ending. |
| 52 | fail | There is no visible recommended main ending; the three alternates in each language are numbered rather than mode-labeled. |
| 53 | fail | Ending-mode function cannot be verified from unnamed numbered alternates. |
| 54 | partial | The `name the confusion` recognition line is source-grounded and late, but surrounding prose weakens its isolated clip treatment. |
| 55 | not applicable | The packet does not supply the full prohibition predicate. |
| 56 | fail | Both branches lack identifiable main-ending mode intent and the required alternates structure, despite separately scoped main bodies. |

## Final forward-test verdict

The minimal refinements close the observed English ending-output gaps, but the final overwritten-English run still fails the clip-line hard ordering gate. One final bilingual fresh-context response also fails the required clean output and ending contracts. Status: **DONE_WITH_CONCERNS** pending independent review; no additional patch was made after the third evidence-backed refinement.

## Task-review fix round 1

### Controlling-template correction

The previous final-output boundary named only scripts and light notes, while the canonical clean-output template omitted the required recommended-ending block. Both surfaces now require the same per-language order: complete teleprompter body, `Recommended ending — [mode]` and its one-or-two-breath conclusion, at least three labeled alternate endings, then light delivery notes.

### Overwritten-English clip-line regrade

No focused rerun was performed for this packet in this fix round. The recorded adjacent lines are:

```text
I had confused being easy to reach with making things easier for other people.
I don't think messages are the enemy.
```

The second line is a caveat, not an event, time, or action advance. Scenario 54 is therefore correctly graded **fail**, not pass, for that run.

### Focused bilingual rerun

Prompt: the exact bilingual packet and neutral wrapper at `.superpowers/sdd/2026-08-14-spoken-script-style-and-endings/task-4-source-packets.md` (packet 3). The fresh-context response followed the corrected per-language order and used `Recommended ending — Story request — best for comments`, followed by `Named reader — best for shares`, `Callback — best for cohesion`, and `Unapologized position` alternatives in both branches. The runtime-bearing complete bodies, including the recommended conclusion but excluding editorial headings, alternates, and notes, are retained at:

- `.superpowers/sdd/2026-08-14-spoken-script-style-and-endings/task-4-fix1-bilingual-en.txt`
- `.superpowers/sdd/2026-08-14-spoken-script-style-and-endings/task-4-fix1-bilingual-zh.txt`

Runtime commands and results:

```text
python3 skills/voice-to-script-en-ch/scripts/estimate_runtime.py --language en .superpowers/sdd/2026-08-14-spoken-script-style-and-endings/task-4-fix1-bilingual-en.txt
{"language": "en", "estimated_seconds": 203.6, "estimated_minutes": 3.39, "status": "within_range", "word_count": 509, "rate": 150, "rate_unit": "words_per_minute"}

python3 skills/voice-to-script-en-ch/scripts/estimate_runtime.py --language zh .superpowers/sdd/2026-08-14-spoken-script-style-and-endings/task-4-fix1-bilingual-zh.txt
{"language": "zh", "estimated_seconds": 222.0, "estimated_minutes": 3.7, "status": "within_range", "han_character_count": 888, "latin_word_count": 0, "han_rate": 240, "latin_rate": 150}
```

| Scenario | Verdict | Evidence |
| --- | --- | --- |
| 49 | pass | Both branches use predominantly short displayed lines and purposeful fragments. |
| 50 | not applicable | The packet supplies spoken wording and concrete meeting events. |
| 51 | pass | Both branches earn naming the deadline mismatch and retain the same high-stakes uncertainty. |
| 52 | pass | Every language section visibly separates a recommended, mode-labeled conclusion from three labeled alternatives. |
| 53 | partial | The English endings are one or two breaths; the Chinese story-request ending occupies three displayed breath lines despite preserving its mode and tension. |
| 54 | partial | The late `name the confusion` line is source-grounded, but the next material reflects on its meaning rather than advancing an event, time, or action. |
| 55 | not applicable | The packet does not provide the full prohibition predicate. |
| 56 | pass | Both independently measured complete branches are within range, separate from alternates/notes, semantically parallel, and carry the same ending-mode intent. |

The output-order and runtime findings are closed. The existing clip-line hard-gate issue remains accurately recorded; the Chinese ending's three-line breath issue is a newly observed partial, not the subject of another speculative wording change in this round.

## Task-review fix round 2

### Controlling refinements

- `spoken-style.md` now requires clip-line placement at a boundary that leaves an approved later event, time, or action beat. A candidate that is too late must move earlier without changing chronology or yield to another source-grounded candidate.
- `finalization.md` now requires a final displayed-line count: every recommended or alternate ending has at most two spoken lines/breaths, excluding only its editorial label; Simplified Chinese must compress naturally rather than spill into a third line.

### Exact overwritten-English rerun

Prompt: packet 1 and the neutral wrapper in `.superpowers/sdd/2026-08-14-spoken-script-style-and-endings/task-4-source-packets.md`.

Clip-line adjacency:

```text
I had confused being easy to reach with making things easier for other people.
The first afternoon felt selfish.
```

The following line is a remaining source event/time beat, so it satisfies the hard ordering gate.

| Scenario | Verdict | Evidence |
| --- | --- | --- |
| 49 | pass | Short spoken lines and source repetition replace the overwritten explanation. |
| 50 | not applicable | This packet is not the no-detail predicate. |
| 51 | pass | The notification-block decision is earned and the availability question stays open. |
| 52 | pass | Visible recommended ending plus three mode-labeled alternates. |
| 53 | partial | The story-request alternate is two lines but does not explicitly state the shared unresolved tension. |
| 54 | pass | The source-grounded clip line is followed by the first-afternoon event, not a caveat or reflection. |
| 55 | not applicable | The packet lacks the full prohibition predicate. |
| 56 | not applicable | English-only request. |

### Exact bilingual rerun

Prompt: packet 3 and the same neutral wrapper. Ending line counts, excluding labels: English recommended 2; English alternates 2/2/2; Simplified Chinese recommended 2; Simplified Chinese alternates 2/2/2. The prior three-line Chinese Story-request failure is closed.

Clip-line adjacency remains noncompliant in both branches:

```text
EN: If I can name the confusion accurately, I do not have to solve the entire problem before I speak.
EN: I am not saying uncertainty is automatically useful.

ZH: 如果我能把混乱说准，我不需要先把整个问题解决，才可以说话。
ZH: 我不是说，不确定本身就一定有用。
```

The second line in each pair is a caveat, so the bilingual clip-line hard gate remains failed.

| Scenario | Verdict | Evidence |
| --- | --- | --- |
| 49 | partial | Both branches are mostly line-broken for speech, but several displayed multi-clause lines remain long. |
| 50 | not applicable | The packet contains supplied speech and concrete meeting events. |
| 51 | pass | Both branches preserve the earned deadline-mismatch intervention and high-stakes uncertainty. |
| 52 | pass | Both show a recommended mode heading, conclusion, and three labeled alternates. |
| 53 | pass | Every recommended/alternate ending is mode-labeled, tension-bearing, and no more than two spoken lines. |
| 54 | fail | Both clip lines are immediately followed by caveats rather than event, time, or action advances. |
| 55 | not applicable | The packet lacks the full prohibition predicate. |
| 56 | partial | Assembly and parity pass; runtime was measured exactly in fix round 1 but not remeasured from this new fresh output. |

Round 2 closes the overwritten-English clip placement and bilingual Chinese ending-length findings. The bilingual clip-line placement remains a demonstrated residual; no further patch is made in this formal round.

## Task-review fix round 3

### Exact reruns

Used only packet 1 (overwritten English) and packet 3 (bilingual), each with the neutral wrapper in `.superpowers/sdd/2026-08-14-spoken-script-style-and-endings/task-4-source-packets.md`.

**Overwritten English clip adjacency**

```text
I had confused being easy to reach
with making things easier for other people.
The answer isn't to ignore messages.
```

The candidate is still followed by a caveat, so scenario 54 remains failed. Its Story-request alternate now uses two spoken lines and explicitly states the shared tension: `I'm still learning how to make room for that work without becoming unreachable when something genuinely needs me.`

**Bilingual clip adjacency**

```text
EN: If I can name the confusion accurately, I don't have to solve the entire problem before I speak.
EN: After that meeting, I started trying to catch the moment earlier.

ZH: 如果我能把困惑说准，我不必先把整个问题都解决，才可以开口。
ZH: 那次以后，我开始试着更早一点抓住那个时刻。
```

Each following line advances to a later event/time action, so the bilingual clip-line hard gate passes. The displayed complete bodies use one-breath line breaks; the Story-request, Named reader, Callback, and Unapologized position endings in both branches are each two spoken lines and each explicitly carry the unresolved high-stakes uncertainty.

| Scenario | Overwritten English | Bilingual | Evidence |
| --- | --- | --- |
| 49 | pass | pass | Final aloud audit splits the displayed bodies into short, performable beats. |
| 50 | not applicable | not applicable | Neither packet is the no-detail predicate. |
| 51 | pass | pass | Both preserve the earned turn and one source-specific future uncertainty. |
| 52 | pass | pass | Recommended endings and three mode-labeled alternates appear for every requested language. |
| 53 | pass | pass | Each ending is one or two lines and explicitly states its writer-side unresolved tension. |
| 54 | fail | pass | Overwritten English still places its clip line before a caveat; bilingual advances to an event/time beat. |
| 55 | not applicable | not applicable | Neither packet contains the complete prohibition predicate. |
| 56 | not applicable | pass | Independently measured complete bodies are within range; headings, alternates, and notes are excluded. |

The exact round-3 bilingual response is retained in `.superpowers/sdd/2026-08-14-spoken-script-style-and-endings/task-4-round3-bilingual-output.md`. Runtime commands and results, with `Recommended ending` editorial labels, alternates, and notes excluded:

```text
awk '/^## English/{on=1; next} /^Alternate endings$/{if (on) exit} on && !/^Recommended ending —/{print}' .superpowers/sdd/2026-08-14-spoken-script-style-and-endings/task-4-round3-bilingual-output.md | python3 skills/voice-to-script-en-ch/scripts/estimate_runtime.py --language en
{"language": "en", "estimated_seconds": 179.2, "estimated_minutes": 2.99, "status": "within_range", "word_count": 448, "rate": 150, "rate_unit": "words_per_minute"}

awk '/^## 简体中文/{on=1; next} /^Alternate endings$/{if (on) exit} on && !/^Recommended ending —/{print}' .superpowers/sdd/2026-08-14-spoken-script-style-and-endings/task-4-round3-bilingual-output.md | python3 skills/voice-to-script-en-ch/scripts/estimate_runtime.py --language zh
{"language": "zh", "estimated_seconds": 189.75, "estimated_minutes": 3.16, "status": "within_range", "han_character_count": 759, "latin_word_count": 0, "han_rate": 240, "latin_rate": 150}
```
