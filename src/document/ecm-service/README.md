# ecm-service

Service in the document domain of RiskShield.

Language: Go Â· Port: 50322

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/ecm-service/](../../../helm/charts/ecm-service/) â€” Helm chart
- [manifests/document/ecm-service/](../../../manifests/document/ecm-service/) â€” Raw K8s manifests
