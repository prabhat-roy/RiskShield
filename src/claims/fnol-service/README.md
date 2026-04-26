# fnol-service

Service in the **claims** domain of RiskShield.

**Language:** Go · **Port:** 50081

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/fnol-service/](../../../helm/charts/fnol-service/) — Helm chart
- [manifests/claims/fnol-service/](../../../manifests/claims/fnol-service/) — Raw K8s manifests
