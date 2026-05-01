module "profile_site_metadata" {
  source = "../../modules/profile-site-metadata"

  environment      = var.environment
  owner            = var.owner
  application_name = var.application_name
  tags             = var.tags
}
