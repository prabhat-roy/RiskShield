# mfa-service

Service in the **identity** domain of RiskShield.

**Language:** Go · **Port:** 50023

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/mfa-service/](../../../helm/charts/mfa-service/) — Helm chart
- [manifests/identity/mfa-service/](../../../manifests/identity/mfa-service/) — Raw K8s manifests
