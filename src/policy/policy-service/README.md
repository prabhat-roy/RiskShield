# policy-service

Service in the policy domain of RiskShield.

Language: Go Â· Port: 50040

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/policy-service/](../../../helm/charts/policy-service/) â€” Helm chart
- [manifests/policy/policy-service/](../../../manifests/policy/policy-service/) â€” Raw K8s manifests
