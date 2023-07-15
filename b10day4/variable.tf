variable "vpc_cidr" {
  description = "Enter vpc CIDR"
  type = string
  default = "172.25.0.0/16"
}

variable "private_subnet_cidr" {
  description = "Enter Private subnet CIDR"
  type = string
  default = "172.25.0.0/20"
}

variable "public_subnet_cidr" {
  description = "Enter Public subnet CIDR"
  type = string
  default = "172.25.16.0/20"
}

variable "tags" {
  default = "Dev"
  type = string
}

variable "ami_id" {
    default = "ami-078efad6f7ec18b8a"
}

variable "instance_type" {
  default = "t2.micro"
}