# Redis key patterns — RiskShield

| Pattern | TTL | Service | Notes |
|---|---|---|---|
| `session:{session_id}`           | 24h   | session-service | Customer / agent |
| `mfa:{user_id}:totp:{ts}`        | 30s   | mfa-service     |  |
| `rate:{ip}:{path}`               | 60s   | api-gateway     |  |
| `cache:catalog:{key}`            | 10m   | various         |  |
| `sanction:{hash(name+dob)}`      | **4h**| sanction-screening | **Hard cap** — CLAUDE.md: never longer than refresh interval |
| `sanction:list:meta`             | 4h    | sanction-screening | Last refresh timestamp (drift alert if stale) |
| `quote:{quote_id}:state`         | 30m   | quote-service   | Rate engine intermediate state |
| `rate-engine:{product}:{step}`   | 15m   | rating-engine   | Prevents recompute thrash |
| `kyc:result:{customer_hash}`     | 24h   | kyc-service     | OFAC/PEP screening cached |
| `aml:score:{customer_hash}`      | 24h   | aml-service     | Refreshed on event |
| `bordereau:lock:{reinsurer}:{period}` | 1h | bordereau-service | Idempotency lock |
| `pricing-engine:cache:{rate_table_id}` | 12h | pricing-engine | Haskell engine memoisation |
