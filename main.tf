resource "aws_codebuild_project" "this" {
  name         = "${var.product_domain}-${var.jar_name}"
  description  = "CodeBuild project for publishing ${var.product_domain}_${var.jar_name} proxy binary"
  service_role = "${data.aws_iam_role.code_build_service_role.arn}"

  artifacts {
    type = "NO_ARTIFACTS"
  }

  environment {
    compute_type = "${var.compute_type}"
    image        = "${var.image}"
    type         = "LINUX_CONTAINER"
  }

  source {
    type      = "GITHUB"
    location  = "${var.source_location}"
    buildspec = "${data.template_file.buildspec.rendered}"
  }

  tags {
    "ProductDomain" = "${var.product_domain}"
    "JarName"       = "${var.jar_name}"
    "Description"   = "${local.description}"
    "Environment"   = "${local.environment}"
  }
}
