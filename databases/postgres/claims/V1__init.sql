CREATE EXTENSION IF NOT EXISTS pgcrypto;

CREATE TABLE claim (
    id              UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    claim_number    TEXT NOT NULL UNIQUE,
    policy_id       UUID NOT NULL,
    incident_date   DATE NOT NULL,
    fnol_received_at TIMESTAMPTZ NOT NULL,
    status          TEXT NOT NULL CHECK (status IN ('fnol','triaged','adjudicating','approved','denied','settled','litigated','closed')),
    cause_of_loss   TEXT,
    estimated_loss  NUMERIC(18,2),
    paid_to_date    NUMERIC(18,2) NOT NULL DEFAULT 0,
    closed_at       TIMESTAMPTZ
);
CREATE INDEX idx_claim_policy ON claim(policy_id);
CREATE INDEX idx_claim_status ON claim(status);

-- Append-only ledger (CLAUDE.md rule: claim ledger entries are append-only)
CREATE TABLE claim_ledger (
    seq             BIGSERIAL PRIMARY KEY,
    claim_id        UUID NOT NULL REFERENCES claim(id),
    posted_at       TIMESTAMPTZ NOT NULL DEFAULT now(),
    txn_type        TEXT NOT NULL CHECK (txn_type IN ('reserve','payment','recovery','adjustment','salvage','subrogation')),
    amount          NUMERIC(18,2) NOT NULL,
    currency_code   CHAR(3)       NOT NULL,
    posted_by       UUID          NOT NULL,
    notes           TEXT
);
CREATE INDEX idx_ledger_claim ON claim_ledger(claim_id, posted_at);

-- Block any UPDATE/DELETE on claim_ledger
CREATE OR REPLACE FUNCTION claim_ledger_immutable() RETURNS trigger AS $$
BEGIN
    RAISE EXCEPTION 'claim_ledger is append-only';
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER claim_ledger_no_update BEFORE UPDATE ON claim_ledger
  FOR EACH ROW EXECUTE FUNCTION claim_ledger_immutable();

CREATE TRIGGER claim_ledger_no_delete BEFORE DELETE ON claim_ledger
  FOR EACH ROW EXECUTE FUNCTION claim_ledger_immutable();
