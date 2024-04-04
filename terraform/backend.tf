terraform {
  backend "s3" {
    bucket         = "aws-state-files"
    key            = "state/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "aws-statelock-files"
    # kms_key_id     = "aws-statelock-files"
  }
}
