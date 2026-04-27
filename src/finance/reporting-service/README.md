# reporting-service

Service in the finance domain of RiskShield.

Language: Go Â· Port: 50223

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/reporting-service/](../../../helm/charts/reporting-service/) â€” Helm chart
- [manifests/finance/reporting-service/](../../../manifests/finance/reporting-service/) â€” Raw K8s manifests
