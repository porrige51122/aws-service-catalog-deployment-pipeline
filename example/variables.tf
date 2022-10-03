/**
 * ## variables.tf
 *
 * This file contains all input variables. They all have a default
 * value so don't need ot be filled. However, they can be changed by
 * setting env variables like so:
 *
 * `export TF_VAR_product_name=new_example_product`
 *
 * Or within your terraform apply command:
 *
 * `terraform apply -var="product_name=new_example_product" -var="product_owner=not_porrige51122"`
 *
 */

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