# ctr-analytics

Service in the **analytics** domain of RiskShield.

**Language:** Go · **Port:** 50303

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/ctr-analytics/](../../../helm/charts/ctr-analytics/) — Helm chart
- [manifests/analytics/ctr-analytics/](../../../manifests/analytics/ctr-analytics/) — Raw K8s manifests
