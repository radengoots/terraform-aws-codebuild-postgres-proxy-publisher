output "codebuild_project" {
  description = "The name of CodeBuild project"
  value       = "${module.this.codebuild_project}"
}
