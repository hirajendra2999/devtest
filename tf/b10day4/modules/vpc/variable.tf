 variable "vpc_cidr" {
   default = "172.25.0.0"
 }
 variable "env_tag" {
   default = "dev"
 }

 variable "vpc_id" {
 }
 variable "subnet_cidr" {
   default = "172.25.0.0/20"
 }
 variable "allow_public_ip" {
   default = false
 }
 
 variable "az_name" {
   default = "ap-south-1a"
 }