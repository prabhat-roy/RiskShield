output "gke_name"           { value = google_container_cluster.this.name }
output "gke_endpoint"       { value = google_container_cluster.this.endpoint  sensitive = true }
output "gke_workload_pool"  { value = google_container_cluster.this.workload_identity_config[0].workload_pool }
output "vpc_self_link"      { value = google_compute_network.this.self_link }
output "subnet_self_link"   { value = google_compute_subnetwork.this.self_link }
output "postgres_connection"{ value = google_sql_database_instance.postgres.connection_name  sensitive = true }
output "redis_host"         { value = google_redis_instance.redis.host }
output "bigtable_instance"  { value = google_bigtable_instance.telematics.name }
output "documents_bucket"   { value = google_storage_bucket.documents.name }
output "ledger_bucket"      { value = google_storage_bucket.ledger.name }
output "bordereaux_bucket"  { value = google_storage_bucket.bordereaux.name }
output "kms_key_ring"       { value = google_kms_key_ring.riskshield.id }
