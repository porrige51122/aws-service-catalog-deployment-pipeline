data "aws_caller_identity" "current" {}

locals {
  # Common Resource Name so name can be changed centrally much easier
  common_resource_name = "sc-pipeline-${data.aws_caller_identity.current.account_id}"

  # Automatically fill manual_approval_url with S3 Bucket URL
  manual_approval_url = var.manual_approval_url == "" ? "https://s3.console.aws.amazon.com/s3/buckets/${var.template_bucket.bucket}" : var.manual_approval_url

  # A work around to use an "if" statement within the manual approval action allowing
  # user to decide if they want to enable manual approval or not.
  approval = var.manual_approval_enabled ? [local.manual_approval_url] : []

  test_buildspec = var.custom_test_buildspec != "" ? var.custom_test_buildspec : data.local_file.static_tests_file.content
}