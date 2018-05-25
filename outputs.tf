output "codebuild_project" {
  description = "CodeBuild project name"
  value       = "${aws_codebuild_project.this.name}"
}
