variable "aws_region"  { type = string  default = "eu-west-1" }
variable "environment" { type = string  default = "prod" }
variable "vpc_cidr"    { type = string  default = "10.50.0.0/16" }
variable "az_count"    { type = number  default = 3 }

variable "eks_version"      { type = string  default = "1.31" }
variable "node_min"         { type = number  default = 6 }
variable "node_max"         { type = number  default = 60 }
variable "node_instance"    { type = string  default = "m6i.2xlarge" }

variable "rds_engine_version" { type = string  default = "16.3" }
variable "rds_instance"       { type = string  default = "db.r6g.2xlarge" }
variable "rds_storage_gb"     { type = number  default = 1000 }

variable "kafka_version"         { type = string  default = "3.7.x" }
variable "kafka_broker_count"    { type = number  default = 6 }
variable "kafka_broker_instance" { type = string  default = "kafka.m5.xlarge" }

variable "rabbitmq_instance"     { type = string  default = "mq.m5.large" }

variable "redis_node_type" { type = string  default = "cache.r6g.xlarge" }
variable "redis_num_nodes" { type = number  default = 3 }

variable "documentdb_instance" { type = string default = "db.r6g.large" }
variable "documentdb_count"    { type = number default = 3 }

variable "keyspaces_keyspace_name" { type = string default = "riskshield_telematics" }
