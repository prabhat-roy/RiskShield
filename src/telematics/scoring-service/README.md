# scoring-service

Service in the telematics domain of RiskShield.

Language: Go Â· Port: 50283

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/scoring-service/](../../../helm/charts/scoring-service/) â€” Helm chart
- [manifests/telematics/scoring-service/](../../../manifests/telematics/scoring-service/) â€” Raw K8s manifests
