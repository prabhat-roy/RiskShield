# link-analysis

Service in the fraud domain of RiskShield.

Language: Go Â· Port: 50142

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/link-analysis/](../../../helm/charts/link-analysis/) â€” Helm chart
- [manifests/fraud/link-analysis/](../../../manifests/fraud/link-analysis/) â€” Raw K8s manifests
