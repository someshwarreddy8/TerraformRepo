resource "aws_vpc" "vpccreation" {
  tags = {
    Name = "vpccreation"
  }

  cidr_block = "10.0.0.0/24"
}

resource "aws_internet_gateway" "myinternetgatewaycreation" {
  tags = {
    Name = "myinternetgatewaycreation"
  }

  vpc_id     = aws_vpc.vpccreation.id
  depends_on = [aws_vpc.vpccreation]
}

resource "aws_subnet" "pubsub1creation" {
  vpc_id     = aws_vpc.vpccreation.id
  cidr_block = "10.0.0.0/26"
  depends_on = [ aws_vpc.vpccreation ]

  tags = {
    Name = "pubsub1"
  }

}

resource "aws_subnet" "pvtsub2creation" {
  vpc_id     = aws_vpc.vpccreation.id
  cidr_block = "10.0.0.64/26"
  depends_on = [ aws_vpc.vpccreation ]

  tags = {
    Name = "pvtsub2"
  }
}

resource "aws_route_table" "pubroutetablecreation" {
  vpc_id = aws_vpc.vpccreation.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.myinternetgatewaycreation.id
  }
}

resource "aws_route_table_association" "pubroutetableassosiation" {
  route_table_id = aws_route_table.pubroutetablecreation.id
  subnet_id      = aws_subnet.pubsub1creation.id
}

