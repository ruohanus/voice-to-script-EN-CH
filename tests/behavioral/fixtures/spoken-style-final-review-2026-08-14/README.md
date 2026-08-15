# Final-review behavioral fixtures

These fixtures preserve the exact neutral prompts and user-facing outputs used for the final-review correction wave. The prompts contain no scenario numbers, rubric text, suspected failures, or expected observations.

## Packet and output map

| Packet | Purpose | Pre-fix evidence | Post-fix evidence |
|---|---|---|---|
| `packet-1-overwritten-en.md` | English overwritten source | `red-packet-1-output.md` | `green-packet-1-output.md` |
| `packet-2-no-detail-en.md` | English source with paraphrased speech and no physical detail | `iteration-1-packet-2-output.md`, `iteration-2-packet-2-output.md` | `green-packet-2-output.md` |
| `packet-3-bilingual.md` | Bilingual endings and runtime | `red-packet-3-output.md` | `green-packet-3-output.md` |
| `packet-4-prohibited-forms-en.md` | English source containing prohibited written forms | `control-packet-4-output.md` | `green-packet-4-output.md` |

The two `red-` files are exact outputs from the last pre-fix fresh-context runs retained by the implementation campaign. They demonstrate the quotation-status and Named-reader failures that triggered this correction. The `control-` file is the exact pre-fix run for the newly added prohibited-form packet; it already complied, so no speculative prohibition wording was added. `iteration-1-packet-2-output.md` exposed two writer-side uncertainties in one callback; `iteration-2-packet-2-output.md` then placed preference commentary between the clip candidate and its source action. Each drove one narrow follow-up. The `green-` files are generated from independent ephemeral contexts after the final wording.

## Fresh-run method

From the repository root, use one new ephemeral context per packet:

```bash
codex exec --ephemeral -s read-only -C "$PWD" \
  -o /tmp/packet-1-output.md - \
  < tests/behavioral/fixtures/spoken-style-final-review-2026-08-14/packet-1-overwritten-en.md
```

Repeat with a different packet and temporary output path for each run. The committed `green-` file is the exact last-message file produced by that run, with only transport metadata absent because `--output-last-message` records the user-facing response directly.

## Runtime extraction boundary

Measure the complete teleprompter body plus the recommended conclusion. Exclude the editorial `Recommended ending — ...` heading, the `Alternate endings` section, and `Light delivery notes`. The final correction report records the exact extraction and estimator commands used for each output.

From the repository root, the single-language extraction shape is:

```bash
awk '/^Alternate endings$/{exit} !/^Recommended ending —/{print}' \
  tests/behavioral/fixtures/spoken-style-final-review-2026-08-14/green-packet-1-output.md \
  | python3 skills/voice-to-script-en-ch/scripts/estimate_runtime.py --language en
```

For packet 3, select each language section before applying the same heading exclusion:

```bash
awk '/^## English$/{on=1; next} /^Alternate endings$/{if(on) exit} on && !/^Recommended ending —/{print}' \
  tests/behavioral/fixtures/spoken-style-final-review-2026-08-14/green-packet-3-output.md \
  | python3 skills/voice-to-script-en-ch/scripts/estimate_runtime.py --language en

awk '/^## 简体中文$/{on=1; next} /^Alternate endings$/{if(on) exit} on && !/^Recommended ending —/{print}' \
  tests/behavioral/fixtures/spoken-style-final-review-2026-08-14/green-packet-3-output.md \
  | python3 skills/voice-to-script-en-ch/scripts/estimate_runtime.py --language zh
```

## Focused source/output audits

These commands expose the pre-fix quotation promotion, the final indirect phrasing, all final Named-reader blocks, and the prohibited-form preservation evidence:

```bash
rg -n '["“”]' tests/behavioral/fixtures/spoken-style-final-review-2026-08-14/red-packet-3-output.md

rg -n 'I said that I thought|我只是说|我觉得大家可能' \
  tests/behavioral/fixtures/spoken-style-final-review-2026-08-14/green-packet-3-output.md

for f in tests/behavioral/fixtures/spoken-style-final-review-2026-08-14/green-packet-*-output.md; do
  awk '/^Named reader — best for shares$/{show=1; print FNR ":" $0; next} show && NF {print FNR ":" $0; count++; if(count==2){show=0; count=0}}' "$f"
done

awk '/^Light delivery notes$/{exit} {print}' \
  tests/behavioral/fixtures/spoken-style-final-review-2026-08-14/green-packet-4-output.md \
  | rg -n -i 'okay, so|before I say anything useful|here is the part where|as a quick aside|what I learned|the big lesson|let that sink in|at the end of the day|tell me in the comments|tap like|share this|[();]'

rg -n 'I checked once|Then again|Then once more|Feeling unnecessary bothered me|care because control sounded uglier' \
  tests/behavioral/fixtures/spoken-style-final-review-2026-08-14/green-packet-4-output.md
```

The prohibited-form `rg` command is expected to return no matches; the preservation command is expected to return matches.
