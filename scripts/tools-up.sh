#!/usr/bin/env bash
# One-shot deploy of every OSS tool registered for RiskShield via ArgoCD.
set -euo pipefail
argocd app sync -l "project=riskshield-tools" --grpc-web
