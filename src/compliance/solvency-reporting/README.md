# solvency-reporting

Service in the **compliance** domain of RiskShield.

**Language:** Go · **Port:** 50240

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/solvency-reporting/](../../../helm/charts/solvency-reporting/) — Helm chart
- [manifests/compliance/solvency-reporting/](../../../manifests/compliance/solvency-reporting/) — Raw K8s manifests
