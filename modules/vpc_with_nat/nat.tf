resource "aws_eip" "nat_1a" {
  tags = {
    Name = "${var.author}-natgw-1a"
  }
}

resource "aws_eip" "nat_1c" {
  tags = {
    Name = "${var.author}-natgw-1c"
  }
}

resource "aws_nat_gateway" "public_1a" {
  allocation_id = aws_eip.nat_1a.id
  subnet_id     = aws_subnet.public_1a.id

  tags = {
    Name = "${var.author}-natgw-1a"
  }
}

resource "aws_nat_gateway" "public_1c" {
  allocation_id = aws_eip.nat_1c.id
  subnet_id     = aws_subnet.public_1c.id

  tags = {
    Name = "${var.author}-natgw-1c"
  }
}
