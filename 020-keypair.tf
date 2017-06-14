resource "aws_key_pair" "demo" {
  key_name   = "demo-key"
  public_key = "${var.public_ssh_key}"
}
