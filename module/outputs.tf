output "pipeline_name" {
    description = "The name of the pipeline created"
    value = aws_codepipeline.codepipeline.name
}

output "pipeline_arn" {
    description = "The arn of the pipeline created"
    value = aws_codepipeline.codepipeline.arn
}