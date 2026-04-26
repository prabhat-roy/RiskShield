# settlement-service

Service in the **claims** domain of RiskShield.

**Language:** Go · **Port:** 50083

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/settlement-service/](../../../helm/charts/settlement-service/) — Helm chart
- [manifests/claims/settlement-service/](../../../manifests/claims/settlement-service/) — Raw K8s manifests
