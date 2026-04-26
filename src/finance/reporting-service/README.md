# reporting-service

Service in the **finance** domain of RiskShield.

**Language:** Go · **Port:** 50223

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/reporting-service/](../../../helm/charts/reporting-service/) — Helm chart
- [manifests/finance/reporting-service/](../../../manifests/finance/reporting-service/) — Raw K8s manifests
