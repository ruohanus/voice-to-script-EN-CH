# Behavioral scenarios

Each numbered case is a fresh-context test. Give the agent only the relevant input block and the runtime skill, never this file's expected-observation text.

## Shared rich source packet

Use this packet where a case says “use the rich packet”:

> For six weeks I kept moving a proposal to tomorrow while attending eleven recurring meetings. One Tuesday I opened the proposal, lost my thread after answering a “two-minute” message, and spent twenty minutes reconstructing the argument. I cancelled two meetings for a month, explained the experiment to my team, and created one office-hour block. The first quiet afternoon felt exposed rather than peaceful because nobody needed an immediate answer. After about forty uncomfortable minutes, I found the argument and completed the outline and two hard sections. I realized meetings gave me immediate evidence that I belonged, while the proposal brought uncertainty and delayed feedback. The intended audience is people who mistake constant availability for useful contribution. The approved earned turn is not “meetings are bad”; it is choosing a one-week experiment after recognizing that availability and contribution are different. The one unresolved tension is whether I can protect meaningful work without abandoning someone who genuinely needs an immediate answer. The supported next action is to protect one meaningful block, move quick questions into an office-hour window, and notice both what gets completed and what discomfort appears.

### 1. First capture with unspecified audience and language

Input: “I cancelled two meetings and finally finished a proposal I had avoided for six weeks. I liked feeling needed in those meetings. Help me develop this into a talking-head video.”

Observe: one efficient first response briefly reflects the supplied material, asks once for an exact duration, a rough range, or `freestyle`, then continues with 4–6 source-grounded discovery questions because the material is not ready for angle selection; it does not offer story angles yet. It infers a plausible audience or asks only if ambiguity would materially change the story; bilingual is recorded as the default.

### 2. First-turn finalize now

Input: “Finalize this now as a talking-head video,” followed by the rich packet, with no prior narrative authorization.

Observe: if duration is absent, `finalize now` asks only for an exact duration, a rough range, or `freestyle`; after that choice it skips optional discovery and angle comparison, selects the strongest supportable story from the available material, and drafts without invention or padding.

### 3. User delegates narrative choice

Input: “Use the rich packet. You choose the best direction and finalize.”

Observe: the agent selects its recommended direction without another approval turn, forms the story contract, and proceeds subject to evidence/runtime/dependency gates.

### 4. Explicit English-only

Input: “Use the approved rich packet and direction. Finalize in English only.”

Observe: only the English complete teleprompter body, visible recommended ending and conclusion, exactly three labeled alternate endings, three TikTok options, three Instagram cover/caption packages, and light English delivery notes appear.

### 5. Explicit Simplified-Chinese-only

Input: “Use the approved rich packet and direction. Finalize in Simplified Chinese only.”

Observe: the agent creates the Chinese complete body, visible recommended ending and conclusion, exactly three labeled alternate endings, three Xiaohongshu note-title/cover-phrase packages, and light notes directly from the story contract, with no English script or English-first framing.

### 6. Default bilingual

Input: “Use the approved rich packet and direction. Finalize.”

Observe: English and Simplified Chinese are independently generated from one story contract; each language has the complete body, visible recommended ending and conclusion, exactly three labeled alternate endings, its platform-specific title packages, then light notes.

### 7. Mid-session language change

Input: after approving English-only, “Actually, make the final bilingual.”

Observe: language mode changes without reopening approved story/evidence decisions.

### 8. Chinese source to Chinese script

Input: a Chinese transcript plus “只要简体中文成稿”.

Observe: no English intermediary is generated or used as the canonical version.

### 9. English source to natural Chinese adaptation

Input: the rich English packet plus “只要简体中文，写给新加坡的中文职场观众”.

Observe: the result is natural spoken Chinese for the stated audience, not a literal translation or mainland-China assumption.

### 10. Bilingual parity

Input: the approved rich packet in bilingual mode.

Observe: both scripts preserve the same facts, claim strength, evidence, conflict, earned turn, exactly one unresolved tension, speech status, ending-mode intent, and viewer effect while allowing different rhetoric and cadence.

### 11. Non-mainland Chinese audience

Input: “Simplified Chinese for Chinese-speaking viewers in Malaysia.”

Observe: Simplified Chinese does not trigger mainland-specific assumptions, examples, or vocabulary without user support.

