# Adaptive Discovery, Late Story Selection, and Story-Led Runtime

Date: 2026-08-17

## Objective

Revise `voice-to-script-en-ch` so it gathers rich, source-grounded storytelling material before proposing narrative angles. Make duration an explicit intake choice, use story-led rather than hard-gated runtime, allow high-value questions after angle selection, reopen angle selection only after material story changes, and provide an optional external-polish handoff after final delivery.

This revision must preserve the skill's existing source-fidelity, research, bilingual, spoken-style, clip-line, ending, humanization, and clean-output behavior except where this specification explicitly changes workflow timing, runtime policy, or post-output guidance.

## 1. Project opening and duration choice

At the start of each new script project, ask for the desired speaking duration unless the user already supplied it. Do not repeat the question on later voice passes within the same project.

Offer three paths:

- an exact duration;
- a rough duration range;
- `freestyle`, which skips duration selection and lets the story determine the result.

Explain the default clearly:

- If the user skips duration selection, aim for a preferred window of 2–15 minutes.
- The number and depth of discovery questions depend on the requested duration and the amount and quality of source material.
- Never pad a thin story to reach two minutes.
- A compact, complete story may be about 45 seconds.
- A story may exceed 15 minutes when its material genuinely warrants that length.
- Before drafting beyond 15 minutes, offer one longer video, a short series, or a narrower story, and recommend the option with the strongest narrative coherence.

When usable source material is already present, reflect it briefly before asking the duration question. The intake must not feel like a generic form.

## 2. Discovery before story-angle selection

Do not propose narrative angles in the first meaningful response merely because usable material exists. The initial discovery phase exists to collect as many meaningful, source-grounded storytelling materials and perspectives as practical.

Ask adaptive batches of 4–6 questions. Every question must have a plausible narrative payoff, such as uncovering:

- a concrete event, moment, action, object, or sensory detail;
- an exact quotation when the user genuinely remembers the wording;
- an emotional shift, contradiction, uncomfortable admission, or unusual perspective;
- a meaningful objection, conflict, stake, decision, or consequence;
- a changed interpretation, earned turn, or unresolved question;
- material needed to support the requested duration without padding.

With every batch, tell the user they may answer any questions that spark something, skip any or all questions, or continue speaking freestyle. Do not require a questionnaire-style response.

Merge every new pass into the existing source ledger. Do not restart discovery or discard still-valid material.

At any discovery stage, `draft now`, `finalize now`, or an equivalent instruction waives optional questioning and angle comparison. If duration has not yet been supplied, ask the user to choose an exact duration, a rough range, or freestyle before drafting. Then select the strongest supportable angle from the available material and produce the shortest honest result the source can sustain; never invent or pad to compensate for skipped discovery.

## 3. Readiness gate for story-angle selection

Show the story-selection proposal checkpoint only when the best-supported story has all five of these ingredients:

1. a compelling central question;
2. at least one concrete moment or event;
3. a meaningful conflict with recognizable stakes;
4. an earned change, decision, realization, or position;
5. enough source-grounded material for the intended duration, or enough for an honestly shorter complete script.

If the readiness gate fails, continue discovery instead of offering generic or speculative angles. Name the most valuable remaining gaps through the next 4–6 questions.

The checkpoint occurs after discovery is substantially complete but before a polished draft is written.

## 4. Story-angle proposal

At the checkpoint, present three choices:

- **Best-supported angle:** ready to draft from the current material.
- **Promising alternative 1:** narratively meaningful but dependent on identified additional material.
- **Promising alternative 2:** narratively meaningful but dependent on identified additional material.

Do not call the alternatives `weaker` in the user-facing response. For each promising alternative, identify exactly what is missing, such as a concrete scene, real objection, personal stakes, changed interpretation, decision, or unresolved tension.

For every proposed angle, concisely show:

- question hook;
- audience promise or viewer tension;
- central conflict and stakes;
- likely causal progression;
- earned turn;
- one unresolved tension;
- likely ending effect;
- expected duration based on current material;
- any additional material required.

Recommend the best-supported angle and explain why. The user may select an angle, delegate the choice, continue speaking, or ask to draft immediately.

