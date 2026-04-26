# uw-service

Service in the **underwriting** domain of RiskShield.

**Language:** Go · **Port:** 50060

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/uw-service/](../../../helm/charts/uw-service/) — Helm chart
- [manifests/underwriting/uw-service/](../../../manifests/underwriting/uw-service/) — Raw K8s manifests
