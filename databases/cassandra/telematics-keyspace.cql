-- Telematics archive — high-volume, time-series IoT events
CREATE KEYSPACE IF NOT EXISTS riskshield_telematics
WITH REPLICATION = { 'class': 'NetworkTopologyStrategy', 'eu-west-1': 3 };

CREATE TABLE riskshield_telematics.device_events (
    device_id   text,
    event_time  timestamp,
    event_id    timeuuid,
    event_type  text,
    lat         double,
    lon         double,
    speed_kph   double,
    accel_mps2  double,
    heading_deg int,
    payload     blob,
    PRIMARY KEY ((device_id), event_time, event_id)
) WITH CLUSTERING ORDER BY (event_time DESC, event_id ASC)
  AND default_time_to_live = 220752000   -- 7y
  AND compression = { 'class':'ZstdCompressor' };

CREATE TABLE riskshield_telematics.trip_summary (
    policy_id      uuid,
    trip_start     timestamp,
    trip_id        timeuuid,
    device_id      text,
    distance_km    double,
    duration_sec   int,
    avg_speed_kph  double,
    harsh_brakes   int,
    harsh_accels   int,
    night_driving_pct double,
    safety_score   double,
    PRIMARY KEY ((policy_id), trip_start, trip_id)
) WITH CLUSTERING ORDER BY (trip_start DESC, trip_id ASC);

-- Audit (CLAUDE.md: Cassandra for telematics + audit)
CREATE KEYSPACE IF NOT EXISTS riskshield_audit
WITH REPLICATION = { 'class': 'NetworkTopologyStrategy', 'eu-west-1': 3 };

CREATE TABLE riskshield_audit.user_action (
    actor_id    text,
    event_time  timestamp,
    event_id    uuid,
    action      text,
    resource    text,
    correlation text,
    metadata    map<text, text>,
    PRIMARY KEY ((actor_id), event_time, event_id)
) WITH CLUSTERING ORDER BY (event_time DESC, event_id ASC)
  AND default_time_to_live = 220752000;   -- 7y FCA / PRA / Solvency II
