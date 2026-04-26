# telematics-service

Service in the **telematics** domain of RiskShield.

**Language:** Go · **Port:** 50280

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/telematics-service/](../../../helm/charts/telematics-service/) — Helm chart
- [manifests/telematics/telematics-service/](../../../manifests/telematics/telematics-service/) — Raw K8s manifests
