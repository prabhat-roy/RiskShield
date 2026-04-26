# proto/

gRPC contracts for RiskShield. Codegen via [buf](https://buf.build).

```bash
buf generate
```

Layout:

| Path | Domain |
|---|---|
| `common/types.proto` | Shared types (Money, PolicyId, ClaimId, SanctionScreeningResult, AcordRef) |
| `platform/*.proto` | API gateway + BFFs |
| `identity/*.proto` | Auth, SSO, MFA, RBAC |
| `policy/*.proto` | Policy admin, endorsement, renewal, cancellation |
| `underwriting/*.proto` | UW workbench, risk, rating, appetite, referral |
| `claims/*.proto` | Claim, FNOL, adjudication, settlement, litigation |
| `reinsurance/*.proto` | Treaty, facultative, cession, bordereau |
| `actuarial/*.proto` | Actuarial, pricing engine, reserve, IFRS 17 |
| `fraud/*.proto` | Fraud, SIU, link analysis, scoring, alert |
| `distribution/*.proto` | Agent, broker, commission, MGA, channel |
| `customer/*.proto` | Customer, quote, self-service, document, NPS |
| `product/*.proto` | Product, coverage, exclusion, wording, form |
| `finance/*.proto` | Premium, payment, bordereaux, accounting, reporting |
| `compliance/*.proto` | Compliance, solvency, sanctions, KYC, AML |
| `third-party/*.proto` | Repair, medical, legal, TPA, data vendor |
| `telematics/*.proto` | Telematics ingest, IoT, UBI, scoring, event stream |
| `analytics/*.proto` | Loss, profitability, cohort, CTR analytics |
| `document/*.proto` | Document, OCR, ECM, eSign, archive |
