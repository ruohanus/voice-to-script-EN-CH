# Optional external rewriting

Offer this only after finalization and all internal integrity checks. Never send content automatically. Warn the user not to upload private or sensitive material unless comfortable sharing it with the third-party service.

Use Claude for English and DeepSeek for Simplified Chinese. In bilingual mode, provide both prompts separately. Humanizer and `shuorenhua` must run for their matching language branches before this optional handoff. Claude and DeepSeek do not replace those required internal polishing passes, runtime estimation, or source-fidelity audits.

Request both versions by default:

1. `Same Story, Better Delivery`
2. `Same Material, Stronger Storytelling`

The external service returns two complete teleprompter scripts, not a critique.

## Build the handoff payload

Before rendering a prompt, build a compact source-truth record from the approved story contract. Include only what the external model needs to avoid invention:

- intended audience and authorized runtime;
- approved events and their real chronology;
- feelings, motives, and interpretations the writer explicitly supplied;
- exact quotations, indirect speech, and uncertain recollections with their speech status preserved;
- approved evidence and qualification boundaries;
- central conflict, earned movement, and exactly one unresolved tension; and
- details that must not be inferred or strengthened.

Insert that compact record into the matching prompt. This is a user-visible safety boundary, not permission to expose the full source ledger, research trace, or internal workbench.

In the normal final response, render each complete prompt once with its documented script placeholder intact. Immediately before the fenced block, tell the user to replace that placeholder with the finalized matching-language section above, from the teleprompter body through light delivery notes. Do not duplicate the script inside the prompt block, do not embed the other language, and do not include the optional handoff recursively. If the user explicitly asks for a fully substituted ready-to-send prompt, replace the placeholder with that exact matching-language payload once and omit any second copy of the same payload from the handoff.

## Claude copy-paste prompt

```text
Rewrite the English narrative below as two complete alternatives for a talking-head video.

This is spoken narration to camera. It is not an article, essay, keynote, LinkedIn post, literary monologue, or written-content summary.

Use the SOURCE-TRUTH RECORD as a hard factual boundary. You may transform the language and, where Version 2 permits it, the presentation structure. You may not add story material.

VERSION 1 — Same Story, Better Delivery

Keep the story content, meaning, real event order, major beat order, central conflict, earned movement, one unresolved tension, clip-line function, and existing recommended and alternate ending concepts substantially intact.

Freely improve the colloquial language, hook wording, emotional precision, breath rhythm, pauses, repetition, transitions, emphasis, and ending wording. Strengthen emotion only where the source-truth record supports it.

VERSION 2 — Same Material, Stronger Storytelling

Use only the supplied material, but freely rebuild the presentation order, information reveals, tempo, hook, transitions, emotional progression, clip-line placement, and ending strategy to maximize watcher retention.

You may cold-open on a later real moment and then return, but you may not falsify the chronology of what actually happened. Create a new recommended ending and three new alternate endings from the supplied material.

SHARED TRUTH LOCKS

- Do not invent or strengthen facts, events, experiences, feelings, motives, interior states, scenes, dialogue, quotations, evidence, research, credentials, outcomes, causal claims, or certainty.
- Preserve direct quotations exactly. Keep indirect speech indirect and uncertain recollections uncertain.
- Preserve the writer's point of view, uncomfortable admissions, distinctive wording, and useful repetition when they carry voice.
- Keep exactly one unresolved tension. Do not add a second one or manufacture uncertainty for engagement.
- Keep every spoken line comfortable to say aloud. Use natural contractions, fragments, pauses, and purposeful repetition.
- Do not pad. Aim for the authorized runtime only as far as the supplied material can support it honestly.
- Avoid generic creator language, announced insights, engagement bait, fake controversy, emojis, hashtags, parentheses, and semicolons.

TITLES FOR EACH VERSION

For each version, generate three TikTok opening-title options and three Instagram packages. Every Instagram package contains a short Cover headline and one natural Caption opening line.

Make the titles authentic, emotionally truthful, colloquial, specific to this narrator, and compelling without misleading. Use distinct emotional entry points. Do not invent drama or promise anything the video does not deliver.

OUTPUT

Return only these two sections, in this order:

1. Version 1 — complete teleprompter body and recommended ending, three labeled alternate endings, its platform-title set, and light delivery notes.
2. Version 2 — complete teleprompter body and recommended ending, three labeled alternate endings, its platform-title set, and light delivery notes.

Do not return critique, analysis, scoring, explanations, a change summary, or a hybrid third version.

Before responding, silently verify that you invented nothing, preserved speech status and real chronology, kept the emotion source-supported, made every line performable, and made Version 2 structurally distinct from Version 1. Silently repair any violation.

SOURCE-TRUTH RECORD:
[INSERTED BY THE SKILL]

SCRIPT:
[PASTE ENGLISH SCRIPT HERE]
```

