# iot-gateway

Service in the telematics domain of RiskShield.

Language: Go Â· Port: 50281

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/iot-gateway/](../../../helm/charts/iot-gateway/) â€” Helm chart
- [manifests/telematics/iot-gateway/](../../../manifests/telematics/iot-gateway/) â€” Raw K8s manifests
