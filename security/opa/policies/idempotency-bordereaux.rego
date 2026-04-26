package riskshield.bordereaux

import future.keywords.if
import future.keywords.in

# CLAUDE.md: "Bordereaux generation is idempotent on (reinsurer_id, period)."
#
# This policy is consulted by the bordereau-service before it accepts a
# generate-bordereau request. It refuses to generate a second bordereau for
# the same (reinsurer, period) unless the previous one was explicitly
# revoked. Revocations themselves are append-only.

default allow := false

allow if {
    input.action == "bordereau.generate"
    not duplicate
}

allow if {
    input.action == "bordereau.generate"
    duplicate
    previous_revoked
}

allow if {
    # Reading and shipping is always allowed — only generation is gated.
    input.action in {"bordereau.read", "bordereau.ship"}
}

duplicate if {
    some existing in input.existing_bordereaux
    existing.reinsurer_id == input.request.reinsurer_id
    existing.period       == input.request.period
}

previous_revoked if {
    some existing in input.existing_bordereaux
    existing.reinsurer_id == input.request.reinsurer_id
    existing.period       == input.request.period
    existing.revoked_at != null
    existing.revocation_reason != ""
    existing.revocation_officer_id != ""
}

deny[msg] if {
    input.action == "bordereau.generate"
    duplicate
    not previous_revoked
    msg := sprintf(
        "bordereau already exists for (reinsurer=%v, period=%v); revoke previous before regenerating",
        [input.request.reinsurer_id, input.request.period]
    )
}

# Append-only: prevent any mutation of historical bordereau records.
deny[msg] if {
    input.action == "bordereau.update"
    msg := "bordereau records are append-only; issue a corrective bordereau instead"
}
