resource "aws_lb_target_group" "tg-home" {
 name = "tg-home"
 port = 80
 protocol = "HTTP"
 vpc_id = "${aws_vpc.my-vpc.id}"
 tags =  {
    Name = "tg-home"
    Env = "${var.tags}"
 }
 health_check {   
    path =  "/"
 }   
}
resource "aws_lb_target_group" "tg-mobile" {
 name = "tg-mobile"
 port = 80
 protocol = "HTTP"
 vpc_id = "${aws_vpc.my-vpc.id}"
 tags =  {
    Name = "tg-mobile"
    Env = "${var.tags}"
 }
 health_check {   
    path =  "/mobile"
 }
}
resource "aws_lb_target_group" "tg-laptop" {
 name = "tg-laptop"
 port = 80
 protocol = "HTTP"
 vpc_id = "${aws_vpc.my-vpc.id}"
tags = {
    Name = "tg-laptop"
    Env = "${var.tags}"
 }
 health_check {   
    path =  "/laptop"
 }
}

resource "aws_autoscaling_attachment" "attach-home" {
    autoscaling_group_name = "${aws_autoscaling_group.as-home.id}"
    lb_target_group_arn = "${aws_lb_target_group.tg-home.arn}"
}
resource "aws_autoscaling_attachment" "attach-laptop" {
    autoscaling_group_name = "${aws_autoscaling_group.as-laptop.id}"
    lb_target_group_arn = "${aws_lb_target_group.tg-laptop.arn}"
}
resource "aws_autoscaling_attachment" "attach-mobile" {
    autoscaling_group_name = "${aws_autoscaling_group.as-mobile.id}"
    lb_target_group_arn = "${aws_lb_target_group.tg-mobile.arn}"
}

resource "aws_lb" "my-lb" {
    name = "my-lb"
    internal = false
    load_balancer_type = "application"
    security_groups = ["${aws_security_group.my-sg.id}"]
    subnets = ["${aws_subnet.public-subnet-a.id}","${aws_subnet.public-subnet-b.id}"]
    tags = {
        Env = "${var.tags}"
    }
}

resource "aws_lb_listener" "default" {
    load_balancer_arn = "${aws_lb.my-lb.arn}"
    port = "80"
    protocol = "HTTP"
    default_action {
      type = "forward"
      target_group_arn = "${aws_lb_target_group.tg-home.arn}"
    }
}
resource "aws_lb_listener_rule" "laptop-rule" {
listener_arn = "${aws_lb_listener.default.arn}"
action {
         type = "forward"
      target_group_arn = "${aws_lb_target_group.tg-laptop.arn}"
    }
    condition {
        path_pattern {
            values = ["/laptop*"]
        }
    }
}
resource "aws_lb_listener_rule" "mobile-rule" {
    listener_arn = "${aws_lb_listener.default.arn}"
    action {
         type = "forward"
      target_group_arn = "${aws_lb_target_group.tg-mobile.arn}"
    }
    condition {
        path_pattern {
            values = ["/mobile*"]
        }
    }
}



