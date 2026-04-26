# adjudication-service

Service in the **claims** domain of RiskShield.

**Language:** Go · **Port:** 50082

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/adjudication-service/](../../../helm/charts/adjudication-service/) — Helm chart
- [manifests/claims/adjudication-service/](../../../manifests/claims/adjudication-service/) — Raw K8s manifests
