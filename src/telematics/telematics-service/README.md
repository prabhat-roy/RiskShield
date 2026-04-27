# telematics-service

Service in the telematics domain of RiskShield.

Language: Go Â· Port: 50280

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/telematics-service/](../../../helm/charts/telematics-service/) â€” Helm chart
- [manifests/telematics/telematics-service/](../../../manifests/telematics/telematics-service/) â€” Raw K8s manifests
