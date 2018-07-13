provider "aws" {
  region = "ap-southeast-1"
}

module "codebuild_backend_common_rules_engine" {
  source          = "../../"
  product_domain  = "test"
  jar_name        = "test"
  source_location = "https://github.com/traveloka/test.git"
  project_path    = "backend/common/test"
  service_role    = "ServiceRoleForCodeBuild_TvSQLPublisher_Test"
}
