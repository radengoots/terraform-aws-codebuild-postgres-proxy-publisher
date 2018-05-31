output "codebuild_project" {
  description = "The name of CodeBuild project"
  value       = "${module.codebuild_backend_common_rules_engine.codebuild_project}"
}
