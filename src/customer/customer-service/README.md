# customer-service

Service in the **customer** domain of RiskShield.

**Language:** Go · **Port:** 50180

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/customer-service/](../../../helm/charts/customer-service/) — Helm chart
- [manifests/customer/customer-service/](../../../manifests/customer/customer-service/) — Raw K8s manifests
