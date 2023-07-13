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


 install-apache2.sh =
= <<-EOF
#!/bin/bash
sudo apt update -y
sudo apt install apache2 -y
sudo su
echo "Custom html page" > /var/www/html/index.html
EOF

/*user_data = <<-EOF
      #!/bin/bash
      yum install httpd -y
      systemctl start httpd
      systemctl enable httpd
      echo "<h1> hello world" > /var/www/html/index.html
    EOF    

    user_data = <<-EOF
   #!/bin/bash
   yum install httpd -y
   systemctl start httpd
   systemctl enable httpd
   mkdir /var/www/html/mobile
   echo "<H1>This is Mobile Page" > /var/www/html/mobile/index.html
   EOF
    */