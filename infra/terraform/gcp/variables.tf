variable "gcp_project" { type = string }
variable "gcp_region"  { type = string  default = "europe-west2" } # London
variable "environment" { type = string  default = "prod" }

variable "subnet_cidr" { type = string  default = "10.50.0.0/16" }
variable "pods_cidr"   { type = string  default = "10.60.0.0/14" }
variable "svc_cidr"    { type = string  default = "10.64.0.0/16" }

variable "gke_version"  { type = string  default = "1.31" }
variable "node_min"     { type = number  default = 6 }
variable "node_max"     { type = number  default = 60 }
variable "node_machine" { type = string  default = "n2-standard-8" }

variable "pg_tier"     { type = string  default = "db-custom-8-32768" }
variable "pg_version"  { type = string  default = "POSTGRES_16" }
variable "redis_size_gb" { type = number default = 16 }

variable "bigtable_node_count" { type = number default = 3 }
