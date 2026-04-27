# solvency-reporting

Service in the compliance domain of RiskShield.

Language: Go Â· Port: 50240

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/solvency-reporting/](../../../helm/charts/solvency-reporting/) â€” Helm chart
- [manifests/compliance/solvency-reporting/](../../../manifests/compliance/solvency-reporting/) â€” Raw K8s manifests
