resource "aws_vpc" "infra" {
  cidr_block           = "10.11.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    Name = "gaming"
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id            = aws_vpc.infra.id
  cidr_block        = "10.11.1.0/24"
  availability_zone = "us-east-2b"
  tags = {
    Name = "public_subnet"
  }
}

resource "aws_internet_gateway" "infra" {
  vpc_id = aws_vpc.infra.id
  tags = {
    Name = "igw"
  }
}

resource "aws_default_route_table" "infra" {
  default_route_table_id = aws_vpc.infra.default_route_table_id
  tags = {
    Name = "infrastructure"
  }
}

resource "aws_route" "infra" {
  route_table_id         = aws_default_route_table.infra.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.infra.id
  depends_on             = [aws_default_route_table.infra]

}

resource "aws_route_table_association" "public_subnet" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_default_route_table.infra.id
}
