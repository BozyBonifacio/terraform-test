variable "environment" {
  description = "Environment name, such as dev or prod."
  type        = string

  validation {
    condition     = contains(["dev", "test", "stage", "prod"], var.environment)
    error_message = "Environment must be one of: dev, test, stage, prod."
  }
}

variable "owner" {
  description = "Service or resource owner."
  type        = string

  validation {
    condition     = length(trimspace(var.owner)) > 0
    error_message = "Owner cannot be empty."
  }
}

variable "application_name" {
  description = "Application name for generated metadata."
  type        = string

  validation {
    condition     = length(trimspace(var.application_name)) > 0
    error_message = "Application name cannot be empty."
  }
}

variable "tags" {
  description = "Common tags to apply to generated metadata."
  type        = map(string)
  default     = {}
}
