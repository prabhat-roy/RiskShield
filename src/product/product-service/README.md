# product-service

Service in the product domain of RiskShield.

Language: Go Â· Port: 50200

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/product-service/](../../../helm/charts/product-service/) â€” Helm chart
- [manifests/product/product-service/](../../../manifests/product/product-service/) â€” Raw K8s manifests
