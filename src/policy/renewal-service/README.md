# renewal-service

Service in the policy domain of RiskShield.

Language: Go Â· Port: 50042

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/renewal-service/](../../../helm/charts/renewal-service/) â€” Helm chart
- [manifests/policy/renewal-service/](../../../manifests/policy/renewal-service/) â€” Raw K8s manifests
