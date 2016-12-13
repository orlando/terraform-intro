/*
 * Resources
 */

module "t2nano" {
  source = "./aws_instance"

  instance_type = "t2.nano"
}

module "t2micro" {
  source = "./aws_instance"

  instance_type = "t2.micro"
}
