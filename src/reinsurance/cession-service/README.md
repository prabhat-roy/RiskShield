# cession-service

Service in the **reinsurance** domain of RiskShield.

**Language:** Go · **Port:** 50102

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/cession-service/](../../../helm/charts/cession-service/) — Helm chart
- [manifests/reinsurance/cession-service/](../../../manifests/reinsurance/cession-service/) — Raw K8s manifests
