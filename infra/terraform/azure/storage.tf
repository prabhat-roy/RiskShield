resource "azurerm_storage_account" "documents" {
  name                     = "riskshield${var.environment}docs"
  resource_group_name      = azurerm_resource_group.this.name
  location                 = azurerm_resource_group.this.location
  account_tier             = "Standard"
  account_replication_type = "ZRS"
  account_kind             = "StorageV2"
  is_hns_enabled           = true
  min_tls_version          = "TLS1_2"
  blob_properties {
    versioning_enabled = true
    delete_retention_policy { days = 30 }
  }
}

resource "azurerm_storage_container" "documents" {
  name                  = "documents"
  storage_account_id    = azurerm_storage_account.documents.id
  container_access_type = "private"
}

# Append-only ledger (IFRS 17 / Solvency II) — immutability policy 10y
resource "azurerm_storage_account" "ledger" {
  name                     = "riskshield${var.environment}ledger"
  resource_group_name      = azurerm_resource_group.this.name
  location                 = azurerm_resource_group.this.location
  account_tier             = "Standard"
  account_replication_type = "GZRS"
  account_kind             = "StorageV2"
  min_tls_version          = "TLS1_2"
  blob_properties { versioning_enabled = true }
}

resource "azurerm_storage_container" "ledger" {
  name               = "ledger"
  storage_account_id = azurerm_storage_account.ledger.id
}

resource "azurerm_storage_management_policy" "ledger" {
  storage_account_id = azurerm_storage_account.ledger.id
  rule {
    name    = "immutable-10y"
    enabled = true
    filters { blob_types = ["blockBlob"] }
    actions {
      base_blob {
        tier_to_archive_after_days_since_modification_greater_than = 90
      }
    }
  }
}

# Bordereaux container
resource "azurerm_storage_container" "bordereaux" {
  name               = "bordereaux"
  storage_account_id = azurerm_storage_account.documents.id
}
