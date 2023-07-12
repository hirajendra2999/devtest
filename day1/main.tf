provider "aws" {
        region = "us-east-2"
       # access_key = ""
       # secret_key = ""
}

resource "aws_instance" "assignment-4" {
        ami = "ami-069d73f3235b535bd"
        instance_type = "t2.micro"
        key_name = ""
        tags = {
        Name = "assignment-1"
        }
}