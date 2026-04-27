# mga-service

Service in the distribution domain of RiskShield.

Language: Go Â· Port: 50163

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/mga-service/](../../../helm/charts/mga-service/) â€” Helm chart
- [manifests/distribution/mga-service/](../../../manifests/distribution/mga-service/) â€” Raw K8s manifests
