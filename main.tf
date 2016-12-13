/*
 * Resources
 */
resource "aws_vpc" "default" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
}

resource "aws_subnet" "public_a" {
  vpc_id            = "${aws_vpc.default.id}"
  cidr_block        = "10.0.0.0/24"
  availability_zone = "us-east-1a"

  tags {
    Name = "Public-a"
  }
}

resource "aws_internet_gateway" "default" {
  vpc_id = "${aws_vpc.default.id}"
}

resource "aws_route_table" "public" {
  vpc_id = "${aws_vpc.default.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.default.id}"
  }
}

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
  instance_type = "t2.nano"
  subnet_id     = "${aws_subnet.public_a.id}"

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
output "ip" {
  value = "${aws_eip.example_eip.public_ip}"
}
