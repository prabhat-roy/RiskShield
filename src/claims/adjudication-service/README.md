# adjudication-service

Service in the claims domain of RiskShield.

Language: Go Â· Port: 50082

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/adjudication-service/](../../../helm/charts/adjudication-service/) â€” Helm chart
- [manifests/claims/adjudication-service/](../../../manifests/claims/adjudication-service/) â€” Raw K8s manifests
