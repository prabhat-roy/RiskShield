# AI_PLAN.md — RiskShield (Cybersecurity & Insurance Risk Platform)

> Hierarchical AI/ML strategy. Reuses the Paperclip / OpenClaw / NemoClaw
> agent platform first defined in [ShopOS/AI.md](../ShopOS/AI.md). This file
> is the RiskShield-specific specialisation.

---

## 1. Why AI in RiskShield

RiskShield sits at the junction of **cybersecurity ops** (SOC, threat
intel, IR) and **insurance underwriting + claims**. AI is mandatory in both:

- SOC analysts can't keep up with telemetry volume — only ML triage scales.
- Cyber-insurance pricing depends on continuously-updated technical signals
  (exposed surface, EOL stack, breach prior, dark-web mentions).
- Claims fraud (cyber + non-cyber) needs graph + behavioural analysis.

Adversarial robustness, explainability, and tight blast radius are the
core constraints — every AI surface assumes adversaries will probe it.

---

## 2. Domain-Specific AI/ML Use Cases

| # | Use case | Domain | Model class | Latency budget |
|---|----------|--------|-------------|----------------|
| 1 | SIEM alert triage / suppression | soc | GBM + LLM rationale | <200 ms |
| 2 | Threat-intel summarisation + IOC extraction | threat-intel | Llama 3.1 70B + Donut + KG | <5 s/feed |
| 3 | Phishing / BEC detection (email + URL) | email-sec | DistilBERT + URL feature GBM | <100 ms |
| 4 | Malware classification (PE, ELF, JS, Office) | malware | Gradient Boost on byte n-grams + CNN | <500 ms |
| 5 | UEBA — user / entity anomaly | identity, soc | Autoencoder + Isolation Forest | streaming |
| 6 | Cyber-insurance underwriting risk score | underwriting | LightGBM + GNN on supply-chain | <1 s |
| 7 | Claims fraud detection (cyber + non-cyber) | claims | GraphSAGE + GBM | <500 ms |
| 8 | Policy-document NLP (extract terms, exclusions) | underwriting, claims | Llama 3.1 70B + Donut + LayoutLMv3 | <3 s/doc |
| 9 | Breach-cost estimator (post-incident) | claims, ir | LightGBM + LLM rationale | <2 s |
| 10 | Adversary-emulation / purple-team scenario gen | red-team | Llama 3.1 70B + ATT&CK KG | <10 s |
| 11 | Auto-runbook draft (IR steps from telemetry) | ir | Llama 3.1 70B + tool-calling | <30 s |
| 12 | Dark-web / leaked-credential mining | threat-intel | Embedding match + dedup + LLM scorer | hourly |

---

## 3. Hierarchical Agent Architecture

Reuses **OpenClaw** / **Paperclip** / **NemoClaw** from `ShopOS/AI.md`.

### Tier 0 — Master Architect Agent

`risk-architect` — researches AI tooling, proposes services, on-boards
Tier-1 leads, weekly written report. Read-only on prod.

### Tier 1 — Division Leads (5)

| Agent | Scope |
|-------|-------|
| `risk-dev-lead`        | Backend/frontend service code |
| `risk-devops-lead`     | Helm, GitOps, infra, CI |
| `risk-devsecops-lead`  | OPA, Vault, Cilium, Falco, MITRE D3FEND |
| `risk-dataml-lead`     | Feature store, training, drift, adversarial robustness |
| `risk-platform-lead`   | Cross-cutting (idempotency, saga, outbox), edge runtime |

### Tier 2 — Specialist Agents

**By language**: Go, Java, Kotlin, Python, Node, Rust, TypeScript, C
(low-level malware tooling).

**By tool**: PostgreSQL, MongoDB, Redis, Elasticsearch, OpenSearch,
ClickHouse, Cassandra, Kafka, NATS, RabbitMQ, Vault, Keycloak, OPA,
Kyverno, Falco, Cilium, Istio, ArgoCD, Argo Workflows, Prometheus,
Grafana, Loki, Jaeger, OpenTelemetry, MinIO, Trivy, Cosign, Pulsar,
Druid, Camunda, OpenFGA, **Wazuh** (XDR), **TheHive + Cortex**
(SOAR), **MISP** (threat-intel), **OpenCTI**, **YARA**, **Suricata**,
**Zeek**, **Velociraptor** (DFIR), **Falco** (runtime), **Sigma**
(detection rules), **CALDERA** (purple), **Atomic Red Team**.

