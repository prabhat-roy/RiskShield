# treaty-service

Service in the **reinsurance** domain of RiskShield.

**Language:** Go · **Port:** 50100

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/treaty-service/](../../../helm/charts/treaty-service/) — Helm chart
- [manifests/reinsurance/treaty-service/](../../../manifests/reinsurance/treaty-service/) — Raw K8s manifests
