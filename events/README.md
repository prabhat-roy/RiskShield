# events/

Avro schemas for Kafka event topics. Topic naming: `{domain}.{entity}.{event}`.

## Insurance event catalogue

| Topic | Producer | Description |
|---|---|---|
| `policy.policy.bound`                    | policy-service        | Policy bound (premium paid + sanctions cleared) |
| `policy.policy.cancelled`                | cancellation-service  | Policy cancelled (lapse / NTU / mid-term) |
| `policy.endorsement.applied`             | endorsement-service   | Mid-term endorsement applied |
| `claims.fnol.received`                   | fnol-service          | First Notice of Loss received (triggers fraud + sanctions check) |
| `claims.adjudication.completed`          | adjudication-service  | Coverage + liability decided |
| `claims.settlement.paid`                 | settlement-service    | Claim payment authorised + paid |
| `claims.litigation.opened`               | litigation-service    | Litigation case opened |
| `reinsurance.cession.calculated`         | cession-service       | Cession calculated for a claim/policy |
| `reinsurance.bordereau.generated`        | bordereau-service     | Monthly bordereau file generated (idempotent) |
| `actuarial.reserve.posted`               | reserve-service       | IBNR/RBNS reserve posted |
| `actuarial.ifrs17.cashflow.calculated`   | ifrs17-service        | IFRS 17 cashflow + CSM update emitted |
| `compliance.sanction-screening.checked`  | sanction-screening    | Sanction screening result (hit / clear) |
| `compliance.kyc.verified`                | kyc-service           | KYC verification outcome |
| `fraud.alert.raised`                     | alert-service         | Fraud alert raised (graph + score) |
| `finance.premium.booked`                 | premium-service       | Premium booked to ledger |
| `finance.payment.captured`               | payment-service       | Inbound/outbound payment captured |
| `distribution.commission.calculated`     | commission-service    | Commission calculated for a placement |
| `telematics.trip.scored`                 | telematics-scoring    | Telematics trip scored (UBI) |
| `document.policy.issued`                 | document-service      | Policy document issued (signed via esign) |

All schemas live next to this README as `*.avsc` (Avro JSON).
