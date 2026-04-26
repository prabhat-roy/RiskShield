# risk-assessment

Service in the **underwriting** domain of RiskShield.

**Language:** Go · **Port:** 50061

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/risk-assessment/](../../../helm/charts/risk-assessment/) — Helm chart
- [manifests/underwriting/risk-assessment/](../../../manifests/underwriting/risk-assessment/) — Raw K8s manifests
