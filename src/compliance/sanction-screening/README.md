# sanction-screening

Service in the **compliance** domain of RiskShield.

**Language:** Go · **Port:** 50241

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/sanction-screening/](../../../helm/charts/sanction-screening/) — Helm chart
- [manifests/compliance/sanction-screening/](../../../manifests/compliance/sanction-screening/) — Raw K8s manifests
