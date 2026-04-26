# agent-service

Service in the **distribution** domain of RiskShield.

**Language:** Go · **Port:** 50160

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/agent-service/](../../../helm/charts/agent-service/) — Helm chart
- [manifests/distribution/agent-service/](../../../manifests/distribution/agent-service/) — Raw K8s manifests
