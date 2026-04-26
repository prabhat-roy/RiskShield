# appetite-service

Service in the **underwriting** domain of RiskShield.

**Language:** Go · **Port:** 50063

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/appetite-service/](../../../helm/charts/appetite-service/) — Helm chart
- [manifests/underwriting/appetite-service/](../../../manifests/underwriting/appetite-service/) — Raw K8s manifests
