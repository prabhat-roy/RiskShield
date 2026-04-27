# reserve-service

Service in the actuarial domain of RiskShield.

Language: Go Â· Port: 50122

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/reserve-service/](../../../helm/charts/reserve-service/) â€” Helm chart
- [manifests/actuarial/reserve-service/](../../../manifests/actuarial/reserve-service/) â€” Raw K8s manifests
