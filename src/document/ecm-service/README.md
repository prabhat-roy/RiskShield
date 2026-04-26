# ecm-service

Service in the **document** domain of RiskShield.

**Language:** Go · **Port:** 50322

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/ecm-service/](../../../helm/charts/ecm-service/) — Helm chart
- [manifests/document/ecm-service/](../../../manifests/document/ecm-service/) — Raw K8s manifests
