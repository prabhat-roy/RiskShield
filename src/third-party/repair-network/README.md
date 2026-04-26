# repair-network

Service in the **third-party** domain of RiskShield.

**Language:** Go · **Port:** 50260

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/repair-network/](../../../helm/charts/repair-network/) — Helm chart
- [manifests/third-party/repair-network/](../../../manifests/third-party/repair-network/) — Raw K8s manifests
