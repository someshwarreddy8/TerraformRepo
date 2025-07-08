resource "aws_instance" "moduletestinstance" {
  ami           = var.ami_id
  instance_type = var.instance_type
}