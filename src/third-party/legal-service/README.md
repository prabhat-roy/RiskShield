# legal-service

Service in the **third-party** domain of RiskShield.

**Language:** Go · **Port:** 50262

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/legal-service/](../../../helm/charts/legal-service/) — Helm chart
- [manifests/third-party/legal-service/](../../../manifests/third-party/legal-service/) — Raw K8s manifests
