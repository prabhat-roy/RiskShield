# self-service

Service in the **customer** domain of RiskShield.

**Language:** Go · **Port:** 50182

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/self-service/](../../../helm/charts/self-service/) — Helm chart
- [manifests/customer/self-service/](../../../manifests/customer/self-service/) — Raw K8s manifests
