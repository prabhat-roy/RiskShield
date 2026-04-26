# mga-service

Service in the **distribution** domain of RiskShield.

**Language:** Go · **Port:** 50163

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/mga-service/](../../../helm/charts/mga-service/) — Helm chart
- [manifests/distribution/mga-service/](../../../manifests/distribution/mga-service/) — Raw K8s manifests