### 12. Unrelated audiences and domains

Input variants: a new parent discussing sleep routines; a ceramic artist explaining glaze failure; a retiree learning piano; a community gardener recruiting volunteers.

Observe: no work, productivity, founder, career-change, or ADHD default leaks into any response.

### 13. Requested runtime below preferred window

Input: “Make it a 90-second talking-head video.”

Observe: the agent accepts 90 seconds as an explicit target below the preferred window, does not impose a two-minute minimum, and continues intake or discovery for the strongest honest compact story; if the material cannot honestly support 90 seconds, it warns rather than padding.

### 14. Requested runtime above 15 minutes

Input: “Make this an 18-minute video.”

Observe: before drafting, the agent offers one longer video, a short series, or a narrower story, recommends the most coherent option, and may proceed with an over-15 result only if the user chooses the longer-video scope.

### 15. Insufficient source material

Input: “Finalize three minutes: I walked yesterday and felt less stuck.”

Observe: before drafting, the agent warns that the explicit three-minute target is unsupported and offers more discovery, an honestly shorter script, additional freestyle material, or a narrower angle instead of padding or inventing.

### 16. Excess material with multiple lessons

Input: “My read-through is 22 minutes with eight different lessons and examples.”

Observe: the agent offers one longer video, a short series, or a narrower central question, recommends the strongest narrative shape, and does not flatten essential meaning merely to force the material under 15 minutes.

### 17. Personal story requiring no research

Input: “I went to a neighborhood event while nervous, spoke to one person, and learned that action came before confidence for me.”

Observe: no research occurs merely because a psychological interpretation is possible.

### 18. Mixed personal, factual, and high-stakes claims

Input: personal burnout story containing claims about sleep, depression, and workplace prevalence.

Observe: the internal inventory separates personal experience, ordinary factual claims, and high-stakes claims; only material claims are researched and offered for approval.

### 19. Health claim framed as personal experience

Input: “My ADHD makes every interruption destroy twenty minutes of focus.”

Observe: the experience is preserved as personal, but the universal/quantified implication is not treated as established fact without strong evidence.

### 20. Strong source versus weak popular source

Input: candidate systematic review and a popular blog both support a related claim.

Observe: source quality and directness govern the recommendation; popularity does not outrank stronger evidence.

### 21. Conflicting evidence

Input: credible studies reach different conclusions.

Observe: the menu represents disagreement and any integration line preserves uncertainty.

### 22. Established but outdated framework

Input: a familiar framework with newer evidence challenging its use.

Observe: “established” does not override evidence quality, age, correction, or supersession checks.

### 23. Fake citation

Input: user supplies a plausible but nonexistent paper title.

Observe: the source is verified before being offered; no fabricated URL, author, or publication detail appears.

### 24. Real source that does not support the claim

Input: a real paper whose title sounds relevant but whose findings concern a different population and outcome.

Observe: source-to-claim verification rejects or narrows the proposed integration.

### 25. Approved evidence with requested overstatement

Input: “Use study #1 and say it proves my method works for everyone.”

Observe: approval does not authorize stronger causality, population scope, or certainty than the source supports.

### 26. User rejects all evidence

Input: “No evidence. Keep it personal.”

Observe: the agent omits optional external claims and continues without another evidence approval turn.

### 27. No research capability

Input: a claim that benefits from research in an environment with no reliable web/research tool.

Observe: the agent omits a nonessential claim or asks whether to continue without it; it never invents support.

### 28. Agent-Reach absent, another research tool available

Input: a research-worthy claim where web search exists but Agent-Reach does not.

Observe: the strongest available reliable research capability is used; the semantic workflow does not block on Agent-Reach.

### 29. Humanizer missing

Input: English finalization with no Humanizer skill installed.

Observe: a concise missing-dependency message and current installation guidance; no claim that generic cleanup was Humanizer.

### 30. Shuorenhua missing

Input: Simplified-Chinese finalization with no Shuorenhua skill installed.

Observe: a concise missing-dependency message and current installation guidance; no unpolished substitute presented as complete.

### 31. Both polishing dependencies missing

Input: default bilingual finalization with neither dependency installed.

Observe: both missing dependencies are identified in one response without unnecessary serial turns.

### 32. Dependency version drift

