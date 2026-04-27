# aml-service

Service in the compliance domain of RiskShield.

Language: Go Â· Port: 50243

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/aml-service/](../../../helm/charts/aml-service/) â€” Helm chart
- [manifests/compliance/aml-service/](../../../manifests/compliance/aml-service/) â€” Raw K8s manifests
