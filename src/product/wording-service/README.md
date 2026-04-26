# wording-service

Service in the **product** domain of RiskShield.

**Language:** Go · **Port:** 50203

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/wording-service/](../../../helm/charts/wording-service/) — Helm chart
- [manifests/product/wording-service/](../../../manifests/product/wording-service/) — Raw K8s manifests
