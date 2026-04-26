# endorsement-service

Service in the **policy** domain of RiskShield.

**Language:** Go · **Port:** 50041

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/endorsement-service/](../../../helm/charts/endorsement-service/) — Helm chart
- [manifests/policy/endorsement-service/](../../../manifests/policy/endorsement-service/) — Raw K8s manifests
