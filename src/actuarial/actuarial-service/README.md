# actuarial-service

Service in the **actuarial** domain of RiskShield.

**Language:** Go · **Port:** 50120

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/actuarial-service/](../../../helm/charts/actuarial-service/) — Helm chart
- [manifests/actuarial/actuarial-service/](../../../manifests/actuarial/actuarial-service/) — Raw K8s manifests
