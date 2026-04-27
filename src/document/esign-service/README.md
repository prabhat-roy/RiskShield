# esign-service

Service in the document domain of RiskShield.

Language: Go Â· Port: 50323

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/esign-service/](../../../helm/charts/esign-service/) â€” Helm chart
- [manifests/document/esign-service/](../../../manifests/document/esign-service/) â€” Raw K8s manifests
