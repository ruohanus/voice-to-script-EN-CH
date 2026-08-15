# voice to script en/ch identity migration implementation plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Rename the existing public skill and local runtime installation to `voice-to-script-en-ch` without changing behavior.

**Architecture:** Treat identity as a cross-repository contract enforced by the existing smoke test, metadata, frontmatter, paths, and invocation strings. Drive the migration RED → GREEN, preserve Git history with `git mv`, then mirror the validated package into one canonical local runtime directory before moving the distinct legacy copy to Trash.

**Tech Stack:** Markdown/YAML skill package, POSIX shell smoke tests, Python `unittest`, Git/GitHub CLI, macOS filesystem.

## Global constraints

- Public name: `voice to script en/ch`.
- Machine name and canonical folder: `voice-to-script-en-ch`.
- Invocation: `$voice-to-script-en-ch`.
- The repository starts at `https://github.com/ruohanus/voice-to-script-EN-CH.git`; the user explicitly authorized a final case-normalization rename to `https://github.com/ruohanus/voice-to-script-en-ch.git`.
- Only identity-bearing text and paths may change; any unrelated behavior change is a regression.
- Do not create a compatibility alias or replacement repository. Rename the existing GitHub repository only after the validated commit is pushed.
- Commit and push only once, after final diff review and successful validation.
- Never permanently delete local copies. Re-inspection proved the uppercase and lowercase `voice-to-script` paths share one inode on this case-insensitive filesystem, so normalize that entry's casing through a temporary name and move only the distinct verified legacy directory to Trash.

---

### Task 1: Establish the identity contract RED state

**Files:**
- Modify: `tests/test_package_smoke.sh`
- Modify: `tests/test_runtime_estimator.py`

**Interfaces:**
- Consumes: current repository with `skills/speaking-ideas-into-content/`.
- Produces: tests that resolve `skills/voice-to-script-en-ch/` and assert the target frontmatter, UI name, invocation, and README install command.

- [ ] Update `skill_dir` and `SCRIPT` to `skills/voice-to-script-en-ch`.
- [ ] Change the smoke assertion to `^name: voice-to-script-en-ch$`.
- [ ] Add exact assertions for `display_name: "voice to script en/ch"`, `$voice-to-script-en-ch`, and `npx skills add ./skills/voice-to-script-en-ch`.
- [ ] Run `sh tests/test_package_smoke.sh` before moving the directory.
- [ ] Record exit status `1` and confirm the failure is the missing new runtime path, not a shell or fixture error.
- [ ] Run `python3 -m unittest tests/test_runtime_estimator.py -v` and confirm the new script path is missing before migration.

### Task 2: Rename the package and active identity

**Files:**
- Move: `skills/speaking-ideas-into-content/` → `skills/voice-to-script-en-ch/`
- Modify: `skills/voice-to-script-en-ch/SKILL.md`
- Modify: `skills/voice-to-script-en-ch/agents/openai.yaml`
- Modify: `README.md`
- Inspect: `docs/architecture.md`
- Inspect: `docs/testing.md`
- Modify: current identity references in tests and migration specifications where applicable

**Interfaces:**
- Consumes: the failing identity contract from Task 1.
- Produces: a valid package at the canonical path with target frontmatter and invocation.

- [ ] Run `git mv skills/speaking-ideas-into-content skills/voice-to-script-en-ch`.
- [ ] Change only `name:` and the human-facing title in `SKILL.md`.
- [ ] Set `display_name: "voice to script en/ch"` and replace the default invocation with `$voice-to-script-en-ch`.
- [ ] Replace active public naming, runtime paths, and install commands in README and current developer documentation.
- [ ] Add native path examples `.agents/skills/voice-to-script-en-ch/` and `$HOME/.agents/skills/voice-to-script-en-ch/` without redesigning installation guidance.
- [ ] Search active fixtures and prompts; replace only old paths, invocations, or public identity labels.
- [ ] Run `git status --short` and confirm Git recognizes the runtime files as renames.

### Task 3: Prove behavioral preservation and GREEN state

