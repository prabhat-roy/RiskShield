# archive-service

Service in the document domain of RiskShield.

Language: Go Â· Port: 50324

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/archive-service/](../../../helm/charts/archive-service/) â€” Helm chart
- [manifests/document/archive-service/](../../../manifests/document/archive-service/) â€” Raw K8s manifests
