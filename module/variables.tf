variable "template_bucket" {
  description = "S3 Bucket resource where the template is stored"
  type = object({
    arn    = string
    bucket = string
  })
}

variable "template_key" {
  description = "Key to the zipped template object in S3"
  type        = string

  validation {
    condition     = endswith(var.template_key, ".zip")
    error_message = "The template_key value must be a compressed file ending with \".zip\"."
  }
}

variable "template_path" {
  description = "Path to the file inside the zip file"
  type        = string

  validation {
    condition     = endswith(var.template_path, ".yaml") || endswith(var.template_path, ".json")
    error_message = "The template_key value must be a compressed file ending with \".yaml\" or \".json\" ."
  }
}

variable "service_catalog_product" {
  description = "The Service Catalog product to deploy the template to"
  type = object({
    arn = string
    id  = string
  })
}