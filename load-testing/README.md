# Load testing for RiskShield
- `k6/` — smoke, browse, spike, soak, checkout-flow scripts
- `locust/` — 3 user classes + Dockerfile for distributed runs
- `gatling/` — Commerce + Search simulations
Run: `k6 run k6/smoke.js`  |  `locust -f locust/locustfile.py`  |  `gatling.sh -s riskshield.CommerceSimulation`
