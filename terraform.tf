terraform {
  backend "s3" {
    bucket = "prabhubuckets"
    key    = "sample-folder/terraform.tfstate"
    region = "us-east-1"
  }
}
