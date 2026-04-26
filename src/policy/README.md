# policy/

Policy administration system (PAS) core.

| Service | Lang | Port |
|---|---|---|
| policy-service        | Java | 50040 |
| endorsement-service   | Java | 50041 |
| renewal-service       | Java | 50042 |
| cancellation-service  | Java | 50043 |

Blue-green deployments only — no canary on policy admin (CLAUDE.md rule).