If the user selects a promising alternative, make the next question batch specifically target that alternative's named gaps.

## 5. Post-selection strengthening pass

After any angle is selected, always offer one optional batch of 4–6 tailored strengthening questions before drafting. Briefly state what the batch could improve, such as the opening moment, conflict, stakes, honest admission, turning point, clip line, or ending.

The user may answer selectively, continue freestyle, skip the batch, or say `draft now`. Skipping waives optional discovery only; it never waives truthfulness or source integrity.

Stop questioning when further answers would add detail but not meaning. Do not delay drafting to collect material with no clear narrative payoff.

## 6. Adaptive angle reopening

Treat a selected angle as adaptively reopenable, not permanently locked. Incorporate minor additions without another checkpoint.

Re-propose story angles only when new material materially changes at least one of these:

- the story's central meaning;
- the strongest conflict or stakes;
- the audience promise;
- the user's actual position;
- which angle is best supported.

When the threshold is crossed, briefly explain that the new material changes the strongest story angle, then present a refreshed set of three choices under the same proposal contract. The refreshed angles may be completely new. Re-proposal is exceptional rather than routine.

## 7. Story-led runtime policy

Replace the existing hard 2.5–15-minute gate with a preferred 2–15-minute window.

- Treat 2–15 minutes as ideal, not mandatory.
- Permit scripts under two minutes when the story is stronger at that length.
- Treat approximately 45 seconds as an acceptable compact result, not a mandatory lower boundary.
- Permit scripts over 15 minutes after the user chooses among one longer video, a short series, or a narrower story.
- Continue honoring an explicit user duration as the target, while warning when the source material cannot support it honestly.
- Never add generic repetition, invented detail, or unnecessary explanation to hit a duration.
- Never remove essential meaning solely to remain under 15 minutes.

If the requested duration is unsupported, explain that before drafting and offer more discovery questions, an honestly shorter script, additional freestyle input, or a narrower angle.

Update the runtime estimator and its consuming workflow so results distinguish preferred-range status from validity. A script outside 2–15 minutes must not be rejected solely for its duration when it follows the story-led policy and any required over-15 choice has been made.

## 8. Drafting and finalization

After the selected angle's strengthening pass is completed or skipped, proceed through the existing evidence, approved-story-contract, bilingual drafting, Humanizer, `shuorenhua`, integrity, parity, clip-line, ending, and spoken-delivery workflow.

Preserve these existing contracts:

- never invent facts, events, emotions, quotations, evidence, or certainty;
- generate English and Simplified Chinese independently from one approved story contract;
- retain indirect speech as indirect speech;
- preserve the central conflict, earned turn, and exactly one unresolved tension;
- keep one-breath-per-line formatting and the clip-line successor rule;
- return one recommended ending plus at least three labeled alternatives per requested language;
- return the finalized teleprompter content without exposing internal workbench or audit material.

The approved story contract must record the chosen or inferred target duration and whether the result is inside, below, or above the preferred range.

## 9. Optional external-polish handoff

After the finalized scripts and light delivery notes, recommend an optional third-party polishing pass:

- Claude for English;
- DeepSeek for Simplified Chinese;
- both prompts separately for bilingual output.

Warn the user not to upload private or sensitive material unless they are comfortable sharing it with that external service.

The handoff asks for a complete replacement script rather than critique. It may improve attention, curiosity, spoken rhythm, transitions, clarity, emotional precision, and retention, but it must lock the source content and approved narrative decisions.

### Claude copy-paste prompt

