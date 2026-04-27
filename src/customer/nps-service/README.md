# nps-service

Service in the customer domain of RiskShield.

Language: Go Â· Port: 50184

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/nps-service/](../../../helm/charts/nps-service/) â€” Helm chart
- [manifests/customer/nps-service/](../../../manifests/customer/nps-service/) â€” Raw K8s manifests
