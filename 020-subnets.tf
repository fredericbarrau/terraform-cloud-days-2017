# Subnet proxy aka "public subnet"
resource "aws_subnet" "demo" {
  vpc_id                  = "${aws_vpc.demo.id}"
  cidr_block              = "10.200.0.0/24"
  availability_zone       = "${var.availability_zone}"
}
