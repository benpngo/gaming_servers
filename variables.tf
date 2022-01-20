
# General
variable "aws_region" {
  type        = string
  description = "VPC Region"
  default     = "us-east-2"
}


variable "key_name" {
  type        = string
  description = "SSH Key"
}

variable "pubkey" {
  type        = string
  description = "SSH pubkey"
}
