# Finalization

## Preconditions

Finalize after the user authorizes a narrative direction and evidence choices, delegates the choice with “you choose,” or explicitly says “finalize now.” Build the approved story contract described in `story-workflow.md` before drafting.

Confirm the requested mode: English, Simplified Chinese, or bilingual. Default to bilingual. Confirm or infer the audience from the user's material; never impose a career, neurodiversity, founder, or other niche audience unless the user chooses it.

## Independent language branches

Draft each requested language directly from the approved story contract:

- English should sound reflective, conversational, and natural when spoken aloud.
- Simplified Chinese should be natural spoken Chinese adapted for the intended Chinese-speaking viewers, not translation-shaped prose. Do not assume a mainland-China audience unless the user specifies one.
- Bilingual scripts must preserve the same question, story beats, facts, conflicts, resolution, evidence boundaries, and intended viewer shift. They may differ in idiom, sentence order within a beat, connective phrasing, and culturally natural explanation.
- Chinese-only mode must not generate an English draft.

Use short teleprompter-friendly paragraphs. Retain purposeful fragments and pauses. Remove filler, false starts, duplicated setup, and transcription artifacts without erasing the speaker's personality.

## Required polishing passes

### English

Invoke the installed `humanizer` skill on the English draft. Instruct it to preserve all approved facts, story beats, causal relationships, uncertainty, audience, and runtime; make only naturalness and spoken-rhythm improvements. Use its final humanized text internally. Suppress its draft, critique, scoring, and change summary.

If `humanizer` is missing, do not finalize English. Tell the user to install it with:

`npx skills add blader/humanizer`

### Simplified Chinese

Invoke the installed `shuorenhua` skill on the Chinese draft. Instruct it to preserve all approved facts, story beats, causal relationships, uncertainty, audience, and runtime; make it sound like natural contemporary spoken Chinese. Use its single recommended final version internally. Suppress diagnostics, alternatives, annotations, and change summaries.

If `shuorenhua` is missing, do not finalize Simplified Chinese. Tell the user to install it with:

`npx skills add MrGeDiao/shuorenhua`

For bilingual mode, a missing dependency blocks only its language branch. Clearly state that the deliverable is incomplete; do not present one branch as a completed bilingual result.

If an installed dependency is incompatible, fails validation, or cannot run, treat it as unavailable for that branch. Report the dependency and observed problem; do not modify or replace third-party code silently.

## Integrity audit after polishing

Compare each polished script to the approved story contract. Reject or repair any added experience, source, number, causal claim, certainty, or story beat. Check that omitted qualifications have not changed the meaning.

For bilingual output, run a parity audit across:

- hook question and audience promise;
- event order and causal links;
- every approved fact and evidence boundary;
- meaningful conflicts and stakes;
- resolution, takeaway, and call to reflection.

Parity is semantic, not literal. Do not make either version a line-by-line translation.

## Hard runtime gate

Every requested version must be at least 2.5 minutes and no longer than 15 minutes.

Use `scripts/estimate_runtime.py` after polishing:

- English: 150 spoken words per minute; valid range 375–2250 words.
- Simplified Chinese: 240 Han characters per minute; valid range 600–3600 Han characters. Mixed Latin words add time at 150 words per minute.

Examples:

```bash
python3 scripts/estimate_runtime.py --language en english.txt
python3 scripts/estimate_runtime.py --language zh chinese.txt
```

If the result is `too_short`, deepen an approved beat with source-grounded detail, reflection, or an authorized support point. Never pad with generic repetition. If `too_long`, cut secondary setup and optional examples before touching the core conflict or resolution. Re-polish affected passages, rerun integrity and parity checks, and estimate again.

After the numeric gate passes, read for spoken cadence. Pause-heavy delivery may run longer, so shorten scripts that sit too close to 15 minutes when cadence suggests an overrun. The numeric minimum remains binding.

## Clean output contract

Output only the final humanized teleprompter script plus light delivery notes. For bilingual mode, label the two scripts clearly. Light delivery notes may mark a pause, emphasis, pronunciation, one optional visual or source cue, or one concise performance suggestion. Keep them sparse and do not turn them into production direction.

Do not include research menus, source ledgers, citations lists, workbench notes, the approved story contract, runtime metrics, parity reports, polishing commentary, or editorial explanations unless the user explicitly requests them.
