resource "aws_vpc" "my-vpc" {
    cidr_block = "${var.vpc_cidr}"
    tags  = {
        Name = "my-vpc"
        Env = "${var.env_tag}"
    }  
}
resource "aws_subnet" "public-subnet-a" {
  vpc_id                  = "${var.vpc_id}"
  cidr_block              = "${var.subnet_cidr}"
   tags                   = { 
    Name                  =  "public_subnet"
    Env                   = "${var.env_tag}"
  }
  map_public_ip_on_launch = "${var.allow_public_ip}"
  availability_zone        = "${var.az_name}"
}    