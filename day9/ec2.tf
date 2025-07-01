resource "aws_instance" "ec2" {
  ami                         = var.ec2ami
  instance_type               = var.typeofinstance
  key_name                    = aws_key_pair.mynewkeypair.key_name
  security_groups             = [aws_security_group.mysg.id]
  associate_public_ip_address = true
  subnet_id                   = aws_subnet.pubsub.id
  availability_zone           = "ap-south-1a"
  depends_on = [ aws_vpc.ec2vpc, aws_key_pair.mynewkeypair, aws_subnet.pubsub ]

  tags = {
    Name = "myfirstec2"
  }
}


resource "aws_vpc" "ec2vpc" {
  cidr_block = "10.0.0.0/24"

  tags = {
    Name = "ec2vpc"
  }
}

resource "aws_subnet" "pubsub" {
  vpc_id            = aws_vpc.ec2vpc.id
  cidr_block        = "10.0.0.0/26"
  availability_zone = "ap-south-1a"
  depends_on        = [aws_vpc.ec2vpc]

  tags = {
    Name = "pubsub"
  }
}

resource "aws_subnet" "pvtsub" {
  vpc_id     = aws_vpc.ec2vpc.id
  cidr_block = "10.0.0.64/26"
  depends_on = [aws_vpc.ec2vpc]

  tags = {
    Name = "pvtsub"
  }
}

resource "aws_internet_gateway" "myig" {
  vpc_id = aws_vpc.ec2vpc.id

  tags = {
    Name = "myig"
  }
}

resource "aws_route_table" "myroutetable" {
  vpc_id     = aws_vpc.ec2vpc.id
  depends_on = [aws_vpc.ec2vpc]

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.myig.id
  }
}

resource "aws_route_table_association" "routetablesubnetassociation" {
  route_table_id = aws_route_table.myroutetable.id
  subnet_id      = aws_subnet.pubsub.id
}

resource "aws_security_group" "mysg" {
  tags = {
    Name = "mysg"
  }

  vpc_id = aws_vpc.ec2vpc.id

  ingress {
    to_port    = 22
    from_port  = 22
    protocol   = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    to_port    = 0
    from_port  = 0
    protocol   = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

}

resource "tls_private_key" "ec2-pvtkey" {
  algorithm = "RSA"
}

resource "aws_key_pair" "mynewkeypair" {
  key_name   = "terraform-newkey"
  public_key = tls_private_key.ec2-pvtkey.public_key_openssh
}

resource "local_file" "private-key" {
  content         = tls_private_key.ec2-pvtkey.private_key_openssh
  filename        = "${path.module}/terraform-newec2.pem"
  file_permission = 0600
}
