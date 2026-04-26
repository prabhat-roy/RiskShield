# form-service

Service in the **product** domain of RiskShield.

**Language:** Go · **Port:** 50204

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/form-service/](../../../helm/charts/form-service/) — Helm chart
- [manifests/product/form-service/](../../../manifests/product/form-service/) — Raw K8s manifests
