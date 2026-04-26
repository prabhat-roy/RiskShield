CREATE EXTENSION IF NOT EXISTS pgcrypto;

-- Reserves (append-only) — CLAUDE.md rule
CREATE TABLE reserve_movement (
    seq              BIGSERIAL PRIMARY KEY,
    portfolio_id     UUID        NOT NULL,
    valuation_date   DATE        NOT NULL,
    movement_type    TEXT        NOT NULL CHECK (movement_type IN ('IBNR','IBNeR','UPR','URR','CSM','RA','BEL')),
    amount           NUMERIC(20,2) NOT NULL,
    currency_code    CHAR(3)     NOT NULL,
    method           TEXT        NOT NULL,        -- 'chain-ladder', 'BF', 'cape-cod', 'haskell-pricing-engine'
    posted_at        TIMESTAMPTZ NOT NULL DEFAULT now(),
    posted_by        UUID        NOT NULL
);
CREATE INDEX idx_reserve_portfolio ON reserve_movement(portfolio_id, valuation_date);

CREATE OR REPLACE FUNCTION reserve_movement_immutable() RETURNS trigger AS $$
BEGIN RAISE EXCEPTION 'reserve_movement is append-only'; END;
$$ LANGUAGE plpgsql;
CREATE TRIGGER reserve_movement_no_update BEFORE UPDATE ON reserve_movement
  FOR EACH ROW EXECUTE FUNCTION reserve_movement_immutable();
CREATE TRIGGER reserve_movement_no_delete BEFORE DELETE ON reserve_movement
  FOR EACH ROW EXECUTE FUNCTION reserve_movement_immutable();

-- IFRS 17 cashflow projections (CSM, RA, BEL) — append-only
CREATE TABLE ifrs17_cashflow (
    id              UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    contract_group_id UUID NOT NULL,
    measurement_model TEXT NOT NULL CHECK (measurement_model IN ('GMM','PAA','VFA')),
    valuation_date  DATE NOT NULL,
    period_start    DATE NOT NULL,
    period_end      DATE NOT NULL,
    fulfilment_cf   NUMERIC(20,2) NOT NULL,
    risk_adjustment NUMERIC(20,2) NOT NULL,
    csm             NUMERIC(20,2) NOT NULL,
    discount_rate   NUMERIC(8,6)  NOT NULL,
    computed_by     TEXT NOT NULL DEFAULT 'pricing-engine-haskell'
);
CREATE INDEX idx_ifrs17_group_date ON ifrs17_cashflow(contract_group_id, valuation_date);
