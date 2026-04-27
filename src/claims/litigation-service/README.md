# litigation-service

Service in the claims domain of RiskShield.

Language: Go Â· Port: 50084

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/litigation-service/](../../../helm/charts/litigation-service/) â€” Helm chart
- [manifests/claims/litigation-service/](../../../manifests/claims/litigation-service/) â€” Raw K8s manifests
