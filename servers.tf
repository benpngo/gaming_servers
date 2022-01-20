resource "aws_key_pair" "main" {
  key_name   = var.key_name
  public_key = var.pubkey
}

# Create the server
resource "aws_instance" "main" {
  ami = "ami-002068ed284fb165b"

  instance_type    = "t3.2xlarge"
  key_name         = aws_key_pair.main.key_name
  subnet_id        = aws_subnet.public_subnet.id
  user_data_base64 = base64encode(data.template_file.pz.rendered)
  vpc_security_group_ids = [
    aws_security_group.pz_sg.id
  ]

  root_block_device {
    volume_size = 128
  }
  lifecycle {
    ignore_changes = [
      # Ignore changes so VM doesn't get rebuilt
      user_data_base64
    ]
  }
  tags = {
    Name = "gaming_server"
  }
}

resource "aws_eip" "main" {
  vpc = true

  instance   = aws_instance.main.id
  depends_on = [aws_internet_gateway.infra]
}



