# telematics/

Telematics & IoT — ingest, gateway, UBI, scoring, event stream.

| Service | Lang | Port |
|---|---|---|
| telematics-ingest    | Go     | 50280 |
| iot-gateway          | Go     | 50281 |
| usage-based-service  | Go     | 50282 |
| telematics-scoring   | Python | 50283 |
| event-stream         | Go     | 50284 |

Telematics archive is in Cassandra (high write throughput, time-series).
