# Architecture

The runtime skill is intentionally compact. Detailed rules are split into three references loaded by task stage:

- story discovery, narrative authorization, and reference safety;
- evidence selection and source-to-claim verification;
- independent English and Simplified Chinese finalization.

One internal, language-neutral approved story contract controls both language branches. English is not an intermediary for Chinese. Integrity and hard runtime constraints outrank narrative and evidence choices; optional enrichment comes last.

The project remains a standalone skill repository. External polishing skills are invoked as dependencies, and research is expressed as a capability requirement rather than tied to a particular adapter.
