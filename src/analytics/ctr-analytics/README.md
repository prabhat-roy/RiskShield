# ctr-analytics

Service in the analytics domain of RiskShield.

Language: Go Â· Port: 50303

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/ctr-analytics/](../../../helm/charts/ctr-analytics/) â€” Helm chart
- [manifests/analytics/ctr-analytics/](../../../manifests/analytics/ctr-analytics/) â€” Raw K8s manifests
