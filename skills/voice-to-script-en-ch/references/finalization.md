# Finalization

## Preconditions

Finalize after the user authorizes a narrative direction and evidence choices, delegates the choice with “you choose,” or explicitly says “finalize now.” A missing `duration_choice` is a strict precondition failure: ask only for exact duration, rough range, or freestyle, end the turn, and never infer freestyle from `finalize now`. Build the approved story contract described in `story-workflow.md` only after the user answers, including `planned_preferred_status` and any required shorter-result or over-15 authorization, then read and apply `references/spoken-style.md`.

Do not build the approved story contract while an unsupported explicit target or above-15 scope choice remains unresolved. When the supplied target or expected one-video scope exceeds 15 minutes and no scope choice exists, set `scope_choice_required` and return to the **Above-15 first response contract** in `SKILL.md`. An initial request for one long video does not resolve this state. End that turn before source-sufficiency assessment. Set `scope_choice_resolved` only after the user selects one longer video, a short series, or a narrower story in a follow-up to the displayed checkpoint; only then assess whether the selected shape has enough honest support and show the four-way unsupported-target menu if it does not.

Confirm the requested mode: English, Simplified Chinese, or bilingual. Default to bilingual. Confirm or infer the audience from the user's material; never impose a career, neurodiversity, founder, or other niche audience unless the user chooses it.

## Independent language branches and source-faithful drafting

Draft each requested language directly from the approved story contract:

- English should sound reflective, conversational, and natural when spoken aloud.
- Simplified Chinese should be natural spoken Chinese adapted for the intended Chinese-speaking viewers, not translation-shaped prose. Do not assume a mainland-China audience unless the user specifies one.
- Bilingual scripts must preserve the same question, story beats, facts, conflicts, earned turn, exactly one remaining unresolved tension, evidence boundaries, and intended viewer shift. They may differ in idiom, sentence order within a beat, connective phrasing, and culturally natural explanation.
- Chinese-only mode must not generate an English draft.

For every branch, make an initial deletion pass before rewriting: cut throat-clearing, duplicate explanation, softened restatements, and transcription artifacts while retaining source tics, useful repetition, fragments, and uncomfortable admissions that carry the writer's voice. Then perform an aloud pass. Split or cut every stumble, restart, or breath failure. Format one breath per line; line breaks are pauses. Use contractions in English and equivalent natural spoken compression in Simplified Chinese without forcing English grammar onto Chinese.

Build the complete teleprompter script with the approved clip line, earned turn, and exactly one unresolved tension. Choose the strongest ending mode for that complete script and use it as the recommended ending.

Before drafting the body, verify the clip-line pair in the approved story contract: the candidate must have a specific later source event, time, or action beat that can immediately follow it in source chronology. When the writer supplied a clear self-recognition line, keep that line as the candidate and use it as narrator-level framing immediately before the planned successor; moving commentary does not reorder the source events. Build a different source-grounded candidate only when the source contains no clear recognition line. Assemble the verified clip line and successor as an adjacent pair around two-thirds through the complete script.

Before output, audit clip-line assembly separately. This is a hard ordering gate: the actual next spoken line must be the paired event, time, or action beat. A statement about what the writer did not want, intend, claim, believe, or know is commentary, not that successor. If the next line defines, paraphrases, translates, compares, qualifies, or otherwise explains the clip line, move it before the pair or after the successor, or delete it, then re-check the adjacency.

Perform that clip-line audit independently for every requested language after its final body is assembled. Inspect the actual adjacent written line. If the pair fails, replace the candidate and successor together with another approved pair, then re-check the new adjacent line before output. Do not leave a failed candidate in place because it is strong or late.

## Required polishing passes

### English

Invoke the installed `humanizer` skill on the English complete script. Instruct it to preserve all approved facts, story beats, causal relationships, uncertainty, audience, runtime, line rhythm, fragments, useful repetition, source tics, uncomfortable admissions, the clip line, the earned turn, and the unresolved tension; make only naturalness and spoken-rhythm improvements. Use its final humanized text internally. Suppress its draft, critique, scoring, and change summary.

If `humanizer` is missing, do not finalize English. Tell the user to install it with:

`npx skills add blader/humanizer`

### Simplified Chinese

