# broker-service

Service in the **distribution** domain of RiskShield.

**Language:** Go · **Port:** 50161

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/broker-service/](../../../helm/charts/broker-service/) — Helm chart
- [manifests/distribution/broker-service/](../../../manifests/distribution/broker-service/) — Raw K8s manifests
