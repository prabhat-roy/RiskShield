# customer-sso

Service in the **identity** domain of RiskShield.

**Language:** Go · **Port:** 50021

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/customer-sso/](../../../helm/charts/customer-sso/) — Helm chart
- [manifests/identity/customer-sso/](../../../manifests/identity/customer-sso/) — Raw K8s manifests