Input: installed dependency behavior differs from documented embedded-output assumptions.

Observe: the host workflow still suppresses dependency diagnostics and performs its own fidelity/output-cleanliness checks.

### 33. Humanizer invocation trace

Input: English finalization in a trace-capable host.

Observe: the execution trace shows Humanizer was actually loaded/invoked before the final script; prose self-report alone does not pass.

### 34. Shuorenhua invocation trace

Input: Simplified-Chinese finalization in a trace-capable host.

Observe: the execution trace shows Shuorenhua was actually loaded/invoked before the final script; prose self-report alone does not pass.

### 35. No internal diagnostic leakage

Input: bilingual finalization after research and both polishing passes.

Observe: no draft, critique, research log, source-selection reasoning, word count, runtime calculation, or polishing report appears.

### 36. Delivery-note scope

Input: finalized script with one pronunciation issue and one useful visual source cue.

Observe: notes contain only pause, emphasis, pronunciation, optional visual/source cue, or one concise performance suggestion.

### 37. Reproducible English runtime

Input: English scripts at 299, 300, 2,250, and 2,251 words.

Observe: the estimator classifies 299 words as `below_preferred`, 300 and 2,250 as `within_preferred`, and 2,251 as `above_preferred` for the complete body plus recommended conclusion. The editorial heading, alternates, and notes are excluded, followed by a spoken-cadence sanity check. A result outside the preferred 2–15-minute window is not invalid solely because of duration.

### 38. Reproducible Simplified-Chinese runtime

Input: Chinese scripts at 479, 480, 3,600, and 3,601 Han characters.

Observe: the estimator classifies 479 Han characters as `below_preferred`, 480 and 3,600 as `within_preferred`, and 3,601 as `above_preferred` for the complete body plus recommended conclusion. The editorial heading, alternates, and notes are excluded, followed by a spoken-cadence sanity check. A result outside the preferred 2–15-minute window is not invalid solely because of duration.

### 39. Audio transcription unavailable

Input: attached audio in a host without transcription capability.

Observe: the agent asks for a transcript or authorized transcription route and does not hallucinate content.

### 40. Garbled transcription

Input: transcript with several low-confidence or inaudible passages.

Observe: uncertainty is marked and unresolved words are not invented.

### 41. User rejects all narrative directions

Input: “None of these directions work.”

Observe: the agent returns to the material bank and proposes materially new directions rather than merging rejected ones.

### 42. Audience changes after direction selection

Input: after selecting a direction for managers, “The actual audience is first-year university students.”

Observe: only audience-dependent parts of the direction/story contract are reopened; approved facts remain stable.

### 43. Unauthorized composite story

Input: “Make it relatable” without authorizing invented client/team/composite details.

Observe: no composite anecdote, quotation, vulnerability, or result is invented.

### 44. Reference-transcript structural adaptation

Input: a reference transcript with a question hook, two reversals, an earned turn, and one lingering question.

Observe: a temporary structural fingerprint is created; distinctive phrases, anecdotes, and signature expressions are not copied.

### 45. Named living creator imitation

Input: “Make me sound exactly like [living creator].”

Observe: the response abstracts the request into high-level craft properties and does not imitate distinctive voice or phrasing.

### 46. Positive triggers

Input variants: voice note to talking-head script; transcript to teleprompter script; ramble to reflective video; recording to bilingual video script.

Observe: the skill activates for all variants.

### 47. Negative triggers

Input variants: summarize this report; edit this article; write a LinkedIn post from bullet points; translate this contract.

Observe: the talking-head workflow does not activate when the user did not request spoken-material development into a video script.

### 48. User-turn friction regression

Input: rich material, explicit audience, “you choose,” “no evidence,” bilingual default, and finalize request in one turn.

Observe: the agent proceeds without re-asking audience, direction, evidence, language, or optional voice-pass questions. If duration is absent, it asks only once for an exact duration, rough range, or freestyle; an unsupported explicit target or an unresolved over-15 scope choice is the only additional pre-draft stop. Runtime is measured on the complete body plus recommended conclusion and reported descriptively rather than treated as hard validity.

### 49. Breathable deletion pass

Source contains overwritten explanations and long sentences.
Observe: the result cuts redundant explanation, uses one-breath lines and purposeful fragments, and preserves distinctive source phrasing.

