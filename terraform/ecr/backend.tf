terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = ">= 5.0.0"
    }
  }

  backend "s3" {
    encrypt = true
    bucket = "nasir-cicd-eks-terraform-jenkins-voting-app"
    key = "ecr/terraform.tfstate"
    dynamodb_table = "nasir-cicd-eks-terraform-jenkins-voting-app"
    region = "ap-southeast-1"
  }

}

provider "aws" {
  region = "ap-southeast-1"
}