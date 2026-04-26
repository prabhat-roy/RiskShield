# reinsurance/

Reinsurance — treaty, facultative, cession, bordereau.

| Service | Lang | Port |
|---|---|---|
| ri-service          | Java | 50100 |
| treaty-service      | Java | 50101 |
| facultative-service | Java | 50102 |
| cession-service     | Java | 50103 |
| bordereau-service   | Java | 50104 |

Bordereaux are idempotent on `(reinsurer_id, period)` — see CLAUDE.md.
