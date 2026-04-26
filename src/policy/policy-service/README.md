# policy-service

Service in the **policy** domain of RiskShield.

**Language:** Go · **Port:** 50040

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/policy-service/](../../../helm/charts/policy-service/) — Helm chart
- [manifests/policy/policy-service/](../../../manifests/policy/policy-service/) — Raw K8s manifests
