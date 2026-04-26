# pricing-engine

Service in the **actuarial** domain of RiskShield.

**Language:** Go · **Port:** 50121

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/pricing-engine/](../../../helm/charts/pricing-engine/) — Helm chart
- [manifests/actuarial/pricing-engine/](../../../manifests/actuarial/pricing-engine/) — Raw K8s manifests
