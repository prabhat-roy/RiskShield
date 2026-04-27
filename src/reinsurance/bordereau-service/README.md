# bordereau-service

Service in the reinsurance domain of RiskShield.

Language: Go Â· Port: 50103

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/bordereau-service/](../../../helm/charts/bordereau-service/) â€” Helm chart
- [manifests/reinsurance/bordereau-service/](../../../manifests/reinsurance/bordereau-service/) â€” Raw K8s manifests
