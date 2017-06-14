 # EIP's :
# resource "aws_eip" "demo" {
#   vpc         = true
# }
#
# NOT CREATED HERE : see create-EIP.sh
#
resource "aws_eip_association" "demo" {
  allocation_id      = "${var.demo_eip}"
  instance_id        = "${aws_instance.demo.0.id}"
  private_ip_address = "${aws_instance.demo.0.private_ip}"
}
