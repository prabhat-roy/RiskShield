# claim-service

Service in the claims domain of RiskShield.

Language: Go Â· Port: 50080

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/claim-service/](../../../helm/charts/claim-service/) â€” Helm chart
- [manifests/claims/claim-service/](../../../manifests/claims/claim-service/) â€” Raw K8s manifests
