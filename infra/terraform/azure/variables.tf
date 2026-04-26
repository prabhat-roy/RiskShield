variable "location"    { type = string  default = "uksouth" }   # London
variable "environment" { type = string  default = "prod" }
variable "vnet_cidr"   { type = string  default = "10.70.0.0/16" }

variable "aks_version"  { type = string  default = "1.31" }
variable "node_min"     { type = number  default = 6 }
variable "node_max"     { type = number  default = 60 }
variable "node_vm_size" { type = string  default = "Standard_D8s_v5" }

variable "pg_sku"        { type = string  default = "GP_Standard_D8s_v3" }
variable "pg_storage_mb" { type = number  default = 2097152 }   # 2 TiB
variable "pg_version"    { type = string  default = "16" }

variable "redis_sku_name" { type = string  default = "Premium" }
variable "redis_capacity" { type = number  default = 2 }

variable "cosmosdb_throughput" { type = number default = 10000 }
