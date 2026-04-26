resource "google_kms_key_ring" "riskshield" {
  name     = "riskshield-${var.environment}"
  location = var.gcp_region
}

resource "google_kms_crypto_key" "documents" {
  name            = "documents"
  key_ring        = google_kms_key_ring.riskshield.id
  rotation_period = "7776000s"   # 90d
}

resource "google_kms_crypto_key" "ledger" {
  name            = "ledger"
  key_ring        = google_kms_key_ring.riskshield.id
  rotation_period = "7776000s"
}

resource "google_secret_manager_secret" "pg" {
  secret_id = "riskshield-${var.environment}-postgres"
  replication { auto {} }
}

resource "google_secret_manager_secret_version" "pg" {
  secret = google_secret_manager_secret.pg.id
  secret_data = jsonencode({
    username = google_sql_user.riskshield.name
    password = random_password.pg.result
    instance = google_sql_database_instance.postgres.connection_name
    dbname   = google_sql_database.riskshield.name
  })
}

resource "google_secret_manager_secret" "sanction_sources" {
  secret_id = "riskshield-${var.environment}-sanction-sources"
  replication { auto {} }
}
