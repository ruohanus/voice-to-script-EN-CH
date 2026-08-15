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

Observed behavior: The late source-grounded line, `I had confused being easy to reach with making things easier for other people`, stands alone before the script advances to a caveat. The main ending is visibly labeled `Recommended ending — Unapologized position`; it and all three alternates explicitly keep the question of how availability can help without making the team dependent.

| Scenario | Verdict | Evidence |
| --- | --- | --- |
| 49 | pass | One-breath or short spoken lines throughout; the repeated handbook phrase remains useful rather than explanatory padding. |
| 50 | not applicable | This packet is not the no-detail predicate. |
| 51 | pass | The notification-block decision is earned and the availability/dependence question is the sole remaining tension. |
| 52 | pass | A labeled recommended ending is followed by three distinct, mode-labeled alternates. |
| 53 | pass | The named reader, story request, callback, and unapologized position each perform their named function, remain concise, and state the shared tension. |
| 54 | pass | The source-grounded recognition line appears in the later third; the following material advances rather than paraphrases it. |
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

The minimal refinements close the observed English output gaps in fresh contexts. One final bilingual fresh-context response still fails the required clean output and ending contracts. Status: **DONE_WITH_CONCERNS** pending independent review; no additional patch was made after the third evidence-backed refinement.
