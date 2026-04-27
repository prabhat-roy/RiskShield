# ocr-service

Service in the document domain of RiskShield.

Language: Go Â· Port: 50321

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/ocr-service/](../../../helm/charts/ocr-service/) â€” Helm chart
- [manifests/document/ocr-service/](../../../manifests/document/ocr-service/) â€” Raw K8s manifests
