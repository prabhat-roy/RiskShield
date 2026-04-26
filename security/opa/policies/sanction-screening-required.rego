package riskshield.sanction

import future.keywords.if
import future.keywords.in

# Hard rule from CLAUDE.md:
#   "Sanction-screening failures must block policy issuance — never bypass."
#
# Any request that issues a policy, binds a quote, or registers a new
# claimant MUST carry a sanction-screening result that is:
#   1. successful (no hit) OR explicitly cleared by compliance review,
#   2. produced within the last 4 hours (matches the Redis TTL ceiling),
#   3. signed by the sanction-screening service.

default allow := false

policy_actions := {
    "policy.issue",
    "policy.endorse",
    "policy.renew",
    "claims.register-claimant",
    "customer.create",
}

allow if {
    not input.action in policy_actions
}

allow if {
    input.action in policy_actions
    screening_valid
}

screening_valid if {
    input.sanction.result == "clear"
    input.sanction.signed_by == "sanction-screening.riskshield-compliance"
    age_seconds := input.now - input.sanction.completed_at
    age_seconds <= 14400   # 4 hours — see CLAUDE.md cache TTL ceiling
}

# Compliance officer override path (must be explicit + audited)
screening_valid if {
    input.sanction.result == "hit"
    input.sanction.compliance_review.decision == "clear"
    input.sanction.compliance_review.officer_id != ""
    input.sanction.compliance_review.case_id    != ""
}

deny[msg] if {
    input.action in policy_actions
    not screening_valid
    msg := sprintf(
        "sanction-screening required for %q: result=%v age=%vs",
        [input.action, input.sanction.result, input.now - input.sanction.completed_at]
    )
}
