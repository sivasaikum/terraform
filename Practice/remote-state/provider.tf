terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~>5.0"
        }
    }

    backend "s3" {
    bucket         = "sai-tf-state-remote2"  # Name of the S3 bucket where the state will be stored.
    key            = "App10/terraform.tfstate" # Path within the bucket where the state will be read/written.
    region         = "us-east-1" # AWS region of the S3 bucket.
    dynamodb_table = "sai-tf-state-locking" # DynamoDB table used for state locking.
    # encrypt        = true  # Ensures the state is encrypted at rest in S3.
    }

}

provider "aws" {
    region = "us-east-1"
}