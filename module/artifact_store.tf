resource "aws_s3_bucket" "artifact_store" {
  bucket        = local.common_resource_name
  force_destroy = true
}

resource "aws_s3_bucket_acl" "artifact_store_acl" {
  bucket = aws_s3_bucket.artifact_store.id
  acl    = "private"
}