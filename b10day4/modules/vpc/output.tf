output "vpcid" {
    value = "${aws_vpc.my-vpc.id}"
}
output "subnetid" {
  value = "${aws_subnet.public-subnet-a.id}"
}