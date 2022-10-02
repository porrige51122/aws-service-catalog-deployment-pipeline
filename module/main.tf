data "aws_caller_identity" "current" {}

locals {
  common_resource_name = "sc-pipeline-${data.aws_caller_identity.current.account_id}"
}