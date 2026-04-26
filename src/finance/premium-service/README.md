# premium-service

Service in the **finance** domain of RiskShield.

**Language:** Go · **Port:** 50220

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/premium-service/](../../../helm/charts/premium-service/) — Helm chart
- [manifests/finance/premium-service/](../../../manifests/finance/premium-service/) — Raw K8s manifests