### 50. No invented embodiment or quotation

Source contains an abstract feeling and a paraphrased objection but no physical detail or exact quote.
Observe: the result invents neither sensory detail nor quoted dialogue and keeps the objection unquoted.

### 51. Earned turn with one unresolved tension

Source supports a decision but not certainty about its future result.
Observe: the complete script earns the decision and leaves exactly that future uncertainty unresolved rather than adding a lesson.

### 52. Main ending and labeled alternatives

Approved English finalization with enough material for several ending approaches.
Observe: one complete script uses a recommended ending and is followed by three materially different alternatives labeled by intended viewer aftereffect rather than promised platform performance.

### 53. Ending-mode integrity

Source supports a story invitation, callback with new meaning, open decision, concrete final image, unapologized position, and next real move.
Observe: the selected endings perform their named functions, remain one or two breaths, avoid a generic maxim, and preserve the same facts. The complete story retains exactly one unresolved tension, but an alternate may embody it without restating it.

### 54. Source-grounded clip line

Source contains one strong self-recognition line buried beneath explanation.
Observe: the line appears around the two-thirds point, the explanation after it is removed, and the line identifies the viewer rather than merely flattering the writer.

### 55. Spoken-language prohibitions

Source includes throat-clearing, parentheses, semicolons, asides, announced-insight phrases, and engagement bait.
Observe: final scripts remove those forms while preserving useful repetition, discomfort, and source rhythm.

### 56. Bilingual endings and runtime boundary

Bilingual finalization with alternates long enough to push the combined deliverable over the limit.
Observe: The runtime-bearing script is the frozen complete body plus recommended conclusion. Each language records its exact `measured_preferred_status` only after integrity and parity repairs are complete; any later edit invalidates measurement and requires the audits and estimator to rerun. A result outside the preferred 2–15-minute window is not invalid solely because of duration. The editorial recommended-ending heading, alternates, notes, and handoff are excluded; both languages preserve speech status, the earned turn, unresolved tension, and ending-mode intent without literal translation.

### 57. Duration intake or supplied-duration recognition

Input variants: a new project with no duration; a new project that already requests 90 seconds.
Observe: the first variant asks once for exact duration, rough range, or freestyle; the second accepts 90 seconds without asking again; later passes in either project do not repeat the duration intake.

### 58. Freestyle and story-led window explanation

Input: a new project with usable material but no duration.
Observe: the response explains that freestyle is allowed, 2–15 minutes is preferred rather than mandatory, questioning scales with material quality and intended length, a strong compact story may be about 45 seconds, and the story will not be padded.

### 59. Tailored discovery batch

Input: thin source material with one concrete event but unclear conflict, stakes, and change.
Observe: the response asks 4–6 source-specific questions with plausible narrative payoff and explicitly permits selective answers, skipping, or continued freestyle; it does not present story angles.

### 60. Readiness gate withholds premature angles

Input: material lacking a meaningful conflict, recognizable stakes, and earned change.
Observe: the response continues discovery and does not propose narrative directions merely because usable material exists.

### 61. Late story-selection checkpoint

Input: material containing a central question, concrete event, meaningful conflict and stakes, earned change, and enough material for an honest target-length story.
Observe: only now does the response present the story-selection checkpoint, before writing a polished draft.

### 62. Best-supported and developmental alternatives

Input: one draft-ready angle plus two plausible but under-supported perspectives.
Observe: the checkpoint labels one angle best-supported and ready, presents two promising alternatives without calling them weaker, and names the exact additional material each alternative needs.

### 63. Developmental-angle gap questions

Input: the user selects one promising alternative from scenario 62.
Observe: the next 4–6 questions target that alternative's named gaps rather than reverting to generic discovery. If the user then says `draft now`, the skill drafts that authorized developmental angle from available source material rather than switching back to the best-supported angle.

### 64. Optional post-selection strengthening pass

Input: the user selects the best-supported angle.
Observe: the response offers one optional 4–6-question strengthening batch, states what it could improve, and allows selective answers, freestyle, skipping, or `draft now`.

### 65. Minor additions preserve the selected angle

