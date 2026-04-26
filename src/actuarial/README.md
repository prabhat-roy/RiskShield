# actuarial/

Actuarial workbench, pricing engine, reserving, IFRS 17.

| Service | Lang | Port |
|---|---|---|
| actuarial-service | Java    | 50120 |
| pricing-engine    | Haskell | 50121 |
| reserve-service   | Java    | 50122 |
| ifrs17-service    | Haskell | 50123 |

`pricing-engine` and `ifrs17-service` are **pure Haskell** — preserve type safety, no IO.
Reserves and ledger entries are append-only.
