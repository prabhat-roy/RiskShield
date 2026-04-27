# ifrs17-service

Service in the actuarial domain of RiskShield.

Language: Go Â· Port: 50123

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/ifrs17-service/](../../../helm/charts/ifrs17-service/) â€” Helm chart
- [manifests/actuarial/ifrs17-service/](../../../manifests/actuarial/ifrs17-service/) â€” Raw K8s manifests
