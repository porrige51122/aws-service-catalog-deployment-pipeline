<!-- BEGIN_TF_DOCS -->
# AWS Service Catalog - Deployment Pipeline
![image](https://img.shields.io/github/workflow/status/porrige51122/aws-service-catalog-deployment-pipeline/Terraform%20Format%20Check/main)


A pipeline for deploying a cloudformation template to a service catalog
product.

As with every piece of code on the internet. Please read through this code
(especially ./iam.tf) before deploying to your own aws account.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.15 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.33.0 |
| <a name="requirement_local"></a> [local](#requirement\_local) | >= 2.2.3 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 4.33.0 |
| <a name="provider_local"></a> [local](#provider\_local) | >= 2.2.3 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_service_catalog_product"></a> [service\_catalog\_product](#input\_service\_catalog\_product) | The Service Catalog product to deploy the template to | <pre>object({<br>    arn = string<br>    id  = string<br>  })</pre> | n/a | yes |
| <a name="input_template_bucket"></a> [template\_bucket](#input\_template\_bucket) | S3 Bucket resource where the template is stored | <pre>object({<br>    arn    = string<br>    bucket = string<br>  })</pre> | n/a | yes |
| <a name="input_template_path"></a> [template\_path](#input\_template\_path) | Path to the file inside the zip file | `string` | n/a | yes |
| <a name="input_template_zip_object"></a> [template\_zip\_object](#input\_template\_zip\_object) | Zipped template object in S3 | <pre>object({<br>    key = string<br>  })</pre> | n/a | yes |
| <a name="input_custom_test_buildspec"></a> [custom\_test\_buildspec](#input\_custom\_test\_buildspec) | Custom buildspec for the codebuild container. | `string` | `""` | no |
| <a name="input_manual_approval_comments"></a> [manual\_approval\_comments](#input\_manual\_approval\_comments) | (Ignore if manual approval is disabled) The comments displayed to the user when manual approval is needed | `string` | `"A review is needed for deploying this service catalog product"` | no |
| <a name="input_manual_approval_enabled"></a> [manual\_approval\_enabled](#input\_manual\_approval\_enabled) | Enable manual approval within the pipeline stages. | `bool` | `false` | no |
| <a name="input_manual_approval_url"></a> [manual\_approval\_url](#input\_manual\_approval\_url) | (Ignore if manual approval is disabled) The url you want to provide to the user as part of the approval request | `string` | `""` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Resource tagging | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_execution_role"></a> [execution\_role](#output\_execution\_role) | The execution role within the codebuild build stage |
| <a name="output_pipeline_arn"></a> [pipeline\_arn](#output\_pipeline\_arn) | The arn of the pipeline created |
| <a name="output_pipeline_name"></a> [pipeline\_name](#output\_pipeline\_name) | The name of the pipeline created |
| <a name="output_pipeline_role"></a> [pipeline\_role](#output\_pipeline\_role) | The role used for running deployments through codepipeline |

## Resources

| Name | Type |
|------|------|
| [aws_codebuild_project.static_tests](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/codebuild_project) | resource |
| [aws_codepipeline.codepipeline](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/codepipeline) | resource |
| [aws_iam_role.codepipeline_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.execution_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy.codepipeline_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |
| [aws_iam_role_policy.execution_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |
| [aws_s3_bucket.artifact_store](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_acl.artifact_store_acl](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_acl) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [local_file.static_tests_file](https://registry.terraform.io/providers/hashicorp/local/latest/docs/data-sources/file) | data source |
<!-- END_TF_DOCS -->