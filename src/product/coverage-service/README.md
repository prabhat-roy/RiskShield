# coverage-service

Service in the product domain of RiskShield.

Language: Go Â· Port: 50201

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/coverage-service/](../../../helm/charts/coverage-service/) â€” Helm chart
- [manifests/product/coverage-service/](../../../manifests/product/coverage-service/) â€” Raw K8s manifests
