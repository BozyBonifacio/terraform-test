variable "environment" {
  description = "Environment name."
  type        = string
}

variable "owner" {
  description = "Owner of the application."
  type        = string
}

variable "application_name" {
  description = "Application name."
  type        = string
}

variable "tags" {
  description = "Common tags."
  type        = map(string)
  default     = {}
}
