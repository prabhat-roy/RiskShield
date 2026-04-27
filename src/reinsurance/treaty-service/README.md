# treaty-service

Service in the reinsurance domain of RiskShield.

Language: Go Â· Port: 50100

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/treaty-service/](../../../helm/charts/treaty-service/) â€” Helm chart
- [manifests/reinsurance/treaty-service/](../../../manifests/reinsurance/treaty-service/) â€” Raw K8s manifests
