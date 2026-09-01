def rubric_scores($review):
  {
    triggerClarityAndScope: $review.quality.triggerClarityAndScope.score,
    proceduralSpecificityAndDeliverableQuality: $review.quality.proceduralSpecificityAndDeliverableQuality.score,
    safetyConfirmationAndDegradedMode: $review.quality.safetyConfirmationAndDegradedMode.score,
    platformRuntimeFeasibility: $review.quality.platformRuntimeFeasibility.score,
    distinctProfessionalValue: $review.quality.distinctProfessionalValue.score
  };

def disposition($scores):
  if (($scores | [.[]] | min) >= 2 and ($scores | [.[]] | add) >= 15)
  then "keep"
  else "reject"
  end;

(.entryReviews
 | to_entries
 | sort_by(.key)
 | map(
     .value as $review
     | rubric_scores($review) as $scores
     | {
         entry: .key,
         scores: $scores,
         minimumScore: ($scores | [.[]] | min),
         totalScore: ($scores | [.[]] | add),
         runtimeFeasible: $review.runtimeFeasible,
         disposition: disposition($scores)
       }
   )) as $entries
| {
    schemaVersion: "arinova.skill-catalog.companion-selection/v1",
    sourceSchemaVersion: .schemaVersion,
    sourceDecision: .decision,
    rule: "keep iff every rubric dimension is >= 2 and total score is >= 15",
    totalEntries: ($entries | length),
    keepCount: ($entries | map(select(.disposition == "keep")) | length),
    rejectCount: ($entries | map(select(.disposition == "reject")) | length),
    keepList: ($entries | map(select(.disposition == "keep") | .entry)),
    rejectList: ($entries | map(select(.disposition == "reject") | {
      entry,
      scores,
      minimumScore,
      totalScore,
      runtimeFeasible
    })),
    entries: $entries
  }
