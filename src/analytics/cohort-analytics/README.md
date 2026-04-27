# cohort-analytics

Service in the analytics domain of RiskShield.

Language: Go Â· Port: 50302

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/cohort-analytics/](../../../helm/charts/cohort-analytics/) â€” Helm chart
- [manifests/analytics/cohort-analytics/](../../../manifests/analytics/cohort-analytics/) â€” Raw K8s manifests
