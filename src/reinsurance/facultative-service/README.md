# facultative-service

Service in the reinsurance domain of RiskShield.

Language: Go Â· Port: 50101

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/facultative-service/](../../../helm/charts/facultative-service/) â€” Helm chart
- [manifests/reinsurance/facultative-service/](../../../manifests/reinsurance/facultative-service/) â€” Raw K8s manifests
