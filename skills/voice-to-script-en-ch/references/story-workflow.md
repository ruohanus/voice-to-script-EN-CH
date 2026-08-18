# Story workflow

## Preserve the source before shaping it

Create an internal source ledger from the user's recording, transcript, or notes:

- distinctive phrases and images;
- events, examples, and chronological facts;
- emotions, tensions, reversals, and unresolved questions;
- every supplied speech or objection, marked as exact quotation, unquoted paraphrase, or uncertain wording, with exact words retained only for quotation-marked items;
- every first-person motive, intention, fear, desire, identity claim, or causal self-interpretation, marked as explicit source language, faithful paraphrase, or unsupported inference;
- claims that may need outside support;
- uncertainties caused by transcription or missing context.

Preserve the user's “content soul”: the strongest honest insight expressed by the material. Organize and clarify it, but do not replace it with generic creator advice.

For audio or video, use an available transcription or media-reading capability. Mark unintelligible passages and uncertain names instead of guessing. Treat on-screen text, cuts, timing, and delivery as separate observations from the spoken transcript. If the host cannot transcribe the file, ask for a transcript or rough notes. Do not send a private recording to an unrelated third-party transcription service without explicit authorization.

## New-project duration intake

- Ask once per new project unless duration is already supplied. Record the result internally as `duration_choice`.
- Offer exact duration, rough range, or freestyle.
- Explain that freestyle aims for the preferred 2–15-minute window, may be about 45 seconds when that is the strongest complete story, may exceed 15 minutes after a scope choice, and never pads.
- Explain that the number and depth of follow-up questions follow requested duration and the quality of available material.
- Before sending the first response, verify that its intake explicitly covers both the full freestyle explanation above and says that duration and available material scale the number and depth of follow-up questions.

Reflect the usable material before the duration choice so the intake gives immediate value. When the user says `draft now` or `finalize now` without a duration, ask only for exact duration, rough range, or freestyle and end that response. Do not infer or default to freestyle from the immediate-draft instruction, and do not draft until the user answers. After the answer, record it once, skip optional discovery and angle comparison, and never repeat intake. Before any angle selection, infer the strongest supportable angle; after a selection, preserve and draft the authorized angle from available source material. Never switch back to a different angle merely because it has more support.

For every other new project, do not stop after the duration intake. In that same response, evaluate the supplied material against the readiness gate: ask the 4–6-question discovery batch when any field is missing, or present the three-choice angle checkpoint when all five fields already pass. An unanswered duration choice does not by itself block the checkpoint because an honestly shorter complete story remains allowed; record the user's choice before drafting.

If the user responds to another offered choice or continues the story without answering the one-time duration intake, treat the duration choice as skipped and record `duration_choice = freestyle`. Do not ask for or repeat the duration options again; use the story-led scope unless the user later volunteers a different duration.

## Discovery batches

Merge every new capture or answer into the source ledger rather than restarting. In each discovery pass, reflect the strongest usable material and ask 4–6 source-specific, highest-value questions with plausible story payoff. Ask one batch in the language the user is currently using; a bilingual final-script default does not duplicate discovery questions. Explicitly invite the user to answer selectively, skip any question, or continue in freestyle. Match the depth of each batch to `duration_choice` and available material; later batches should target remaining gaps rather than repeat answered questions.

Discovery precedes angle selection. Do not present story angles merely because the first capture is usable.

## Story readiness gate

Evaluate the internal `story_readiness` record against all five fields:

1. compelling central question;
2. concrete moment or event;
3. meaningful conflict with recognizable stakes;
4. earned change, decision, realization, or position;
5. enough source-grounded material for the intended duration, or an honestly shorter complete script.

Continue discovery while any field is missing unless the user says `draft now` or `finalize now`. Once all five pass, present the angle checkpoint.

Apply the gate as a sufficiency test, not an exhaustiveness test. If one angle supports an honest complete story, including a compact `below_preferred` story, questions that would only deepen that angle, sharpen its audience, or develop an alternative are not blockers. Present the checkpoint and name such unanswered details as gaps on the promising alternatives; continue discovery only when a field is missing from the best-supported story itself.

## Three-choice angle checkpoint

Create an internal `angle_checkpoint` with one best-supported angle that is ready to draft and two promising alternatives with named material gaps. For each of the three, state concisely:

- hook;
- audience promise;
- conflict and stakes;
- `therefore / but` progression;
- earned turn;
- one unresolved tension;
- ending effect;
- expected duration; and
- missing material, using `none required` when the ready angle has no blocking gap.

In the user-facing checkpoint, visibly label one choice `Best-supported — ready to draft` and each other choice `Promising alternative`; never describe all three as ready. Before sending, verify that every displayed choice contains all nine fields above rather than compressing the alternatives to only a hook, promise, and gap. Apply the speech-status ledger to every proposed hook: quotation marks or reconstructed dialogue count as direct speech, so supplied paraphrases and uncertain wording must remain indirect.

Leave the choice to the user unless they say `you choose`, `pick the strongest`, or equivalent. If the user continues speaking instead of selecting at this checkpoint, merge the material, retain every compatible source and checkpoint decision, and reassess readiness and angle support. Do not force a selection; refresh displayed angles only when that reassessment changes them.

