variable "project" {
  description = "GCP project ID"
  type        = string
}

variable "region" {
  description = "GCP region"
  type        = string
  default     = "australia-southeast2"
}

variable "backend_bucket" {
  description = "GCS bucket name for Terraform state"
  type        = string
}

variable "backend_prefix" {
  description = "Prefix inside the backend bucket (eg. envs/dev)"
  type        = string
  default     = "envs/test"
}
