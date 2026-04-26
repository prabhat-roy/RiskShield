# RiskShield Grafana Dashboards

Provisioned via folder mounts; one folder per domain.

| Dashboard | Source |
|-----------|--------|
| Platform overview          | platform/api-gateway, BFFs |
| Policy lifecycle           | policy domain — issue, endorse, renew, cancel |
| Claims funnel              | FNOL → triage → adjudication → settlement |
| Pricing engine             | Haskell engine quote latency, cache hit |
| Fraud scoring              | model drift, alert volume, link analysis |
| Sanction screening         | hits, blocks, cache age, source freshness |
| Bordereaux                 | per-reinsurer monthly counts, idempotency check |
| Solvency II / IFRS 17      | calc duration, last-run, capital ratio |
| Telematics                 | events/sec, ingest lag, scoring distribution |
