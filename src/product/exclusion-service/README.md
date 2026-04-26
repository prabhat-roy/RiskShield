# exclusion-service

Service in the **product** domain of RiskShield.

**Language:** Go · **Port:** 50202

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/exclusion-service/](../../../helm/charts/exclusion-service/) — Helm chart
- [manifests/product/exclusion-service/](../../../manifests/product/exclusion-service/) — Raw K8s manifests
