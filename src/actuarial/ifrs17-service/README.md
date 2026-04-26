# ifrs17-service

Service in the **actuarial** domain of RiskShield.

**Language:** Go · **Port:** 50123

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/ifrs17-service/](../../../helm/charts/ifrs17-service/) — Helm chart
- [manifests/actuarial/ifrs17-service/](../../../manifests/actuarial/ifrs17-service/) — Raw K8s manifests
