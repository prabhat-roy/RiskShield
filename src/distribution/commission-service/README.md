# commission-service

Service in the distribution domain of RiskShield.

Language: Go Â· Port: 50162

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/commission-service/](../../../helm/charts/commission-service/) â€” Helm chart
- [manifests/distribution/commission-service/](../../../manifests/distribution/commission-service/) â€” Raw K8s manifests
