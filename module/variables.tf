variable "template_bucket_name" {
  description = "Bucket name where the template is stored"
  type        = string
}

variable "template_bucket_arn" {
  description = "Bucket arn where the template is stored"
  type        = string
}

variable "template_key" {
  description = "Key to the template object in s3"
  type        = string
}