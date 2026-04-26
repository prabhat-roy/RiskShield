terraform {
  required_version = ">= 1.9.0"
  required_providers {
    google      = { source = "hashicorp/google",      version = "~> 6.5" }
    google-beta = { source = "hashicorp/google-beta", version = "~> 6.5" }
    kubernetes  = { source = "hashicorp/kubernetes",  version = "~> 2.32" }
    helm        = { source = "hashicorp/helm",        version = "~> 2.15" }
    random      = { source = "hashicorp/random",      version = "~> 3.6" }
  }
  backend "gcs" {
    bucket = "riskshield-tfstate-gcp"
    prefix = "riskshield/gcp"
  }
}

provider "google"      { project = var.gcp_project  region = var.gcp_region }
provider "google-beta" { project = var.gcp_project  region = var.gcp_region }
