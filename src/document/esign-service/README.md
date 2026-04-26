# esign-service

Service in the **document** domain of RiskShield.

**Language:** Go · **Port:** 50323

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/esign-service/](../../../helm/charts/esign-service/) — Helm chart
- [manifests/document/esign-service/](../../../manifests/document/esign-service/) — Raw K8s manifests
