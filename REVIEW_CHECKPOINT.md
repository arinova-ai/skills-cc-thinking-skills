# S2 review-selection checkpoint — 2026-09-02

Status: **FULL 27/28 KEEP-LIST RECONSTRUCTED FROM ENTRY RUBRICS**.

## Immutable source

- Original review-input path (read only):
  `/Users/ripple/orca/workspaces/arinova-skill-catalog/skill-gap-2-content/reports/skill-gap-2-s2-review-input-2026-09-02.json`
- Original review-input SHA-256:
  `0ee266e31e4a6aa38e309c27adabf3d114bb8292bf49c160a6d429428fc7b406`
- Schema: `arinova.skill-catalog.review-input/v2`
- Source decision: `defer`
- Exact entry-rubric snapshot:
  `review/source-entry-rubrics-2026-09-02.json`
- Entry-rubric snapshot SHA-256:
  `eec419e3f61fa057b0b959a3adcffedda20abcfe2e7493c1cf6969232f4c1154`

The free-text package note ends in a truncated `thinking-thought-exp` token and
is not used as selection evidence. The reconstruction uses all 28 objects in
`entryReviews`, including each entry's five rubric scores and runtime verdict.

## Deterministic rule and result

`review/derive-selection.jq` applies the settled redline exactly:

- keep only if every one of the five dimension scores is at least 2; and
- keep only if the five-score total is at least 15.

The generated `review/reconstructed-selection.json` records all 28 score rows,
their minima, totals, runtime verdicts, and dispositions. Result:

- keep: 27
- reject: 1
- rejected entry: `thinking-lindy-effect` (`minimumScore=2`,
  `totalScore=14`, `runtimeFeasible=true`)

`review/KEEP_LIST.txt` is the complete alphabetical 27-entry selection. Its
final three entries are `thinking-thought-experiment`, `thinking-triz`, and
`thinking-via-negativa`; none is inferred from the truncated text.

## Reproduction

```sh
jq -f review/derive-selection.jq \
  review/source-entry-rubrics-2026-09-02.json \
  > /tmp/s2-reconstructed-selection.json
cmp /tmp/s2-reconstructed-selection.json review/reconstructed-selection.json

jq -r '.keepList[]' review/reconstructed-selection.json \
  > /tmp/s2-keep-list.txt
cmp /tmp/s2-keep-list.txt review/KEEP_LIST.txt
```

The companion retains all 28 upstream-exact source skills for provenance.
Canonical acquisition must apply the 27-entry keep-list and create a fresh
candidate key. No catalog, staging, or production mutation is part of this
checkpoint.
