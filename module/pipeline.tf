resource "aws_codepipeline" "codepipeline" {
  name     = "service-catalog-pipeline"
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
        S3ObjectKey          = var.template_key
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

}