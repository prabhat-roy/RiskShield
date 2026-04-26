module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.24"

  cluster_name    = "riskshield-${var.environment}"
  cluster_version = var.eks_version

  vpc_id     = aws_vpc.this.id
  subnet_ids = aws_subnet.private[*].id

  cluster_endpoint_public_access = true
  enable_irsa                    = true

  cluster_encryption_config = {
    resources        = ["secrets"]
    provider_key_arn = aws_kms_key.riskshield.arn
  }

  eks_managed_node_groups = {
    general = {
      min_size     = var.node_min
      max_size     = var.node_max
      desired_size = var.node_min
      instance_types = [var.node_instance]
      capacity_type  = "ON_DEMAND"
      labels         = { workload = "general" }
    }
    actuarial = {
      # Reserved for Haskell pricing-engine + IFRS 17 batch jobs
      min_size     = 2
      max_size     = 10
      desired_size = 2
      instance_types = ["c6i.4xlarge"]
      capacity_type  = "ON_DEMAND"
      labels         = { workload = "actuarial" }
      taints = [{
        key = "workload", value = "actuarial", effect = "NO_SCHEDULE"
      }]
    }
    fraud-ml = {
      min_size     = 2
      max_size     = 10
      desired_size = 2
      instance_types = ["g5.xlarge"]
      capacity_type  = "ON_DEMAND"
      labels         = { workload = "fraud-ml" }
      taints = [{
        key = "nvidia.com/gpu", value = "true", effect = "NO_SCHEDULE"
      }]
    }
  }

  cluster_addons = {
    coredns                = { most_recent = true }
    kube-proxy             = { most_recent = true }
    vpc-cni                = { most_recent = true }
    aws-ebs-csi-driver     = { most_recent = true }
  }
}
