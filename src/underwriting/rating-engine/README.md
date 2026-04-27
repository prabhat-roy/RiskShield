# rating-engine

Service in the underwriting domain of RiskShield.

Language: Go Â· Port: 50062

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/rating-engine/](../../../helm/charts/rating-engine/) â€” Helm chart
- [manifests/underwriting/rating-engine/](../../../manifests/underwriting/rating-engine/) â€” Raw K8s manifests
