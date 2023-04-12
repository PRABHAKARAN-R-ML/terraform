provider "aws" {
  region = "us-east-1"
  version = "~> 3.0"
  
}
terraform {
  backend "s3" {
    bucket = "prabhubuckets"
    key    = "sample-folder/terraform.tfstate"
    region = "us-east-1"
  }

}


