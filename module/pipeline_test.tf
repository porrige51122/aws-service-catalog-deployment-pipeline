resource "aws_codebuild_project" "static_tests" {
  name          = "static_tests"
  description   = "Test cloudformation template statically"
  service_role  = aws_iam_role.deploy.arn
  build_timeout = 5

  artifacts {
    type = "CODEPIPELINE"
  }

  environment {
    compute_type = "BUILD_GENERAL1_SMALL"
    image        = "aws/codebuild/amazonlinux2-aarch64-standard:2.0"
    type         = "ARM_CONTAINER"
  }

  source {
    type                = "CODEPIPELINE"
    git_clone_depth     = 0
    insecure_ssl        = false
    report_build_status = false
    buildspec           = data.local_file.static_tests_file.content
  }
}

data "local_file" "static_tests_file" {
  filename = "${path.module}/buildspecs/static_tests.yml"
}