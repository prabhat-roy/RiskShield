# siu-service

Service in the **fraud** domain of RiskShield.

**Language:** Go · **Port:** 50141

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/siu-service/](../../../helm/charts/siu-service/) — Helm chart
- [manifests/fraud/siu-service/](../../../manifests/fraud/siu-service/) — Raw K8s manifests
