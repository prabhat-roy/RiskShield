# commission-service

Service in the **distribution** domain of RiskShield.

**Language:** Go · **Port:** 50162

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/commission-service/](../../../helm/charts/commission-service/) — Helm chart
- [manifests/distribution/commission-service/](../../../manifests/distribution/commission-service/) — Raw K8s manifests
