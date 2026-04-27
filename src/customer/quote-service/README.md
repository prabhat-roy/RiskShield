# quote-service

Service in the customer domain of RiskShield.

Language: Go Â· Port: 50181

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/quote-service/](../../../helm/charts/quote-service/) â€” Helm chart
- [manifests/customer/quote-service/](../../../manifests/customer/quote-service/) â€” Raw K8s manifests
