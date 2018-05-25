resource "aws_codebuild_project" "this" {
  name         = "${replace("TvSQLPublisher_${var.project_path}", "/", "_")}"
  description  = "CodeBuild project for publishing ${var.project_path} proxy binary"
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
}
