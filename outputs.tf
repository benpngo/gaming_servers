output "public_ip_two" {
  value = aws_eip.servertwo.public_ip
}

output "seven_ip" {
  value = aws_eip.seven.public_ip
}