Input: after selection, the user adds a useful detail that strengthens a beat without changing meaning, conflict, audience promise, position, or angle support.
Observe: the detail is merged without another angle checkpoint or another strengthening offer for the same angle revision; answering selectively or skipping the offered pass proceeds to drafting unless the new material crosses the material-change reopening threshold.

### 66. Material change reopens angle selection

Input: after selection, the user adds material that changes the central meaning, strongest conflict, audience promise, position, or best-supported angle.
Observe: the response briefly explains the shift and presents a refreshed set of three angles, which may be completely new. Selecting an angle from that refreshed checkpoint receives one new tailored strengthening offer for the new angle revision.

### 67. Immediate-draft override remains honest

Input: thin material plus `finalize now`, with no duration supplied.
Observe: the response asks only for exact duration, rough range, or freestyle; if the user answers `freestyle`, it does not repeat intake, skips optional discovery and angle comparison, chooses the strongest supportable story, and neither invents nor pads. If an angle had already been selected, the same override would preserve that authorized angle.

### 68. Sub-two-minute story is allowed

Input: source material supports a compelling 45-to-90-second story but not an interesting two-minute story.
Observe: the skill delivers the shorter complete story, reports it as below the preferred range without treating it as invalid, and does not pad it.

### 69. Above-15-minute choice

Input: source material and requested scope genuinely require more than 15 minutes.
Observe: before drafting, the response offers one longer video, a short series, or a narrower story and recommends the option with the strongest narrative coherence.

### 70. Optional external-polish handoff

Input: completed bilingual finalization.
Observe: after each finalized script and light notes, the response gives a privacy-aware optional handoff: Claude for English and DeepSeek for Simplified Chinese. Each copy-paste prompt requests both `Same Story, Better Delivery` and `Same Material, Stronger Storytelling` by default, includes a compact source-truth record, keeps the first version's major beat order and ending concepts, allows the second to restructure presentation and endings, prohibits invention in both, and follows the authorized runtime without padding.

### 71. Ending palette and aftereffect labels

Input: source material that can support several of the six approved ending approaches.
Observe: the agent considers story invitation, callback with new meaning, open decision, concrete final image, unapologized position, and next real move; it recommends the best story fit and labels three alternatives by intended viewer aftereffect without claiming one is best for comments or shares.

### 72. Implicit unresolved tension in alternate endings

Input: the complete story has one clear unresolved career decision, while a concrete final image can preserve that tension without naming it.
Observe: the main script retains exactly one unresolved tension. The concrete-image alternate neither resolves nor contradicts it and is accepted without mechanically restating the decision.

### 73. English platform title packages

Input: completed English talking-head narrative.
Observe: after the ending alternatives, the output contains three TikTok opening-title options and three Instagram packages, each with a cover headline and caption opening line. The options use distinct truthful emotional entry points, match the script, and contain no invented drama, generic inspiration, forced emoji, hashtag, or platform cliché.

### 74. Simplified Chinese and bilingual title adaptation

Input variants: completed Chinese-only narrative; completed bilingual narrative.
Observe: every Chinese version has three Xiaohongshu packages, each containing a concise `笔记标题` and shorter `封面短句`. In bilingual mode the Chinese titles are independently adapted rather than literal translations of the English TikTok or Instagram options.

### 75. Two external versions have different permissions

Input: an English final script with a stable beat order and four ending choices.
Observe: Claude is asked for both versions by default. `Same Story, Better Delivery` may freely rewrite spoken language but preserves story content, event order, major beat order, and ending concepts. `Same Material, Stronger Storytelling` may change presentation order, reveal timing, tempo, hook, emotional progression, clip-line placement, and ending strategy while preserving source truth and real event chronology.

### 76. External versions receive matching title sets

Input: optional English and Chinese handoffs whose structurally reworked versions use different hooks from the internal final drafts.
Observe: each of the two Claude versions receives its own three TikTok options and three Instagram cover/caption packages; each of the two DeepSeek versions receives its own three Xiaohongshu note-title/cover-phrase packages. Titles match the version they accompany, and the models return no critique, scoring, change summary, article, or essay.

### 77. Ending breath limit survives mechanical splitting

Input: a Simplified Chinese ending whose first draft needs more than two displayed lines after applying the 28-Han-character ceiling.
Observe: the ending is cut and recomposed from approved material until it occupies no more than two displayed spoken lines. The mechanical line audit never creates or leaves a third ending line.
