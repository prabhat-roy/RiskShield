# kyc-service

Service in the compliance domain of RiskShield.

Language: Go Â· Port: 50242

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/kyc-service/](../../../helm/charts/kyc-service/) â€” Helm chart
- [manifests/compliance/kyc-service/](../../../manifests/compliance/kyc-service/) â€” Raw K8s manifests
