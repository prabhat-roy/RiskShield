# cession-service

Service in the reinsurance domain of RiskShield.

Language: Go Â· Port: 50102

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/cession-service/](../../../helm/charts/cession-service/) â€” Helm chart
- [manifests/reinsurance/cession-service/](../../../manifests/reinsurance/cession-service/) â€” Raw K8s manifests
