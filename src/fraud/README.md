# fraud/

Fraud detection — orchestrator, SIU, graph link analysis, scoring, alerting.

| Service | Lang | Port |
|---|---|---|
| fraud-service    | Python | 50140 |
| siu-service      | Python | 50141 |
| link-analysis    | Python | 50142 |
| scoring-service  | Python | 50143 |
| alert-service    | Python | 50144 |

Graph link analysis runs against Neo4j at **claim time** — flags suspicious patterns
before any payment is authorised, not in batch overnight.
