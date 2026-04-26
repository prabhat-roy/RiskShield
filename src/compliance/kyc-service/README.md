# kyc-service

Service in the **compliance** domain of RiskShield.

**Language:** Go · **Port:** 50242

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/kyc-service/](../../../helm/charts/kyc-service/) — Helm chart
- [manifests/compliance/kyc-service/](../../../manifests/compliance/kyc-service/) — Raw K8s manifests
