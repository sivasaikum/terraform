terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~>5.0"
        }

    }

    backend  "s3" {
        bucket = "sai-tf-state-remote2"
        key = "App10/terraform-foreachloop"
        region = "us-east-1"
        dynamodb_table = "sai-tf-state-locking"
    }
    
}

provider "aws" {
    region = "us-east-1"
}