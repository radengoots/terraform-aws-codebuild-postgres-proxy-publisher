output "codebuild_project" {
  description = "CodeBuild project name"
  value       = "${module.codebuild_backend_common_rules-engine.codebuild_project}"
}
