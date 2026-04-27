# uw-service

Service in the underwriting domain of RiskShield.

Language: Go Â· Port: 50060

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/uw-service/](../../../helm/charts/uw-service/) â€” Helm chart
- [manifests/underwriting/uw-service/](../../../manifests/underwriting/uw-service/) â€” Raw K8s manifests
