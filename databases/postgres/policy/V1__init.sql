-- Policy administration schema (ACORD-aligned)
CREATE EXTENSION IF NOT EXISTS pgcrypto;

CREATE TABLE policy (
    id                  UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    policy_number       TEXT NOT NULL UNIQUE,
    product_code        TEXT NOT NULL,
    insured_id          UUID NOT NULL,
    effective_date      DATE NOT NULL,
    expiry_date         DATE NOT NULL,
    status              TEXT NOT NULL CHECK (status IN ('quoted','bound','in-force','cancelled','lapsed','expired')),
    premium_amount      NUMERIC(18,2) NOT NULL,           -- fixed-point — CLAUDE.md rule
    currency_code       CHAR(3) NOT NULL,
    underwriter_id      UUID,
    created_at          TIMESTAMPTZ NOT NULL DEFAULT now(),
    bound_at            TIMESTAMPTZ,
    cancelled_at        TIMESTAMPTZ,
    cancellation_reason TEXT
);
CREATE INDEX idx_policy_insured  ON policy(insured_id);
CREATE INDEX idx_policy_status   ON policy(status);
CREATE INDEX idx_policy_dates    ON policy(effective_date, expiry_date);

CREATE TABLE endorsement (
    id              UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    policy_id       UUID NOT NULL REFERENCES policy(id),
    endorsement_no  INT  NOT NULL,
    effective_date  DATE NOT NULL,
    delta_premium   NUMERIC(18,2) NOT NULL,
    payload_json    JSONB NOT NULL,
    applied_at      TIMESTAMPTZ NOT NULL DEFAULT now(),
    applied_by      UUID NOT NULL,
    UNIQUE (policy_id, endorsement_no)
);
