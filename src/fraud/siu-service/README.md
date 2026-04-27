# siu-service

Service in the fraud domain of RiskShield.

Language: Go Â· Port: 50141

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/siu-service/](../../../helm/charts/siu-service/) â€” Helm chart
- [manifests/fraud/siu-service/](../../../manifests/fraud/siu-service/) â€” Raw K8s manifests
