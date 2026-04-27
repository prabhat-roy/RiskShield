# referral-service

Service in the underwriting domain of RiskShield.

Language: Go Â· Port: 50064

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/referral-service/](../../../helm/charts/referral-service/) â€” Helm chart
- [manifests/underwriting/referral-service/](../../../manifests/underwriting/referral-service/) â€” Raw K8s manifests
