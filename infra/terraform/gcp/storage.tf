resource "google_storage_bucket" "documents" {
  name                        = "riskshield-${var.environment}-documents"
  location                    = var.gcp_region
  uniform_bucket_level_access = true
  versioning { enabled = true }
  encryption { default_kms_key_name = google_kms_crypto_key.documents.id }
  force_destroy = false
}

# IFRS 17 / Solvency II append-only ledger — bucket retention 10 years
resource "google_storage_bucket" "ledger" {
  name                        = "riskshield-${var.environment}-ledger"
  location                    = var.gcp_region
  uniform_bucket_level_access = true
  versioning { enabled = true }
  encryption { default_kms_key_name = google_kms_crypto_key.documents.id }
  retention_policy {
    is_locked        = true
    retention_period = 315360000   # 10 years
  }
}

resource "google_storage_bucket" "bordereaux" {
  name                        = "riskshield-${var.environment}-bordereaux"
  location                    = var.gcp_region
  uniform_bucket_level_access = true
  versioning { enabled = true }
  encryption { default_kms_key_name = google_kms_crypto_key.documents.id }
  lifecycle_rule {
    condition { age = 90 }
    action    { type = "SetStorageClass"  storage_class = "ARCHIVE" }
  }
}
