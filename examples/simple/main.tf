provider "aws" {
  region  = "ap-southeast-1"
}

module "codebuild_backend_common_rules-engine" {
  source          = "../../"
  source_location = "https://github.com/traveloka/repo-location.git"
  project_path    = "backend/common/rules-engine"
  service_role    = "ServiceRoleForCodeBuild_TvSQLPublisher_12345acdefghijk"
}
