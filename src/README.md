# src/

Backend service source code, organised per domain (17 domains, 82 services).

```
src/
├── platform/      ← gateway, BFFs, GraphQL
├── identity/      ← auth, SSOs, MFA, RBAC
├── policy/        ← policy admin, endorsement, renewal, cancellation
├── underwriting/  ← UW, risk, rating engine (Haskell), appetite, referral
├── claims/        ← claim, FNOL, adjudication, settlement, litigation
├── reinsurance/   ← treaty, facultative, cession, bordereau
├── actuarial/     ← actuarial, pricing engine (Haskell), reserve, IFRS 17 (Haskell)
├── fraud/         ← fraud, SIU, link analysis, scoring, alert
├── distribution/  ← agent, broker, commission, MGA, channel
├── customer/      ← customer, quote, self-service, document, NPS
├── product/       ← product, coverage, exclusion, wording, form
├── finance/       ← premium, payment, bordereaux, accounting, reporting
├── compliance/    ← compliance, solvency, sanction-screening, KYC, AML
├── third-party/   ← repair, medical (FHIR), legal, TPA, data vendor
├── telematics/    ← ingest, IoT, UBI, scoring, event stream
├── analytics/     ← loss, profitability, cohort, CTR
└── document/      ← document, OCR, ECM, eSign (Rust), archive
```

Each service is self-contained: `Dockerfile`, `Makefile`, `.env.example`, `README.md`, `/healthz`, `/metrics`.
