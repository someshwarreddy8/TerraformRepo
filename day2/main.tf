resource "aws_instance" "ec21" {
  ami = "ami-0b09627181c8d5778"
  instance_type = "t2.micro"
  availability_zone = "ap-south-1b"

  tags = {
    Name = "ec2nameupdate"
  }
}