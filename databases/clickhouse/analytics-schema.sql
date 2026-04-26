-- ClickHouse — Loss, profitability, cohort, CTR OLAP (CLAUDE.md)
CREATE DATABASE IF NOT EXISTS riskshield_analytics;

-- Append-only event stream from Kafka -> Materialised View
CREATE TABLE IF NOT EXISTS riskshield_analytics.event_stream (
    event_time      DateTime64(3),
    domain          LowCardinality(String),
    entity          LowCardinality(String),
    event           LowCardinality(String),
    correlation_id  String,
    payload         String                CODEC(ZSTD(3))
) ENGINE = MergeTree
ORDER BY (domain, event_time)
PARTITION BY toYYYYMM(event_time)
TTL event_time + INTERVAL 7 YEAR;

-- Loss ratio aggregation (monthly per product)
CREATE TABLE IF NOT EXISTS riskshield_analytics.loss_ratio_monthly (
    period_start    Date,
    product_code    LowCardinality(String),
    region          LowCardinality(String),
    written_premium Decimal(20,2),
    earned_premium  Decimal(20,2),
    incurred_loss   Decimal(20,2),
    paid_loss       Decimal(20,2),
    loss_ratio      Float64
) ENGINE = ReplacingMergeTree(period_start)
ORDER BY (product_code, period_start, region);

-- Profitability cube
CREATE TABLE IF NOT EXISTS riskshield_analytics.profitability (
    period_start    Date,
    product_code    LowCardinality(String),
    channel         LowCardinality(String),
    written         Decimal(20,2),
    earned          Decimal(20,2),
    losses          Decimal(20,2),
    expenses        Decimal(20,2),
    commission      Decimal(20,2),
    underwriting_result Decimal(20,2)
) ENGINE = MergeTree
ORDER BY (period_start, product_code, channel)
PARTITION BY toYYYYMM(period_start);

-- Cohort retention
CREATE TABLE IF NOT EXISTS riskshield_analytics.cohort_retention (
    cohort_month    Date,
    months_since    UInt8,
    product_code    LowCardinality(String),
    customers       UInt64,
    retained        UInt64,
    retention_rate  Float64
) ENGINE = MergeTree
ORDER BY (cohort_month, product_code, months_since);

-- Quote-to-bind funnel
CREATE TABLE IF NOT EXISTS riskshield_analytics.quote_funnel (
    period_start    Date,
    channel         LowCardinality(String),
    product_code    LowCardinality(String),
    quotes          UInt64,
    bound           UInt64,
    ctr             Float64
) ENGINE = MergeTree
ORDER BY (period_start, channel, product_code);
