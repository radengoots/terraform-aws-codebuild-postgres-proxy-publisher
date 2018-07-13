provider "aws" {
  region = "ap-southeast-1"
}

module "this" {
  source             = "../../"
  product_domain     = "test"
  jar_name           = "test"
  source_location    = "https://github.com/traveloka/test.git"
  project_path       = "backend/common/test"
  service_role       = "${data.terraform_remote_state.service_role.role_name}"
  pre_build_commands = ["ls", "ps aux"]
}
