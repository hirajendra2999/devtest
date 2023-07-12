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
        #access_key = ""
        #secret_key = ""
}
resource "aws_instance" "assignment-3-1" {
        provider = aws.NV
        ami = "ami-04823729c75214919"
        instance_type = "t2.micro"
        key_name = "Sameer"
        tags = {
        Name = "hello-virginia"
        }
}
resource "aws_instance" "assignment-3-2" {
        provider = aws.Ohio
        ami = "ami-069d73f3235b535bd"
        instance_type = "t2.micro"
        key_name = "raj"
        tags = {
        Name = "hello-ohio"
        }
}