## DeepSeek copy-paste prompt

```text
请把下面这份叙事口播稿改成两个完整版本，用于真人面对镜头讲述。

这是口播视频，不是文章、散文、演讲稿、公众号文案、书面总结，也不是英文直译腔。

把「事实边界记录」当作不可突破的真实边界。你可以大幅调整语言；在版本二允许的范围内，也可以重组呈现结构；但不能补写故事素材。

版本一｜同一个故事，更好地说出来

基本保留故事内容、原意、真实事件顺序、主要叙事节点顺序、核心冲突、真实发生的转变、唯一一个未解决的张力、核心句的作用，以及原有推荐结尾和三个备选结尾的构思。

你可以充分优化口语自然度、开头措辞、情绪准确度、呼吸节奏、停顿、重复、衔接、重音和结尾表达。只有在事实边界记录明确支持时，才能加强情绪表达。

版本二｜同一批真实素材，更强的故事讲法

只能使用已经提供的素材，但可以为了提高观众留存，自由重组信息的呈现顺序、揭示时机、节奏、开头、转场、情绪推进、核心句位置和结尾策略。

可以用后面真实发生的一个时刻做冷开场，再回到前面；但不能改写事情真实发生的先后。请重新创作一个推荐结尾和三个备选结尾，但仍然只能使用现有素材。

两个版本都必须遵守

- 不得新增或强化原稿没有明确支持的事实、事件、经历、情绪、动机、内心状态、场景、对话、引语、证据、研究、履历、结果、因果关系或确定性。
- 直接引语必须准确保留；转述继续用转述；不确定的回忆继续保留不确定性。
- 保留作者本人的立场、不舒服但真实的坦白、独特措辞和有效重复。
- 只保留一个未解决的张力，不要为了互动再制造第二个悬念。
- 每一行都要适合真实开口说。可以使用自然短句、停顿、不完整句和有作用的重复。
- 不要为了凑时长加内容。只在现有素材能诚实支撑的范围内接近授权时长。
- 避免模板化创作者语言、自我宣布观点、互动诱导、假冲突、表情符号、话题标签、括号和分号。

每个版本的标题

每个版本都生成三组小红书标题方案。每组包含一个简洁的「笔记标题」和一个更短的「封面短句」。

标题要真实、有情绪、口语自然、属于这个讲述者，也要让人想点开，但不能误导。三组标题使用不同的真实情绪入口，不能虚构冲突，也不能承诺视频里没有的内容。

输出

只按以下顺序返回两个部分：

1. 版本一：完整口播正文和推荐结尾、三个已标注的备选结尾、本版本的小红书标题方案、简短表达提示。
2. 版本二：完整口播正文和推荐结尾、三个已标注的备选结尾、本版本的小红书标题方案、简短表达提示。

不要返回点评、分析、评分、解释、修改说明，也不要拼出第三个混合版本。

回答前请在内部检查：有没有编造内容，有没有改变引语属性或真实时间顺序，情绪是否有素材支持，每一行是否好说，版本二是否真的在结构上不同于版本一。发现问题后先静默修正，再输出。

事实边界记录：
[由本技能自动填入]

原稿：
[在这里粘贴中文稿]
```
