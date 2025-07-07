resource "aws_vpc" "customvpc" {
  depends_on = [aws_internet_gateway.customgateway]
  cidr_block = "10.0.0.0/24"
  tags = {
    Name = "dbtestvpc"
  }
  enable_dns_hostnames = true
  enable_dns_support = true

}

resource "aws_subnet" "pubsub1" {
  vpc_id            = aws_vpc.customvpc.id
  cidr_block        = "10.0.0.0/26"
  availability_zone = "ap-south-1a"

  tags = {
    Name = "subnet1"
  }
}

resource "aws_subnet" "pubsub2" {
  vpc_id            = aws_vpc.customvpc.id
  cidr_block        = "10.0.0.64/26"
  availability_zone = "ap-south-1b"

  tags = {
    Name = "subnet2"
  }
}

resource "aws_route_table_association" "rtassosiation" {
  route_table_id = aws_route_table.customroutetable
  subnet_id      = aws_subnet.pubsub1.id
}
resource "aws_route_table_association" "rtassosiation2" {
  route_table_id = aws_route_table.customroutetable
  subnet_id      = aws_subnet.pubsub2.id
}

resource "aws_security_group" "customsecuritygroup" {
  vpc_id = aws_vpc.customvpc.id

  ingress {
    protocol    = "tcp"
    to_port     = 3306
    from_port   = 3306
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_db_subnet_group" "customsubnetgroup" {
  name       = "customdbsubnetgroup"
  subnet_ids = [aws_subnet.pubsub1.id, aws_subnet.pubsub2.id]
}

resource "aws_db_instance" "mysqldb" {
  engine                 = "mysql"
  engine_version         = "8.0.40"
  username               = "admin"
  password               = "250240"
  instance_class         = "db.t3.micro"
  allocated_storage      = 20
  publicly_accessible    = true
  db_subnet_group_name   = aws_db_subnet_group.customsubnetgroup.id
  vpc_security_group_ids = [aws_security_group.customsecuritygroup.id]
}

resource "aws_internet_gateway" "customgateway" {
  vpc_id = aws_vpc.customvpc.id
}

resource "aws_route_table" "customroutetable" {
  vpc_id = aws_vpc.customvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.myig.id
  }

  tags = {
    Name = "pubrt"
  }
}


