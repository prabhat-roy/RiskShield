# scoring-service

Service in the **telematics** domain of RiskShield.

**Language:** Go · **Port:** 50283

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/scoring-service/](../../../helm/charts/scoring-service/) — Helm chart
- [manifests/telematics/scoring-service/](../../../manifests/telematics/scoring-service/) — Raw K8s manifests
