# Health check for all critical services
GET https://riskshield.internal/healthz
HTTP 200
[Asserts]
jsonpath "$.status" == "ok"

GET https://api.riskshield.internal/healthz
HTTP 200
[Asserts]
jsonpath "$.status" == "ok"
