data "archive_file" "template" {
  type        = "zip"
  source_file = "${path.module}/cloudformation/example-ec2.template"
  output_path = "${path.module}/cloudformation/example-ec2.zip"
}

resource "aws_s3_object" "template" {
  bucket = aws_s3_bucket.template_store.bucket
  key    = basename(data.archive_file.template.output_path)
  source = data.archive_file.template.output_path

  etag = filemd5(data.archive_file.template.output_path)
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