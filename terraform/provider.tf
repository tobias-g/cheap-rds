terraform {
  required_version = ">= 1.12.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "eu-west-1"
  default_tags {
    tags = {
      App  = "cheap-rds"
      Repo = "https://github.com/tobias-g/cheap-rds"
    }
  }
}
