resource "aws_network_acl" "public_acl" {
  vpc_id     = aws_vpc.infra.id
  subnet_ids = [aws_subnet.public_subnet.id]

  ingress {
    protocol   = "-1"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  egress {
    protocol   = "-1"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  ingress {
    protocol   = "tcp"
    rule_no    = 101
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 80
    to_port    = 80
  }
  ingress {
    protocol   = "tcp"
    rule_no    = 110
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 26900
    to_port    = 26900
  }
  ingress {
    protocol   = "tcp"
    rule_no    = 120
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 1024
    to_port    = 65535
  }
  ingress {
    protocol   = "tcp"
    rule_no    = 130
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 22
    to_port    = 22
  }
  ingress {
    protocol   = "all"
    rule_no    = 140
    action     = "allow"
    cidr_block = "10.11.0.0/16"
    from_port  = 0
    to_port    = 0
  }
  ingress {
    protocol   = "udp"
    rule_no    = 150
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 26900
    to_port    = 26905
  }
  ingress {
    protocol   = "tcp"
    rule_no    = 160
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 2450
    to_port    = 2460
  }
  ingress {
    protocol   = "udp"
    rule_no    = 170
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 2450
    to_port    = 2460
  }

  egress {
    protocol   = "tcp"
    rule_no    = 101
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 80
    to_port    = 80
  }
  egress {
    protocol   = "tcp"
    rule_no    = 110
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 443
    to_port    = 443
  }
  egress {
    protocol   = "tcp"
    rule_no    = 120
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 1024
    to_port    = 65535
  }
  egress {
    protocol   = "tcp"
    rule_no    = 130
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 22
    to_port    = 22
  }
  egress {
    protocol   = "all"
    rule_no    = 140
    action     = "allow"
    cidr_block = "10.11.0.0/16"
    from_port  = 0
    to_port    = 0
  }
  egress {
    protocol   = "tcp"
    rule_no    = 150
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 26900
    to_port    = 26900
  }
  egress {
    protocol   = "udp"
    rule_no    = 160
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 26900
    to_port    = 26905
  }
  egress {
    protocol   = "tcp"
    rule_no    = 170
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 2450
    to_port    = 2460
  }
  egress {
    protocol   = "udp"
    rule_no    = 180
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 2450
    to_port    = 2460
  }

  tags = {
    Name = "public_acl"
  }

}
