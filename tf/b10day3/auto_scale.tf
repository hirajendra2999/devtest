 resource "aws_launch_configuration" "lc-home" {
   image_id = "${var.ami_id}"
   instance_type = "${var.instance_type}"
   security_groups = ["${aws_security_group.my-sg.id}"]
   key_name = "rajmumbai"
   user_data = <<-EOF
   #!/bin/bash
   yum install httpd -y
   systemctl start httpd
   systemctl enable httpd
   echo "<H1>homepage" > /var/www/html/index.html
   EOF
    }
      
  resource "aws_launch_configuration" "lc-mobile" {
   image_id = "${var.ami_id}"
   instance_type = "${var.instance_type}"
   security_groups = ["${aws_security_group.my-sg.id}"]
   key_name = "rajmumbai"
   user_data = <<-EOF
   #!/bin/bash
   yum install httpd -y
   systemctl start httpd
   systemctl enable httpd
   mkdir /var/www/html/mobile
   echo "<H1>This is Mobile Page" > /var/www/html/mobile/index.html
   EOF
    }
   
   resource "aws_launch_configuration" "lc-laptop" {
   image_id = "${var.ami_id}"
   instance_type = "${var.instance_type}"
   security_groups = ["${aws_security_group.my-sg.id}"]
   key_name = "rajmumbai"
   user_data = <<-EOF
   #!/bin/bash
   yum install httpd -y
   systemctl start httpd
   systemctl enable httpd
   mkdir /var/www/html/laptop
   echo "<H1>This is Laptop Page" > /var/www/html/laptop/index.html
   EOF
   }
   
   resource "aws_autoscaling_group" "as-home" {
    name = "AS-HOME"
    max_size = 2
    min_size = 2
    desired_capacity = 2
    launch_configuration = "${aws_launch_configuration.lc-home.name}"
    vpc_zone_identifier = ["${aws_subnet.public-subnet-a.id}", "${aws_subnet.public-subnet-b.id}"]
   tag {
    key = "Name"
    value = "homepage"
    propagate_at_launch = true
   }
   }

   resource "aws_autoscaling_group" "as-mobile" {
     name = "AS-MOBILE"
     max_size = 2
     min_size = 2
     desired_capacity = 2
     launch_configuration = "${aws_launch_configuration.lc-mobile.name}"
     vpc_zone_identifier = ["${aws_subnet.public-subnet-a.id}", "${aws_subnet.public-subnet-b.id}"]
   tag {
    key = "Name"
    value = "mobile_page"
    propagate_at_launch = true
   }
   }

   resource "aws_autoscaling_group" "as-laptop" {
     name = "AS-LAPTOP"
     max_size = 3
     min_size = 1
     desired_capacity = 2
     launch_configuration = "${aws_launch_configuration.lc-laptop.name}"
     vpc_zone_identifier = ["${aws_subnet.public-subnet-a.id}", "${aws_subnet.public-subnet-b.id}"]
     tag {
    key = "Name"
    value = "laptop_page"
    propagate_at_launch = true
   }
   }