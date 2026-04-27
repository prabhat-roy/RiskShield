# mfa-service

Service in the identity domain of RiskShield.

Language: Go Â· Port: 50023

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/mfa-service/](../../../helm/charts/mfa-service/) â€” Helm chart
- [manifests/identity/mfa-service/](../../../manifests/identity/mfa-service/) â€” Raw K8s manifests
