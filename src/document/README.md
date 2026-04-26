# document/

Document management — orchestrator, OCR, ECM, eSign (Rust), archive.

| Service | Lang | Port |
|---|---|---|
| document-service | Node   | 50320 |
| ocr-service      | Python | 50321 |
| ecm-service      | Node   | 50322 |
| esign-service    | Rust   | 50323 |
| archive-service  | Node   | 50324 |

`esign-service` handles cryptographic signing — Rust for memory safety.
