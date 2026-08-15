# Spoken-style forward evaluation — 2026-08-14

## Method and packet provenance

Three independent fresh-context runs read only the repository skill and the references it routes for finalization, then returned only a response to the supplied user request. They were not given the behavioral scenarios, rubric, plan, suspected failures, or intended fixes. The sanitized exact neutral prompts are tracked under `tests/behavioral/fixtures/spoken-style-final-review-2026-08-14/`; they cover overwritten English, no-detail English, bilingual endings/runtime finalization, and the later prohibited-form control.

The observations below are manually graded from the user-facing responses. No execution trace was available for polishing-skill invocation, so this evaluation does not claim that either dependency ran.

Sections before **Final-review correction wave** preserve the implementation campaign's iteration history. Any historical `.superpowers/sdd/` scratch path is superseded by the tracked final-review prompts and exact outputs; only the tracked fixture set is release evidence auditable from a clean checkout.

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

## Task-review fix round 4

### Root cause and minimal correction

The round-3 aloud audit still depended on subjective judgment and only required splitting a multi-clause line with more than one independently performable beat. That left a loophole for long single grammatical sentences and endings: the retained bilingual output included a 23-word English body line, its 39-Han-character Chinese counterpart, and longer ending lines. The finalization audit now checks every displayed spoken line in bodies and endings against measurable ceilings of 18 English spoken words and 28 Simplified Chinese Han characters, then still requires the stricter aloud/stumble/breath judgment for shorter lines.

The clip check also happened after a strong candidate had already been selected, so packet 1 repeatedly kept the supplied self-recognition late and tried to repair its adjacency after assembly. The approved story contract now records a clip candidate together with its specific source-grounded successor event/time/action. Finalization assembles and rechecks that pair. A supplied narrator-level self-recognition remains the candidate and may frame the next source event without reordering the events themselves.

The first packet-1 rerun after adding the pair chose a weaker earlier recognition while leaving the supplied line late. The final one-sentence selection refinement closed that remaining loophole. No facts, event order, bilingual generation rule, ending rule, or runtime boundary changed.

### Final exact fresh-context reruns

Used only `packet-1-overwritten-en.md` and `packet-3-bilingual.md` from the tracked fixture directory. Each exact packet contains the neutral wrapper. Each run used a separate fresh context, read only the current repository skill and required finalization references, received no rubric or suspected-failure language, and returned only the user-facing response. No execution trace was available, so this result does not claim that either polishing dependency was invoked.

**Packet 1 clip adjacency**

```text
I had confused being easy to reach with making things easier for other people.
So I tried something embarrassingly small.
```

The supplied self-recognition now advances immediately to the notification-block experiment. The caveats remain later, after the first-afternoon and one-week result, so they no longer occupy the post-clip slot.

**Packet 3 clip adjacency**

```text
EN: I hadn't solved the whole problem.
EN: I'd only named the confusion accurately.
EN: Later, a teammate told me that question had saved them a week of work.

ZH: 我没有解决整个问题，只是把混乱说清楚了。
ZH: 后来，一个同事告诉我，那个问题帮他们省下了一周的工作。
```

The recognition beat is independently phrased in each language and advances directly to the later teammate report, not to a caveat, paraphrase, or explanation.

### Mechanical line and runtime evidence

The exact pre-fix responses are tracked as `red-packet-1-output.md` and `red-packet-3-output.md` in the fixture directory. The following line audit covered every displayed spoken body and ending line while excluding editorial labels and delivery notes:

```text
red-packet-1-output.md: max_en=18, max_zh=0, violations=0
red-packet-3-output.md: max_en=16, max_zh=22, violations=0
```

Thus the previously failed 23-word / 39-Han body pair and the long Story-request lines do not recur. Every recommended and alternate ending remains one or two displayed spoken lines.

Runtime was measured on each complete body plus its recommended conclusion, excluding the `Recommended ending` editorial heading, alternate endings, and delivery notes:

