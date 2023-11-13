variable "authorized_networks" {
  type = list(object({
    name    = string
    network = string
  }))
  default = []
}

variable "backup_config" {
  type = object({
    binary_log_enabled = optional(bool)
    enabled            = optional(bool)
    location           = optional(string, "eu")
  })
  default = {
  }
}

variable "database_version" {
  type = string
}

variable "databases" {
  type = list(string)
}

variable "deletion_protection" {
  type    = bool
  default = true
}

variable "environment" {
  type = string
  validation {
    condition     = contains(["production", "staging"], var.environment)
    error_message = "Environment must be production or staging."
  }
}

variable "flags" {
  type    = map(string)
  default = {}
}

variable "highly_available" {
  type = bool
}

variable "insights_config" {
  type = object({
    query_insights_enabled  = bool
    query_string_length     = optional(number, 1024)
    record_application_tags = optional(bool, false)
    record_client_address   = optional(bool, false)
  })
  default = {
    query_insights_enabled = true
  }
}
variable "instance_name" {
  type = string
}

variable "labels" {
  type    = map(string)
  default = {}
}

variable "primary_instance_name" {
  type    = string
  default = null
}

variable "storage_autoresize" {
  type = bool
}

variable "storage_limit" {
  type    = number
  default = 0
}

variable "storage_size" {
  type    = number
  default = 0
}

variable "tier" {
  type    = string
  default = null
}

variable "users" {
  type = list(object({
    name = string
    host = optional(string)
  }))
}

variable "project_prefix" {
  type    = string
  default = null
}
