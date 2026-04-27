# scoring-service

Service in the fraud domain of RiskShield.

Language: Go Â· Port: 50143

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/scoring-service/](../../../helm/charts/scoring-service/) â€” Helm chart
- [manifests/fraud/scoring-service/](../../../manifests/fraud/scoring-service/) â€” Raw K8s manifests
