# product-service

Service in the **product** domain of RiskShield.

**Language:** Go · **Port:** 50200

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/product-service/](../../../helm/charts/product-service/) — Helm chart
- [manifests/product/product-service/](../../../manifests/product/product-service/) — Raw K8s manifests
