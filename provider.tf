terraform {
  backend "s3" {
    bucket = "piklesfastfood"
    key    = "Lambda-APIGateway/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = var.regionDefault

  default_tags {
    tags = var.tags
  }
}