terraform {
  backend "s3" {
    bucket = "tfstatefiletestbucket2806"
    region = "ap-south-1"
    key    = "terraform.tfstate"
    dynamodb_table = "terraform-locks"
  }
}