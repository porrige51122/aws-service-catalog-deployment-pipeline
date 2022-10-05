/**
 * ## main.tf
 *
 * This file deploys the module with all the resources created
 * in the other files. Please check them out if you want to know
 * more about this deployment
 */

module "service_catalog_deployment_pipeline" {
  # Source is relative for testing, externally use: 
  # "github.com/porrige51122/aws-service-catalog-deployment-pipeline/module"
  source = "../module/"

  # These refer to details about the bucket where the template is stored
  template_bucket     = aws_s3_bucket.template_store
  template_zip_object = aws_s3_object.template
  template_path       = basename(data.archive_file.template.source_file)

  # This is the service catalog product that we are deploying to
  service_catalog_product = aws_servicecatalog_product.template

  # This is an optional extra step in the pipeline that allows manual approval
  manual_approval_enabled = true
  # manual_approval_comments = "Comments for the user to see on the approval stage"
  # manual_approval_url      = "URL for the user to see during the approval stage"

  # This is a custom buildspec that you can pass in, allowing for custom tests in your pipeline
  custom_test_buildspec = data.local_file.buildspec_file.content

  # Tags parameter to allow automatic tagging of resources
  tags = {
    "Environment" = "dev"
  }
}