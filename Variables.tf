variable "region" {
  default = "us-east-1"
}

variable "public_subnets" {
  type = list(string)
}

variable "private_subnets" {
  type = list(string)
}

variable "instance_type" {
  default = "t2.small"
}

variable "key_name" {}

variable "allowed_ssh_ip" {}

variable "app_port" {
  default = 1337
}
