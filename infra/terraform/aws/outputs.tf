output "eks_cluster_name"        { value = module.eks.cluster_name }
output "eks_cluster_endpoint"    { value = module.eks.cluster_endpoint }
output "eks_oidc_issuer"         { value = module.eks.cluster_oidc_issuer_url }
output "vpc_id"                  { value = aws_vpc.this.id }
output "private_subnets"         { value = aws_subnet.private[*].id }
output "postgres_endpoint"       { value = aws_db_instance.postgres.endpoint  sensitive = true }
output "redis_primary_endpoint"  { value = aws_elasticache_replication_group.redis.primary_endpoint_address }
output "kafka_bootstrap_brokers" { value = aws_msk_cluster.kafka.bootstrap_brokers_tls  sensitive = true }
output "rabbitmq_endpoints"      { value = aws_mq_broker.rabbitmq.instances[*].endpoints  sensitive = true }
output "documentdb_endpoint"     { value = aws_docdb_cluster.documents.endpoint  sensitive = true }
output "keyspaces_keyspace"      { value = aws_keyspaces_keyspace.telematics.name }
output "documents_bucket"        { value = aws_s3_bucket.documents.bucket }
output "ledger_bucket"           { value = aws_s3_bucket.ledger.bucket }
output "bordereaux_bucket"       { value = aws_s3_bucket.bordereaux.bucket }
output "kms_key_arn"             { value = aws_kms_key.riskshield.arn }
