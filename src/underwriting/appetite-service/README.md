# appetite-service

Service in the underwriting domain of RiskShield.

Language: Go Â· Port: 50063

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/appetite-service/](../../../helm/charts/appetite-service/) â€” Helm chart
- [manifests/underwriting/appetite-service/](../../../manifests/underwriting/appetite-service/) â€” Raw K8s manifests
