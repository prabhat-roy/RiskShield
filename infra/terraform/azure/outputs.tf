output "aks_name"           { value = azurerm_kubernetes_cluster.this.name }
output "aks_oidc_issuer"    { value = azurerm_kubernetes_cluster.this.oidc_issuer_url }
output "vnet_id"            { value = azurerm_virtual_network.this.id }
output "postgres_fqdn"      { value = azurerm_postgresql_flexible_server.this.fqdn  sensitive = true }
output "redis_host"         { value = azurerm_redis_cache.this.hostname }
output "eventhub_namespace" { value = azurerm_eventhub_namespace.kafka.name }
output "servicebus_namespace" { value = azurerm_servicebus_namespace.rabbit.name }
output "cosmos_cassandra"   { value = azurerm_cosmosdb_account.cassandra.endpoint }
output "cosmos_mongo"       { value = azurerm_cosmosdb_account.mongo.endpoint }
output "documents_account"  { value = azurerm_storage_account.documents.name }
output "ledger_account"     { value = azurerm_storage_account.ledger.name }
output "key_vault_uri"      { value = azurerm_key_vault.this.vault_uri }