Invoke the installed `shuorenhua` skill on the Chinese complete script. Instruct it to preserve all approved facts, story beats, causal relationships, uncertainty, audience, runtime, line rhythm, fragments, useful repetition, source tics, uncomfortable admissions, the clip line, the earned turn, and the unresolved tension; make it sound like natural contemporary spoken Chinese. Use its single recommended final version internally. Suppress diagnostics, alternatives, annotations, and change summaries.

If `shuorenhua` is missing, do not finalize Simplified Chinese. Tell the user to install it with:

`npx skills add MrGeDiao/shuorenhua`

For bilingual mode, a missing dependency blocks only its language branch. Clearly state that the deliverable is incomplete; do not present one branch as a completed bilingual result.

If an installed dependency is incompatible, fails validation, or cannot run, treat it as unavailable for that branch. Report the dependency and observed problem; do not modify or replace third-party code silently.

## Integrity and parity audits after polishing

Compare each polished complete script to the approved story contract. Reject or repair invented detail: an added experience, source, number, causal claim, certainty, story beat, motive, or interior state. Also reject or repair smoothed-away edges, restored explanation, generic advice, or formatting that cannot be performed aloud. Check that omitted qualifications have not changed the meaning.

Run a motive-and-interiority audit after polishing and again after assembling the endings. Map every first-person explanation of why the speaker acted, what they wanted or feared, what identity they protected, and what an event meant to the source ledger. A preference such as “I liked being the reliable one” does not authorize a stronger motive such as “I was protecting my place as the reliable one.” Keep only explicit source language or a meaning-equivalent paraphrase. Turn any useful but unsupported inference into a discovery question before drafting, or remove it; never assert it in the script or pass it into the external-polish prompt.

Run a quote-status audit after polishing and again after assembling the endings. Compare every passage presented as direct speech, including quotation marks or dialogue phrasing, with the speech-status ledger. Only a ledger item marked as an exact quotation may remain direct: preserve its words in the source language or translate it faithfully for another requested language. Material marked unquoted paraphrase or uncertain must remain indirect in every language. Never turn `I said that I thought...` into reconstructed dialogue such as `I said, “I think...”`.

For bilingual output, run a parity audit across:

- hook question and audience promise;
- event order and causal links;
- every approved fact and evidence boundary;
- meaningful conflicts and stakes;
- clip line, earned turn, exactly one remaining unresolved tension, and ending intent.

Parity is semantic, not literal. Do not make either version a line-by-line translation.

## Ending-generation pass

After the complete script's recommended ending is chosen and polished, generate at least three labeled additional endings. Label each additional ending with one of these exact modes:

1. `Story request — best for comments`
2. `Named reader — best for shares`
3. `Callback — best for cohesion`
4. `Unapologized position`

The recommended ending plus the alternatives must collectively use at least three modes. Alternatives must be materially distinct, one or two breaths each, preserve the approved facts, earned turn, and exactly one unresolved tension, and avoid generic advice, generic maxims, engagement bait, or new explanation. Do not use an alternative to resolve the tension left intentionally open in the complete script.

In the final user-facing output, place the complete script's last one-or-two-breath conclusion beneath `Recommended ending — [mode]`, using the exact selected mode label above. The label is editorial and is excluded from the complete script's runtime. The recommended ending itself must perform its named mode; do not replace it with a generic reflective question or invitation addressed to an abstract viewer.

Before output, audit the words of the recommended ending and **every** alternate separately. A correct label is not evidence: each ending must actually perform its labeled mode as defined in `spoken-style.md` and state, rather than merely imply, the same source-specific unresolved tension. Reject any ending that only carries the mode label, substitutes a generic question for its function, or drops the unresolved tension to sound more conclusive.

Inventory writer-side uncertainties across the complete body and recommended conclusion. Repeated phrasings of the approved unresolved tension count as one; answer or remove every other open writer-side question. In a callback, do not preserve a distinct opening question as a second uncertainty. A Story-request prompt may ask the viewer for a lived story, but it does not replace or multiply the writer's one approved tension.

For every ending labeled `Named reader — best for shares`, apply this concrete predicate: it must recognize one singular person through both a source-supported role or relationship and a source-specific moment, action, or conflict, then pair that recognition with the writer's real disclosure. Reject a broad audience label, an `if you` condition, or an imperative telling the viewer what to do. If either recognition anchor is missing, the ending does not perform the mode.

For every ending, reserve one of its one-or-two spoken lines for an explicit writer-side statement of that exact unresolved tension. A viewer question, a mode label, or an implied risk does not satisfy this requirement.

