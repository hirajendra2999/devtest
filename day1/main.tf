provider "aws" {
        region = "us-east-2"
        access_key = ""
        secret_key = ""
}

resource "aws_instance" "assignment-4" {
        ami = "ami-006935d9a6773e4ec"
        instance_type = "t2.micro"
        key_name = ""
        tags = {
        Name = "assignment-1"
        }
}