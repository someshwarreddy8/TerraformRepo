resource "aws_vpc" "myvpc" {
  tags = {
    Name = "vpccreationtest"
  }

  cidr_block = "10.0.0.0/24"
}

resource "aws_subnet" "sub1" {
  vpc_id     = aws_vpc.myvpc.id
  cidr_block = "10.0.0.0/26"
  depends_on = [aws_vpc.myvpc]

  tags = {
    Name = "sub1"
  }

}

resource "aws_subnet" "sub2" {
  vpc_id     = aws_vpc.myvpc.id
  cidr_block = "10.0.0.64/26"
  depends_on = [aws_vpc.myvpc]

  tags = {
    Name = "sub2"
  }
}

resource "aws_subnet" "sub3" {
  vpc_id     = aws_vpc.myvpc.id
  cidr_block = "10.0.0.128/26"
  depends_on = [aws_vpc.myvpc]

  tags = {
    Name = "sub3"
  }

}
