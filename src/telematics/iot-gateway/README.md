# iot-gateway

Service in the **telematics** domain of RiskShield.

**Language:** Go · **Port:** 50281

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/iot-gateway/](../../../helm/charts/iot-gateway/) — Helm chart
- [manifests/telematics/iot-gateway/](../../../manifests/telematics/iot-gateway/) — Raw K8s manifests
