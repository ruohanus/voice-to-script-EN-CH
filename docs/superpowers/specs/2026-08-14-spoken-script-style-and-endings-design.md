# Spoken Script Style and Endings Revision

## Objective

Revise `voice-to-script-en-ch` so its finalized scripts sound performable rather than written, retain the writer's actual voice and facts, include a clip-worthy line, and end with productive openness instead of a fully explained lesson.

These rules supersede the existing requirement to resolve every conflict. The story must still earn movement, but exactly one meaningful tension remains unresolved so the viewer has something real to respond to.

## Scope

Change only the skill's writing, ending, final-output, and related behavioral-test contracts. Preserve its identity, audiences, bilingual architecture, evidence workflow, polishing dependencies, research behavior, safety boundaries, and 2.5-to-15-minute runtime.

Do not add dependencies, scripts, plugin packaging, or invented source material.

## Architecture

Add one focused reference, `references/spoken-style.md`, for the detailed performance and ending rules. Keep routing and precedence in `SKILL.md`, story selection and the approved story contract in `references/story-workflow.md`, and language-specific polishing, auditing, runtime, and output assembly in `references/finalization.md`.

This separation keeps the core skill scannable and gives finalization one authoritative style reference without duplicating a long checklist across files.

## Narrative Contract

Retain the question-led `therefore / but` engine, but replace the fully resolved arc with:

`question → therefore → but → therefore → but → earned turn → one unresolved tension`

The earned turn may be a decision, changed interpretation, honest position, or next action. It must satisfy the central movement without explaining away every conflict. Exactly one intentional tension, uncertainty, or question remains open at the end.

Narrative directions must identify both the earned turn and what remains unresolved. The approved story contract must record:

- the earned turn;
- the one unresolved tension;
- the clip line or source passage from which it can be built;
- the recommended ending mode;
- the facts and disclosures available for alternate endings.

## Spoken-Writing Contract

Final drafts must follow these rules:

- Never invent a fact, event, feeling, quotation, objection, physical detail, credential, number, or outcome.
- Read every line aloud as an editorial test. Split or cut any line that causes a stumble, restart, or breath failure.
- Format one breath per line. Line breaks are pauses; em dashes are beats.
- Use contractions in English. Do not use parentheses, semicolons, or performative asides in either language.
- Remove throat-clearing, duplicate explanation, excess summary, and softened restatements.
- Preserve useful fragments, repetition, unusual word choices, constructions, rhythm, and uncomfortable admissions from the source.
- Replace abstraction only with physical detail from the writer's supplied life. Never introduce stock metaphors as substitutes.
- Quote an objection only when the writer supplied the actual words. Otherwise preserve it as a clearly unquoted paraphrase.
- Let nearby events imply cause and effect when the explanation adds no necessary meaning.
- Repeat the key phrase two or three times across the script when it improves listener recall.
- Exclude emojis, hashtags, engagement bait, announced-insight phrases, generic audience advice, and unclaimed authority or results.

The English `humanizer` and Chinese `shuorenhua` passes must preserve these constraints. Their output is audited and repaired if polishing adds facts, smooths away a useful edge, restores overwritten explanation, or breaks spoken formatting.

## Clip Line

Every finalized script contains one clip line around the two-thirds point. Prefer a line the writer already supplied but buried under explanation. If it must be built, use only approved source material.

The clip line must make the viewer feel accurately seen or self-aware rather than merely making the writer sound impressive. It stands without an immediate explanatory sentence after it.

## Ending System

Spend a dedicated revision pass on the ending. Reject an ending when it:

- could close an unrelated person's script unchanged;
- addresses an abstract `you`;
- ends on a maxim;
- explains a lesson already demonstrated;
- becomes stronger when its final line is deleted;
- resolves every tension.

Available ending modes:

1. **Story request — best for comments:** ask for a lived story, not an opinion. It is a sincere camera-facing question, never engagement bait.
2. **Named reader — best for shares:** identify one specific person in one specific situation and pair that recognition with real disclosure.
3. **Callback — best for cohesion:** answer the opening question honestly, including `I don't know`, and repeat the opening phrase when natural. The ending must still work without perfect viewer recall.
4. **Unapologized position:** let the writer stand somewhere without adding justification or a lesson.

Every ending is one or two breaths. It preserves the same facts, earned turn, and unresolved tension as the main script.

## Final Output Contract

For each requested language, output in this order:

1. A complete teleprompter script using the recommended ending.
2. An `Alternate endings` section with at least three additional endings, each labeled by its ending mode and optimization goal where applicable.
3. Sparse light delivery notes.

The main script's ending and the alternates must collectively use at least three of the four ending modes. The additional endings are genuine alternatives, not minor rewrites of one sentence.

In bilingual mode, each language receives its own naturally adapted complete script and alternate endings. Both languages preserve semantic parity in story facts, earned turn, unresolved tension, and ending intent without becoming line-by-line translations.

Only the complete script counts toward the 2.5-to-15-minute runtime. Alternate endings and delivery notes are excluded from runtime estimation.

## Behavioral Validation

Update the behavioral scenarios and rubric before changing the skill. Validate at least these observable behaviors in fresh contexts:

- an overwritten draft becomes breathable without losing the writer's verbal tics;
- no absent feeling, event, quotation, physical detail, credential, number, or outcome is invented;
- the story earns movement but leaves exactly one tension unresolved;
- the main script is followed by at least three labeled, materially different alternate endings;
- ending labels correctly distinguish story request, named reader, callback, and unapologized position;
- a source-grounded clip line appears near the two-thirds point and is not immediately explained;
- generic maxims, abstract audience address, announced-insight phrases, and engagement bait are absent;
- bilingual versions preserve semantic parity while remaining independently natural;
- runtime validation measures only each complete script.

Retain the existing package, dependency, research, language, safety, and runtime tests.

## Completion Criteria

- The new reference is routed and required before drafting or polishing.
- Every old instruction requiring total resolution is replaced or narrowed to the earned-turn contract.
- Behavioral tests demonstrate RED against the current skill and GREEN after revision.
- The public package and canonical local runtime copy match.
- The skill validator, package checks, runtime tests, and fresh-context behavioral checks pass.
- Final diff contains no unrelated behavioral, identity, installation, dependency, or packaging changes.
