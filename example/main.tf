module "service_catalog_deployment_pipeline" {
  source               = "../module/"
  template_bucket_name = aws_s3_bucket.template_store.bucket
  template_bucket_arn  = aws_s3_bucket.template_store.arn
  template_key         = aws_s3_object.template.key
}