# channel-service

Service in the distribution domain of RiskShield.

Language: Go Â· Port: 50164

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/channel-service/](../../../helm/charts/channel-service/) â€” Helm chart
- [manifests/distribution/channel-service/](../../../manifests/distribution/channel-service/) â€” Raw K8s manifests
