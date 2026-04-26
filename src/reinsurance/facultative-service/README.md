# facultative-service

Service in the **reinsurance** domain of RiskShield.

**Language:** Go · **Port:** 50101

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/facultative-service/](../../../helm/charts/facultative-service/) — Helm chart
- [manifests/reinsurance/facultative-service/](../../../manifests/reinsurance/facultative-service/) — Raw K8s manifests
