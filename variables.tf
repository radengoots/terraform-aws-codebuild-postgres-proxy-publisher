variable "source_location" {
  description = "Link to github repository"
  type        = "string"
}

variable "project_path" {
  description = "Relative path to the project"
  type        = "string"
}

variable "service_role" {
  description = "Service role name"
  type        = "string"
}

variable "compute_type" {
  description = "https://docs.aws.amazon.com/codebuild/latest/userguide/build-env-ref-compute-types.html"
  default     = "BUILD_GENERAL1_SMALL"
}

variable "image" {
  description = "https://docs.aws.amazon.com/codebuild/latest/userguide/build-env-ref-available.html"
  default     = "traveloka/postgresql-proxy-builder:latest"
}

