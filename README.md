# CC Thinking Skills companion

This repository is a self-contained, prompt-only redistribution of the 28
thinking skills from
[`tjboudreaux/cc-thinking-skills`](https://github.com/tjboudreaux/cc-thinking-skills).
It is prepared for review and import into the Arinova skill catalog.

## Provenance

- Upstream repository: `https://github.com/tjboudreaux/cc-thinking-skills`
- Reviewed upstream commit: `7b8fece345dfaa11773be7152ccd194589cb5437`
- Upstream author and copyright holder: TJ Boudreaux
- License: MIT; the complete upstream license is retained in [`LICENSE`](LICENSE)
- Content changes: none. Every retained `SKILL.md` is byte-for-byte identical
  to the file at the reviewed commit.

## Curated contents

Only `skills/` is redistributed. It contains 28 `thinking-*` prompt skills and
no executable code or runtime dependency.

The following upstream material is intentionally excluded:

- `evals/` (331 tracked evaluation and harness files, including SWE-bench
  derived data)
- `analysis/`, `experiments/`, and `scripts/`
- repository automation, plugin metadata, images, and general project docs

This keeps the companion focused on the reusable skills and prevents the
upstream evaluation corpus from entering archive-wide credential screening.

## Review selection checkpoint

The source companion intentionally remains a byte-identical 28-skill archive.
The 2026-09-02 entry-level review applies the settled rubric redline (every
dimension at least 2 and total at least 15) and selects 27 entries for the next
acquisition run. `thinking-lindy-effect` is excluded because its total is 14.
The complete, reproducible selection is under [`review/`](review/); downstream
acquisition must use `review/KEEP_LIST.txt` rather than recursively importing
all 28 source skills.
