# alert-service

Service in the **fraud** domain of RiskShield.

**Language:** Go · **Port:** 50144

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/alert-service/](../../../helm/charts/alert-service/) — Helm chart
- [manifests/fraud/alert-service/](../../../manifests/fraud/alert-service/) — Raw K8s manifests
