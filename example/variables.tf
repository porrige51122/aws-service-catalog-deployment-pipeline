variable "product_name" {
  description = "Name of the AWS Service Catalog product"
  type        = string
  default     = "example_product"
}

variable "product_owner" {
  description = "Name of the AWS Service Catalog product owner"
  type        = string
  default     = "porrige51122"
}

variable "product_description" {
  description = "Description of the AWS Service Catalog product"
  type        = string
  default     = "Example product deployed from https://github.com/porrige51122/aws-service-catalog-deployment-pipeline"
}