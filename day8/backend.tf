terraform {
  backend "s3" {
    bucket         = "tfstatefiletestbucket2806"
    key            = "terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform-locks"
  }
}
