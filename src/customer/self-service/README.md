# self-service

Service in the customer domain of RiskShield.

Language: Go Â· Port: 50182

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/self-service/](../../../helm/charts/self-service/) â€” Helm chart
- [manifests/customer/self-service/](../../../manifests/customer/self-service/) â€” Raw K8s manifests
