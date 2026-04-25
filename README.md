# RiskShield — Enterprise Insurance & Risk Management Platform

Enterprise-grade, cloud-native insurance platform built on open source technologies. Covers
the full insurance value chain — policy administration, underwriting, claims management, reinsurance,
actuarial analytics, fraud detection, distribution management, and regulatory compliance — designed
for P&C insurers, life & health carriers, reinsurers, MGAs, and insurtech companies. Compliant
with Solvency II, IFRS 17, and Lloyd's standards.

---

## Overview

| Attribute         | Value                                                              |
|-------------------|--------------------------------------------------------------------|
| Type              | PAS · Claims TPA · Underwriting · Actuarial · Insurtech            |
| Domains           | 17 business domains                                                |
| Services          | 185+ microservices                                                 |
| Languages         | Go, Java, Kotlin, Python, Scala, R (actuarial), Node.js, Rust      |
| Standards         | ACORD, XBRL, HL7 FHIR (health), ISO 20022, Lloyd's messaging       |
| Compliance        | Solvency II, IFRS 17, GDPR, CCPA, FCA/PRA (UK), NAIC (US)        |
| Databases         | PostgreSQL, MongoDB, Cassandra, Redis, Elasticsearch, ClickHouse   |
| Message Broker    | Apache Kafka, RabbitMQ, NATS JetStream                             |
| Cloud             | AWS (primary), Azure (secondary), on-premise (actuarial workloads) |
| Orchestration     | Kubernetes (EKS / AKS)                                             |
| Frontend          | React (claims portal), Angular (underwriting), Next.js (customer), Flutter (mobile) |

---

## Business Domains

| # | Domain                    | Key Services                                                           |
|---|---------------------------|------------------------------------------------------------------------|
| 1 | Policy Administration     | policy-service, endorsement-service, renewal-service, cancellation    |
| 2 | Underwriting              | uw-service, risk-assessment, rating-engine, appetite-service, referral |
| 3 | Claims Management         | claim-service, fnol-service, adjudication, settlement, litigation      |
| 4 | Reinsurance               | ri-service, treaty-service, facultative, cession-service, bordereau   |
| 5 | Actuarial & Pricing       | actuarial-service, pricing-engine, reserve-service, ifrs17-service    |
| 6 | Fraud Detection           | fraud-service, siu-service, link-analysis, scoring-service, alert     |
| 7 | Distribution              | agent-service, broker-service, commission, mga-service, channel       |
| 8 | Customer Portal           | customer-service, quote-service, self-service, document, nps          |
| 9 | Product Management        | product-service, coverage-service, exclusion-service, wording, form   |
| 10 | Finance & Accounting      | premium-service, payment-service, bordereaux, accounting, reporting    |
| 11 | Compliance & Regulatory   | compliance-service, solvency-reporting, sanction-screening, kyc, aml  |
| 12 | Third-Party Integration   | repair-network, medical-provider, legal-service, tpa-gateway, data    |
| 13 | Telematics & IoT          | telematics-service, iot-gateway, usage-based, scoring, event-stream   |
| 14 | Analytics & BI            | loss-analytics, profitability-analytics, ctr-analytics, cohort        |
| 15 | Document Management       | document-service, ocr-service, ecm-service, esign-service, archive    |
| 16 | Identity & Access         | auth-service, customer-sso, agent-sso, mfa, rbac-service              |
| 17 | Platform                  | api-gateway, customer-bff, agent-bff, claims-bff, graphql-gateway     |

---

## Architecture

```
    ┌──────────────────────────────────────────────────────────────────┐
    │                        API Gateway                               │
    │          (OAuth2 · mTLS · Rate Limit · Fraud Gate)               │
    └────┬──────────────┬──────────────┬────────────────┬──────────────┘
         │              │              │                │
  ┌──────▼──┐    ┌──────▼──┐   ┌──────▼──┐     ┌──────▼──┐
  │Customer │    │  Agent  │   │ Claims  │     │  UW     │
  │ Portal  │    │ Portal  │   │ Portal  │     │ Portal  │
  │(Next.js)│    │(Angular)│   │ (React) │     │(Angular)│
  └──────┬──┘    └──────┬──┘   └──────┬──┘     └──────┬──┘
         └──────────────┴──────────────┴────────────────┘
                                │ gRPC (Istio mTLS)
    ┌───────────────────────────▼────────────────────────────────────┐
    │                Internal gRPC Mesh (Istio mTLS)                 │
    │  ┌──────────┐  ┌────────────┐  ┌────────────┐  ┌────────────┐  │
    │  │  Policy  │  │   Claims   │  │Underwriting│  │ Actuarial  │  │
    │  │  Admin   │  │ Management │  │  Engine    │  │ & Pricing  │  │
    │  └──────────┘  └────────────┘  └────────────┘  └────────────┘  │
    └──────────────────────┬─────────────────────────────────────────┘
                           │ Kafka (Insurance Events)
          ┌────────────────┼────────────────┐
          │                │                │
 ┌────────▼──────┐ ┌───────▼────────┐ ┌────▼──────────────────┐
 │  Fraud        │ │  Reinsurance   │ │  Analytics Platform   │
 │  Detection    │ │  Bordereau     │ │  ClickHouse + Spark   │
 │  (ML + graph) │ │  Processing    │ │  Airflow + Superset   │
 └───────────────┘ └────────────────┘ └───────────────────────┘
```

---

## Tech Stack

