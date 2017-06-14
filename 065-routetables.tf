# RT Admin
resource "aws_route_table" "demo" {
  vpc_id     = "${aws_vpc.demo.id}"

  # Route to outside
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.demo.id}"
  }
}

# Sortie des règles de route pour cette RT pour pouvoir mettre celle du vpn dans
# un fichier à part. Pas de combinaison possible entre règles de routage "inline"
# dans la définition de la route table et des route externes. Cf. doc https://www.terraform.io/docs/providers/aws/r/route_table.html
# resource "aws_route" "admin_web" {
#     route_table_id = "${aws_route_table.admin.id}"
#     destination_cidr_block = "0.0.0.0/0"
#     nat_gateway_id = "${aws_instance.nat_instance.id}"
# }
resource "aws_route_table_association" "demo_ass" {
  subnet_id = "${aws_subnet.demo.id}"
  route_table_id = "${aws_route_table.demo.id}"
}
