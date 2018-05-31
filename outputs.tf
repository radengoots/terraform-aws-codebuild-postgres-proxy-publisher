output "codebuild_project" {
  description = "The name of CodeBuild project"
  value       = "${aws_codebuild_project.this.name}"
}
