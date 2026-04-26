# usage-based

Service in the **telematics** domain of RiskShield.

**Language:** Go · **Port:** 50282

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/usage-based/](../../../helm/charts/usage-based/) — Helm chart
- [manifests/telematics/usage-based/](../../../manifests/telematics/usage-based/) — Raw K8s manifests
