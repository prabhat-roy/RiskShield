# medical-provider

Service in the **third-party** domain of RiskShield.

**Language:** Go · **Port:** 50261

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/medical-provider/](../../../helm/charts/medical-provider/) — Helm chart
- [manifests/third-party/medical-provider/](../../../manifests/third-party/medical-provider/) — Raw K8s manifests
