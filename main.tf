provider "aws" {}

/*
 * Resources
 */

module "vpc" {
  source = "./aws_vpc"
}

module "t2nano" {
  source = "./aws_instance"

  instance_type = "t2.nano"
  subnet_id     = "${module.vpc.public_subnet_id}"
}

module "t2micro" {
  source = "./aws_instance"

  instance_type = "t2.micro"
  subnet_id     = "${module.vpc.public_subnet_id}"
}

/*
 * Outputs
 */
output "t2nano_ip" {
  value = "${module.t2nano.ip}"
}

output "t2micro_ip" {
  value = "${module.t2micro.ip}"
}
