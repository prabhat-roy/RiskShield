# tpa-gateway

Service in the third-party domain of RiskShield.

Language: Go Â· Port: 50263

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/tpa-gateway/](../../../helm/charts/tpa-gateway/) â€” Helm chart
- [manifests/third-party/tpa-gateway/](../../../manifests/third-party/tpa-gateway/) â€” Raw K8s manifests
