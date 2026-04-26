# renewal-service

Service in the **policy** domain of RiskShield.

**Language:** Go · **Port:** 50042

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/renewal-service/](../../../helm/charts/renewal-service/) — Helm chart
- [manifests/policy/renewal-service/](../../../manifests/policy/renewal-service/) — Raw K8s manifests
