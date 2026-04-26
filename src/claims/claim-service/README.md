# claim-service

Service in the **claims** domain of RiskShield.

**Language:** Go · **Port:** 50080

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/claim-service/](../../../helm/charts/claim-service/) — Helm chart
- [manifests/claims/claim-service/](../../../manifests/claims/claim-service/) — Raw K8s manifests