**By service** — one agent per microservice (~190). Owns README,
OpenAPI, tests, CHANGELOG, deps, /healthz.

### Tier 3 — Ephemeral Workers

Spawned per IR ticket — runs hypothesis-driven enrichment and writes the
draft runbook. Sandboxed in NemoClaw with strict tool allow-list.

### Lifecycle

Research → Document → Implement → Test → Review → Deploy → Monitor →
Respond → Upgrade → Report. Plus an **adversarial-robustness gate**:
every classifier has an adversarial-eval suite (textattack, FGSM, etc.)
that must pass before prod.

---

## 4. Separate AI Infrastructure

```
ai-platform/
├── cluster: risk-ai-{aws,gcp,azure}      ← cloud GPU pool
├── cluster: risk-ai-air-gapped           ← optional, on-prem for sensitive tenants
├── namespace: risk-ai-control             ← Paperclip
├── namespace: risk-ai-agents              ← OpenClaw runtime
├── namespace: risk-ai-sandbox             ← NemoClaw — strict adversarial guardrails
├── namespace: risk-ai-models              ← vLLM, Ollama, LiteLLM, Triton
├── namespace: risk-ai-data                ← Qdrant, Weaviate, MinIO, MLflow
├── namespace: risk-ai-obs                 ← Langfuse, Phoenix
└── namespace: risk-ai-pipelines           ← Argo Workflows
```

### Hardware

- **Cloud**: A100 for malware + email + UEBA training; A10G/L4 for LLM.
- **Air-gapped option**: customer-side k3s with Ollama + smaller Llama
  3.1 8B for sensitive tenants who refuse cloud LLM.

### Software stack

Same baseline (vLLM, Paperclip, OpenClaw, NemoClaw, Qdrant, Weaviate,
MLflow, Feast, Argo Workflows, Evidently, Langfuse, Phoenix) plus the
SOC stack listed in tool-agents above.

### Data isolation

- All telemetry hashed before any LLM input (no raw IPs / hostnames /
  user-IDs in prompts unless customer opts in).
- Vector DB sharded per tenant (insurance MGA / SOC customer).
- Adversarial-input detector (LLM-Guard) in front of every public-facing
  AI surface.

---

## 5. Compliance & Guardrails

| Control | Mechanism |
|---------|-----------|
| ISO 27001 / SOC 2 / PCI-DSS | Self-hosted, encrypted at rest/in-transit |
| GDPR / CCPA / DPDP | Tenant data tokenised; right-to-erasure |
| Insurance reg (NAIC / FCA / IRDAI) | Underwriting models have model card + monitoring |
| Adversarial robustness | Every classifier passes adversarial eval before prod |
| Threat-actor data ethics | Dark-web mining limited to leaked-cred matches; no PII redistribution |
| Auto-response blast radius | AI never executes containment without analyst confirmation |
| NemoClaw security policy | Blocks the LLM from generating live-attacker-usable PoCs outside red-team mode |

---

## 6. Implementation Roadmap

| Month | Milestone |
|-------|-----------|
| 1 | `risk-ai-*` cluster up; vLLM Llama 3.1 70B |
| 2 | Paperclip + NemoClaw; Tier-0 architect live |
| 3 | Tier-1 leads; alert-triage v0 shadow on Wazuh feed |
| 4 | Per-language / per-tool Tier-2 agents |
| 5 | Per-service Tier-2 agents (soc → ir → underwriting first) |
| 6 | Phishing detection v1; UEBA v1 |
| 7 | Cyber-underwriting v1; threat-intel summariser v1 |
| 8 | Air-gapped offering; multi-cloud failover drill |

---

## 7. Cost Envelope (target)

- **Cloud infra**: $5,500 – $8,500 / month per primary cloud
- **Air-gapped tenant**: $1,500 one-time per appliance
- **No** subscription LLM spend

---

## 8. Cross-References

- Master AI strategy: [ShopOS/AI.md](../ShopOS/AI.md)
- Same Paperclip/OpenClaw/NemoClaw platform across all 15 sibling projects.
