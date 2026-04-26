# scoring-service

Service in the **fraud** domain of RiskShield.

**Language:** Go · **Port:** 50143

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/scoring-service/](../../../helm/charts/scoring-service/) — Helm chart
- [manifests/fraud/scoring-service/](../../../manifests/fraud/scoring-service/) — Raw K8s manifests
