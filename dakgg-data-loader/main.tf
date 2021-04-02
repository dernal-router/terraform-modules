terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
   region = "us-east-1"
}

variable "dakgg_data_loader_location" {
  type        = string
  description = "The location of the data loader lambda code"
}
