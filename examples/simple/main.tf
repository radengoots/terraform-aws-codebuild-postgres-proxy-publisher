provider "aws" {
  region  = "ap-southeast-1"
}

module "codebuild_backend_common_rules_engine" {
  source          = "../../"
  product_domain  = "bei"
  jar_name        = "rules-engine-repository-db-proxy"
  source_location = "https://github.com/traveloka/tv-sql-product.git"
  project_path    = "backend/common/rules-engine"
  service_role    = "ServiceRoleForCodeBuild_TvSQLPublisher_26c1ab9cdd15094b010d"
}
