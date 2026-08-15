# Behavioral scenarios

Each numbered case is a fresh-context test. Give the agent only the relevant input block and the runtime skill, never this file's expected-observation text.

## Shared rich source packet

Use this packet where a case says “use the rich packet”:

> For six weeks I kept moving a proposal to tomorrow while attending eleven recurring meetings. One Tuesday I opened the proposal, lost my thread after answering a “two-minute” message, and spent twenty minutes reconstructing the argument. I cancelled two meetings for a month, explained the experiment to my team, and created one office-hour block. The first quiet afternoon felt exposed rather than peaceful because nobody needed an immediate answer. After about forty uncomfortable minutes, I found the argument and completed the outline and two hard sections. I realized meetings gave me immediate evidence that I belonged, while the proposal brought uncertainty and delayed feedback. The intended audience is people who mistake constant availability for useful contribution. The approved resolution is not “meetings are bad”; it is that availability and contribution are different. The practical ending is a one-week experiment: protect one meaningful block, move quick questions into an office-hour window, and notice both what gets completed and what discomfort appears.

### 1. First capture with unspecified audience and language

Input: “I cancelled two meetings and finally finished a proposal I had avoided for six weeks. I liked feeling needed in those meetings. Help me develop this into a talking-head video.”

Observe: one efficient first response contains the complete discovery workbench plus two or three selectable directions; it infers a plausible audience or asks only if ambiguity would materially change the story; bilingual is recorded as the default.

### 2. First-turn finalize now

Input: “Finalize this now as a talking-head video,” followed by the rich packet, with no prior narrative authorization.

Observe: “finalize now” skips optional enrichment but not narrative authorization; the agent offers directions unless the user also delegated the choice.

### 3. User delegates narrative choice

Input: “Use the rich packet. You choose the best direction and finalize.”

Observe: the agent selects its recommended direction without another approval turn, forms the story contract, and proceeds subject to evidence/runtime/dependency gates.

### 4. Explicit English-only

Input: “Use the approved rich packet and direction. Finalize in English only.”

Observe: only the English teleprompter script and light English delivery notes appear.

### 5. Explicit Simplified-Chinese-only

Input: “Use the approved rich packet and direction. Finalize in Simplified Chinese only.”

Observe: the agent creates Chinese directly from the story contract, with no English script or English-first framing.

### 6. Default bilingual

Input: “Use the approved rich packet and direction. Finalize.”

Observe: English and Simplified Chinese are independently generated from one story contract and returned in the specified order.

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

Observe: both scripts preserve the same facts, claim strength, evidence, conflict, resolution, and viewer effect while allowing different rhetoric and cadence.

### 11. Non-mainland Chinese audience

Input: “Simplified Chinese for Chinese-speaking viewers in Malaysia.”

Observe: Simplified Chinese does not trigger mainland-specific assumptions, examples, or vocabulary without user support.

### 12. Unrelated audiences and domains

Input variants: a new parent discussing sleep routines; a ceramic artist explaining glaze failure; a retiree learning piano; a community gardener recruiting volunteers.

Observe: no work, productivity, founder, career-change, or ADHD default leaks into any response.

### 13. Requested runtime below 2.5 minutes

Input: “Make it a 90-second talking-head video.”

Observe: the agent explains the skill's 2.5-minute minimum and asks whether to use that minimum; it does not silently violate the hard boundary.

### 14. Requested runtime above 15 minutes

Input: “Make this an 18-minute video.”

Observe: the agent narrows or proposes a series; it never returns an over-15-minute script.

### 15. Insufficient source material

Input: “Finalize three minutes: I walked yesterday and felt less stuck.”

Observe: the agent requests the minimum missing material instead of padding or inventing.

### 16. Excess material with multiple lessons

Input: “My read-through is 22 minutes with eight different lessons and examples.”

Observe: the agent proposes a narrower central question or series rather than flattening or exceeding 15 minutes.

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

Input: English scripts at 374, 375, 2,250, and 2,251 words.

Observe: the estimator consistently classifies the exact 150-WPM boundaries, followed by a spoken-cadence sanity check.

### 38. Reproducible Simplified-Chinese runtime

Input: Chinese scripts at 599, 600, 3,600, and 3,601 Han characters.

Observe: the estimator consistently classifies the exact 240-character-per-minute boundaries, followed by a spoken-cadence sanity check.

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

Input: a reference transcript with a question hook, two reversals, and a quiet resolution.

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

Observe: the agent proceeds without re-asking audience, direction, evidence, language, or optional voice-pass questions; only hard blockers can stop finalization.
