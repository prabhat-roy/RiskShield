# fnol-service

Service in the claims domain of RiskShield.

Language: Go Â· Port: 50081

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/fnol-service/](../../../helm/charts/fnol-service/) â€” Helm chart
- [manifests/claims/fnol-service/](../../../manifests/claims/fnol-service/) â€” Raw K8s manifests
