provider "aws" {
        #access_key = ""
        #secret_key = ""
        region = "us-east-2"
}

resource "aws_instance" "a5-instance" {
        ami = "ami-024e6efaf93d85776"
        instance_type = "t2.micro"
        key_name = ""
        user_data = "${file("install-apache2.sh")}"
        tags = {
                Name = "a5-instance"
        }
}

output "IPv4" {
        value = aws_instance.a5-instance.public_ip
}


 install-apache2.sh 
= install-apache2.sh 
#!/bin/bash
sudo apt update -y
sudo apt install apache2 -y
sudo su
echo "Custom html page" > /var/www/html/index.html