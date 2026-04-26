# tpa-gateway

Service in the **third-party** domain of RiskShield.

**Language:** Go · **Port:** 50263

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/tpa-gateway/](../../../helm/charts/tpa-gateway/) — Helm chart
- [manifests/third-party/tpa-gateway/](../../../manifests/third-party/tpa-gateway/) — Raw K8s manifests