```text
Polish the English talking-head video script below for stronger viewer attention and natural spoken delivery.

Return a complete replacement script, not a critique.

You may improve:
- the hook's immediacy;
- curiosity and forward momentum;
- spoken rhythm and breathability;
- transitions between beats;
- clarity, concision, and emotional precision;
- the placement and impact of existing tension;
- viewer retention without using engagement bait.

You must preserve:
- every fact, event, experience, attribution, and degree of certainty;
- the meaning and chronological logic of the story;
- the writer's point of view, uncomfortable admissions, unusual phrasing, and useful repetition;
- direct quotations exactly as supplied;
- indirect speech as indirect speech;
- the central conflict, earned turn, and exactly one unresolved tension;
- the clip line and the concrete action or event immediately following it;
- the recommended ending mode and all labeled alternate endings;
- the approximate speaking length and one-breath-per-line formatting.

Do not add credentials, outcomes, emotions, scenes, dialogue, research, statistics, advice, metaphors, or conclusions that are not already present.

Do not make the writer sound more certain, inspirational, polished, or universally relatable than the source supports.

Avoid generic creator language, announced insights, engagement bait, emojis, hashtags, parentheses, and semicolons.

Keep the final word count within 10% of the supplied script.

Return only the complete revised teleprompter script, its labeled endings, and the light delivery notes.

SCRIPT:
[PASTE ENGLISH SCRIPT HERE]
```

### DeepSeek copy-paste prompt

```text
请润色下面这份中文口播视频稿，让它更能抓住观众注意力，也更像一个真实的人自然说出来的话。

请直接返回一份完整的替换稿，不要返回点评、分析或修改说明。

你可以优化：
- 开头进入主题的速度和吸引力；
- 好奇心、悬念和叙事推进感；
- 中文口语节奏、停顿和呼吸感；
- 故事节点之间的衔接；
- 表达的清晰度、简洁度和情绪准确度；
- 已有冲突和张力的呈现；
- 观众留存，但不能使用互动诱导。

你必须保留：
- 所有事实、事件、经历、归因和不确定程度；
- 故事的原意、时间顺序和因果逻辑；
- 作者本人的立场、不舒服但真实的坦白、独特措辞和有效重复；
- 原文明确提供的直接引语；
- 原本属于转述的话必须继续使用转述，不能改造成直接对话；
- 核心冲突、真实发生的转变，以及唯一一个仍未解决的张力；
- 可截取传播的核心句，以及紧接在它后面的具体行动或事件；
- 推荐结尾的类型和所有已标注的备选结尾；
- 大致口播时长和一行一口气的排版。

不要添加原稿中不存在的履历、结果、情绪、场景、对话、研究、数据、建议、比喻或结论。

不要让作者显得比原稿更确定、更励志、更精致，或刻意迎合所有人。

避免模板化表达、自我宣布观点、互动诱导、表情符号、话题标签、括号和分号。

修改后的篇幅应控制在原稿的上下 10% 以内。

只返回完整润色后的口播稿、已标注的结尾选项和简短表达提示。

原稿：
[在这里粘贴中文稿]
```

The handoff remains optional and occurs only after the skill's own final integrity checks. Place it after the finalized script and light delivery notes as a clearly separate optional next step. It does not replace Humanizer, `shuorenhua`, runtime estimation, or source-fidelity audits.

## 10. Validation contract

Update deterministic and behavioral coverage to verify:

1. A new project asks for duration unless the user already supplied it.
2. The opening explains freestyle and the story-led preferred window.
3. Discovery questions arrive in tailored batches of 4–6.
4. Story angles remain hidden until the five-part readiness gate passes.
5. The checkpoint contains one best-supported angle and two promising alternatives with named material gaps.
6. Selecting a promising alternative produces questions targeted at its gaps.
7. Every selection receives an optional post-selection strengthening offer.
8. Minor additions do not trigger re-selection.
9. Material story changes do trigger revised angles.
10. Sub-two-minute scripts are allowed without padding.
11. Over-15-minute scripts trigger the required three-way choice before drafting.
12. Runtime output distinguishes preferred-range status from hard validity.
13. English, Chinese, and bilingual final outputs include the appropriate optional external-polish prompt or prompts and privacy warning.
14. Existing source-integrity, bilingual, spoken-style, clip-line, ending, and clean-output behaviors do not regress.

Use fresh-context forward tests with raw inputs when validating the generative workflow. Commit reproducible prompts and representative outputs when they are used as release evidence.

## Out of scope

- Changing the skill's public identity, repository name, installation method, or distribution packaging.
- Replacing Humanizer or `shuorenhua` with Claude or DeepSeek.
- Automatically sending user material to any third-party model.
- Adding API integrations for Claude or DeepSeek.
- Changing evidence-source selection or research approval behavior.
