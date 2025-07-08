module "myownmodule" {
  source = "github.com/someshwarreddy8/TerraformRepo/day11"
#   source = "../day11"
  ami_id = "ami-0d03cb826412c6b0f"
  instance_type = "t2.micro"
  bucketName = "Testbucket08072025"
}