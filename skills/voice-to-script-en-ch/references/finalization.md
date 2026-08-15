# Finalization

## Preconditions

Finalize after the user authorizes a narrative direction and evidence choices, delegates the choice with “you choose,” or explicitly says “finalize now.” Build the approved story contract described in `story-workflow.md` before drafting, then read and apply `references/spoken-style.md`.

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

Before output, audit clip-line assembly separately. This is a hard ordering gate: the actual next spoken line must be the paired event, time, or action beat. If it instead defines, paraphrases, translates, compares, or otherwise explains the clip line, move that explanation before the pair or delete it, then re-check the adjacency.

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

Compare each polished complete script to the approved story contract. Reject or repair invented detail: an added experience, source, number, causal claim, certainty, or story beat. Also reject or repair smoothed-away edges, restored explanation, generic advice, or formatting that cannot be performed aloud. Check that omitted qualifications have not changed the meaning.

For bilingual output, run a parity audit across:

- hook question and audience promise;
- event order and causal links;
- every approved fact and evidence boundary;
- meaningful conflicts and stakes;
- clip line, earned turn, unresolved tension, and ending intent; and
- earned turn and exactly one remaining unresolved tension.

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

For every ending, reserve one of its one-or-two spoken lines for an explicit writer-side statement of that exact unresolved tension. A viewer question, a mode label, or an implied risk does not satisfy this requirement.

Count the displayed spoken lines in the recommended ending and every alternate before output. Each must contain no more than two spoken lines or breaths; exclude only its editorial label. Compress Simplified Chinese naturally when needed rather than spilling an ending into a third line.

Run a mechanical line audit over every displayed spoken line in each complete body and ending. Split any English line over 18 spoken words and any Simplified Chinese line over 28 Han characters, even when it is one grammatical sentence or one ending breath. These are ceilings, not targets: split or cut shorter lines too whenever the aloud pass reveals a stumble, restart, breath failure, or more than one independently performable beat. Recount after every split and preserve only approved source material.

## Hard runtime gate

Every requested complete script must be at least 2.5 minutes and no longer than 15 minutes. Before appending alternate endings and delivery notes, run `scripts/estimate_runtime.py` on the complete script body only:

- English: 150 spoken words per minute; valid range 375–2250 words.
- Simplified Chinese: 240 Han characters per minute; valid range 600–3600 Han characters. Mixed Latin words add time at 150 words per minute.

Examples:

```bash
python3 scripts/estimate_runtime.py --language en english.txt
python3 scripts/estimate_runtime.py --language zh chinese.txt
```

If the result is `too_short`, deepen an approved beat with source-grounded detail, reflection, or an authorized support point. Never pad with generic repetition. If `too_long`, cut secondary setup and optional examples before touching the core conflict or resolution. When duration changes, repeat polishing and measurement only on the complete script, then rerun its integrity audit and the bilingual parity audit when applicable. Do not include alternate endings or delivery notes in runtime measurement.

After the numeric gate passes, read for spoken cadence. Pause-heavy delivery may run longer, so shorten scripts that sit too close to 15 minutes when cadence suggests an overrun. The numeric minimum remains binding.

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
```

For bilingual mode, label the two language sections clearly and preserve this order within each section. Light delivery notes may mark a pause, emphasis, pronunciation, one optional visual or source cue, or one concise performance suggestion. Keep them sparse and do not turn them into production direction.

Suppress internal workbench, research, source ledgers, citations lists, approved story contract, polishing commentary, runtime metrics, parity reports, editorial explanations, and all other process notes unless the user explicitly requests them.
