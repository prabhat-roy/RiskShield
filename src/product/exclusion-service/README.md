# exclusion-service

Service in the product domain of RiskShield.

Language: Go Â· Port: 50202

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/exclusion-service/](../../../helm/charts/exclusion-service/) â€” Helm chart
- [manifests/product/exclusion-service/](../../../manifests/product/exclusion-service/) â€” Raw K8s manifests
