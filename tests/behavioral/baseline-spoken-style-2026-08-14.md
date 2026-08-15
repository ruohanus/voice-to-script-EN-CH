# Spoken-style RED baseline — 2026-08-14

## Method

Three independent fresh-context agents used the pre-revision public skill and only the skill's then-current references required for finalization. They were not shown the behavioral scenarios, rubric, design, plan, or expected observations. Each agent received a supplied source and a finalization request. The runs covered an overwritten English source, a source without an exact quotation or physical detail, and bilingual finalization with ending alternatives and an independent runtime request.

The table grades only contracts that the supplied prompt could exercise; `not applicable` means the source did not contain the needed predicate.

| Scenario | Overwritten English source | No-detail English source | Bilingual endings/runtime source | Baseline evidence |
|---|---|---|---|---|
| 49. Breathable deletion pass | Partial | Not applicable | Partial | The overwritten run retains a long explanatory sentence: “That was true in the way a lot of technically true things are true.” It also keeps the repeated explanation rather than making a clear deletion pass. The bilingual run contains several multi-clause prose lines, including “A thought that arrives five minutes later may be accurate, but it may no longer change what happens next.” |
| 50. No invented embodiment or quotation | Not applicable | Pass | Not applicable | The no-detail run expressly keeps the objection indirect: “Her concern, as I understood it, was…” and repeats that no exact words or physical detail were recorded. It adds neither sensory embodiment nor a fabricated quotation. Retain this as a regression requirement. |
| 51. Earned turn with one unresolved tension | Fail | Partial | Partial | The overwritten run resolves its central tension into the lesson “Being easy to reach is not the same as making things easier for other people,” then closes with prescriptive advice. The no-detail and bilingual runs preserve future uncertainty, but both also add generalized viewer lessons, so the exactly-one-tension constraint is not reliably demonstrated. |
| 52. Main ending and labeled alternatives | Fail | Not applicable | Fail | The overwritten run has no alternatives. The bilingual run supplies three numbered alternatives in each language under “Alternate endings” / “备用结尾,” but none is labeled by ending mode or optimization goal and the main ending is not identified as recommended. |
| 53. Ending-mode integrity | Not applicable | Not applicable | Partial | The bilingual prompt did not supply the named-reader, callback, and unapologized-position predicates needed to grade all four modes. The produced alternatives are short, but their unnamed modes make their stated function and mode integrity unverifiable. |
| 54. Source-grounded clip line | Fail | Partial | Partial | The overwritten run's closest recognition line, “I was available, but we were not becoming more independent,” appears before the two-thirds point and is followed by further explanation. The other runs contain possible recognition lines but do not deliberately place a source-grounded clip line around two-thirds or remove its following explanation. |
| 55. Spoken-language prohibitions | Not applicable | Not applicable | Not applicable | None of the supplied sources intentionally included the complete prohibited-form set, so this baseline did not exercise it. |
| 56. Bilingual endings and runtime boundary | Not applicable | Not applicable | Fail | The bilingual response provides two complete scripts plus alternatives and delivery notes, but does not distinguish the runtime-bearing main scripts from the excluded material or report a deterministic runtime check. It also does not state an ending-mode intent for either language. Independent compliance is therefore ambiguous even though the prose appears plausibly within range. |

## Observed RED failures

- A fully resolved lesson displaced the source-supported future uncertainty in the overwritten English run.
- The old skill did not require labeled, mode-specific alternative endings: the bilingual run returned unlabeled numbered alternatives.
- The old skill offered no placement rule for a source-grounded clip line; the overwritten run's strongest line appeared too early and was followed by explanation.
- The old skill left bilingual runtime accounting ambiguous once alternates and delivery notes accompanied the two complete scripts.
- The overwritten and bilingual runs retained some overlong explanatory prose rather than consistently making a one-breath deletion pass.

## Preserved behavior

The no-detail run did not invent quoted dialogue, sensory detail, or a fabricated physical scene. The revised instructions must retain that source-grounded restraint.
