# Document & bordereaux archive
resource "aws_s3_bucket" "documents" {
  bucket = "riskshield-${var.environment}-documents"
}

resource "aws_s3_bucket_versioning" "documents" {
  bucket = aws_s3_bucket.documents.id
  versioning_configuration { status = "Enabled" }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "documents" {
  bucket = aws_s3_bucket.documents.id
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm     = "aws:kms"
      kms_master_key_id = aws_kms_key.riskshield.arn
    }
  }
}

resource "aws_s3_bucket_public_access_block" "documents" {
  bucket                  = aws_s3_bucket.documents.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# Object Lock for IFRS 17 / Solvency II append-only ledger entries
resource "aws_s3_bucket" "ledger" {
  bucket              = "riskshield-${var.environment}-ledger"
  object_lock_enabled = true
}

resource "aws_s3_bucket_object_lock_configuration" "ledger" {
  bucket = aws_s3_bucket.ledger.id
  rule {
    default_retention {
      mode  = "COMPLIANCE"
      years = 10  # Solvency II + IFRS 17 retention
    }
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "ledger" {
  bucket = aws_s3_bucket.ledger.id
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm     = "aws:kms"
      kms_master_key_id = aws_kms_key.riskshield.arn
    }
  }
}

# Bordereaux files for reinsurers (monthly idempotent on (reinsurer_id, period))
resource "aws_s3_bucket" "bordereaux" {
  bucket = "riskshield-${var.environment}-bordereaux"
}

resource "aws_s3_bucket_versioning" "bordereaux" {
  bucket = aws_s3_bucket.bordereaux.id
  versioning_configuration { status = "Enabled" }
}

resource "aws_s3_bucket_lifecycle_configuration" "bordereaux" {
  bucket = aws_s3_bucket.bordereaux.id
  rule {
    id     = "archive-after-90d"
    status = "Enabled"
    transition {
      days          = 90
      storage_class = "GLACIER"
    }
  }
}
