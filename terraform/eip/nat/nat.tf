resource "aws_nat_gateway" "gw" {
  allocation_id = aws_eip.ok_nat.id
  subnet_id     = aws_subnet.example.id

  tags = {
    Name = "gw NAT"
  }
}

resource "aws_eip" "ok_nat" {
  vpc      = true
}

resource "aws_subnet" "example" {
    
}