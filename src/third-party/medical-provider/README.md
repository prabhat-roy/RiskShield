# medical-provider

Service in the third-party domain of RiskShield.

Language: Go Â· Port: 50261

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/medical-provider/](../../../helm/charts/medical-provider/) â€” Helm chart
- [manifests/third-party/medical-provider/](../../../manifests/third-party/medical-provider/) â€” Raw K8s manifests
