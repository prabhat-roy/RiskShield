# compliance/

Compliance & regulatory — Solvency II, sanctions, KYC, AML.

| Service | Lang | Port |
|---|---|---|
| compliance-service   | Java | 50240 |
| solvency-reporting   | Java | 50241 |
| sanction-screening   | Java | 50242 |
| kyc-service          | Java | 50243 |
| aml-service          | Java | 50244 |

Sanction-screening **must** run synchronously on every new policy and claimant.
A hit blocks issuance / payment. Cache TTL = 4h (CLAUDE.md rule).
