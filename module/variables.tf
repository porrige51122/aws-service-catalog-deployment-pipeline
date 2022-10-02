variable "template_bucket" {
  description = "S3 Bucket resource where the template is stored"
  type = object({
    bucket = string
    arn    = string
  })
}

variable "template_key" {
  description = "Key to the template object in s3"
  type        = string

  validation {
    condition     = endswith(var.template_key, ".zip")
    error_message = "The template_key value must be a compressed file ending with \".zip\"."
  }
}