resource "aws_vpc" "myvpc" {
  tags = {
    name = "vpccreationtest"
  }

  cidr_block = "10.0.0.0/24"
}

resource "aws_subnet" "sub1" {
  vpc_id     = aws_vpc.myvpc.id
  cidr_block = "10.0.0.0/26"
  depends_on = [aws_vpc.myvpc]

  tags = {
    name = "sub1"
  }
}