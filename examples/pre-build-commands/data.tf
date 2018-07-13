data "terraform_remote_state" "service_role" {
  backend = "s3"

  config {
    bucket         = "test-terraform-state-ap-southeast-1"
    key            = "ap-southeast-1/postgres-proxy-publisher/terraform.tfstate"
    region         = "ap-southeast-1"
    dynamodb_table = "test-terraform-state-ap-southeast-1"
  }
}
