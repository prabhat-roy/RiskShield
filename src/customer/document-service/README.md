# document-service

Service in the customer domain of RiskShield.

Language: Go Â· Port: 50183

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/document-service/](../../../helm/charts/document-service/) â€” Helm chart
- [manifests/customer/document-service/](../../../manifests/customer/document-service/) â€” Raw K8s manifests
