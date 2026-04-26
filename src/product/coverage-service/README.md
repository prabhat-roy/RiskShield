# coverage-service

Service in the **product** domain of RiskShield.

**Language:** Go · **Port:** 50201

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/coverage-service/](../../../helm/charts/coverage-service/) — Helm chart
- [manifests/product/coverage-service/](../../../manifests/product/coverage-service/) — Raw K8s manifests
