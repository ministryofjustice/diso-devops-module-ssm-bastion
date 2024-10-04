terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      ## this is set for NAC
      ## when NAC updated this branch can be deleted
      ## point NAC at latest main github hash
      version = "~> 4.0"
    }
  }
}
