resource "aws_db_subnet_group" "pg" {
  name       = "riskshield-${var.environment}"
  subnet_ids = aws_subnet.private[*].id
}

resource "random_password" "pg" {
  length  = 32
  special = true
}

resource "aws_db_instance" "postgres" {
  identifier               = "riskshield-${var.environment}"
  engine                   = "postgres"
  engine_version           = var.rds_engine_version
  instance_class           = var.rds_instance
  allocated_storage        = var.rds_storage_gb
  storage_encrypted        = true
  kms_key_id               = aws_kms_key.riskshield.arn
  db_name                  = "riskshield"
  username                 = "riskshield"
  password                 = random_password.pg.result
  db_subnet_group_name     = aws_db_subnet_group.pg.name
  multi_az                 = true
  backup_retention_period  = 35   # FCA / PRA reg requirement
  deletion_protection      = true
  performance_insights_enabled = true
  performance_insights_retention_period = 731
  skip_final_snapshot       = false
  final_snapshot_identifier = "riskshield-${var.environment}-final"
  iam_database_authentication_enabled = true
}

# Redis — sanction-screening cache (TTL = 4h max), rate engine intermediate state
resource "aws_elasticache_subnet_group" "redis" {
  name       = "riskshield-${var.environment}"
  subnet_ids = aws_subnet.private[*].id
}

resource "aws_elasticache_replication_group" "redis" {
  replication_group_id        = "riskshield-${var.environment}"
  description                 = "RiskShield Redis (sanction cache, sessions)"
  node_type                   = var.redis_node_type
  num_cache_clusters          = var.redis_num_nodes
  automatic_failover_enabled  = true
  multi_az_enabled            = true
  engine_version              = "7.1"
  port                        = 6379
  subnet_group_name           = aws_elasticache_subnet_group.redis.name
  at_rest_encryption_enabled  = true
  transit_encryption_enabled  = true
  kms_key_id                  = aws_kms_key.riskshield.arn
}

# MSK — domain events (claims.*, policy.*, fraud.*, telematics.*)
resource "aws_msk_cluster" "kafka" {
  cluster_name           = "riskshield-${var.environment}"
  kafka_version          = var.kafka_version
  number_of_broker_nodes = var.kafka_broker_count

  broker_node_group_info {
    instance_type   = var.kafka_broker_instance
    client_subnets  = aws_subnet.private[*].id
    storage_info {
      ebs_storage_info { volume_size = 2000 }
    }
  }

  encryption_info {
    encryption_at_rest_kms_key_arn = aws_kms_key.riskshield.arn
    encryption_in_transit {
      client_broker = "TLS"
      in_cluster    = true
    }
  }
}

# Amazon MQ — RabbitMQ for delayed jobs (renewal reminders, cancellation grace periods)
resource "aws_mq_broker" "rabbitmq" {
  broker_name        = "riskshield-${var.environment}"
  engine_type        = "RabbitMQ"
  engine_version     = "3.13"
  host_instance_type = var.rabbitmq_instance
  deployment_mode    = "CLUSTER_MULTI_AZ"
  publicly_accessible = false
  subnet_ids          = slice(aws_subnet.private[*].id, 0, 2)

  user {
    username = "riskshield"
    password = random_password.pg.result
  }

  encryption_options {
    use_aws_owned_key = false
    kms_key_id        = aws_kms_key.riskshield.arn
  }
}

# DocumentDB (MongoDB-compatible) — policy wordings, claim files, OCR results
resource "aws_docdb_subnet_group" "this" {
  name       = "riskshield-${var.environment}"
  subnet_ids = aws_subnet.private[*].id
}

resource "aws_docdb_cluster" "documents" {
  cluster_identifier      = "riskshield-${var.environment}-docs"
  engine                  = "docdb"
  master_username         = "riskshield"
  master_password         = random_password.pg.result
  db_subnet_group_name    = aws_docdb_subnet_group.this.name
  storage_encrypted       = true
  kms_key_id              = aws_kms_key.riskshield.arn
  backup_retention_period = 35
  skip_final_snapshot     = false
  final_snapshot_identifier = "riskshield-${var.environment}-docs-final"
}

resource "aws_docdb_cluster_instance" "documents" {
  count              = var.documentdb_count
  identifier         = "riskshield-${var.environment}-docs-${count.index}"
  cluster_identifier = aws_docdb_cluster.documents.id
  instance_class     = var.documentdb_instance
}

# Amazon Keyspaces (Cassandra-compatible) — telematics archive + audit
resource "aws_keyspaces_keyspace" "telematics" {
  name = var.keyspaces_keyspace_name
}

resource "aws_keyspaces_table" "telematics_events" {
  keyspace_name = aws_keyspaces_keyspace.telematics.name
  table_name    = "device_events"
  schema_definition {
    column { name = "device_id"  type = "text" }
    column { name = "event_time" type = "timestamp" }
    column { name = "lat"        type = "double" }
    column { name = "lon"        type = "double" }
    column { name = "speed_kph"  type = "double" }
    column { name = "payload"    type = "blob" }
    partition_key { name = "device_id" }
    clustering_key {
      name     = "event_time"
      order_by = "DESC"
    }
  }
  point_in_time_recovery { status = "ENABLED" }
  encryption_specification {
    type             = "CUSTOMER_MANAGED_KMS_KEY"
    kms_key_identifier = aws_kms_key.riskshield.arn
  }
}
