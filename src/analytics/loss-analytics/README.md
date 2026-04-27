# loss-analytics

Service in the analytics domain of RiskShield.

Language: Go Â· Port: 50300

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/loss-analytics/](../../../helm/charts/loss-analytics/) â€” Helm chart
- [manifests/analytics/loss-analytics/](../../../manifests/analytics/loss-analytics/) â€” Raw K8s manifests
