# fraud-service

Service in the fraud domain of RiskShield.

Language: Go Â· Port: 50140

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/fraud-service/](../../../helm/charts/fraud-service/) â€” Helm chart
- [manifests/fraud/fraud-service/](../../../manifests/fraud/fraud-service/) â€” Raw K8s manifests
