/**
 * ## pipeline.tf
 *
 * Codepipeline which pulls from S3, tests the template, optional manual
 * approval, then deploys to a service catalog product.
 *
 */

resource "aws_codepipeline" "codepipeline" {
  name     = local.common_resource_name
  role_arn = aws_iam_role.codepipeline_role.arn

  artifact_store {
    location = aws_s3_bucket.artifact_store.bucket
    type     = "S3"
  }

  stage {
    name = "Source"

    action {
      name             = "source"
      category         = "Source"
      owner            = "AWS"
      provider         = "S3"
      version          = "1"
      output_artifacts = ["source_output"]

      configuration = {
        S3Bucket             = var.template_bucket.bucket
        S3ObjectKey          = var.template_zip_object.key
        PollForSourceChanges = true
      }
    }
  }

  stage {
    name = "Test"

    action {
      name            = "static-analysis"
      category        = "Test"
      owner           = "AWS"
      provider        = "CodeBuild"
      input_artifacts = ["source_output"]
      version         = "1"

      configuration = {
        ProjectName   = aws_codebuild_project.static_tests.name
        PrimarySource = "source_output"
      }
    }
  }

  dynamic "stage" {
    for_each = local.approval
    content {
      name = "Approval"

      action {
        name     = "manual-approval"
        category = "Approval"
        owner    = "AWS"
        provider = "Manual"
        version  = "1"
        configuration = {
          "CustomData"         = var.manual_approval_comments
          "ExternalEntityLink" = stage.value
        }
      }
    }
  }

  stage {
    name = "Deploy"

    action {
      name             = "deploy"
      category         = "Deploy"
      owner            = "AWS"
      provider         = "ServiceCatalog"
      input_artifacts  = ["source_output"]
      output_artifacts = []
      version          = "1"
      configuration = {
        "ProductId"          = var.service_catalog_product.id
        "ProductType"        = "CLOUD_FORMATION_TEMPLATE"
        "ProductVersionName" = "1"
        "TemplateFilePath"   = var.template_path
      }
    }
  }

}