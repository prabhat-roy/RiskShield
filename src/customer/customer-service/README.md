# customer-service

Service in the customer domain of RiskShield.

Language: Go Â· Port: 50180

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/customer-service/](../../../helm/charts/customer-service/) â€” Helm chart
- [manifests/customer/customer-service/](../../../manifests/customer/customer-service/) â€” Raw K8s manifests
