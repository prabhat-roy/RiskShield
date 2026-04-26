# document-service

Service in the **customer** domain of RiskShield.

**Language:** Go · **Port:** 50183

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/document-service/](../../../helm/charts/document-service/) — Helm chart
- [manifests/customer/document-service/](../../../manifests/customer/document-service/) — Raw K8s manifests
