# rating-engine

Service in the **underwriting** domain of RiskShield.

**Language:** Go · **Port:** 50062

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/rating-engine/](../../../helm/charts/rating-engine/) — Helm chart
- [manifests/underwriting/rating-engine/](../../../manifests/underwriting/rating-engine/) — Raw K8s manifests
