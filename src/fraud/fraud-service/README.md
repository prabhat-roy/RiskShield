# fraud-service

Service in the **fraud** domain of RiskShield.

**Language:** Go · **Port:** 50140

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/fraud-service/](../../../helm/charts/fraud-service/) — Helm chart
- [manifests/fraud/fraud-service/](../../../manifests/fraud/fraud-service/) — Raw K8s manifests
