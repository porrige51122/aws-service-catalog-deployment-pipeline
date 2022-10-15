/**
 *
 * A pipeline for deploying a cloudformation template to a service catalog
 * product.
 *
 * As with every piece of code on the internet. Please read through this code
 * (especially ./iam.tf) before deploying to your own aws account.
 * 
 */

data "aws_caller_identity" "current" {}

locals {
  # Common Resource Name so name can be changed centrally much easier
  common_resource_name = "${trimsuffix(basename(var.template_zip_object.key), ".zip")}-sc-pipeline"

  # Automatically fill manual_approval_url with S3 Bucket URL
  manual_approval_url = var.manual_approval_url == "" ? "https://s3.console.aws.amazon.com/s3/buckets/${var.template_bucket.bucket}" : var.manual_approval_url

  # A work around to use an "if" statement within the manual approval action allowing
  # user to decide if they want to enable manual approval or not.
  approval = var.manual_approval_enabled ? [local.manual_approval_url] : []

  # A work around to use an "if" statement for toggling using a built in buildspec or
  # using the one given by the user
  test_buildspec = var.custom_test_buildspec != "" ? var.custom_test_buildspec : data.local_file.static_tests_file.content
}