```text
awk '/^Alternate endings$/{exit} !/^Recommended ending —/{print}' tests/behavioral/fixtures/spoken-style-final-review-2026-08-14/red-packet-1-output.md | python3 skills/voice-to-script-en-ch/scripts/estimate_runtime.py --language en
{"language": "en", "estimated_seconds": 243.2, "estimated_minutes": 4.05, "status": "within_range", "word_count": 608, "rate": 150, "rate_unit": "words_per_minute"}

awk '/^## English$/{on=1; next} /^Alternate endings$/{if(on) exit} on && !/^Recommended ending —/{print}' tests/behavioral/fixtures/spoken-style-final-review-2026-08-14/red-packet-3-output.md | python3 skills/voice-to-script-en-ch/scripts/estimate_runtime.py --language en
{"language": "en", "estimated_seconds": 174.4, "estimated_minutes": 2.91, "status": "within_range", "word_count": 436, "rate": 150, "rate_unit": "words_per_minute"}

awk '/^## 简体中文$/{on=1; next} /^Alternate endings$/{if(on) exit} on && !/^Recommended ending —/{print}' tests/behavioral/fixtures/spoken-style-final-review-2026-08-14/red-packet-3-output.md | python3 skills/voice-to-script-en-ch/scripts/estimate_runtime.py --language zh
{"language": "zh", "estimated_seconds": 186.75, "estimated_minutes": 3.11, "status": "within_range", "han_character_count": 747, "latin_word_count": 0, "han_rate": 240, "latin_rate": 150}
```

### Scenario grades

| Scenario | Packet 1 | Packet 3 | Evidence |
| --- | --- | --- | --- |
| 49 | pass | pass | No displayed spoken line exceeds 18 English words or 28 Han characters; purposeful fragments and source repetition remain. |
| 50 | not applicable | fail | Packet 3 supplied only indirect speech, but both language branches reconstruct it as purported verbatim dialogue. |
| 51 | pass | pass | Packet 1 leaves only the reachable-versus-dependent boundary open; both packet-3 branches leave only higher-stakes follow-through open. |
| 52 | pass | pass | Every requested language has a visible recommended ending followed by three distinct labeled alternates. |
| 53 | fail | pass | Packet 1's recommended `Named reader` ending is generic second-person advice rather than recognition of one person in one specific situation; packet 3's endings perform their labels. |
| 54 | pass | pass | The exact adjacent lines above advance from recognition to a source event/action in packet 1 and both packet-3 branches. |
| 55 | not applicable | not applicable | Neither packet supplies the complete prohibition predicate. |
| 56 | not applicable | fail | English and Chinese are independently phrased, separately assembled, and independently within runtime, but both branches change indirect speech into direct quotation and therefore fail speech-status preservation. |

Post-review regrade: round 4 did not close source fidelity or Named-reader integrity. The exact RED fixtures above preserve both violations. The final-review correction section added below supersedes this round's original green claim.

## Final-review correction wave

### Authoritative fresh-context method

The exact neutral prompts and exact last-message outputs are tracked in `tests/behavioral/fixtures/spoken-style-final-review-2026-08-14/`. Each prompt instructs one new ephemeral Codex context to read only the repository skill and the references it routes for finalization, avoid tests/plans/history, make no repository changes, and return only the user-facing response. No prompt contains scenario numbers, rubric language, suspected failures, or expected observations.

The reproducible invocation shape was:

```text
codex exec --ephemeral -s read-only -C "$PWD" \
  -o /tmp/packet-output.md - \
  < tests/behavioral/fixtures/spoken-style-final-review-2026-08-14/packet-N.md
```

Packet 2's two focused reruns used `workspace-write` only so the evaluator could create temporary runtime input after the read-only sandbox blocked its heredoc; the neutral prompt still prohibited repository writes. The exact user-facing outputs, not process logs, are the graded artifacts. No execution trace proves Humanizer or Shuorenhua invocation, so this evidence makes no such claim.

### Corrected RED grades

- `red-packet-1-output.md` fails scenario 53. Its recommended `Named reader` ending says `If one question keeps returning on your small team, protect an afternoon...`; this is generic second-person advice and an imperative, not recognition of one person in one concrete situation.
- `red-packet-3-output.md` fails scenario 50's quote-status predicate and therefore scenario 56's speech-status preservation. The source says indirectly that the writer thought the group was solving two different problems. The output invents direct dialogue in both languages: `I said, "I think we're solving two different problems."` and `我说：“我觉得我们在解决两个不同的问题。”`
- `control-packet-4-output.md` passes scenario 55 before the correction. It removes the supplied prohibited forms while keeping the repeated checking rhythm and uncomfortable admission. Because the control already complied, no speculative prohibition wording was added.

### Demonstrated corrections and focused iteration

The final-review wording adds a speech-status ledger and two audits that keep exact quotation, unquoted paraphrase, and uncertain recollection distinct through polishing, endings, and both language branches. It also gives Named reader a concrete predicate: singular recognition, a source-supported role or relationship, a source-specific moment/action/conflict, writer disclosure, and no imperative.

The first post-fix no-detail run, retained as `iteration-1-packet-2-output.md`, preserved quote status but left two writer-side uncertainties in one callback. The next wording requires a callback to answer a distinct opening question with the earned turn before leaving only the approved tension open. `iteration-2-packet-2-output.md` closed that gap but placed preference commentary between its clip candidate and source action. The last narrow change classifies statements about what the writer did not want, intend, claim, believe, or know as commentary rather than the required clip successor. The final packet-2 output then passes both gates.

