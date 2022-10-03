module "service_catalog_deployment_pipeline" {
  source                  = "../module/"
  template_bucket         = aws_s3_bucket.template_store
  template_zip_object     = aws_s3_object.template
  template_path           = basename(data.archive_file.template.source_file)
  service_catalog_product = aws_servicecatalog_product.template
  manual_approval_enabled = true
}