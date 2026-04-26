# link-analysis

Service in the **fraud** domain of RiskShield.

**Language:** Go · **Port:** 50142

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/link-analysis/](../../../helm/charts/link-analysis/) — Helm chart
- [manifests/fraud/link-analysis/](../../../manifests/fraud/link-analysis/) — Raw K8s manifests
