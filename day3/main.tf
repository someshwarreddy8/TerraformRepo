resource "aws_instance" "nvirec2" {
  ami = var.nvirec2_ami
  instance_type = var.nvirec2_instance_type
  availability_zone = var.nvirec2_availability_zone

  tags = {
    Name = var.nvirec2_Name
  }
}

resource "aws_instance" "nvirec21" {
  ami = var.nvirec21_ami
  instance_type = var.nvirec21_instance_type
  availability_zone = var.nvirec21_availability_zone

  tags = {
    Name = var.nvirec21_Name
  }
}