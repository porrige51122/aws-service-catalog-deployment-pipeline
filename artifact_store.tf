resource "aws_s3_bucket" "artifact_store" {
  bucket = local.common_resource_name
  force_destroy = true
}