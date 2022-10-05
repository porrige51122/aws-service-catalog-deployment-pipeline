/**
 * ## outputs.tf
 *
 * Generic outputs file containing everything that the user may want to know
 */

output "pipeline_name" {
  description = "The name of the pipeline created"
  value       = aws_codepipeline.codepipeline.name
}

output "pipeline_arn" {
  description = "The arn of the pipeline created"
  value       = aws_codepipeline.codepipeline.arn
}

output "pipeline_role" {
  description = "The role used for running deployments through codepipeline"
  value       = aws_iam_role.codepipeline_role
}

output "execution_role" {
  description = "The execution role within the codebuild build stage"
  value       = aws_iam_role.execution_role
}