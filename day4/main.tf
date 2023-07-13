provider "aws" {
        region = "us-east-2"
        #access_key = ""
        #secret_key = ""
}

resource "aws_instance" "assignment-4" {
        ami = "ami-069d73f3235b535bd"
        instance_type = "t2.micro"
        subnet_id = aws_subnet.assignment-4-subnet.id
        key_name = ""
        tags = {
        Name = "assignment-4"
        }
}

resource "aws_vpc" "assignment-4-vpc" {
        cidr_block = "10.10.0.0/16"
        tags = {
        Name = "assignment-4-vpc"
        }
}

resource "aws_subnet" "assignment-4-subnet" {
        vpc_id = aws_vpc.assignment-4-vpc.id
        cidr_block = "10.10.1.0/2"
        availability_zone = "us-east-2a"
        tags = {
        Name = "assignment-4-subnet"
        }
}