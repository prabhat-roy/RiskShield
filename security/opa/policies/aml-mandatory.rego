package riskshield.aml

import future.keywords.if
import future.keywords.in

# AML / KYC must run on:
#   - new customer creation,
#   - any premium payment over the structuring threshold,
#   - any claim settlement to a payee that is not the policyholder,
#   - any refund > GBP 10,000.
#
# This policy gates each of those actions on a fresh KYC + AML decision.

default allow := false

aml_actions := {
    "customer.create",
    "customer.kyc-refresh",
    "finance.premium-payment",
    "claims.settlement",
    "finance.refund",
}

allow if {
    not input.action in aml_actions
}

allow if {
    input.action in aml_actions
    kyc_fresh
    aml_decision_clear
    not threshold_exceeded
}

allow if {
    input.action in aml_actions
    kyc_fresh
    aml_decision_clear
    threshold_exceeded
    input.aml.enhanced_due_diligence.completed == true
}

kyc_fresh if {
    age_days := (input.now - input.kyc.completed_at) / 86400
    age_days <= 365   # KYC valid for 1 year
}

aml_decision_clear if {
    input.aml.score <= 60                 # configurable risk score
    input.aml.pep_match == false
}

aml_decision_clear if {
    input.aml.score > 60
    input.aml.compliance_review.decision == "clear"
}

threshold_exceeded if { input.action == "finance.premium-payment" ; input.amount.value >= 10000 }
threshold_exceeded if { input.action == "finance.refund"          ; input.amount.value >= 10000 }
threshold_exceeded if { input.action == "claims.settlement"       ; input.amount.value >= 100000 }

deny[msg] if {
    input.action in aml_actions
    not allow
    msg := sprintf(
        "AML/KYC required for %q (score=%v, kyc_age_days=%v, threshold_exceeded=%v)",
        [input.action, input.aml.score, (input.now - input.kyc.completed_at) / 86400, threshold_exceeded]
    )
}
