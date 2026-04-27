#!/usr/bin/env bash
set -euo pipefail
pact-provider-verifier https://pact-broker.riskshield.internal \
  --provider riskshield_identity_service \
  --provider-base-url http://identity-service.riskshield.svc:50060 \
  --provider-version "${GIT_SHA:-local}" \
  --publish-verification-results
