# premium-service

Service in the finance domain of RiskShield.

Language: Go Â· Port: 50220

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/premium-service/](../../../helm/charts/premium-service/) â€” Helm chart
- [manifests/finance/premium-service/](../../../manifests/finance/premium-service/) â€” Raw K8s manifests
