/**
 *## Description:
 *
 *AWS VPC creates a VPC with a public subnet in the us-east region
 *
 *## Usage:
 *
 *```hcl
 *module "vpc" {
 *  source = "./aws_vpc"
 *}
 *```
 */

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

/*
 * Output
 */

// VPC ID
output "id" {
  value = "${aws_vpc.default.id}"
}

// VPC Public subnet id
output "public_subnet_id" {
  value = "${aws_subnet.public_a.id}"
}
