# quote-service

Service in the **customer** domain of RiskShield.

**Language:** Go · **Port:** 50181

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/quote-service/](../../../helm/charts/quote-service/) — Helm chart
- [manifests/customer/quote-service/](../../../manifests/customer/quote-service/) — Raw K8s manifests
