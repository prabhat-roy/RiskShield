# underwriting/

Underwriting workbench, risk assessment, rating, appetite, referral.

| Service | Lang | Port |
|---|---|---|
| uw-service       | Java    | 50060 |
| risk-assessment  | Java    | 50061 |
| rating-engine    | Haskell | 50062 |
| appetite-service | Java    | 50063 |
| referral-service | Java    | 50064 |

`rating-engine` is pure Haskell â€” every rating call stores full input/output snapshot
for regulatory back-testing. Do not introduce IO into the core.
