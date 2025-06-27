resource "aws_instance" "instance16" {
  ami = var.instance16_ami
  instance_type = var.instance16_type
  availability_zone = var.instance16_zoneId

  tags = {
    Name = var.instance16_Name
  }
}


resource "aws_s3_bucket" "mys3bucket" {
  bucket = var.bucketname
}