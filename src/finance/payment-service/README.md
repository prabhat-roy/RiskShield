# payment-service

Service in the finance domain of RiskShield.

Language: Go Â· Port: 50221

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/payment-service/](../../../helm/charts/payment-service/) â€” Helm chart
- [manifests/finance/payment-service/](../../../manifests/finance/payment-service/) â€” Raw K8s manifests
