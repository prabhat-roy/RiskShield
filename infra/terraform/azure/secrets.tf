data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "this" {
  name                       = "riskshield-${var.environment}"
  resource_group_name        = azurerm_resource_group.this.name
  location                   = azurerm_resource_group.this.location
  tenant_id                  = data.azurerm_client_config.current.tenant_id
  sku_name                   = "premium"
  purge_protection_enabled   = true
  soft_delete_retention_days = 90
  enable_rbac_authorization  = true
  network_acls {
    default_action = "Deny"
    bypass         = "AzureServices"
    virtual_network_subnet_ids = [azurerm_subnet.aks.id, azurerm_subnet.data.id]
  }
}

resource "azurerm_key_vault_secret" "pg" {
  name         = "postgres-admin-password"
  value        = random_password.pg.result
  key_vault_id = azurerm_key_vault.this.id
  depends_on   = [azurerm_key_vault.this]
}

resource "azurerm_key_vault_secret" "sanction_sources" {
  name         = "sanction-sources"
  value        = "placeholder"
  key_vault_id = azurerm_key_vault.this.id
  depends_on   = [azurerm_key_vault.this]
}
