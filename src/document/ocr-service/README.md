# ocr-service

Service in the **document** domain of RiskShield.

**Language:** Go · **Port:** 50321

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/ocr-service/](../../../helm/charts/ocr-service/) — Helm chart
- [manifests/document/ocr-service/](../../../manifests/document/ocr-service/) — Raw K8s manifests
