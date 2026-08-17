# Optional external polishing

Offer this only after finalization and all internal integrity checks. Never send content automatically. Warn the user not to upload private or sensitive material unless comfortable sharing it with the third-party service.

Use Claude for English and DeepSeek for Simplified Chinese. In bilingual mode, provide both prompts separately. The external service returns a complete replacement script, not critique.

Humanizer and `shuorenhua` must run for their matching language branches before this optional handoff. Claude and DeepSeek do not replace those required internal polishing passes, runtime estimation, or source-fidelity audits.

## Claude copy-paste prompt

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

## DeepSeek copy-paste prompt

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
