resource "aws_instance" "test_instance" {
  ami  = var.test_instance_ami
  instance_type = var.test_instance_type
  availability_zone = var.test_instance_az

  tags = {
    name = var.test_instance_name
  }
}

resource "aws_s3_bucket" "test_bucket" {
  bucket = var.test_instance_backetname
}