**Files:**
- Test: `tests/test_package_smoke.sh`
- Test: `tests/test_runtime_estimator.py`
- Inspect: renamed `SKILL.md`, references, fixtures, and behavioral specifications

**Interfaces:**
- Consumes: renamed package from Task 2.
- Produces: recorded validation and a behavioral diff restricted to identity.

- [ ] Run the same `sh tests/test_package_smoke.sh`; require exit `0`.
- [ ] Run `python3 -m unittest tests/test_runtime_estimator.py -v`; require all four tests pass.
- [ ] Run the current official `quick_validate.py skills/voice-to-script-en-ch`; require `Skill is valid!`.
- [ ] Parse `agents/openai.yaml`; require display name, 25–64 character short description, and target invocation.
- [ ] Compare the renamed `SKILL.md` to commit `c83e192` with rename-aware Git diff; require changes only to frontmatter name and title.
- [ ] Confirm reference files, runtime estimator logic, and behavioral fixture contents have no non-identity diff.
- [ ] Run fresh-context positive and negative trigger checks using `$voice-to-script-en-ch`; grade against the existing rubric without changing behavioral expectations.

### Task 4: Normalize the local runtime safely

**Files:**
- Source: `skills/voice-to-script-en-ch/`
- Canonical destination: `$HOME/.codex/skills/voice-to-script-en-ch/`
- Stale candidates: `$HOME/.codex/skills/speaking-ideas-into-content/`, `$HOME/.codex/skills/voice-to-script-EN-CH/`

**Interfaces:**
- Consumes: repository package that passed Task 3.
- Produces: one canonical installed copy identical to the repository package; the distinct legacy copy recoverable in Trash.

- [ ] Re-inspect all three exact candidate directories, their frontmatter, and file hashes.
- [ ] Confirm each is a version of this product and no path is a symlink or unrelated skill; record that the uppercase and lowercase paths share inode `404356875`.
- [ ] Rename the mixed-case directory entry through a unique temporary name, then to `voice-to-script-en-ch`, so the on-disk casing is canonical.
- [ ] Mechanically mirror the validated repository package into the canonical lowercase destination.
- [ ] Run the official validator, YAML checks, required-file checks, runtime tests, and `diff -qr` between source and canonical destination.
- [ ] Confirm canonical frontmatter and invocation are `voice-to-script-en-ch` and `$voice-to-script-en-ch`.
- [ ] Check that the legacy Trash target does not already exist.
- [ ] Move only the distinct verified `speaking-ideas-into-content` directory under `$HOME/.Trash/`; do not move the uppercase alias because it is the canonical directory on this filesystem.
- [ ] Confirm only `$HOME/.codex/skills/voice-to-script-en-ch/` remains active for this product.

### Task 5: Final audit, commit, and publish

**Files:**
- Inspect: complete repository diff and all changed paths
- Commit: all validated migration files in one commit

**Interfaces:**
- Consumes: validated repository and normalized runtime.
- Produces: one pushed identity-migration commit on the existing public repository.

- [ ] Run repository-wide searches for the old machine and public names; classify every remaining result as historical or stale.
- [ ] Search for noncanonical `voice-to-script-EN-CH`; allow it only where the migration record identifies the former repository or filesystem name.
- [ ] Run `git diff --check`, smoke tests, unit tests, official validator, YAML assertions, and exact path assertions again.
- [ ] Review `git diff --find-renames --stat`, `git diff --find-renames`, and `git status --short`; require identity-only scope.
- [ ] Confirm the pre-rename origin is exactly `https://github.com/ruohanus/voice-to-script-EN-CH.git`.
- [ ] Stage the reviewed files and commit with `chore: rename skill to voice-to-script-en-ch`.
- [ ] Push `HEAD` to the existing remote `main` branch.
- [ ] Rename the existing GitHub repository to `voice-to-script-en-ch`, update `origin`, and verify no replacement repository was created.
- [ ] Verify remote `main` equals the local commit and the repository remains public at the lowercase URL.
