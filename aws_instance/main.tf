/*
 * Variables
 */
variable "instance_type" {
  default = "t2.nano"
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

  tags {
    Name = "Terraform Intro"
  }
}

resource "aws_eip" "example_eip" {
  instance = "${aws_instance.example.id}"
}

/*
 * Outputs
 */
output "ip" {
  value = "${aws_eip.example_eip.public_ip}"
}
