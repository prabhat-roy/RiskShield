# nps-service

Service in the **customer** domain of RiskShield.

**Language:** Go · **Port:** 50184

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/nps-service/](../../../helm/charts/nps-service/) — Helm chart
- [manifests/customer/nps-service/](../../../manifests/customer/nps-service/) — Raw K8s manifests
