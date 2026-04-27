# accounting-service

Service in the finance domain of RiskShield.

Language: Go Â· Port: 50222

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/accounting-service/](../../../helm/charts/accounting-service/) â€” Helm chart
- [manifests/finance/accounting-service/](../../../manifests/finance/accounting-service/) â€” Raw K8s manifests
