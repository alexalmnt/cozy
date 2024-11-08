resource "aws_security_group" "sg1" {
    name = var.sgname
    description = "allow ssh and http/s"
    vpc_id = var.vpcid
}

resource "aws_vpc_security_group_ingress_rule" "sgingress1" {
  security_group_id = aws_security_group.sg1.id
  cidr_ipv4 = "0.0.0.0/0"
  ip_protocol = "tcp"
  from_port = 22
  to_port = 22
}
resource "aws_vpc_security_group_ingress_rule" "sgingress2" {
  security_group_id = aws_security_group.sg1.id
  cidr_ipv4 = "0.0.0.0/0"
  ip_protocol = "tcp"
  from_port = 80
  to_port = 80
}
resource "aws_vpc_security_group_ingress_rule" "sgingress3" {
  security_group_id = aws_security_group.sg1.id
  cidr_ipv4 = "0.0.0.0/0"
  ip_protocol = "tcp"
  from_port = 443
  to_port = 443
}
resource "aws_vpc_security_group_egress_rule" "sgegress" {
  security_group_id = aws_security_group.sg1.id
  cidr_ipv4 = "0.0.0.0/0"
  ip_protocol = "-1"
}