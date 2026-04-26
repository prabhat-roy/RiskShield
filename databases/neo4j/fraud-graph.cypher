// Fraud link-analysis graph
CREATE CONSTRAINT FOR (c:Customer) REQUIRE c.id IS UNIQUE;
CREATE CONSTRAINT FOR (p:Policy)   REQUIRE p.policy_number IS UNIQUE;
CREATE CONSTRAINT FOR (cl:Claim)   REQUIRE cl.claim_number IS UNIQUE;
CREATE CONSTRAINT FOR (a:Address)  REQUIRE a.normalized IS UNIQUE;
CREATE CONSTRAINT FOR (ph:Phone)   REQUIRE ph.e164 IS UNIQUE;
CREATE CONSTRAINT FOR (ba:BankAccount) REQUIRE ba.iban IS UNIQUE;
CREATE CONSTRAINT FOR (v:Vehicle)  REQUIRE v.vin IS UNIQUE;
CREATE CONSTRAINT FOR (rs:RepairShop)  REQUIRE rs.id IS UNIQUE;
CREATE CONSTRAINT FOR (mp:MedicalProvider) REQUIRE mp.id IS UNIQUE;

CREATE INDEX FOR (c:Customer) ON (c.email);
CREATE INDEX FOR (cl:Claim)   ON (cl.fnol_received_at);

// Common edges:
//   (c)-[:HOLDS]->(p), (p)-[:HAS_CLAIM]->(cl)
//   (c)-[:LIVES_AT]->(a), (c)-[:HAS_PHONE]->(ph)
//   (cl)-[:REPAIRED_AT]->(rs), (cl)-[:TREATED_BY]->(mp)
//   (c)-[:OWNS]->(ba), (cl)-[:PAID_TO]->(ba)
