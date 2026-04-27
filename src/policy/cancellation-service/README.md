# cancellation-service

Service in the policy domain of RiskShield.

Language: Go Â· Port: 50043

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/cancellation-service/](../../../helm/charts/cancellation-service/) â€” Helm chart
- [manifests/policy/cancellation-service/](../../../manifests/policy/cancellation-service/) â€” Raw K8s manifests