Count the displayed spoken lines in the recommended ending and every alternate before output. Each must contain no more than two spoken lines or breaths; exclude only its editorial label. Compress Simplified Chinese naturally when needed rather than spilling an ending into a third line.

Run a mechanical line audit over every displayed spoken line in each complete body and ending. Split any English line over 18 spoken words and any Simplified Chinese line over 28 Han characters, even when it is one grammatical sentence or one ending breath. These are ceilings, not targets: split or cut shorter lines too whenever the aloud pass reveals a stumble, restart, breath failure, or more than one independently performable beat. Recount after every split and preserve only approved source material.

## Story-led runtime check

For each requested language, define the runtime-bearing script as the complete teleprompter body plus its recommended conclusion. The visible `Recommended ending — [mode]` heading is editorial and excluded. Alternate endings and light delivery notes are also excluded.

The approved story contract already contains the pre-draft `planned_preferred_status`. A planned `above_preferred` result must have explicit longer-video authorization before drafting; a series or narrower-story choice creates a new plan and status. The post-draft estimator never substitutes for that planning stop.

After polishing, ending assembly, spoken-cadence reading, mechanical line checks, source-integrity, quote-status, motive-and-interiority, clip-line, ending, and bilingual parity audits are complete, freeze the runtime-bearing text. Run `scripts/estimate_runtime.py` on exactly that frozen text:

- English: 150 spoken words per minute; the preferred 2–15-minute range is 300–2250 words.
- Simplified Chinese: 240 Han characters per minute; the preferred 2–15-minute range is 480–3600 Han characters. Mixed Latin words add time at 150 words per minute.

Examples:

```bash
python3 scripts/estimate_runtime.py --language en english.txt
python3 scripts/estimate_runtime.py --language zh chinese.txt
```

- Record the result as `measured_preferred_status` for that language, together with the exact measured counts and a text fingerprint sufficient to identify the frozen body and recommended conclusion.
- Treat `within_preferred` as the normal 2–15-minute result.
- For `below_preferred`, keep the shorter result when extending it would require padding, repetition, or invention; deepen it only with approved material.
- If an unplanned `above_preferred` result appears, withhold the draft, return to the three-way pre-draft scope choice, and rebuild from the user's selection.
- An explicit user duration remains the target when the source can support it honestly.
- Never reject an otherwise complete script solely for `below_preferred` or an authorized `above_preferred` result.

No text edit is allowed after measurement: any such edit invalidates measured state, including `measured_preferred_status` and the stored fingerprint. After any edit to a measured body or recommended conclusion, rerun the matching required polishing pass when applicable, every integrity, quote-status, motive-and-interiority, clip-line, ending, mechanical-line, and bilingual parity audit, then freeze and measure again. Output only when the final displayed runtime-bearing text exactly matches the last measurement. Do not measure the editorial recommended-ending heading, alternate endings, delivery notes, or external handoff. Account for pause-heavy cadence before freezing; never remove essential meaning merely to stay inside the preferred window.

## Clean output contract

For each requested language, output in this exact order:

```text
[Complete teleprompter body]

Recommended ending — [mode]
[One-or-two-breath recommended conclusion]

Alternate endings
[At least three labeled alternatives]

Light delivery notes
[Sparse notes]

Optional external polish
[Privacy warning]
[Claude copy-paste prompt for English or DeepSeek copy-paste prompt for Simplified Chinese]
```

Although the editorial recommended-ending heading separates the conclusion visually, the runtime-bearing script is the complete body plus that conclusion. The heading itself, alternates, and notes remain outside the measurement.

For bilingual mode, label the two language sections clearly and preserve this order within each section. Keep the Claude prompt with the English section and the DeepSeek prompt with the Simplified Chinese section. Light delivery notes may mark a pause, emphasis, pronunciation, one optional visual or source cue, or one concise performance suggestion. Keep them sparse and do not turn them into production direction.

Read `references/external-polish.md` only after finalization and all internal integrity checks. Humanizer must already have run for English and `shuorenhua` for Simplified Chinese; the optional third-party handoff never replaces either. Insert the matching privacy warning and complete copy-paste prompt template after each requested language's light notes, following its placeholder rule. Never send the script automatically.

Suppress internal workbench, research, source ledgers, citations lists, approved story contract, polishing commentary, runtime metrics, parity reports, editorial explanations, and all other process notes unless the user explicitly requests them.
