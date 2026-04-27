# broker-service

Service in the distribution domain of RiskShield.

Language: Go Â· Port: 50161

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/broker-service/](../../../helm/charts/broker-service/) â€” Helm chart
- [manifests/distribution/broker-service/](../../../manifests/distribution/broker-service/) â€” Raw K8s manifests
