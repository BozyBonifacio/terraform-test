resource "random_id" "deployment" {
  byte_length = 4

  keepers = {
    environment      = var.environment
    application_name = var.application_name
  }
}

locals {
  common_tags = merge(
    var.tags,
    {
      Environment = var.environment
      Owner       = var.owner
      Application = var.application_name
      ManagedBy   = "Terraform"
    }
  )

  metadata = {
    deployment_id    = random_id.deployment.hex
    environment      = var.environment
    owner            = var.owner
    application_name = var.application_name
    tags             = local.common_tags
  }
}

resource "local_file" "metadata" {
  filename = "${path.module}/../../generated/${var.environment}-metadata.json"
  content  = jsonencode(local.metadata)
}
