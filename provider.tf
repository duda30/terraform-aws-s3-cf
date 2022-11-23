terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.38.0"
    }
  }
  backend "s3" {
    bucket = "my-bucket-mary-maria12312"
    key    = "tfstate-rodobens-teste/terraform.tfstate"
    region = "us-east-2"
  }
}

provider "aws" {
  region = var.provider_region
}