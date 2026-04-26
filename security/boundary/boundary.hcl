controller {
  name = "controller-1"
  database { url = "postgresql://boundary@postgres-boundary/riskshield" }
}
worker {
  name = "worker-riskshield-1"
  controllers = ["controller-1.boundary.riskshield.internal"]
}
kms "awskms" {
  purpose = "root"
  key_id  = "alias/riskshield-boundary"
}
