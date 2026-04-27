# customer-sso

Service in the identity domain of RiskShield.

Language: Go Â· Port: 50021

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/customer-sso/](../../../helm/charts/customer-sso/) â€” Helm chart
- [manifests/identity/customer-sso/](../../../manifests/identity/customer-sso/) â€” Raw K8s manifests
