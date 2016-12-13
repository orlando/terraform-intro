/**
 *## Description:
 *
 *AWS Instance creates a EC2 instance
 *
 *## Usage:
 *
 *```hcl
 *module "myinstance" {
 *  source = "./aws_instance"
 *
 *  instance_type = "t2.micro"
 *  subnet_id     = "${aws_subnet.public_a.id}"
 *}
 *```
 */

/*
 * Variables
 */
variable "instance_type" {
  description = "EC2 instance type"
  default     = "t2.nano"
}

variable "subnet_id" {
  description = "VPC subnet id"
}

/*
 * Resources
 */
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-trusty-14.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "example" {
  ami           = "${data.aws_ami.ubuntu.id}"
  instance_type = "${var.instance_type}"
  subnet_id     = "${var.subnet_id}"

  tags {
    Name = "Terraform Intro"
  }
}

resource "aws_eip" "example_eip" {
  vpc      = true
  instance = "${aws_instance.example.id}"
}

/*
 * Outputs
 */

// IP of the EC2 instance
output "ip" {
  value = "${aws_eip.example_eip.public_ip}"
}