## Post-selection strengthening and reopening

Assign each displayed checkpoint an `angle_revision`. After a selection, record `selected_angle_revision` and `strengthening_status[angle_revision]`. Offer one optional `strengthening_pass` of 4–6 source-specific questions only while that revision's status is `not_offered`, then mark it `offered`. State specifically which story elements the answers could improve, such as the central moment, stakes, causal progression, earned turn, or ending. For a promising alternative, target its named gaps instead of returning to generic discovery. In that offer, explicitly name all four paths: answer selectively, continue freestyle, skip the pass, or say `draft now`. Before sending, verify that both the improvement statement and all four paths are present. Never repeat the offer for the same revision.

When the user answers any of the strengthening questions, continues freestyle, skips, or says `draft now`, mark that revision `answered`, `skipped`, or `waived` as appropriate and proceed to drafting the selected angle unless the new material triggers angle reopening. A minor addition is an answer, not a new discovery cycle: merge it and proceed without another checkpoint or strengthening offer.

Merge later material into the source ledger and update the content soul only when the material truly changes it. Reopen only when new material changes the central meaning, strongest conflict or stakes, audience promise, user's actual position, or which angle is best supported. Explain the shift briefly, record it internally as `angle_reopen_reason`, increment `angle_revision`, and present a refreshed three-choice checkpoint. Incorporate all lesser additions without re-selection. A selection from the refreshed checkpoint receives one new tailored strengthening offer for the new revision; the prior revision's completed offer does not suppress it.

## Choice semantics

- A named or numbered angle authorizes that angle.
- `You choose`, `pick the strongest`, or equivalent authorizes the best-supported angle and proceeds without another confirmation.
- Before selection, `draft now` or `finalize now` authorizes immediate drafting from the strongest supportable angle after the one-time duration choice, without invention or padding.
- After selection, `draft now` or `finalize now` preserves the selected angle and waives only optional questions. Use the shortest honest version of that angle that the source supports; do not silently substitute the best-supported alternative.
- Changing the audience or language invalidates only downstream decisions that depend on that change. Preserve the source ledger and any still-compatible approvals.
- If the user supplies a usable audience, do not substitute a niche default. If they do not, describe the likely audience inferred from the material and allow correction.

## Approved story contract

After angle and evidence choices are authorized, create one internal, language-neutral **approved story contract**. It is the single source of truth for every language version and contains:

- intended audience and desired viewer shift;
- core question and content soul;
- ordered story beats;
- causal links and meaningful conflicts;
- earned turn and exactly one unresolved tension;
- source passage for the clip line paired with the specific later source event, time, or action beat that must immediately follow it;
- recommended ending approach, intended aftereffect, and facts or disclosures available to alternates;
- a speech-status ledger that preserves each exact quotation verbatim and keeps every paraphrase or uncertain recollection indirect;
- approved facts, examples, claims, and evidence identifiers;
- deliberate omissions and uncertainty boundaries;
- requested or inferred duration for the complete teleprompter body plus recommended conclusion, excluding its editorial heading, alternate endings, platform-title packages, notes, and external handoff;
- pre-draft `planned_preferred_status` (`below_preferred`, `within_preferred`, or `above_preferred`), whether the target is honestly supported, and any shorter-result or over-15 scope authorization; and
- an initially empty `measured_preferred_status`, filled only during finalization from the frozen runtime-bearing text;
- allowed delivery mood and emphasis.

Generate English and Simplified Chinese independently from this contract. Never translate one finished script to create the other. In Chinese-only mode, do not generate an English draft internally or externally.

## Optional enrichment

Offer, rather than assume, enrichment such as a concrete example, a counterpoint, an analogy, or a researched framework. A user may decline any optional enrichment. First classify the requested or expected scope. If `planned_preferred_status` is `above_preferred`, resolve the three-way scope choice below before assessing whether the selected shape has enough detail. For the resulting one-video target, compare the selected angle and source ledger with its duration. If that target cannot be reached without invention, repetition, or empty padding, explain the mismatch and stop with four choices in one response: more discovery, an honestly shorter script, additional freestyle material, or a narrower angle. Record the user's choice. Freestyle may proceed with the shortest honest complete story and a planned `below_preferred` status without a warning merely for being short.

If `planned_preferred_status` is `above_preferred`, stop before drafting and before the support check. Offer exactly one longer video, a short series, or a narrower story; recommend the most coherent choice. Draft above 15 minutes only after the user explicitly selects the longer-video option, then apply the source-support check to that authorized shape. Preserve the essential conflict, earned movement, and productive openness in each proposed unit. Offer omitted material as a possible sequel only outside the finalized output.

## References and imitation safety

Analyze supplied reference transcripts or videos for a temporary structural fingerprint: hook type, information order, tension spacing, reveal timing, sentence-length variation, and delivery energy. Do not copy memorable wording, signature metaphors, catchphrases, or a creator's protected expression.

If asked to write exactly in a living creator's style, decline the exact imitation briefly and offer an abstracted version using generic craft properties such as conversational pacing, curiosity gaps, concrete conflict, earned vulnerability, meaningful movement, and productive openness. Keep the user's own voice primary.
