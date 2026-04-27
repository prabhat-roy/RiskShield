# agent-sso

Service in the identity domain of RiskShield.

Language: Go Â· Port: 50022

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/agent-sso/](../../../helm/charts/agent-sso/) â€” Helm chart
- [manifests/identity/agent-sso/](../../../manifests/identity/agent-sso/) â€” Raw K8s manifests
