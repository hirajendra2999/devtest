resource "aws_vpc" "my-vpc" {
cidr_block = "${var.vpc_cidr}"
   tags = {
    Name =  "my-vpc"
    Env = "${var.tags}"
  }
}

resource "aws_subnet" "private-subnet-a" {
  vpc_id = "${aws_vpc.my-vpc.id}"
  cidr_block = "${var.private_subnet_cidr}"
   tags = { 
    Name =  "$private_subnet"
    Env = "${var.tags}"
  }
}
resource "aws_subnet" "public-subnet-a" {
  vpc_id = "${aws_vpc.my-vpc.id}"
  cidr_block = "${var.public_subnet_cidr}"
   tags = { 
    Name =  "public_subnet"
    Env = "${var.tags}"
  }
  map_public_ip_on_launch = true
  availability_zone = "ap-south-1a"
}

resource "aws_subnet" "public-subnet-b" {
  vpc_id = "${aws_vpc.my-vpc.id}"
  cidr_block = "172.25.32.0/20"
   tags = { 
    Name =  "public_subnet"
    Env = "${var.tags}"
  }
  map_public_ip_on_launch = true
  availability_zone = "ap-south-1b"
}
resource "aws_internet_gateway" "my-igw" {
  vpc_id = aws_vpc.my-vpc.id
  tags = {
    Name = "my-igw"
    Env = "${var.tags}"
  }
}
resource "aws_default_route_table" "my-rt" {
  default_route_table_id = "${aws_vpc.my-vpc.default_route_table_id}"
    route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.my-igw.id}"
  }
  tags = { 
    Name = "my-rt"
    Env = "${var.tags}"
  }
}


resource "aws_security_group" "my-sg" {
  name = "my-security-group"
  description = "Allowing http, ssh, http"
  vpc_id = "${aws_vpc.my-vpc.id}"
   ingress {
    description = "SSH Port"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "HTTP Port"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
 egress {
    description = "OUTBOUND ALL ALLOW"
    from_port = 0
    to_port = 0
    protocol = "-1"    
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
   tags = { 
    Name = "my-sg"
    Env = "${var.tags}"
  }
}

/*
resource "aws_instance" "private_instance" {
  ami = "${var.image_id}"
  instance_type = "${var.instance_type}"
  vpc_security_group_ids = ["${aws_vpc.my_vpc.default_security_group_id}"]
key_name = var.key_pair
 tags = { 
    Name = "private"
    Env = "${var.tags}"
  }
subnet_id = "${aws_subnet.private_subnet.id}"
}

resource "aws_instance" "public_instance" {
  ami = "${var.image_id}"
  instance_type = "${var.instance_type}"
  vpc_security_group_ids = ["${aws_vpc.my_vpc.default_security_group_id}"]
key_name = var.key_pair
 tags = { 
    Name = "public"
    Env = "${var.tags}"
  }
subnet_id = "${aws_subnet.public_subnet.id}"
user_data = <<-EOF
      #!/bin/bash
      yum install httpd -y
      systemctl start httpd
      systemctl enable httpd
      echo "<h1> hello world" > /var/www/html/index.html
    EOF    
  key_name = "rajmumbai"
}
*/
