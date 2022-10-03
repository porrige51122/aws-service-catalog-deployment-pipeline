data "local_file" "buildspec_file" {
  filename = "${path.module}/buildspecs/custom_specification.yml"
}