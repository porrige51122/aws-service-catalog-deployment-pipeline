resource "aws_servicecatalog_product" "template" {
  name        = var.product_name
  owner       = var.product_owner
  type        = "CLOUD_FORMATION_TEMPLATE"
  description = var.product_description

  provisioning_artifact_parameters {
    name         = "1"
    template_url = "https://gist.github.com/porrige51122/7ddea578fd23d45fced948365da226aa/raw" # Blank Cloudformation Template
    type         = "CLOUD_FORMATION_TEMPLATE"
  }
}