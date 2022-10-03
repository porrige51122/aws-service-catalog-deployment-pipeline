/**
 * ## versions.tf
 *
 * A Basic versions file.
 *  - AWS used for deploying resources
 *  - local used for using local files such as the buildspecs
 */

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.33.0"
    }
    local = {
      source  = "hashicorp/local"
      version = ">= 2.2.3"
    }
  }
  required_version = ">= 0.15"
}

