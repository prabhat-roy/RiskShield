# reserve-service

Service in the **actuarial** domain of RiskShield.

**Language:** Go · **Port:** 50122

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/reserve-service/](../../../helm/charts/reserve-service/) — Helm chart
- [manifests/actuarial/reserve-service/](../../../manifests/actuarial/reserve-service/) — Raw K8s manifests
