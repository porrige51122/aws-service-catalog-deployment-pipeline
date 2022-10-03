/**
 * ## buildspec.tf
 *
 * This file simply imports the yml buildspec file as a
 * terraform resource
 *
 */

data "local_file" "buildspec_file" {
  filename = "${path.module}/buildspecs/custom_specification.yml"
}