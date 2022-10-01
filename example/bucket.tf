resource "aws_s3_object" "template" {
  bucket = aws_s3_bucket.template_store.bucket
  key    = "example-ec2.template"
  source = "./cloudformation/example-ec2.template"

  etag = filemd5("./cloudformation/example-ec2.template")
}

resource "aws_s3_bucket" "template_store" {
  force_destroy = true
}

resource "aws_s3_bucket_acl" "template_store_acl" {
  bucket = aws_s3_bucket.template_store.id
  acl    = "private"
}

resource "aws_s3_bucket_versioning" "versioning_example" {
  bucket = aws_s3_bucket.template_store.id
  versioning_configuration {
    status = "Enabled"
  }
}