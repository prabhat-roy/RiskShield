# referral-service

Service in the **underwriting** domain of RiskShield.

**Language:** Go · **Port:** 50064

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/referral-service/](../../../helm/charts/referral-service/) — Helm chart
- [manifests/underwriting/referral-service/](../../../manifests/underwriting/referral-service/) — Raw K8s manifests
