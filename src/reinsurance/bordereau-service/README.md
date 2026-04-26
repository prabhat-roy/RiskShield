# bordereau-service

Service in the **reinsurance** domain of RiskShield.

**Language:** Go · **Port:** 50103

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/bordereau-service/](../../../helm/charts/bordereau-service/) — Helm chart
- [manifests/reinsurance/bordereau-service/](../../../manifests/reinsurance/bordereau-service/) — Raw K8s manifests
