variable "product_domain" {
  type        = "string"
  description = "Binary Owner"
}

variable "jar_name" {
  type        = "string"
  description = "Jar name, e.g. rules-engine-repository-db-proxy"
}

variable "source_location" {
  type        = "string"
  description = "Link to github repository"
}

variable "project_path" {
  type        = "string"
  description = "Relative path to the project"
}

variable "service_role" {
  type        = "string"
  description = "Service role name"
}

variable "compute_type" {
  type        = "string"
  description = "https://docs.aws.amazon.com/codebuild/latest/userguide/build-env-ref-compute-types.html"
  default     = "BUILD_GENERAL1_SMALL"
}

variable "image" {
  type        = "string"
  description = "Docker image for building and testing binary, overridable by publicly available image from docker hub or AWS provided images"
  default     = "traveloka/postgresql-proxy-builder:latest"
}

