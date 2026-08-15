# voice to script en/ch identity migration

## Objective

Rename the public and machine-readable identity of the existing skill without changing its behavior.

| Surface | Current | Target |
|---|---|---|
| Public name | Speaking Ideas Into Content | voice to script en/ch |
| Skill name | `speaking-ideas-into-content` | `voice-to-script-en-ch` |
| Runtime path | `skills/speaking-ideas-into-content/` | `skills/voice-to-script-en-ch/` |
| Invocation | `$speaking-ideas-into-content` | `$voice-to-script-en-ch` |
| Canonical local folder | multiple copies | `voice-to-script-en-ch` only |

The GitHub repository began as `ruohanus/voice-to-script-EN-CH`. During implementation, the user explicitly superseded the earlier no-rename constraint and authorized normalizing the repository to `ruohanus/voice-to-script-en-ch`.

## Scope

Update only identity-bearing surfaces:

- runtime directory name;
- `SKILL.md` frontmatter name and human-facing title;
- `agents/openai.yaml` display name and invocation;
- README installation examples and current product naming;
- active developer-documentation paths;
- test paths, prompts, and identity assertions;
- local runtime installation directories.

Do not modify storytelling architecture, audience handling, language modes, bilingual default, Chinese-native adaptation, runtime limits, narrative selection, causal/conflict structure, research and evidence authorization, polishing dependencies, output cleanliness, or safety rules.

## Test-first migration

1. Change active contract tests to require the new folder, frontmatter name, display name, invocation, and README installation command.
2. Run them before the runtime rename and confirm failure for the expected missing new path or old identity.
3. Use `git mv` for the runtime directory.
4. Make the smallest identity-only edits needed for the tests to pass.
5. Review the behavioral-instruction diff. Any non-identity change is a regression and must be reverted or investigated.

## Historical records

Search the full repository for both old names. Update active specifications, commands, tests, current examples, and runtime documentation. Preserve an old-name occurrence only when it is necessary to describe historical reality, and add enough context to make that status unambiguous. The target is zero stale active references.

## Local runtime normalization

The initial path inspection appeared to expose three candidates:

- `speaking-ideas-into-content`: legacy generic version;
- `voice-to-script-EN-CH`: noncanonical-casing copy of the current public skill;
- `voice-to-script-en-ch`: lowercase copy whose internal identity is still old.

Implementation re-inspection showed that the two `voice-to-script` spellings resolve to the same inode on the case-insensitive macOS filesystem. There are therefore two actual directory entries, not three. Safely normalize the existing mixed-case entry through a temporary name to the lowercase canonical name; do not move the uppercase path to Trash because that would also move the canonical path. Move only the distinct legacy `speaking-ideas-into-content` directory to Trash after canonical validation.

After repository validation:

1. Build the canonical lowercase installation from the validated repository folder.
2. Validate its frontmatter, metadata, resources, and runtime script.
3. Confirm the legacy path is a distinct stale copy and the uppercase/lowercase paths are aliases of one directory entry.
4. Move the distinct legacy directory to Trash with a recoverable name; normalize casing on the canonical entry through a temporary name.
5. Do not touch any other installed skill.
6. Confirm discovery exposes only `voice-to-script-en-ch` for this product.

## Validation

Run and record:

- current official skill validator;
- identity/contract smoke test, including observed red then green states;
- runtime estimator unit tests;
- affected behavioral trigger/invocation checks in fresh contexts;
- YAML parsing and metadata constraints;
- `git diff --check`;
- repository-wide old-name classification;
- exact path and frontmatter invariants;
- local canonical-installation validation;
- final diff review proving behavioral files changed only where identity required.

Commit and push only after all checks pass and the final diff has been reviewed. Push to the existing public repository, then apply the separately authorized lowercase repository rename and update `origin`.

## Success criteria

- `skills/voice-to-script-en-ch/SKILL.md` exists and declares `name: voice-to-script-en-ch`.
- UI metadata displays `voice to script en/ch` and invokes `$voice-to-script-en-ch`.
- Active documentation installs `./skills/voice-to-script-en-ch` and documents native Codex paths with the lowercase name.
- No active path references `skills/speaking-ideas-into-content/`.
- Existing behavioral and runtime tests pass without non-identity expectation changes.
- Only one canonical lowercase local runtime copy remains active.
- GitHub `origin` becomes `https://github.com/ruohanus/voice-to-script-en-ch.git` after the validated commit is pushed and the authorized repository rename succeeds.
