provider "aws" {
        region = "us-east-2"
        #access_key = ""
        #secret_key = ""
}
resource "aws_instance" "assignment-2" {
        ami = "ami-069d73f3235b535bd"
        instance_type = "t2.micro"
        key_name = ""
        tags = {
        Name = "assignment-2"
        }
}
resource "aws_eip" "eip" {
  vpc = false
}
resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.assignment-2.id
  allocation_id = aws_eip.eip.id
}