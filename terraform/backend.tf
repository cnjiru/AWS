terraform {
  backend "s3" {
    bucket         = "aws-state-files"
    key            = "state/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "aws-statelock-files"
    kms_key_id     = "4d709a24-da54-4e9b-9f99-46456fa010f1"
  }
}
