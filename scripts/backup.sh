#!/usr/bin/env bash
set -euo pipefail
NS="${1:-riskshield}"
TS=$(date -u +%Y%m%dT%H%M%S)
velero backup create "riskshield-$TS" --include-namespaces "$NS" --wait
