# loss-analytics

Service in the **analytics** domain of RiskShield.

**Language:** Go · **Port:** 50300

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/loss-analytics/](../../../helm/charts/loss-analytics/) — Helm chart
- [manifests/analytics/loss-analytics/](../../../manifests/analytics/loss-analytics/) — Raw K8s manifests
