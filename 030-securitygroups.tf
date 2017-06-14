resource "aws_security_group" "demo" {
  vpc_id      = "${aws_vpc.demo.id}"
  name = "demo_sg"

  # Allow 22 from configured IPs
  ingress {
      from_port       = 22
      to_port         = 22
      protocol        = "tcp"
      cidr_blocks     = ["0.0.0.0/0"]
  }
  # Allow 80 from configured IPs
  ingress {
      from_port       = 80
      to_port         = 80
      protocol        = "tcp"
      cidr_blocks     = ["0.0.0.0/0"]
  }

  # Allow everyting to out
  egress {
      from_port       = 0
      to_port         = 0
      protocol        = "-1"
      cidr_blocks     = ["0.0.0.0/0"]
  }

}
