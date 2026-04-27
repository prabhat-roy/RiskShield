# agent-service

Service in the distribution domain of RiskShield.

Language: Go Â· Port: 50160

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/agent-service/](../../../helm/charts/agent-service/) â€” Helm chart
- [manifests/distribution/agent-service/](../../../manifests/distribution/agent-service/) â€” Raw K8s manifests
