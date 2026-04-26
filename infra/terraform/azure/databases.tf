resource "azurerm_private_dns_zone" "pg" {
  name                = "riskshield.postgres.database.azure.com"
  resource_group_name = azurerm_resource_group.this.name
}

resource "azurerm_private_dns_zone_virtual_network_link" "pg" {
  name                  = "riskshield-${var.environment}"
  resource_group_name   = azurerm_resource_group.this.name
  private_dns_zone_name = azurerm_private_dns_zone.pg.name
  virtual_network_id    = azurerm_virtual_network.this.id
}

resource "random_password" "pg" {
  length  = 32
  special = false
}

resource "azurerm_postgresql_flexible_server" "this" {
  name                          = "riskshield-${var.environment}"
  resource_group_name           = azurerm_resource_group.this.name
  location                      = azurerm_resource_group.this.location
  version                       = var.pg_version
  administrator_login           = "riskshield"
  administrator_password        = random_password.pg.result
  delegated_subnet_id           = azurerm_subnet.data.id
  private_dns_zone_id           = azurerm_private_dns_zone.pg.id
  sku_name                      = var.pg_sku
  storage_mb                    = var.pg_storage_mb
  zone                          = "1"
  high_availability { mode = "ZoneRedundant"  standby_availability_zone = "2" }
  backup_retention_days         = 35
  geo_redundant_backup_enabled  = true
}

resource "azurerm_redis_cache" "this" {
  name                = "riskshield-${var.environment}"
  resource_group_name = azurerm_resource_group.this.name
  location            = azurerm_resource_group.this.location
  capacity            = var.redis_capacity
  family              = "P"
  sku_name            = var.redis_sku_name
  non_ssl_port_enabled = false
  minimum_tls_version = "1.2"
}

# Event Hubs (Kafka surface) — domain events
resource "azurerm_eventhub_namespace" "kafka" {
  name                = "riskshield-${var.environment}"
  resource_group_name = azurerm_resource_group.this.name
  location            = azurerm_resource_group.this.location
  sku                 = "Premium"
  capacity            = 4
}

# Service Bus — RabbitMQ-style delayed delivery (renewal reminders, cancellation grace)
resource "azurerm_servicebus_namespace" "rabbit" {
  name                = "riskshield-${var.environment}"
  resource_group_name = azurerm_resource_group.this.name
  location            = azurerm_resource_group.this.location
  sku                 = "Premium"
  capacity            = 2
}

resource "azurerm_servicebus_queue" "renewal_reminder" {
  name                = "renewal-reminder"
  namespace_id        = azurerm_servicebus_namespace.rabbit.id
  default_message_ttl = "P30D"
}

resource "azurerm_servicebus_queue" "cancellation_grace" {
  name         = "cancellation-grace"
  namespace_id = azurerm_servicebus_namespace.rabbit.id
}

# Cosmos DB Cassandra API — telematics + audit
resource "azurerm_cosmosdb_account" "cassandra" {
  name                = "riskshield-${var.environment}-cass"
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name
  offer_type          = "Standard"
  kind                = "GlobalDocumentDB"
  capabilities { name = "EnableCassandra" }
  consistency_policy { consistency_level = "Strong" }
  geo_location {
    location          = azurerm_resource_group.this.location
    failover_priority = 0
  }
}

# Cosmos DB Mongo API — policy wordings, claim files, OCR results
resource "azurerm_cosmosdb_account" "mongo" {
  name                = "riskshield-${var.environment}-mongo"
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name
  offer_type          = "Standard"
  kind                = "MongoDB"
  capabilities { name = "EnableMongo" }
  consistency_policy  { consistency_level = "Session" }
  geo_location {
    location          = azurerm_resource_group.this.location
    failover_priority = 0
  }
}
