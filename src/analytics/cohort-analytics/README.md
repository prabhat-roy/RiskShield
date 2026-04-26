# cohort-analytics

Service in the **analytics** domain of RiskShield.

**Language:** Go · **Port:** 50302

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/cohort-analytics/](../../../helm/charts/cohort-analytics/) — Helm chart
- [manifests/analytics/cohort-analytics/](../../../manifests/analytics/cohort-analytics/) — Raw K8s manifests
