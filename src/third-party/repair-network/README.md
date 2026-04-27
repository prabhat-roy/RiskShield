# repair-network

Service in the third-party domain of RiskShield.

Language: Go Â· Port: 50260

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/repair-network/](../../../helm/charts/repair-network/) â€” Helm chart
- [manifests/third-party/repair-network/](../../../manifests/third-party/repair-network/) â€” Raw K8s manifests
