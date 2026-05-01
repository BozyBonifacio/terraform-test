output "deployment_id" {
  description = "Generated deployment identifier."
  value       = random_id.deployment.hex
}

output "metadata_file" {
  description = "Generated local metadata file path."
  value       = local_file.metadata.filename
}

output "tags" {
  description = "Generated tag set."
  value       = local.common_tags
}
