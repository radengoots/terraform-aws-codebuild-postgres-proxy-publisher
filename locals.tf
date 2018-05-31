locals {
  description = "CodeBuild for publishing ${var.product_domain}_${var.jar_name}"
  environment = "management"
}
