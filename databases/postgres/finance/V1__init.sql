CREATE EXTENSION IF NOT EXISTS pgcrypto;

-- Premium ledger (append-only)
CREATE TABLE premium_ledger (
    seq             BIGSERIAL PRIMARY KEY,
    policy_id       UUID        NOT NULL,
    posted_at       TIMESTAMPTZ NOT NULL DEFAULT now(),
    txn_type        TEXT        NOT NULL CHECK (txn_type IN ('written','earned','unearned','refund','commission')),
    amount          NUMERIC(18,2) NOT NULL,
    currency_code   CHAR(3)     NOT NULL,
    period_start    DATE,
    period_end      DATE
);
CREATE INDEX idx_premium_policy ON premium_ledger(policy_id, posted_at);

CREATE OR REPLACE FUNCTION premium_ledger_immutable() RETURNS trigger AS $$
BEGIN RAISE EXCEPTION 'premium_ledger is append-only'; END;
$$ LANGUAGE plpgsql;
CREATE TRIGGER premium_ledger_no_update BEFORE UPDATE ON premium_ledger
  FOR EACH ROW EXECUTE FUNCTION premium_ledger_immutable();
CREATE TRIGGER premium_ledger_no_delete BEFORE DELETE ON premium_ledger
  FOR EACH ROW EXECUTE FUNCTION premium_ledger_immutable();

-- Bordereaux (idempotent on (reinsurer_id, period))
CREATE TABLE bordereau (
    id              UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    reinsurer_id    UUID NOT NULL,
    period          DATE NOT NULL,
    bordereau_type  TEXT NOT NULL CHECK (bordereau_type IN ('premium','claims','combined')),
    file_uri        TEXT NOT NULL,
    generated_at    TIMESTAMPTZ NOT NULL DEFAULT now(),
    generated_by    UUID NOT NULL,
    revoked_at      TIMESTAMPTZ,
    revocation_reason TEXT,
    revocation_officer_id UUID,
    UNIQUE (reinsurer_id, period, bordereau_type, revoked_at)   -- supports CLAUDE.md idempotency
);
