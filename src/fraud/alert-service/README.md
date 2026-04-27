# alert-service

Service in the fraud domain of RiskShield.

Language: Go Â· Port: 50144

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/alert-service/](../../../helm/charts/alert-service/) â€” Helm chart
- [manifests/fraud/alert-service/](../../../manifests/fraud/alert-service/) â€” Raw K8s manifests
