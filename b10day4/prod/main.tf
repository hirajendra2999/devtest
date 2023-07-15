module "myvpc" {
    source = "../modules/vpc"
    #vpc_cidr = "${var.vpc_cidr}"
    vpc_cidr = "10.50.0.0/50"
    env_tag = "production"
    vpc_id = "${module.myvpc.vpcid}"
    #subnet_cidr = "${var.subnet_cidr}"

    allow_public_ip = true
}

module "myinstance" {
  source = "../modules/instance"
  ami_id = "ami-0b08bfc6ff7069aff"
  ## ami_id = "${module.myinstance.amiid}"
  instance_type = "${var.instance_type}"
  ## instance_type = "${module.myinstance.instancetype"
  env_tag = "production"
  subnet_id = "${module.myvpc.subnetid}"
}

/*module "mylb" {
  source = "../modules/loadbalancer"
}
*/