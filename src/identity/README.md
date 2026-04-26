# identity/

Identity & access management.

| Service | Lang | Port |
|---|---|---|
| auth-service   | Rust   | 50020 |
| customer-sso   | Rust   | 50021 |
| agent-sso      | Rust   | 50022 |
| mfa-service    | Go     | 50023 |
| rbac-service   | Kotlin | 50024 |

MFA is mandatory for claims adjusters (CLAUDE.md security rule).
