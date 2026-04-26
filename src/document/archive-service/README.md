# archive-service

Service in the **document** domain of RiskShield.

**Language:** Go · **Port:** 50324

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/archive-service/](../../../helm/charts/archive-service/) — Helm chart
- [manifests/document/archive-service/](../../../manifests/document/archive-service/) — Raw K8s manifests
