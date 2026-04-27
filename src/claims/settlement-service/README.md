# settlement-service

Service in the claims domain of RiskShield.

Language: Go Â· Port: 50083

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/settlement-service/](../../../helm/charts/settlement-service/) â€” Helm chart
- [manifests/claims/settlement-service/](../../../manifests/claims/settlement-service/) â€” Raw K8s manifests
