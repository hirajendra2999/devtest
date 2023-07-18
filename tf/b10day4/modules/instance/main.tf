resource "aws_instance" "private_instance" {
  ami = "${var.ami_id}"
  instance_type = "${var.instance_type}"
  vpc_security_group_ids = ["${var.security_groups}"]
    tags = {
    Name = "private"
    Env = "${var.env_tag}"
  }
  subnet_id = "${var.subnet_id}"
}   