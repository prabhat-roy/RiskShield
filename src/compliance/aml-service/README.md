# aml-service

Service in the **compliance** domain of RiskShield.

**Language:** Go · **Port:** 50243

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/aml-service/](../../../helm/charts/aml-service/) — Helm chart
- [manifests/compliance/aml-service/](../../../manifests/compliance/aml-service/) — Raw K8s manifests
