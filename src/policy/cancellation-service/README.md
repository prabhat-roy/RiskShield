# cancellation-service

Service in the **policy** domain of RiskShield.

**Language:** Go · **Port:** 50043

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/cancellation-service/](../../../helm/charts/cancellation-service/) — Helm chart
- [manifests/policy/cancellation-service/](../../../manifests/policy/cancellation-service/) — Raw K8s manifests
