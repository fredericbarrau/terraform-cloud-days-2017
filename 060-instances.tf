resource "aws_instance" "demo" {
  ami                         = "${var.ami_ids["demo"]}"
  count                       = "${var.instances_num}"
  availability_zone           = "${var.availability_zone}"
  ebs_optimized               = true
  instance_type               = "m4.large"
  key_name                    = "${aws_key_pair.demo.key_name}"
  #source_dest_check           = false
  subnet_id  = "${aws_subnet.demo.id}"
  #security_groups             = ["${aws_security_group.demo.name}"]
  vpc_security_group_ids      = ["${aws_security_group.demo.id}"]
  private_ip                  = "${cidrhost(aws_subnet.demo.cidr_block, count.index + 5)}"
}