### Insurance Standards & Protocols
- **ACORD**: Insurance industry data standards — policy, claims, and reinsurance XML/JSON message formats
- **XBRL**: Regulatory financial reporting (Solvency II, IFRS 17 QRT submissions to regulators)
- **HL7 FHIR R4**: Health insurance — clinical data exchange for medical claims, pre-auth, and UM
- **ISO 20022**: Premium payment and settlement messaging (SEPA, SWIFT integration)
- **Lloyd's**: Lloyd's of London electronic placement standards (PPL — Placing Platform Limited)

### Infrastructure
- **Kubernetes**: EKS + AKS — multi-region for regulatory data residency
- **Actuarial Workloads**: R + Python (actuarial triangle models, GLMs, reserving) on GPU-backed Kubernetes jobs
- **Document Processing**: Apache Tika + OCR (Tesseract) — automated claims document extraction
- **Graph DB**: Neo4j — fraud link analysis (shared addresses, phone numbers, bank accounts across claims)
- **Search**: Elasticsearch — policy and claims full-text search across 10M+ records

### CI/CD & GitOps
- **CI**: Jenkins (primary), GitHub Actions, GitLab CI
- **CD**: ArgoCD (App-of-Apps), Argo Rollouts (blue-green for rating engine — no partial rollback on live quotes)
- **IaC**: Terraform (EKS/AKS + multi-region), Crossplane, Ansible
- **Secrets**: HashiCorp Vault (signing keys for policy documents, payment credentials)

### Observability
- **Metrics**: Prometheus + Grafana (claim cycle time, underwriting decision latency, fraud detection rate)
- **Logs**: Loki + Fluent Bit (PII masked — GDPR/CCPA compliance for policyholder data)
- **Traces**: Jaeger + OpenTelemetry (trace claim from FNOL → adjudication → payment → closure)
- **Regulatory Dashboard**: IFRS 17 liability-of-remaining coverage waterfall, Solvency II SCR/MCR trend
- **SLOs**: FNOL acknowledgement < 5min, quote generation < 3s, claim payment STP rate > 70%

### Security (Solvency II + GDPR)
- **Identity**: Keycloak (customer SSO + social login, agent SAML federation), MFA mandatory for claims adjusters
- **Data Classification**: Policyholder PII, medical data, financial data — field-level encryption and access control
- **Sanction Screening**: Real-time OFAC/EU sanctions check on all new policies and claims (OFAC SDN list)
- **Network**: Cilium eBPF, Istio mTLS, Coraza WAF
- **Audit**: Immutable audit log for every underwriting decision and claims payment (regulatory requirement)

### AI / ML (Insurance Intelligence)
- **Fraud Detection**: Graph neural network (GNN) on claims network + anomaly detection — identifies organised fraud rings
- **Straight-Through Processing (STP)**: ML classifier routes simple claims to automated payment (no human touch)
- **Underwriting AI**: Gradient Boosting on risk factors — automated risk scoring and appetite decision for SME risks
- **Telematics Pricing**: Usage-based insurance (UBI) — real-time driving behaviour scoring for motor policies
- **Loss Reserving**: Bayesian chain-ladder model — IBNR reserve estimation with uncertainty quantification
- **Churn Prediction**: Survival analysis on renewal behaviour — triggers retention pricing and outreach
- **Document AI**: NLP on claims documents (police reports, medical records) — key entity extraction, liability assessment

---

## Key Design Decisions

1. **Rating engine immutability**: Every rating calculation stored with full input/output snapshot — regulatory and audit requirement; enables back-testing new rates without affecting historical quotes
2. **IFRS 17 compliance by design**: Policy cash flow projections stored at contract level — Contractual Service Margin (CSM) tracked event-sourced; no month-end reconciliation needed
3. **Fraud graph at claim time**: Neo4j fraud link analysis runs at FNOL intake — flags suspicious patterns before any payment is authorised, not in batch overnight
4. **Reinsurance bordereau automation**: Cession calculations run automatically when a claim is settled — generates treaty and facultative bordereau entries via event-driven pipeline
5. **Actuarial model versioning**: R/Python actuarial models versioned in MLflow — production pricing uses approved model version; new models shadow-run before promotion
6. **Multi-jurisdiction compliance**: Solvency II (EU), NAIC RBC (US), IRDAI (India) rules configured per entity — single policy admin system serves all regulatory regimes

---

## Compliance Controls

| Standard          | Implementation                                                         |
|-------------------|------------------------------------------------------------------------|
| Solvency II       | SCR/MCR calculation, QRT reporting, ORSA, risk register                |
| IFRS 17           | CSM tracking, coverage unit allocation, loss component, PAA eligibility |
| GDPR / CCPA       | Policyholder consent, right to erasure, data minimisation              |
| FCA / PRA (UK)    | Senior managers regime, conduct of business rules, complaints handling  |
| NAIC (US)         | State filing compliance, market conduct, reserving standards           |

---

## Status

- [ ] Architecture design & insurance data model
- [ ] Service registry & proto definitions
- [ ] Policy administration system (PAS) core
- [ ] Claims management (FNOL, adjudication, payment)
- [ ] Rating engine (rules-based + ML hybrid)
- [ ] Service skeletons (healthz, metrics)
- [ ] Docker Compose (local dev stack)
- [ ] Helm charts (per-service)
- [ ] CI/CD pipelines
- [ ] GitOps (ArgoCD)
- [ ] IFRS 17 reporting engine
- [ ] Fraud detection (GNN + graph analytics)
