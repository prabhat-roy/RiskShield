# Default policy for RiskShield application services.
path "riskshield/data/{{identity.entity.aliases.auth_kubernetes_*.metadata.service_account_name}}/*" {
  capabilities = ["read"]
}
path "database/creds/riskshield-{{identity.entity.aliases.auth_kubernetes_*.metadata.service_account_name}}" {
  capabilities = ["read"]
}
path "transit/encrypt/riskshield" { capabilities = ["update"] }
path "transit/decrypt/riskshield" { capabilities = ["update"] }
# Pricing engine + IFRS 17 service can decrypt cashflow seeds
path "transit/decrypt/ifrs17-cashflow-seed" {
  capabilities = ["update"]
  allowed_parameters = {
    context = []
  }
}
