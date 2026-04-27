# legal-service

Service in the third-party domain of RiskShield.

Language: Go Â· Port: 50262

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/legal-service/](../../../helm/charts/legal-service/) â€” Helm chart
- [manifests/third-party/legal-service/](../../../manifests/third-party/legal-service/) â€” Raw K8s manifests