No further instruction patch was made.

### Exact final behavioral evidence

Quote status is preserved in the final bilingual output:

```text
EN: I said that I thought we were solving two different problems.
ZH: 我只是说，
ZH: 我觉得大家可能在解决两个不同的问题。
```

The no-detail output says `I don't remember her exact words, so I won't try to recreate them.` It introduces no direct quotation or physical setting.

Every final Named-reader ending satisfies the concrete predicate:

- Packet 1 recognizes the singular person who knows the answers and keeps becoming the team's support system.
- Packet 2 recognizes the colleague who warned that moving too fast could cost the team trust.
- Packet 3 recognizes the teammate who reported that the uncertain question saved a week; Chinese adapts the same person and moment naturally.
- Packet 4 recognizes the volunteer who moved the tomato seeds.

The final clip candidates advance directly to source-grounded actions:

```text
Packet 1: I had confused being easy to reach with making things easier for other people.
          So I tried something embarrassingly small: two afternoons with notifications off and one place for questions.

Packet 2: Waiting for my approval had become a system I was helping create.
          So we chose two kinds of decisions that could move without me.

Packet 3 EN: If I can name the confusion accurately,
             I don't have to solve the whole problem before I speak.
             So I asked each person which date they were using, and why.

Packet 3 ZH: 只要我能准确说出困惑在哪里，
             就不用先把整个问题解决了再开口。
             所以那次，我问了两个人，他们各自用的是哪个日期，为什么会用那个日期。

Packet 4: I kept calling it care because control sounded uglier.
          The next week, we changed three things.
```

Packet 4 contains none of the supplied throat-clearing, parentheses, semicolons, `here is the part where`, `as a quick aside`, announced-insight phrases, or like/comment/share bait in its spoken output. It retains `I checked once. Then again. Then once more.`, `Feeling unnecessary bothered me.`, and `I kept calling it care because control sounded uglier.`

Runtime extraction includes each complete body and recommended conclusion, excludes the `Recommended ending — ...` editorial heading, and stops before `Alternate endings`:

```text
packet 1 EN: 530 words, 212.0 seconds, 3.53 minutes, within_range
packet 2 EN: 494 words, 197.6 seconds, 3.29 minutes, within_range
packet 3 EN: 449 words, 179.6 seconds, 2.99 minutes, within_range
packet 3 ZH: 798 Han characters, 199.5 seconds, 3.33 minutes, within_range
packet 4 EN: 475 words, 190.0 seconds, 3.17 minutes, within_range
```

The final mechanical audit reports no line-ceiling violations and no ending-length violations:

```text
green-packet-1-output.md: max_en=18, recommended=1, alternates=3, ending_lines=2/2/2/2
green-packet-2-output.md: max_en=18, recommended=1, alternates=3, ending_lines=2/2/2/2
green-packet-3-output.md: max_en=13, max_zh=22, recommended=2, alternates=6, ending_lines=2/2/2/2 per language
green-packet-4-output.md: max_en=18, recommended=1, alternates=3, ending_lines=2/2/2/2
```

### Final scenario grades

| Scenario | Packet 1 | Packet 2 | Packet 3 | Packet 4 | Evidence |
| --- | --- | --- | --- | --- | --- |
| 49 | pass | pass | pass | pass | All bodies use one-breath lines within the mechanical ceilings and preserve source rhythm. |
| 50 | not applicable | pass | pass for quote status | not applicable | Packets 2 and 3 keep supplied indirect speech indirect; packet 2 adds no physical detail. |
| 51 | pass | pass | pass | pass | Each body earns a source-grounded turn and leaves only its approved future uncertainty open. |
| 52 | pass | pass | pass | pass | Every requested language has a visible recommended ending plus three labeled alternatives. |
| 53 | pass | pass | pass | pass | Every ending performs its label, uses one or two breaths, and carries the shared writer tension. |
| 54 | pass | pass | pass | pass | The exact candidate/successor pairs above advance to an event or action without intervening explanation. |
| 55 | not applicable | not applicable | not applicable | pass | Prohibited forms are absent while repetition, discomfort, and the writer's edge remain. |
| 56 | not applicable | not applicable | pass | not applicable | Both language branches preserve facts, event order, indirect-speech status, earned turn, one tension, and ending intent while remaining independently natural and within runtime. |

### Final verdict

All applicable scenarios 49–56 pass in the tracked final outputs. The only evidence limitation is unchanged: the host exposed no nested polishing-skill trace, so dependency invocation is neither claimed nor graded from prose.
