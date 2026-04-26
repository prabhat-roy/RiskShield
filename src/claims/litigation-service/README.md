# litigation-service

Service in the **claims** domain of RiskShield.

**Language:** Go · **Port:** 50084

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/litigation-service/](../../../helm/charts/litigation-service/) — Helm chart
- [manifests/claims/litigation-service/](../../../manifests/claims/litigation-service/) — Raw K8s manifests
