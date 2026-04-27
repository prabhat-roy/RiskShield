# endorsement-service

Service in the policy domain of RiskShield.

Language: Go Â· Port: 50041

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/endorsement-service/](../../../helm/charts/endorsement-service/) â€” Helm chart
- [manifests/policy/endorsement-service/](../../../manifests/policy/endorsement-service/) â€” Raw K8s manifests
