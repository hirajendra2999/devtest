#Assignment 3
provider "aws" {
        alias = "NV"
        region = "us-east-1"
        #access_key = ""
        #secret_key = ""
}
provider "aws" {
        alias = "Ohio"
        region = "us-east-2"
        access_key = ""
        secret_key = ""
}
resource "aws_instance" "assignment-3-1" {
        provider = aws.NV
        ami = "ami-08d4ac5b34553e16"
        instance_type = "t2.micro"
        key_name = "Sameer"
        tags = {
        Name = "hello-virginia"
        }
}
resource "aws_instance" "assignment-3-2" {
        provider = aws.Ohio
        ami = "ami-0960ab670c8bb45f3"
        instance_type = "t2.micro"
        key_name = ""
        tags = {
        Name = "hello-ohio"
        }
}