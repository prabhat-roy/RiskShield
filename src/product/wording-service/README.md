# wording-service

Service in the product domain of RiskShield.

Language: Go Â· Port: 50203

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/wording-service/](../../../helm/charts/wording-service/) â€” Helm chart
- [manifests/product/wording-service/](../../../manifests/product/wording-service/) â€” Raw K8s manifests
