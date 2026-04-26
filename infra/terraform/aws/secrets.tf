resource "aws_kms_key" "riskshield" {
  description             = "RiskShield ${var.environment} CMK (FCA/PRA-grade)"
  deletion_window_in_days = 30
  enable_key_rotation     = true
}

resource "aws_kms_alias" "riskshield" {
  name          = "alias/riskshield-${var.environment}"
  target_key_id = aws_kms_key.riskshield.id
}

resource "aws_secretsmanager_secret" "pg" {
  name       = "riskshield/${var.environment}/postgres"
  kms_key_id = aws_kms_key.riskshield.arn
}

resource "aws_secretsmanager_secret_version" "pg" {
  secret_id = aws_secretsmanager_secret.pg.id
  secret_string = jsonencode({
    username = aws_db_instance.postgres.username
    password = random_password.pg.result
    host     = aws_db_instance.postgres.address
    port     = aws_db_instance.postgres.port
    dbname   = aws_db_instance.postgres.db_name
  })
}

resource "aws_secretsmanager_secret" "kafka" {
  name       = "riskshield/${var.environment}/kafka"
  kms_key_id = aws_kms_key.riskshield.arn
}

resource "aws_secretsmanager_secret_version" "kafka" {
  secret_id     = aws_secretsmanager_secret.kafka.id
  secret_string = jsonencode({ brokers = aws_msk_cluster.kafka.bootstrap_brokers_tls })
}

# Sanction list sources — encrypted refresh credentials (OFAC, UN, EU, HMT)
resource "aws_secretsmanager_secret" "sanction_sources" {
  name       = "riskshield/${var.environment}/sanction-sources"
  kms_key_id = aws_kms_key.riskshield.arn
}
