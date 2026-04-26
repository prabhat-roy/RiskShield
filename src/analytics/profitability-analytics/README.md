# profitability-analytics

Service in the **analytics** domain of RiskShield.

**Language:** Go · **Port:** 50301

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/profitability-analytics/](../../../helm/charts/profitability-analytics/) — Helm chart
- [manifests/analytics/profitability-analytics/](../../../manifests/analytics/profitability-analytics/) — Raw K8s manifests
