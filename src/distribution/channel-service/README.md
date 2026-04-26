# channel-service

Service in the **distribution** domain of RiskShield.

**Language:** Go · **Port:** 50164

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/channel-service/](../../../helm/charts/channel-service/) — Helm chart
- [manifests/distribution/channel-service/](../../../manifests/distribution/channel-service/) — Raw K8s manifests
