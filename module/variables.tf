variable "template_bucket" {
  description = "S3 Bucket resource where the template is stored"
  type = object({
    arn    = string
    bucket = string
  })
}

variable "template_zip_object" {
  description = "Zipped template object in S3"
  type = object({
    key = string
  })

  validation {
    condition     = endswith(var.template_zip_object.key, ".zip")
    error_message = "The template_zip_object.key value must be a compressed file ending with \".zip\"."
  }
}

variable "template_path" {
  description = "Path to the file inside the zip file"
  type        = string

  validation {
    condition     = endswith(var.template_path, ".yml") || endswith(var.template_path, ".yaml") || endswith(var.template_path, ".json")
    error_message = "The template_key value must be a compressed file ending with \".yml\", \".yaml\" or \".json\" ."
  }
}

variable "service_catalog_product" {
  description = "The Service Catalog product to deploy the template to"
  type = object({
    arn = string
    id  = string
  })
}

variable "manual_approval_enabled" {
  description = "Enable manual approval within the pipeline stages."
  type        = bool
  default     = false
}

variable "manual_approval_comments" {
  description = "(Ignore if manual approval is disabled) The comments displayed to the user when manual approval is needed"
  type        = string
  default     = "A review is needed for deploying this service catalog product"
}

variable "manual_approval_url" {
  description = "(Ignore if manual approval is disabled) The url you want to provide to the user as part of the approval request"
  type        = string
  default     = ""
}

variable "custom_test_buildspec" {
  description = "Custom buildspec for the codebuild container."
  type        = string
  default     = ""
}