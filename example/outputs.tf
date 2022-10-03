/**
 * ## outputs.tf
 *
 * Simple output file listing a few helpful outputs generated
 * by this example. Add more if you want to know more about
 * this example.
 */

output "pipeline_name" {
  description = "The name of the pipeline created"
  value       = module.service_catalog_deployment_pipeline.pipeline_name
}

output "pipeline_arn" {
  description = "The arn of the pipeline created"
  value       = module.service_catalog_deployment_pipeline.pipeline_arn
}

output "template_bucket" {
  description = "The name of the template bucket"
  value       = aws_s3_bucket.template_store.bucket
}

output "service_catalog_product" {
  description = "The name of the service catalog product"
  value       = aws_servicecatalog_product.template.name
}