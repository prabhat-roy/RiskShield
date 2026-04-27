# sanction-screening

Service in the compliance domain of RiskShield.

Language: Go Â· Port: 50241

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/sanction-screening/](../../../helm/charts/sanction-screening/) â€” Helm chart
- [manifests/compliance/sanction-screening/](../../../manifests/compliance/sanction-screening/) â€” Raw K8s manifests
