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