data "aws_availability_zones" "this" { state = "available" }

locals {
  azs = slice(data.aws_availability_zones.this.names, 0, var.az_count)
}

resource "aws_vpc" "this" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = { Name = "riskshield-${var.environment}" }
}

resource "aws_subnet" "private" {
  count                   = var.az_count
  vpc_id                  = aws_vpc.this.id
  availability_zone       = local.azs[count.index]
  cidr_block              = cidrsubnet(var.vpc_cidr, 4, count.index)
  map_public_ip_on_launch = false
  tags = {
    Name                              = "riskshield-private-${count.index}"
    "kubernetes.io/role/internal-elb" = "1"
  }
}

resource "aws_subnet" "public" {
  count                   = var.az_count
  vpc_id                  = aws_vpc.this.id
  availability_zone       = local.azs[count.index]
  cidr_block              = cidrsubnet(var.vpc_cidr, 4, count.index + var.az_count)
  map_public_ip_on_launch = true
  tags = {
    Name                     = "riskshield-public-${count.index}"
    "kubernetes.io/role/elb" = "1"
  }
}

resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id
  tags   = { Name = "riskshield-igw" }
}

resource "aws_eip" "nat" {
  count  = var.az_count
  domain = "vpc"
  tags   = { Name = "riskshield-nat-${count.index}" }
}

resource "aws_nat_gateway" "this" {
  count         = var.az_count
  allocation_id = aws_eip.nat[count.index].id
  subnet_id     = aws_subnet.public[count.index].id
  tags          = { Name = "riskshield-nat-${count.index}" }
  depends_on    = [aws_internet_gateway.this]
}

# VPC Flow Logs for FCA/PRA audit trail
resource "aws_cloudwatch_log_group" "vpc_flow" {
  name              = "/aws/vpc/riskshield-${var.environment}/flow"
  retention_in_days = 365
  kms_key_id        = aws_kms_key.riskshield.arn
}

resource "aws_flow_log" "vpc" {
  log_destination = aws_cloudwatch_log_group.vpc_flow.arn
  iam_role_arn    = aws_iam_role.flow_log.arn
  traffic_type    = "ALL"
  vpc_id          = aws_vpc.this.id
}

resource "aws_iam_role" "flow_log" {
  name = "riskshield-${var.environment}-vpc-flow-log"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = { Service = "vpc-flow-logs.amazonaws.com" }
      Action = "sts:AssumeRole"
    }]
  })
}
